#!/usr/bin/env bash
# backup_to_seed.sh - Sync project source to SeedFS (XOR-encrypted seed storage)
set -euo pipefail

STORE="$HOME/.geometry_os/seed_backup_store"
MNT="$HOME/.geometry_os/seed_backup_mnt"
REPO="$HOME/projects/zion/projects/geometry_os/geometry_os"
SEEDFS="$REPO/scripts/seedfs.py"

# Clean up stale mount if needed
if [ -d "$MNT" ] && ! mount | grep -q "$MNT"; then
    fusermount3 -u -z "$MNT" 2>/dev/null || true
fi

mkdir -p "$MNT"

# Mount SeedFS with health check
if ! mount | grep -q "$MNT"; then
    echo "Mounting SeedFS..."
    python3 "$SEEDFS" mount "$STORE" "$MNT" &
    MOUNT_PID=$!

    # Wait up to 10 seconds for mount to be ready
    for i in $(seq 1 10); do
        if mount | grep -q "$MNT" && ls "$MNT" >/dev/null 2>&1; then
            break
        fi
        sleep 1
    done

    if ! mount | grep -q "$MNT"; then
        echo "ERROR: SeedFS mount failed after 10 seconds" >&2
        kill "$MOUNT_PID" 2>/dev/null || true
        exit 1
    fi
    echo "Mounted successfully."
fi

# Sync source code (no build artifacts, no cache files)
EXCLUDES="--exclude=__pycache__ --exclude=*.pyc --exclude=target --exclude=.git"

echo "Backing up scripts/..."
rsync -r $EXCLUDES --delete "$REPO/scripts/" "$MNT/scripts/"

echo "Backing up src/..."
rsync -r $EXCLUDES --delete "$REPO/src/" "$MNT/src/"

echo "Backup complete: $(date) ($(du -sh "$STORE" | cut -f1) stored)"
