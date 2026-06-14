#!/bin/bash
# =============================================================================
# Geometry OS - USB Flash Script
# =============================================================================
# Flash the boot image to a USB drive for physical hardware boot.
#
# Usage:
#   ./flash_to_usb.sh /dev/sdX    # Flash to specific device
#   ./flash_to_usb.sh --list      # List available devices
# =============================================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BOOT_IMAGE="${SCRIPT_DIR}/geometry_os_boot.img"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

log_info() { echo -e "${GREEN}[INFO]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

list_devices() {
    echo "=== Available Removable Devices ==="
    echo ""

    # List all block devices
    lsblk -o NAME,SIZE,TYPE,TRAN,HOTPLUG 2>/dev/null | while read line; do
        echo "  $line"
    done

    echo ""
    echo "USB/Removable devices (HOTPLUG=1):"
    lsblk -o NAME,SIZE,TRAN -n 2>/dev/null | while read name size tran; do
        if [[ "$tran" == "usb" ]]; then
            echo "  /dev/$name - $size"
        fi
    done

    echo ""
    echo "Usage: sudo $0 /dev/sdX"
}

if [[ "$1" == "--list" ]] || [[ -z "$1" ]]; then
    list_devices
    exit 0
fi

DEVICE="$1"

# Verify boot image exists
if [[ ! -f "${BOOT_IMAGE}" ]]; then
    log_error "Boot image not found: ${BOOT_IMAGE}"
    log_info "Run ./run_bare_metal.sh first to create the boot image"
    exit 1
fi

# Verify device exists
if [[ ! -b "${DEVICE}" ]]; then
    log_error "Device not found: ${DEVICE}"
    list_devices
    exit 1
fi

# Check if device is mounted
if mount | grep -q "${DEVICE}"; then
    log_warn "Device appears to be mounted. Unmounting..."
    sudo umount "${DEVICE}"* 2>/dev/null || true
fi

# Confirm flash
echo ""
echo "=========================================="
echo " GEOMETRY OS - USB FLASH"
echo "=========================================="
echo ""
echo "  Source: ${BOOT_IMAGE} ($(stat -c%s "${BOOT_IMAGE}" | numfmt --to=iec-i --suffix=B))"
echo "  Target: ${DEVICE}"
echo ""
echo "  WARNING: This will ERASE ALL DATA on ${DEVICE}"
echo ""

# Check if it's really a removable device
TRAN=$(lsblk -d -o TRAN -n "${DEVICE}" 2>/dev/null)
if [[ "$TRAN" != "usb" ]]; then
    log_warn "Device transport is '$TRAN', not 'usb'. Proceed with caution!"
fi

read -p "Continue? [y/N] " -n 1 -r
echo ""
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    log_info "Aborted"
    exit 0
fi

# Flash the image
log_info "Flashing boot image to ${DEVICE}..."
sudo dd if="${BOOT_IMAGE}" of="${DEVICE}" bs=4M status=progress conv=fsync

# Sync
log_info "Syncing..."
sync

# Verify
log_info "Verifying..."
if sudo cmp -n $(stat -c%s "${BOOT_IMAGE}") "${BOOT_IMAGE}" "${DEVICE}"; then
    log_info "✅ Flash successful!"
else
    log_error "Verification failed!"
    exit 1
fi

echo ""
echo "=========================================="
echo " FLASH COMPLETE"
echo "=========================================="
echo ""
echo "Next steps:"
echo "  1. Eject USB: sudo eject ${DEVICE}"
echo "  2. Insert into target machine with AMD GPU"
echo "  3. Enter BIOS/UEFI (F2, F12, or Del)"
echo "  4. Disable Secure Boot"
echo "  5. Set boot mode to UEFI"
echo "  6. Select USB drive as boot device"
echo ""
