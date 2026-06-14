#!/bin/bash
# import_binaries_to_memory_palace.sh
# Imports all QEMU binaries into Memory Palace buildings for self-contained boot

set -e

# Building IDs to use
KERNEL_ID=42
INITRD_ID=43
DISK_ID=44

echo "=== Importing binaries to Memory Palace ==="
echo

# Check if socket exists
if [ ! -S /tmp/geo_cmd.sock ]; then
    echo "Error: Geometry OS socket not found at /tmp/geo_cmd.sock"
    echo "Start Geometry OS first: cargo run -- --cli --socket /tmp/geo_cmd.sock"
    exit 1
fi

# Import Alpine kernel
echo "[1/3] Importing Alpine kernel..."
KERNEL_PATH="$HOME/.geometry_os/fs/linux/rv64/Image"
if [ -f "$KERNEL_PATH" ]; then
    echo "import_binary $KERNEL_PATH $KERNEL_ID elf base64" | nc -U /tmp/geo_cmd.sock | head -3
else
    echo "Warning: Kernel not found at $KERNEL_PATH"
fi

# Import initrd
echo
echo "[2/3] Importing Alpine initrd..."
INITRD_PATH="$HOME/.geometry_os/fs/linux/rv64/initramfs.cpio.gz"
if [ -f "$INITRD_PATH" ]; then
    echo "import_binary $INITRD_PATH $INITRD_ID cpio base64" | nc -U /tmp/geo_cmd.sock | head -3
else
    echo "Warning: Initrd not found at $INITRD_PATH"
fi

# Import Alpine disk image
echo
echo "[3/3] Importing Alpine disk image..."
DISK_PATH="$HOME/.geometry_os/vmfs/alpine_disk.img"
if [ -f "$DISK_PATH" ]; then
    echo "import_binary $DISK_PATH $DISK_ID disk_image base64" | nc -U /tmp/geo_cmd.sock | head -3
else
    echo "Warning: Disk image not found at $DISK_PATH"
fi

echo
echo "=== Import complete ==="
echo "Building IDs:"
echo "  Kernel:  $KERNEL_ID"
echo "  Initrd:   $INITRD_ID"
echo "  Disk:     $DISK_ID"
echo
echo "To boot from Memory Palace:"
echo "  echo \"hypervisor_boot arch=riscv64 kernel=building:$KERNEL_ID initrd=building:$INITRD_ID ram=256M disk=building:$DISK_ID append=console=ttyS0\" | nc -U /tmp/geo_cmd.sock"