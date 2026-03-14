#!/bin/bash
# =============================================================================
# Geometry OS - USB Auto-Flash Daemon
# =============================================================================
# Monitors for USB drive insertion and automatically flashes the boot image.
# Run in background: ./usb_watch_daemon.sh &
# =============================================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BOOT_IMAGE="${SCRIPT_DIR}/geometry_os_boot.img"
LOG_FILE="/tmp/geos_usb_daemon.log"
FLASHED_MARKER="/tmp/geos_flashed_marker"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

log() {
    echo -e "[$(date '+%H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

log_info() { log "${GREEN}[INFO]${NC} $1"; }
log_warn() { log "${YELLOW}[WARN]${NC} $1"; }
log_error() { log "${RED}[ERROR]${NC} $1"; }
log_action() { log "${BLUE}[ACTION]${NC} $1"; }

# Get list of currently known USB devices
get_known_devices() {
    lsblk -o NAME,TRAN -n 2>/dev/null | awk '$2=="usb" {print $1}' | sort
}

# Check for new USB devices
check_for_new_usb() {
    local current=$(get_known_devices)
    local known_file="/tmp/geos_known_usb_devices"

    if [[ ! -f "$known_file" ]]; then
        echo "$current" > "$known_file"
        return 1
    fi

    local previous=$(cat "$known_file" 2>/dev/null)

    # Check for new devices
    for dev in $current; do
        if ! echo "$previous" | grep -q "^${dev}$"; then
            # New device found, update known list
            echo "$current" > "$known_file"
            echo "$dev"
            return 0
        fi
    done

    # Update known list
    echo "$current" > "$known_file"
    return 1
}

# Get USB device size in bytes
get_device_size() {
    local device=$1
    lsblk -b -o SIZE -n "/dev/$device" 2>/dev/null | head -1
}

# Flash the boot image
flash_device() {
    local device=$1
    local device_path="/dev/$device"
    local size=$(get_device_size "$device")

    # Check minimum size (128MB)
    if [[ $size -lt 134217728 ]]; then
        log_warn "Device $device too small ($(($size / 1024 / 1024))MB < 128MB)"
        return 1
    fi

    # Check if already flashed this session
    if [[ -f "$FLASHED_MARKER" ]]; then
        local flashed_dev=$(cat "$FLASHED_MARKER" 2>/dev/null)
        if [[ "$flashed_dev" == "$device" ]]; then
            log_info "Device $device already flashed this session"
            return 0
        fi
    fi

    log_action "New USB detected: $device ($(($size / 1024 / 1024))MB)"
    log_info "Flashing boot image..."

    # Unmount if mounted
    sudo umount "${device_path}"* 2>/dev/null || true

    # Flash
    log_info "Writing ${BOOT_IMAGE} to ${device_path}..."
    sudo dd if="${BOOT_IMAGE}" of="${device_path}" bs=4M status=progress conv=fsync 2>&1 | tee -a "$LOG_FILE"

    # Sync
    sync

    # Verify
    log_info "Verifying..."
    if sudo cmp -n $(stat -c%s "${BOOT_IMAGE}") "${BOOT_IMAGE}" "${device_path}" 2>/dev/null; then
        log_info "✅ Flash successful!"
        echo "$device" > "$FLASHED_MARKER"

        # Eject safely
        sudo eject "${device_path}" 2>/dev/null || true

        log_action "=========================================="
        log_action " USB READY FOR BOOT"
        log_action "=========================================="
        log_action ""
        log_action "1. Remove USB drive"
        log_action "2. Insert into AMD machine"
        log_action "3. Boot from USB (F12/F2)"
        log_action "4. Disable Secure Boot"
        log_action ""

        # Notify desktop if available
        if command -v notify-send &> /dev/null; then
            notify-send "Geometry OS" "USB flashed and ready for boot!" 2>/dev/null || true
        fi

        return 0
    else
        log_error "Verification failed!"
        return 1
    fi
}

# Main daemon loop
main() {
    log_info "=========================================="
    log_info " Geometry OS - USB Watch Daemon"
    log_info "=========================================="
    log_info ""
    log_info "Monitoring for USB drive insertion..."
    log_info "Boot image: ${BOOT_IMAGE}"
    log_info "Log file: ${LOG_FILE}"
    log_info ""
    log_info "Press Ctrl+C to stop"
    log_info ""

    # Initialize known devices
    get_known_devices > /dev/null

    while true; do
        # Check for new USB devices
        new_device=$(check_for_new_usb)

        if [[ -n "$new_device" ]]; then
            # Small delay to let device settle
            sleep 2

            # Verify device still exists and has size
            if [[ -b "/dev/$new_device" ]]; then
                flash_device "$new_device"
            fi
        fi

        sleep 1
    done
}

# Handle Ctrl+C
trap 'log_info "Daemon stopped"; exit 0' INT TERM

main "$@"
