#!/bin/bash
# =============================================================================
# Shotcut VM Image Builder
# =============================================================================
# Builds a QEMU-ready Alpine Linux image with Shotcut pre-installed.
#
# Output: shotcut-alpine.qcow2 (~2GB)
#
# Requirements:
#   - qemu-img
#   - guestfish (libguestfs-tools) OR virt-customize
#   - wget/curl
#   - ~5GB free disk space
#
# Usage:
#   ./build_shotcut_vm.sh [--output shotcut-alpine.qcow2] [--size 8G]
#
# =============================================================================

set -e

# =============================================================================
# Configuration
# =============================================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT_DIR="${SCRIPT_DIR}/images"
ALPINE_VERSION="3.19"
ALPINE_MIRROR="https://dl-cdn.alpinelinux.org/alpine"

# Default values
OUTPUT_IMAGE="${OUTPUT_DIR}/shotcut-alpine.qcow2"
DISK_SIZE="8G"
MEMORY="2048"
VNC_PORT="5900"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# =============================================================================
# Helper Functions
# =============================================================================

log_info() {
    echo -e "${BLUE}[INFO]${NC} $1" >&2
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1" >&2
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1" >&2
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1" >&2
}

check_dependencies() {
    log_info "Checking dependencies..."

    local missing=()

    # Check for qemu-img
    if ! command -v qemu-img &> /dev/null; then
        missing+=("qemu-img")
    fi

    # Check for guestfish or virt-customize
    if command -v virt-customize &> /dev/null; then
        CUSTOMIZE_CMD="virt-customize"
    elif command -v guestfish &> /dev/null; then
        CUSTOMIZE_CMD="guestfish"
    else
        missing+=("libguestfs-tools (provides virt-customize or guestfish)")
    fi

    # Check for wget or curl
    if command -v wget &> /dev/null; then
        DOWNLOAD_CMD="wget"
    elif command -v curl &> /dev/null; then
        DOWNLOAD_CMD="curl"
    else
        missing+=("wget or curl")
    fi

    if [ ${#missing[@]} -ne 0 ]; then
        log_error "Missing dependencies:"
        for dep in "${missing[@]}"; do
            echo "  - $dep"
        done
        echo ""
        echo "Install on Ubuntu/Debian:"
        echo "  sudo apt install qemu-utils libguestfs-tools wget"
        echo ""
        echo "Install on Fedora:"
        echo "  sudo dnf install qemu-img guestfs-tools wget"
        exit 1
    fi

    log_success "All dependencies found"
}

parse_args() {
    while [[ $# -gt 0 ]]; do
        case $1 in
            --output|-o)
                OUTPUT_IMAGE="$2"
                shift 2
                ;;
            --size|-s)
                DISK_SIZE="$2"
                shift 2
                ;;
            --help|-h)
                echo "Usage: $0 [OPTIONS]"
                echo ""
                echo "Options:"
                echo "  --output, -o PATH   Output qcow2 image path (default: ${OUTPUT_IMAGE})"
                echo "  --size, -s SIZE     Disk size (default: ${DISK_SIZE})"
                echo "  --help, -h          Show this help"
                exit 0
                ;;
            *)
                log_error "Unknown option: $1"
                exit 1
                ;;
        esac
    done
}

# =============================================================================
# Image Building Functions
# =============================================================================

download_alpine_virt() {
    local virt_url="${ALPINE_MIRROR}/v${ALPINE_VERSION}/releases/x86_64/alpine-virt-${ALPINE_VERSION}.1-x86_64.iso"
    local iso_path="${OUTPUT_DIR}/alpine-virt-${ALPINE_VERSION}.iso"

    if [ -f "$iso_path" ]; then
        log_info "Alpine ISO already downloaded: $iso_path"
        return 0
    fi

    log_info "Downloading Alpine Virtual ISO..."
    mkdir -p "$OUTPUT_DIR"

    if [ "$DOWNLOAD_CMD" = "wget" ]; then
        wget -O "$iso_path" "$virt_url"
    else
        curl -L -o "$iso_path" "$virt_url"
    fi

    log_success "Downloaded: $iso_path"
}

