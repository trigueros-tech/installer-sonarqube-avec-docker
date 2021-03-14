# Arrête les containers
docker-compose stop

# Crée les dossiers où sauvegarder les backups
mkdir backups -Force

# définit la date actuelle
$now = Get-date -Format "yyyy-MM-dd"

# Utilise docker pour créer les backups
docker run --rm -v postgres_data:/mnt/data -v $PWD/backups:/mnt/target busybox:1.33.0-uclibc tar -zcf /mnt/target/backup-db-$now.tar.gz /mnt/data/
docker run --rm -v sonarqube_data:/mnt/data -v $PWD/backups:/mnt/target busybox:1.33.0-uclibc tar -zcf /mnt/target/backup-sq-$now.tar.gz /mnt/data/

# Redémarre les containers
docker-compose start
