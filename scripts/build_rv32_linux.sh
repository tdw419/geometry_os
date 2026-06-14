#!/usr/bin/env bash
# build_rv32_linux.sh -- Build RV32 Linux kernel + minimal initramfs for GeOS
#
# Usage:
#   ./scripts/build_rv32_linux.sh              # full build
#   ./scripts/build_rv32_linux.sh --kernel     # kernel only
#   ./scripts/build_rv32_linux.sh --initramfs  # initramfs only
#   ./scripts/build_rv32_linux.sh --clean      # clean build
#
# Outputs:
#   .geometry_os/build/linux-6.14/vmlinux
#   .geometry_os/build/linux-6.14/System.map
#   .geometry_os/fs/linux/rv32/initramfs.cpio.gz
#
# Requirements: riscv64-linux-gnu-gcc, make, cpio, gzip

set -euo pipefail

# ── Paths ──────────────────────────────────────────────────────────────
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

KERNEL_SRC="$PROJECT_ROOT/.geometry_os/build/linux-6.14"
KERNEL_OUT="$PROJECT_ROOT/.geometry_os/build/linux-6.14"
INITRAMFS_DIR="$PROJECT_ROOT/.geometry_os/build/initramfs"
FS_OUT="$PROJECT_ROOT/.geometry_os/fs/linux/rv32"

DEFCONFIG="$PROJECT_ROOT/scripts/rv32_geos_defconfig"

# ── Colors ─────────────────────────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m'

info()  { echo -e "${GREEN}[build_rv32]${NC} $*"; }
warn()  { echo -e "${YELLOW}[build_rv32]${NC} $*"; }
error() { echo -e "${RED}[build_rv32]${NC} $*" >&2; exit 1; }
step()  { echo -e "${BLUE}[build_rv32]${NC} $*"; }