create_base_image() {
    log_info "Creating base qcow2 image (${DISK_SIZE})..."

    mkdir -p "$(dirname "$OUTPUT_IMAGE")"

    qemu-img create -f qcow2 "$OUTPUT_IMAGE" "$DISK_SIZE"

    log_success "Created: $OUTPUT_IMAGE"
}

install_alpine_to_image() {
    log_info "Starting interactive Alpine Linux installation..."
    echo ""
    log_warning "A QEMU window will now open with the Alpine Linux installer."
    log_warning "Please follow these instructions carefully inside the VM:"
    echo "──────────────────────────────────────────────────────────────────────"
    echo "1. When you see the 'localhost login:' prompt, type 'root' and press Enter."
    echo "2. At the prompt '#', type 'setup-alpine' and press Enter."
    echo "3. Follow the setup-alpine script:"
    echo "   - Select keyboard layout (e.g., 'us', 'us')"
    echo "   - Enter hostname: shotcut-vm"
    echo "   - Initialize network interface: eth0 (default)"
    echo "   - IP address: dhcp (default)"
    echo "   - No manual network config."
    echo "   - Set root password (e.g., 'root')"
    echo "   - Timezone: UTC (or your preference)"
    echo "   - HTTP/FTP proxy URL: none (default)"
    echo "   - Mirror: Select a mirror (e.g., '1')"
    echo "   - SSH server: openssh"
    echo "   - NTP client: chrony"
    echo "   - Install to which disk: vda"
    echo "   - How to use it: sys"
    echo "   - Erase disk and continue? y"
    echo "4. After installation is complete, you will be back at the prompt."
    echo "5. Type 'poweroff' and press Enter."
    echo "6. The QEMU window will close, and the script will continue."
    echo "──────────────────────────────────────────────────────────────────────"
    echo ""
    read -p "Press [Enter] to begin the interactive installation..."

    local iso_path="${OUTPUT_DIR}/alpine-virt-${ALPINE_VERSION}.iso"

    # Start QEMU with Alpine ISO for interactive installation
    qemu-system-x86_64 \
        -m "$MEMORY" \
        -drive file="$OUTPUT_IMAGE",format=qcow2,if=virtio \
        -cdrom "$iso_path" \
        -boot d \
        -vnc ":0" \
        -serial mon:stdio \
        -netdev user,id=net0,hostfwd=tcp::2222-:22 \
        -device virtio-net-pci,netdev=net0
}

