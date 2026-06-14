#!/usr/bin/env bash
# build_palace_initramfs.sh — Build palace-aware initramfs for RV32 Linux
#
# Packages:
#   - BusyBox (RV32 static, or minimal fallback if unavailable)
#   - palace.ko (/dev/palace kernel module)
#   - palace_daemon (userspace Memory Palace coordinator)
#   - /init script (loads palace.ko, launches daemon)
#
# Output: .geometry_os/fs/linux/rv32/palace_initramfs.cpio.gz
#
# Usage: ./scripts/build_palace_initramfs.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

INITRAMFS_DIR="$PROJECT_ROOT/.geometry_os/build/palace_initramfs"
FS_OUT="$PROJECT_ROOT/.geometry_os/fs/linux/rv32"
DAEMON_SRC="$PROJECT_ROOT/kernel/geometry_os/palace_daemon.c"
PALACE_KO="$PROJECT_ROOT/kernel/geometry_os/palace.ko"

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[0;33m'; BLUE='\033[0;34m'; NC='\033[0m'
info()  { echo -e "${GREEN}[palace-init]${NC} $*"; }
warn()  { echo -e "${YELLOW}[palace-init]${NC} $*"; }
error() { echo -e "${RED}[palace-init]${NC} $*" >&2; exit 1; }

# ── Checks ───────────────────────────────────────────────────────────
for cmd in riscv64-linux-gnu-gcc cpio gzip; do
    if ! command -v "$cmd" &>/dev/null; then
        error "Missing: $cmd"
    fi
done

if [[ ! -f "$PALACE_KO" ]]; then
    error "palace.ko not found. Cross-compile first:"
    error "  make -C kernel/geometry_os ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu-"
fi

# ── Clean slate ──────────────────────────────────────────────────────
rm -rf "$INITRAMFS_DIR"
mkdir -p "$INITRAMFS_DIR/root"
mkdir -p "$FS_OUT"

# ── Step 1: Build palace_daemon ──────────────────────────────────────
info "Building palace_daemon (RV32 static)..."
riscv64-linux-gnu-gcc \
    -march=rv32imac -mabi=ilp32 \
    -nostdlib -static -nostartfiles \
    -e _start \
    -o "$INITRAMFS_DIR/root/palace_daemon" \
    "$DAEMON_SRC"

riscv64-linux-gnu-strip "$INITRAMFS_DIR/root/palace_daemon" 2>/dev/null || true
info "  palace_daemon: $(ls -lh "$INITRAMFS_DIR/root/palace_daemon" | awk '{print $5}')"

# ── Step 2: Copy palace.ko ───────────────────────────────────────────
mkdir -p "$INITRAMFS_DIR/root/lib/modules"
cp "$PALACE_KO" "$INITRAMFS_DIR/root/lib/modules/palace.ko"
info "  palace.ko: $(ls -lh "$INITRAMFS_DIR/root/lib/modules/palace.ko" | awk '{print $5}')"

# ── Step 3: BusyBox (static RV32) ────────────────────────────────────
BUSYBOX_SRC="$PROJECT_ROOT/.geometry_os/build/busybox"
BUSYBOX_BIN="$BUSYBOX_SRC/busybox"

if [[ -x "$BUSYBOX_BIN" ]]; then
    info "Using existing BusyBox: $(file "$BUSYBOX_BIN" | grep -o 'ELF.*' || echo 'unknown')"
else
    warn "BusyBox not found at $BUSYBOX_BIN"
    warn "Building minimal BusyBox (RV32 static)..."
    mkdir -p "$BUSYBOX_SRC"

    if [[ ! -d "$BUSYBOX_SRC/.git" ]]; then
        if command -v git &>/dev/null; then
            git clone --depth 1 \
                https://git.busybox.net/busybox "$BUSYBOX_SRC" 2>/dev/null || \
            ( mkdir -p "$BUSYBOX_SRC" && \
              curl -sL https://busybox.net/downloads/busybox-1.36.1.tar.bz2 | \
              tar xj -C "$BUSYBOX_SRC" --strip-components=1 2>/dev/null ) || \
            error "Failed to get BusyBox source. Install manually at $BUSYBOX_SRC"
        else
            error "No git and no existing BusyBox binary"
        fi
    fi

    if [[ -f "$BUSYBOX_SRC/Makefile" ]]; then
        make -C "$BUSYBOX_SRC" \
            ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- \
            defconfig 2>/dev/null

        # Force static build for initramfs
        sed -i 's/^.*CONFIG_STATIC.*$/CONFIG_STATIC=y/' "$BUSYBOX_SRC/.config" 2>/dev/null
        echo "CONFIG_STATIC=y" >> "$BUSYBOX_SRC/.config" 2>/dev/null

        # Minimal feature set
        sed -i 's/^.*CONFIG_FEATURE_PREFER_APPLETS.*$/CONFIG_FEATURE_PREFER_APPLETS=y/' "$BUSYBOX_SRC/.config" 2>/dev/null
        sed -i 's/^.*CONFIG_INSTALL_NO_USR.*$/CONFIG_INSTALL_NO_USR=y/' "$BUSYBOX_SRC/.config" 2>/dev/null

        make -C "$BUSYBOX_SRC" \
            ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- \
            -j"$(nproc)" 2>&1 | tail -5

        if [[ ! -x "$BUSYBOX_BIN" ]]; then
            error "BusyBox build failed at $BUSYBOX_BIN"
        fi
    else
        error "BusyBox source missing at $BUSYBOX_SRC/Makefile"
    fi
fi

# Install BusyBox into initramfs
mkdir -p "$INITRAMFS_DIR/root/bin"
cp "$BUSYBOX_BIN" "$INITRAMFS_DIR/root/bin/busybox"
chmod +x "$INITRAMFS_DIR/root/bin/busybox"

# Install symlinks for basic commands
for cmd in sh mount mkdir mknod cat ls echo insmod modprobe lsmod rmmod \
           chmod chown cp mv dmesg ps kill sleep uname; do
    ln -sf /bin/busybox "$INITRAMFS_DIR/root/bin/$cmd"
done

info "  BusyBox: $(ls -lh "$INITRAMFS_DIR/root/bin/busybox" | awk '{print $5}')"

# ── Step 4: /init script ─────────────────────────────────────────────
# The /init script (runs as PID 1 in the initramfs)
cat > "$INITRAMFS_DIR/root/init" << 'INIT_SCRIPT'
#!/bin/sh

# Mount devtmpfs first so /dev/console is created by kernel
mount -t devtmpfs none /dev

# Direct diagnostic echos to identify active console nodes
echo "[init-debug] direct to /dev/console" >/dev/console 2>/dev/null || true
echo "[init-debug] direct to /dev/ttyS0" >/dev/ttyS0 2>/dev/null || true
echo "[init-debug] direct to /dev/hvc0" >/dev/hvc0 2>/dev/null || true

# Pre-validate which console device is actually writeable before calling exec
CONSOLE="/dev/console"
if [ ! -c "$CONSOLE" ] || ! echo -n "" >/dev/console 2>/dev/null; then
    CONSOLE="/dev/ttyS0"
    if [ ! -c "$CONSOLE" ] || ! echo -n "" >/dev/ttyS0 2>/dev/null; then
        CONSOLE="/dev/hvc0"
        if [ ! -c "$CONSOLE" ] || ! echo -n "" >/dev/hvc0 2>/dev/null; then
            CONSOLE="/dev/null"
        fi
    fi
fi

exec 1>"$CONSOLE"
exec 2>&1




echo "=============================="
echo "  Palace Linux Booting..."
echo "=============================="

# Mount remaining filesystems
mount -t proc none /proc
mount -t sysfs none /sys
mkdir -p /dev/pts
mount -t devpts none /dev/pts

echo "[init] Mounted proc, sysfs, devtmpfs"

# Load the palace kernel module
if [ -f /lib/modules/palace.ko ]; then
    echo "[init] Loading /dev/palace kernel module..."
    insmod /lib/modules/palace.ko
    echo "[init-debug] insmod completed" >/dev/hvc0 2>/dev/null || true
    chmod 666 /dev/palace
    echo "[init-debug] chmod completed" >/dev/hvc0 2>/dev/null || true
    echo "[init] /dev/palace ready"
else
    echo "[init] WARNING: palace.ko not found"
fi

# Verify palace device
if [ -c /dev/palace ]; then
    echo "[init] /dev/palace is present"
else
    echo "[init] WARNING: /dev/palace device node missing"
fi


echo "[init] Launching Memory Palace Daemon..." >/dev/hvc0
/palace_daemon >/dev/hvc0 2>&1
echo "[init] palace_daemon exited with status $?" >/dev/hvc0
while true; do sleep 1; done
INIT_SCRIPT
chmod +x "$INITRAMFS_DIR/root/init"

# ── Step 5: Package initramfs using gen_init_cpio ─────────────────────
info "Generating initramfs list..."
GEN_INIT_CPIO="$PROJECT_ROOT/.geometry_os/build/linux-6.14/usr/gen_init_cpio"
LIST_FILE="$INITRAMFS_DIR/initramfs.list"

# Initialize list with basic directories and nodes
cat > "$LIST_FILE" << EOF
dir /dev 755 0 0
nod /dev/console 600 0 0 c 5 1
nod /dev/null 666 0 0 c 1 3
nod /dev/zero 666 0 0 c 1 5
EOF

# Find all files and directories in root, except the dev nodes we just declared
(cd "$INITRAMFS_DIR/root" && find . -not -name "." -not -path "./dev*" -not -path "./dev") | while read -r path; do
    abs_path="$INITRAMFS_DIR/root/${path#./}"
    clean_path="${path#./}"
    if [[ -d "$abs_path" ]]; then
        echo "dir /$clean_path 755 0 0" >> "$LIST_FILE"
    elif [[ -h "$abs_path" ]]; then
        target=$(readlink "$abs_path")
        echo "slink /$clean_path $target 777 0 0" >> "$LIST_FILE"
    elif [[ -f "$abs_path" ]]; then
        echo "file /$clean_path $abs_path 755 0 0" >> "$LIST_FILE"
    fi
done

info "Packaging initramfs..."
"$GEN_INIT_CPIO" "$LIST_FILE" | gzip > "$FS_OUT/palace_initramfs.cpio.gz"

SIZE=$(stat -c%s "$FS_OUT/palace_initramfs.cpio.gz" 2>/dev/null || echo 0)
info "palace_initramfs.cpio.gz: ${SIZE} bytes"

# Show what's inside
echo ""
info "=== Palace Initramfs Contents ==="
zcat "$FS_OUT/palace_initramfs.cpio.gz" 2>/dev/null | cpio -t 2>/dev/null
echo ""
info "=== Build Complete ==="
echo ""
info "To boot via hypervisor_boot:"
echo "  hypervisor_boot arch=riscv32 kernel=.geometry_os/build/linux-6.14/vmlinux initrd=.geometry_os/fs/linux/rv32/palace_initramfs.cpio.gz ram=256M append=console=ttyS0"
echo ""
info "Or directly with QEMU:"
echo "  qemu-system-riscv32 -machine virt -m 256M -nographic \\"
echo "    -kernel .geometry_os/build/linux-6.14/vmlinux \\"
echo "    -initrd .geometry_os/fs/linux/rv32/palace_initramfs.cpio.gz \\"
echo "    -append \"console=ttyS0\""
echo ""
