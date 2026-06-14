#!/usr/bin/env bash
# build_rootfs.sh - Build rootless Alpine rootfs for VirtIO storage

set -e

DISK_IMG="$HOME/.geometry_os/vmfs/alpine_disk.img"
ROOTFS_DIR="./tmp_rootfs"

echo "[*] Cleaning old build directories..."
rm -rf "$ROOTFS_DIR"
mkdir -p "$ROOTFS_DIR"/bin "$ROOTFS_DIR"/sbin "$ROOTFS_DIR"/etc "$ROOTFS_DIR"/dev "$ROOTFS_DIR"/proc "$ROOTFS_DIR"/sys "$ROOTFS_DIR"/root

# Create a basic init script inside rootfs to mount Memory Palace storage at boot
mkdir -p "$ROOTFS_DIR"/mnt/memory_palace
mkdir -p "$ROOTFS_DIR"/usr/bin
cp palace_fuse.py "$ROOTFS_DIR"/usr/bin/
cp memory_palace_facts.json "$ROOTFS_DIR"/usr/bin/

cat << 'EOF' > "$ROOTFS_DIR"/sbin/init
#!/bin/sh
mount -t proc proc /proc
mount -t sysfs sysfs /sys

echo "=========================================="
echo " Welcome to Alpine Linux on Geometry OS! "
echo "=========================================="
echo "[*] Mounting Memory Palace storage namespace..."
python3 /usr/bin/palace_fuse.py /mnt/memory_palace &
sleep 1

echo "[*] Storage verification:"
ls -la /mnt/memory_palace/inner_ring/

exec /bin/sh
EOF
chmod +x "$ROOTFS_DIR"/sbin/init

# Download/extract static busybox for rv64 if needed, or copy from existing assets
# For demonstration, we populate minimal files.

# Create 20MB disk image
echo "[*] Allocating 20MB disk image..."
dd if=/dev/zero of="$DISK_IMG" bs=1M count=20

# Create ext4 filesystem directly from the directory without sudo!
echo "[*] Creating ext4 filesystem rootlessly..."
mke2fs -t ext4 -F -d "$ROOTFS_DIR" "$DISK_IMG"

echo "[✓] Disk image successfully prepared at: $DISK_IMG"