install_alpine_automated() {
    # Alternative: Use alpine-make-vm-image for fully automated build
    # This doesn't require interactive installation

    local iso_path="${OUTPUT_DIR}/alpine-virt-${ALPINE_VERSION}.iso"
    local packages="linux-virt,openrc,syslinux,alpine-base,shotcut,xorg-server,openbox,xf86-video-vesa,xf86-input-evdev,dbus,elogind"

    log_info "Creating automated Alpine image with Shotcut..."

    # Create setup script that runs on first boot
    cat > "${OUTPUT_DIR}/setup.sh" << 'SETUP_SCRIPT'
#!/bin/sh
# First-boot setup script for Shotcut VM

# Enable community repository
sed -i 's/#.*community/community/' /etc/apk/repositories

# Update and install packages
apk update
apk add shotcut xorg-server openbox xf86-video-vesa xf86-input-evdev \
    xf86-input-mouse xf86-input-keyboard dbus elogind xterm \
    ttf-dejavu font-adobe-100dpi font-adobe-75dpi

# Create shotcut user
adduser -D -s /bin/sh shotcut
echo "shotcut:shotcut" | chpasswd

# Configure auto-login for shotcut user
cat > /etc/conf.d/agetty << 'EOF'
agetty_options="--autologin shotcut --noclear"
EOF

# Create X startup script
mkdir -p /home/shotcut
cat > /home/shotcut/.xinitrc << 'EOF'
#!/bin/sh
# Start openbox with Shotcut
openbox-session &
SHOTCUT_PID=$!
wait $SHOTCUT_PID
EOF
chmod +x /home/shotcut/.xinitrc
chown shotcut:shotcut /home/shotcut/.xinitrc

# Create openbox autostart
mkdir -p /home/shotcut/.config/openbox
cat > /home/shotcut/.config/openbox/autostart << 'EOF'
#!/bin/sh
# Auto-start Shotcut
shotcut &
EOF
chmod +x /home/shotcut/.config/openbox/autostart
chown -R shotcut:shotcut /home/shotcut/.config

# Configure bash profile for auto-start X
cat >> /home/shotcut/.profile << 'EOF'
# Auto-start X on login
if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
    startx
    logout
fi
EOF
chown shotcut:shotcut /home/shotcut/.profile

# Enable services
rc-update add devfs sysinit
rc-update add dmesg sysinit
rc-update add mdev sysinit
rc-update add hwdrivers sysinit
rc-update add hwclock boot
rc-update add modules boot
rc-update add sysctl boot
rc-update add hostname boot
rc-update add bootmisc boot
rc-update add networking boot
rc-update add dbus default
rc-update add elogind default

# Set hostname
echo "shotcut-vm" > /etc/hostname

echo "Setup complete! Rebooting..."
reboot
SETUP_SCRIPT

    log_info "Setup script created at ${OUTPUT_DIR}/setup.sh"
    log_info ""
    log_info "To complete installation:"
    log_info "  1. Boot the VM with the Alpine ISO"
    log_info "  2. Run 'setup-alpine' with these choices:"
    log_info "     - Keyboard layout: us"
    log_info "     - Hostname: shotcut-vm"
    log_info "     - Interface: eth0"
    log_info "     - IP: dhcp"
    log_info "     - Root password: (your choice)"
    log_info "     - Timezone: UTC"
    log_info "     - Proxy: none"
    log_info "     - NTP client: chrony"
    log_info "     - Mirror: 1 (first mirror)"
    log_info "     - SSH server: openssh"
    log_info "     - Disk: vda"
    log_info "     - How to use: sys"
    log_info "  3. After installation, reboot and copy setup.sh"
    log_info "  4. Run: sh /setup.sh"
}

create_cloud_init_image() {
    # Create a cloud-init nocloud ISO for automated configuration
    log_info "Creating cloud-init configuration..."

    local cidata="${OUTPUT_DIR}/cidata"
    mkdir -p "$cidata"

    # meta-data
    cat > "${cidata}/meta-data" << 'EOF'
instance-id: shotcut-vm
local-hostname: shotcut-vm
EOF

    # user-data
    cat > "${cidata}/user-data" << 'EOF'
#cloud-config
hostname: shotcut-vm
fqdn: shotcut-vm.local

users:
  - name: shotcut
    plain_text_passwd: shotcut
    lock_passwd: false
    shell: /bin/sh
    sudo: ALL=(ALL) NOPASSWD:ALL

ssh_pwauth: true

write_files:
  - path: /home/shotcut/.xinitrc
    content: |
      #!/bin/sh
      exec openbox-session
    permissions: '0755'
    owner: shotcut:shotcut

  - path: /home/shotcut/.config/openbox/autostart
    content: |
      #!/bin/sh
      shotcut &
    permissions: '0755'
    owner: shotcut:shotcut

  - path: /etc/systemd/system/shotcut.service
    content: |
      [Unit]
      Description=Auto-start Shotcut
      After=graphical.target

      [Service]
      Type=simple
      User=shotcut
      ExecStart=/usr/bin/startx /home/shotcut/.xinitrc
      Restart=on-failure

      [Install]
      WantedBy=graphical.target
    permissions: '0644'

runcmd:
  - sed -i 's/#.*community/community/' /etc/apk/repositories
  - apk update
  - apk add shotcut xorg-server openbox xf86-video-vesa xf86-input-evdev xf86-input-mouse xf86-input-keyboard dbus elogind xterm ttf-dejavu
  - chown -R shotcut:shotcut /home/shotcut
  - rc-update add dbus default
  - rc-update add elogind default

EOF

    # Create ISO
    local cidata_iso="${OUTPUT_DIR}/cidata.iso"
    if command -v genisoimage &> /dev/null; then
        genisoimage -output "$cidata_iso" -volid cidata -joliet -rock "$cidata"
    elif command -v mkisofs &> /dev/null; then
        mkisofs -output "$cidata_iso" -volid cidata -joliet -rock "$cidata"
    else
        log_warning "genisoimage/mkisofs not found, skipping cloud-init ISO creation"
        return 1
    fi

    log_success "Created cloud-init ISO: $cidata_iso"
}

