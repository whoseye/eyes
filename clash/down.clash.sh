now=`date "+%Y_%m_%d"`
y=`echo $now | awk -F '_' '{print $1}'`
m=`echo $now | awk -F '_' '{print $2}'`
d=`echo $now | awk -F '_' '{print $3}'`

workdir="yamls/$y/$m/$now"

# ensure dir
mkdir -p $workdir

# download clash_yaml urls
declare -A urls=(\
["annaer"]="https://raw.githubusercontent.com/anaer/Sub/main/clash.yaml" \
["aiboboxx"]="https://raw.githubusercontent.com/aiboboxx/clashfree/main/clash.yml" \
)

# download
for url in ${!urls[@]}
do
    echo "== == == download == $url == ${urls[$url]} == == =="
    curl -s ${urls[$url]} > $workdir/$url.yml
done

# show result
ls -lrth $workdir/