# ── Dependency checks ──────────────────────────────────────────────────
check_deps() {
    local missing=()
    for cmd in riscv64-linux-gnu-gcc make cpio gzip; do
        if ! command -v "$cmd" &>/dev/null; then
            missing+=("$cmd")
        fi
    done
    if [[ ${#missing[@]} -gt 0 ]]; then
        error "Missing dependencies: ${missing[*]}"
        error "Install with: sudo apt install gcc-riscv64-linux-gnu make cpio gzip"
    fi
}

# ── Kernel source validation ───────────────────────────────────────────
check_kernel_src() {
    if [[ ! -f "$KERNEL_SRC/arch/riscv/Makefile" ]]; then
        error "Kernel source not found at $KERNEL_SRC"
        error "Clone linux-6.14 into .geometry_os/build/linux-6.14 first:"
        error "  git clone --depth 1 --branch v6.14 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git $KERNEL_SRC"
    fi
}

# ── Initramfs build ────────────────────────────────────────────────────
build_initramfs() {
    step "Building minimal initramfs..."
    mkdir -p "$INITRAMFS_DIR"
    mkdir -p "$FS_OUT"

    # Write a minimal /init in RV32 assembly.
    # Uses SBI DBCN (debug console) to print a message, then loops.
    # No libc required — works with just riscv64-linux-gnu-gcc.
    cat > "$INITRAMFS_DIR/init.S" << 'ASM_EOF'
    .section .text
    .globl _start
_start:
    # SBI DBCN debug console write (extension=0x4442434N, fid=0)
    # a7 = eid, a6 = fid, a0 = ptr, a1 = len
    li a7, 0x4442434E
    li a6, 0
    la a0, msg
    li a1, 21
    ecall

    # Loop forever (idle)
1:  j 1b

    .section .rodata
msg:
    .ascii "Hello from /init\n"
ASM_EOF

    # Compile static RV32 binary without libc
    riscv64-linux-gnu-gcc \
        -march=rv32imac -mabi=ilp32 \
        -nostdlib -static \
        -o "$INITRAMFS_DIR/init" \
        "$INITRAMFS_DIR/init.S"

    # Strip to minimize size
    riscv64-linux-gnu-strip "$INITRAMFS_DIR/init" 2>/dev/null || true

    info "Static /init built: $(ls -lh "$INITRAMFS_DIR/init" | awk '{print $5}')"

    # Package as cpio.gz
    mkdir -p "$INITRAMFS_DIR/root"
    cp "$INITRAMFS_DIR/init" "$INITRAMFS_DIR/root/init"
    chmod +x "$INITRAMFS_DIR/root/init"

    # Create device nodes (minimal)
    mkdir -p "$INITRAMFS_DIR/root/dev"
    mknod "$INITRAMFS_DIR/root/dev/console" c 5 1 2>/dev/null || true
    mknod "$INITRAMFS_DIR/root/dev/null" c 1 3 2>/dev/null || true
    mknod "$INITRAMFS_DIR/root/dev/zero" c 1 5 2>/dev/null || true
    mknod "$INITRAMFS_DIR/root/dev/random" c 1 8 2>/dev/null || true
    mknod "$INITRAMFS_DIR/root/dev/urandom" c 1 9 2>/dev/null || true

    # Build cpio archive
    (cd "$INITRAMFS_DIR/root" && find . | cpio -o -H newc 2>/dev/null) | gzip > "$FS_OUT/initramfs.cpio.gz"

    local size
    size=$(stat -c%s "$FS_OUT/initramfs.cpio.gz" 2>/dev/null || stat -f%z "$FS_OUT/initramfs.cpio.gz" 2>/dev/null)
    info "Initramfs ready: $FS_OUT/initramfs.cpio.gz (${size} bytes)"
}

# ── Kernel build ───────────────────────────────────────────────────────
build_kernel() {
    step "Building RV32 Linux kernel..."
    check_kernel_src
    mkdir -p "$KERNEL_OUT"

    # If defconfig exists, use it. Otherwise fall back to the existing .config.
    if [[ -f "$DEFCONFIG" ]]; then
        step "Applying defconfig from $DEFCONFIG"
        cp "$DEFCONFIG" "$KERNEL_SRC/arch/riscv/configs/rv32_geos_defconfig"
        make -C "$KERNEL_SRC" \
            ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- \
            O="$KERNEL_OUT" \
            rv32_geos_defconfig
    elif [[ -f "$KERNEL_SRC/.config" ]]; then
        warn "No defconfig found at $DEFCONFIG, using existing .config"
    else
        error "No kernel configuration found. Provide a defconfig or run from a pre-configured tree."
    fi

    # Ensure required options are set
    step "Verifying kernel config..."
    local config_file="$KERNEL_OUT/.config"
    if [[ ! -f "$config_file" ]]; then
        config_file="$KERNEL_SRC/.config"
    fi

    # Critical options that must be enabled for GeOS
    local required=(
        "CONFIG_32BIT=y"
        "CONFIG_ARCH_RV32I=y"
        "CONFIG_MMU=y"
        "CONFIG_SERIAL_8250=y"
        "CONFIG_SERIAL_8250_CONSOLE=y"
        "CONFIG_VIRTIO_MMIO=y"
        "CONFIG_VIRTIO_BLK=y"
        "CONFIG_BLK_DEV_INITRD=y"
        "CONFIG_PRINTK=y"
        "CONFIG_RISCV_TIMER=y"
    )
    local missing=()
    for opt in "${required[@]}"; do
        local key="${opt%%=*}"
        local val="${opt##*=}"
        local actual
        actual=$(grep "^$key=" "$config_file" 2>/dev/null || true)
        if [[ "$actual" != "$opt" ]]; then
            missing+=("$opt (found: ${actual:-<unset>})")
        fi
    done
    if [[ ${#missing[@]} -gt 0 ]]; then
        warn "Config may be missing required options:"
        for m in "${missing[@]}"; do
            warn "  - $m"
        done
    fi

    # Build
    step "Running make vmlinux..."
    make -C "$KERNEL_SRC" \
        ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- \
        O="$KERNEL_OUT" \
        -j"$(nproc)" \
        vmlinux

    if [[ ! -f "$KERNEL_OUT/vmlinux" ]]; then
        error "Build failed: vmlinux not found at $KERNEL_OUT/vmlinux"
    fi

    # Copy outputs to canonical location
    cp "$KERNEL_OUT/vmlinux" "$FS_OUT/vmlinux"
    cp "$KERNEL_OUT/System.map" "$FS_OUT/System.map" 2>/dev/null || true

    info "Kernel built successfully:"
    info "  vmlinux:   $KERNEL_OUT/vmlinux ($(ls -lh "$KERNEL_OUT/vmlinux" | awk '{print $5}'))"
    info "  System.map: $KERNEL_OUT/System.map"
}

# ── Clean ──────────────────────────────────────────────────────────────
clean_build() {
    step "Cleaning build artifacts..."
    if [[ -d "$KERNEL_OUT" ]]; then
        make -C "$KERNEL_SRC" O="$KERNEL_OUT" clean 2>/dev/null || true
        rm -f "$KERNEL_OUT/vmlinux" "$KERNEL_OUT/System.map"
    fi
    rm -rf "$INITRAMFS_DIR"
    rm -f "$FS_OUT/initramfs.cpio.gz"
    info "Clean complete."
}

# ── Main ───────────────────────────────────────────────────────────────
main() {
    local do_kernel=true
    local do_initramfs=true
    local do_clean=false

    for arg in "$@"; do
        case "$arg" in
            --kernel)     do_kernel=true; do_initramfs=false ;;
            --initramfs)  do_kernel=false; do_initramfs=true ;;
            --clean)      do_clean=true ;;
            --help|-h)
                cat << 'HELP'
Usage: build_rv32_linux.sh [OPTIONS]

Build an RV32 Linux kernel and minimal initramfs for the GeOS hypervisor.

Options:
  --kernel      Build only the kernel
  --initramfs   Build only the initramfs
  --clean       Clean build artifacts
  --help        Show this help

Outputs:
  .geometry_os/build/linux-6.14/vmlinux
  .geometry_os/build/linux-6.14/System.map
  .geometry_os/fs/linux/rv32/initramfs.cpio.gz

Requirements:
  riscv64-linux-gnu-gcc, make, cpio, gzip

The kernel is built with ARCH=riscv and -march=rv32imac for the GeOS
virtual machine layout (UART at 0x10000000, CLINT at 0x02000000, etc).
The initramfs contains a static /init that mounts proc/sysfs and idles.
HELP
                exit 0
                ;;
            *)
                error "Unknown argument: $arg (try --help)"
                ;;
        esac
    done

    check_deps

    if $do_clean; then
        clean_build
        exit 0
    fi

    mkdir -p "$FS_OUT"

    if $do_kernel; then
        build_kernel
    fi

    if $do_initramfs; then
        build_initramfs
    fi

    echo ""
    info "=== Build Complete ==="
    echo ""
    if $do_kernel; then
        echo "Kernel:"
        ls -lh "$KERNEL_OUT/vmlinux" 2>/dev/null || true
        ls -lh "$KERNEL_OUT/System.map" 2>/dev/null || true
        echo ""
        echo "Boot with GeOS:"
        echo "  cargo run --example boot_userspace"
        echo ""
        echo "Or programmatically:"
        echo '  let kernel = fs::read(".geometry_os/build/linux-6.14/vmlinux").unwrap();'
        echo '  let initrd = fs::read(".geometry_os/fs/linux/rv32/initramfs.cpio.gz").ok();'
        echo '  let patches = KernelPatches::from_system_map(&fs::read_to_string(".geometry_os/build/linux-6.14/System.map").unwrap());'
        echo '  let (vm, result) = RiscvVm::boot_linux_with_patches(&kernel, initrd.as_deref(), 512, 100_000_000, bootargs, Some(patches)).unwrap();'
    fi
    if $do_initramfs; then
        echo "Initramfs:"
        ls -lh "$FS_OUT/initramfs.cpio.gz" 2>/dev/null || true
    fi
    echo ""
    info "Done."
}

main "$@"