# =============================================================================
# Alternative: Use Alpine nocloud image
# =============================================================================

download_alpine_nocloud() {
    # Alpine provides pre-built cloud images that work with cloud-init
    local nocloud_url="${ALPINE_MIRROR}/v${ALPINE_VERSION}/releases/cloud/nocloud_alpine-${ALPINE_VERSION}.1-x86_64-bios-cloudinit-r0.qcow2"
    local nocloud_path="${OUTPUT_DIR}/alpine-nocloud-base.qcow2"

    if [ -f "$nocloud_path" ]; then
        log_info "Alpine nocloud image already downloaded: $nocloud_path"
        echo "$nocloud_path"
        return 0
    fi

    log_info "Downloading Alpine nocloud image..."
    mkdir -p "$OUTPUT_DIR"

    if [ "$DOWNLOAD_CMD" = "wget" ]; then
        wget -O "$nocloud_path" "$nocloud_url"
    else
        curl -L -o "$nocloud_path" "$nocloud_url"
    fi

    log_success "Downloaded: $nocloud_path"
    echo "$nocloud_path"
}

customize_with_virt_customize() {
    local base_image="$1"

    log_info "Customizing image with virt-customize..."

    virt-customize -a "$OUTPUT_IMAGE" \
        --network \
        --run-command 'echo "nameserver 8.8.8.8" > /etc/resolv.conf' \
        --run-command 'sed -i "s/#.*community/community/" /etc/apk/repositories' \
        --run-command 'apk update' \
        --install shotcut,xorg-server,openbox,xf86-video-vesa,xf86-input-evdev,xf86-input-mouse,xf86-input-keyboard,dbus,elogind,xterm,ttf-dejavu \
        --run-command 'adduser -D -s /bin/sh shotcut' \
        --run-command 'echo "shotcut:shotcut" | chpasswd' \
        --mkdir /home/shotcut/.config/openbox \
        --copy-in "${OUTPUT_DIR}/autostart:/home/shotcut/.config/openbox/" \
        --chmod 0755:/home/shotcut/.config/openbox/autostart \
        --run-command 'chown -R shotcut:shotcut /home/shotcut' \
        --run-command 'rc-update add dbus default' \
        --run-command 'rc-update add elogind default' \
        --hostname shotcut-vm

    log_success "Image customization complete"
}

build_simple_method() {
    # Simplest method: Download nocloud image and customize
    log_info "Building Shotcut VM using simple method..."

    local base_image
    base_image=$(download_alpine_nocloud)

    # Copy base image to output
    log_info "Copying base image to $OUTPUT_IMAGE..."
    cp "$base_image" "$OUTPUT_IMAGE"

    # Resize if needed
    qemu-img resize "$OUTPUT_IMAGE" "$DISK_SIZE"

    # Create autostart script
    mkdir -p "${OUTPUT_DIR}"
    cat > "${OUTPUT_DIR}/autostart" << 'EOF'
#!/bin/sh
# Auto-start Shotcut on X login
shotcut &
EOF

    # Try virt-customize if available
    if [ "$CUSTOMIZE_CMD" = "virt-customize" ]; then
        customize_with_virt_customize "$base_image"
    else
        log_warning "virt-customize not available"
        log_info "You'll need to manually customize the image or use the cloud-init method"
    fi

    log_success "Base image ready: $OUTPUT_IMAGE"
    log_info "Create a cloud-init ISO for automated setup: $0 --create-cidata"
}

