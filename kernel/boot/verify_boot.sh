#!/bin/bash
# =============================================================================
# Geometry OS - Boot Verification Tool
# =============================================================================
# Verifies boot chain integrity and provides diagnostics.
#
# Usage:
#   ./verify_boot.sh              # Full system check
#   ./verify_boot.sh --quick      # Quick status
#   ./verify_boot.sh --serial     # Monitor serial output
# =============================================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKSPACE="$(cd "${SCRIPT_DIR}/../.." && pwd)"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

pass() { echo -e "${GREEN}✓${NC} $1"; }
fail() { echo -e "${RED}✗${NC} $1"; }
warn() { echo -e "${YELLOW}!${NC} $1"; }
info() { echo -e "${CYAN}i${NC} $1"; }

quick_check() {
    echo "Quick Status:"
    echo ""

    # Count ready components
    local ready=0
    local total=4

    [[ -f "${SCRIPT_DIR}/geometry_os_boot.img" ]] && ((ready++)) && echo "  ✓ Boot image"
    [[ -f "${WORKSPACE}/target/x86_64-unknown-uefi/debug/geometry_os_bootloader.efi" ]] && ((ready++)) && echo "  ✓ EFI bootloader"
    [[ -f "${WORKSPACE}/kernel/geos/geometry_os.kernel" ]] && ((ready++)) && echo "  ✓ Kernel"
    [[ -f "${WORKSPACE}/systems/glyph_stratum/programs/window_manager.rts.png" ]] && ((ready++)) && echo "  ✓ Window manager"

    echo ""
    echo "Ready: $ready/$total"
    [[ $ready -eq $total ]] && return 0 || return 1
}

full_check() {
    echo "╔═══════════════════════════════════════════════════════════════╗"
    echo "║         GEOMETRY OS - BOOT CHAIN VERIFICATION                  ║"
    echo "╚═══════════════════════════════════════════════════════════════╝"
    echo ""

    # 1. Boot Image
    echo "1. Boot Image"
    if [[ -f "${SCRIPT_DIR}/geometry_os_boot.img" ]]; then
        local size=$(stat -c%s "${SCRIPT_DIR}/geometry_os_boot.img")
        local size_mb=$((size / 1024 / 1024))
        pass "geometry_os_boot.img (${size_mb}MB)"

        # Check GPT
        if sgdisk -p "${SCRIPT_DIR}/geometry_os_boot.img" 2>/dev/null | grep -q "EFI System"; then
            pass "GPT partition table valid"
        else
            warn "GPT may be invalid"
        fi
    else
        fail "Boot image not found"
    fi
    echo ""

    # 2. EFI Bootloader
    echo "2. EFI Bootloader"
    local efi="${WORKSPACE}/target/x86_64-unknown-uefi/debug/geometry_os_bootloader.efi"
    if [[ -f "$efi" ]]; then
        local efi_size=$(stat -c%s "$efi")
        pass "BOOTX64.EFI (${efi_size} bytes)"

        # Check PE signature
        if file "$efi" | grep -q "PE32+"; then
            pass "Valid PE32+ executable"
        else
            warn "May not be valid EFI"
        fi
    else
        fail "EFI bootloader not built"
        info "Run: cargo build -p geometry_os_bootloader --target x86_64-unknown-uefi"
    fi
    echo ""

    # 3. Kernel
    echo "3. Geometry OS Kernel"
    local kernel="${WORKSPACE}/kernel/geos/geometry_os.kernel"
    if [[ -f "$kernel" ]]; then
        pass "geometry_os.kernel ($(stat -c%s "$kernel") bytes)"
    else
        fail "Kernel not found"
        info "Run: cd kernel/geos && make"
    fi
    echo ""

    # 4. Glyph Components
    echo "4. Glyph Components"
    local wm="${WORKSPACE}/systems/glyph_stratum/programs/window_manager.rts.png"
    local spv="/tmp/glyph_microcode.spv"

    if [[ -f "$wm" ]]; then
        pass "window_manager.rts.png ($(stat -c%s "$wm") bytes)"
    else
        fail "Window manager texture missing"
    fi

    if [[ -f "$spv" ]]; then
        pass "glyph_microcode.spv ($(stat -c%s "$spv") bytes)"
    else
        warn "Microcode not built (will be built on flash)"
    fi
    echo ""

    # 5. Boot Image Contents
    echo "5. Boot Image Contents"
    if [[ -f "${SCRIPT_DIR}/geometry_os_boot.img" ]]; then
        echo "   Checking partition contents..."

        # Try to list FAT partition
        if mdir -i "${SCRIPT_DIR}/geometry_os_boot.img@@1048576" ::/ &>/dev/null; then
            pass "FAT partition readable"
            mdir -i "${SCRIPT_DIR}/geometry_os_boot.img@@1048576" ::/ 2>/dev/null | while read line; do
                echo "     $line"
            done
        else
            warn "Cannot read partition (may need sudo)"
        fi
    fi
    echo ""

    # 6. Services
    echo "6. Active Services"
    if curl -s http://localhost:8088/status &>/dev/null; then
        pass "Spatial Debugger running (port 8088)"
    else
        info "Debugger not running"
    fi

    if pgrep -f usb_watch_daemon &>/dev/null; then
        pass "USB Watch Daemon running"
    else
        info "USB daemon not running"
    fi
    echo ""

    # Summary
    echo "╔═══════════════════════════════════════════════════════════════╗"
    echo "║                         SUMMARY                               ║"
    echo "╚═══════════════════════════════════════════════════════════════╝"

    if [[ -f "${SCRIPT_DIR}/geometry_os_boot.img" ]] && \
       [[ -f "$efi" ]] && \
       [[ -f "$kernel" ]] && \
       [[ -f "$wm" ]]; then
        echo ""
        pass "Boot chain ready for hardware flash"
        echo ""
        echo "Flash command:"
        echo "  sudo ${SCRIPT_DIR}/flash_to_usb.sh /dev/sdX"
        return 0
    else
        echo ""
        fail "Boot chain incomplete"
        echo ""
        echo "Build command:"
        echo "  ${SCRIPT_DIR}/run_bare_metal.sh"
        return 1
    fi
}

serial_monitor() {
    echo "Monitoring serial output (Ctrl+C to stop)..."
    echo ""

    if [[ ! -f "/tmp/geos_serial.log" ]]; then
        touch /tmp/geos_serial.log
    fi

    echo "Last 10 lines:"
    tail -10 /tmp/geos_serial.log 2>/dev/null || echo "(empty)"
    echo ""
    echo "---"
    echo ""

    # Follow log
    tail -f /tmp/geos_serial.log 2>/dev/null
}

# Main
case "${1:-}" in
    --quick|-q)
        quick_check
        ;;
    --serial|-s)
        serial_monitor
        ;;
    *)
        full_check
        ;;
esac
