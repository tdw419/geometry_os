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
IMAGE_DIR="${SCRIPT_DIR}/boot_image"
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
}

# Create FAT32 boot image with EFI file
create_boot_image() {
    log_info "Creating FAT32 boot image..."

    # Create 16MB image
    dd if=/dev/zero of="${BOOT_IMAGE}" bs=1M count=16 2>/dev/null

    # Format as FAT32
    mkfs.fat -F 32 "${BOOT_IMAGE}" 2>/dev/null || {
        log_error "Failed to format boot image"
        exit 1
    }

    # Create directory structure
    mkdir -p "${IMAGE_DIR}/EFI/BOOT"

    # Copy EFI file
    cp "${BUILD_DIR}/${EFI_FILE}" "${IMAGE_DIR}/EFI/BOOT/BOOTX64.EFI"

    # Copy files to image using mtools
    mcopy -i "${BOOT_IMAGE}" -s "${IMAGE_DIR}/EFI" ::/EFI

    # Cleanup
    rm -rf "${IMAGE_DIR}"

    log_info "Created boot image: ${BOOT_IMAGE}"
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

    qemu-system-x86_64 \
        -machine q35,accel=tcg \
        -cpu qemu64 \
        -m 512M \
        -drive if=pflash,format=raw,readonly=on,file="${ovmf_path}" \
        -drive format=raw,file="${BOOT_IMAGE}" \
        -net none \
        -serial stdio \
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