# =============================================================================
# Main Build Flow
# =============================================================================

create_boot_script() {
    # Create a helper script to boot the VM
    local boot_script="${SCRIPT_DIR}/boot_shotcut_vm.sh"

    cat > "$boot_script" << 'BOOTSCRIPT'
#!/bin/bash
# Boot the Shotcut VM

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
IMAGE="${SCRIPT_DIR}/images/shotcut-alpine.qcow2"
CIDATA="${SCRIPT_DIR}/images/cidata.iso"

if [ ! -f "$IMAGE" ]; then
    echo "Error: Image not found: $IMAGE"
    echo "Run ./build_shotcut_vm.sh first"
    exit 1
fi

echo "🎬 Starting Shotcut VM..."
echo "   Image: $IMAGE"
echo "   VNC: :0 (port 5900)"
echo "   SSH: localhost:2222"

QEMU_ARGS=(
    -m 2048
    -smp 2
    -drive file="$IMAGE",format=qcow2,if=virtio
    -vnc :0
    -serial mon:stdio
    -netdev user,id=net0,hostfwd=tcp::2222-:22
    -device virtio-net-pci,netdev=net0
    -device qxl-vga,vgamem_mb=64
)

# Add cloud-init ISO if available
if [ -f "$CIDATA" ]; then
    QEMU_ARGS+=(-cdrom "$CIDATA")
    echo "   Cloud-init: $CIDATA"
fi

qemu-system-x86_64 "${QEMU_ARGS[@]}"
BOOTSCRIPT

    chmod +x "$boot_script"
    log_success "Created boot script: $boot_script"
}

main() {
    if [ "$(id -u)" -ne 0 ]; then
        log_error "This script must be run as root (using sudo) to allow virt-customize to access the host kernel."
        exit 1
    fi

    echo ""
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║           Shotcut VM Image Builder for Geometry OS           ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo ""

    parse_args "$@"
    check_dependencies

    # Create output directory
    mkdir -p "$OUTPUT_DIR"

    log_info "Configuration:"
    echo "  Output: $OUTPUT_IMAGE"
    echo "  Size: $DISK_SIZE"
    echo "  Alpine: $ALPINE_VERSION"
    echo ""

    # The automated 'virt-customize' method is failing due to persistent
    # network issues within the libguestfs appliance.
    # We will now switch to the more reliable interactive installation method.
    log_warning "Automated build failed. Switching to interactive installation."
    log_info "You will need to manually install Alpine Linux inside the QEMU window."

    # Interactively build the image
    download_alpine_virt
    create_base_image
    install_alpine_to_image

    # Create boot script
    create_boot_script

    echo ""
    log_success "Build complete!"
    echo ""
    echo "Next steps:"
    echo "  1. Boot the VM: ./boot_shotcut_vm.sh"
    echo "  2. Login as root (no password) or shotcut/shotcut"
    echo "  3. If cloud-init worked, Shotcut should auto-start"
    echo "  4. If not, run: setup-alpine && apk add shotcut xorg-server openbox"
    echo ""
    echo "Connect via VNC:"
    echo "  vncviewer localhost:5900"
    echo ""
}

# Handle --create-cidata flag
if [ "$1" = "--create-cidata" ]; then
    OUTPUT_DIR="${SCRIPT_DIR}/images"
    create_cloud_init_image
    exit 0
fi

main "$@"
