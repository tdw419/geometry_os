#!/bin/bash
# =============================================================================
# Geometry OS - Bare Metal Boot Test Harness
# =============================================================================
# This script builds the UEFI bootloader and runs it in QEMU with OVMF.
#
# Requirements:
#   - qemu-system-x86_64
#   - ovmf (UEFI firmware for QEMU)
#   - mtools (for FAT32 image creation)
#
# Usage:
#   ./run_bare_metal.sh          # Build and run
#   ./run_bare_metal.sh --debug  # Enable QEMU debug server (port 1234)
# =============================================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKSPACE_DIR="$(cd "${SCRIPT_DIR}/../.." && pwd)"
BUILD_DIR="${WORKSPACE_DIR}/target/x86_64-unknown-uefi/debug"
BOOT_IMAGE="${SCRIPT_DIR}/geometry_os_boot.img"
EFI_FILE="geometry_os_bootloader.efi"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

log_info() { echo -e "${GREEN}[INFO]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

# Check for required tools
check_dependencies() {
    local missing=()

    if ! command -v qemu-system-x86_64 &> /dev/null; then
        missing+=("qemu-system-x86_64")
    fi

    if ! command -v mtools &> /dev/null; then
        missing+=("mtools")
    fi

    # Note: OVMF check is done in find_ovmf() - we don't check here
    # to allow different installation locations

    if [ ${#missing[@]} -ne 0 ]; then
        log_error "Missing dependencies:"
        for dep in "${missing[@]}"; do
            echo "  - $dep"
        done
        echo ""
        echo "Install with:"
        echo "  Ubuntu/Debian: sudo apt install qemu-system-x86 ovmf mtools"
        echo "  Fedora:        sudo dnf install qemu-system-x86 ovmf mtools"
        exit 1
    fi
}

# Build the UEFI bootloader
build_efi() {
    log_info "Building UEFI bootloader..."
    cd "${WORKSPACE_DIR}"
    cargo build -p geometry_os_bootloader --target x86_64-unknown-uefi

    if [[ ! -f "${BUILD_DIR}/${EFI_FILE}" ]]; then
        log_error "Build failed - EFI file not found at ${BUILD_DIR}/${EFI_FILE}"
        exit 1
    fi

    log_info "Built: ${BUILD_DIR}/${EFI_FILE} ($(stat -c%s "${BUILD_DIR}/${EFI_FILE}") bytes)"

    log_info "Building Geometry OS kernel..."
    cd "${WORKSPACE_DIR}/kernel/geos"
    make

    log_info "Compiling Glyph Microcode to SPIR-V..."
    cd "${WORKSPACE_DIR}/systems/infinite_map_rs"
    cargo run --release --bin wgsl_to_spirv -- shaders/glyph_microcode.wgsl /tmp/glyph_microcode.spv
}

# Create FAT32 boot image with EFI file
create_boot_image() {
    log_info "Creating GPT-formatted boot image..."

    # Remove old image if exists
    rm -f "${BOOT_IMAGE}"

    # Create 64MB image (larger for GPT + FAT32)
    dd if=/dev/zero of="${BOOT_IMAGE}" bs=1M count=64 2>/dev/null

    # Create GPT partition table and EFI System Partition
    # Using sgdisk for GPT manipulation
    sgdisk -Z "${BOOT_IMAGE}" 2>/dev/null  # Clear any existing partition table
    sgdisk -o "${BOOT_IMAGE}" 2>/dev/null  # Create new GPT

    # Create EFI System Partition (type EF00)
    sgdisk -n 1:2048:+0 -t 1:EF00 -c 1:"EFI System" "${BOOT_IMAGE}" 2>/dev/null

    # Set partition as bootable
    sgdisk -A 1:set:2 "${BOOT_IMAGE}" 2>/dev/null

    # Print partition info
    sgdisk -p "${BOOT_IMAGE}" 2>/dev/null

    # Calculate partition offset (sector 2048 = 1MB offset)
    local partition_offset=$((2048 * 512))

    # Format the partition as FAT32 (access via offset)
    # Create temporary file for the partition
    local partition_file="${SCRIPT_DIR}/efi_partition.fat"
    rm -f "${partition_file}"

    # Create 32MB FAT32 filesystem for the partition
    dd if=/dev/zero of="${partition_file}" bs=1M count=32 2>/dev/null
    mkfs.fat -F 32 "${partition_file}" 2>/dev/null

    # Create EFI directory structure
    mmd -i "${partition_file}" ::/EFI
    mmd -i "${partition_file}" ::/EFI/BOOT

    # Copy EFI file as BOOTX64.EFI
    mcopy -i "${partition_file}" "${BUILD_DIR}/${EFI_FILE}" ::/EFI/BOOT/BOOTX64.EFI

    # Copy Kernel file
    mcopy -i "${partition_file}" "${WORKSPACE_DIR}/kernel/geos/geometry_os.kernel" ::/geometry_os.kernel

    # Copy Window Manager Glyph
    mcopy -i "${partition_file}" "${WORKSPACE_DIR}/systems/glyph_stratum/programs/window_manager.rts.png" ::/window_manager.rts.png

    # Copy Glyph Microcode
    mcopy -i "${partition_file}" "/tmp/glyph_microcode.spv" ::/glyph_microcode.spv

    # Create startup.nsh
    echo "@echo -off" > "/tmp/startup.nsh"
    echo "for %i in 0 1 2 3 4 5 6 7 8 9 A B C D E F" >> "/tmp/startup.nsh"
    echo "  if exist %i:\EFI\BOOT\BOOTX64.EFI then" >> "/tmp/startup.nsh"
    echo "    %i:" >> "/tmp/startup.nsh"
    echo "    \EFI\BOOT\BOOTX64.EFI" >> "/tmp/startup.nsh"
    echo "    goto DONE" >> "/tmp/startup.nsh"
    echo "  endif" >> "/tmp/startup.nsh"
    echo "endfor" >> "/tmp/startup.nsh"
    echo ":DONE" >> "/tmp/startup.nsh"
    mcopy -i "${partition_file}" "/tmp/startup.nsh" ::/startup.nsh

    # Verify
    log_info "Partition contents:"
    mdir -i "${partition_file}" ::/

    # Write partition to disk image at correct offset
    dd if="${partition_file}" of="${BOOT_IMAGE}" bs=512 seek=2048 conv=notrunc 2>/dev/null

    # Cleanup
    rm -f "${partition_file}"

    log_info "Created GPT boot image: ${BOOT_IMAGE}"
}

# Find OVMF firmware
find_ovmf() {
    if [[ -f "${SCRIPT_DIR}/OVMF.fd" ]]; then
        echo "${SCRIPT_DIR}/OVMF.fd"
    elif [[ -f "/usr/share/OVMF/OVMF_CODE_4M.fd" ]]; then
        echo "/usr/share/OVMF/OVMF_CODE_4M.fd"
    elif [[ -f "/usr/share/OVMF/OVMF_CODE.fd" ]]; then
        echo "/usr/share/OVMF/OVMF_CODE.fd"
    elif [[ -f "/usr/share/OVMF/x64/OVMF_CODE.fd" ]]; then
        echo "/usr/share/OVMF/x64/OVMF_CODE.fd"
    else
        log_error "OVMF firmware not found"
        exit 1
    fi
}

# Run in QEMU
run_qemu() {
    local ovmf_path=$(find_ovmf)
    local debug_flag=""

    if [[ "$1" == "--debug" ]]; then
        debug_flag="-s -S"  # GDB server on port 1234, wait for connection
        log_info "Debug mode enabled - GDB server on port 1234"
        log_info "Connect with: gdb ${BUILD_DIR}/${EFI_FILE} -ex 'target remote localhost:1234'"
    fi

    log_info "Starting QEMU with OVMF..."
    log_info "Press Ctrl+A then X to exit QEMU"
    echo ""

    # Use IDE interface for better UEFI compatibility
    qemu-system-x86_64 \
        -machine q35 \
        -cpu qemu64 \
        -m 512M \
        -drive if=pflash,format=raw,readonly=on,file="${ovmf_path}" \
        -drive format=raw,file="${BOOT_IMAGE}",if=ide \
        -net none \
        -serial file:/tmp/serial.log \
        -display none \
        -vga none \
        ${debug_flag}
}

# Main
main() {
    echo "==============================================="
    echo " Geometry OS - Bare Metal Boot Test Harness   "
    echo "==============================================="
    echo ""

    check_dependencies
    build_efi
    create_boot_image
    run_qemu "$1"
}

main "$@"
