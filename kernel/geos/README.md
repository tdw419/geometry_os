# Phase 4: Bare Metal Boot

Boot directly to GPU without Linux kernel.

## Components

| Component | File | Description |
|-----------|------|-------------|
| UEFI Bootloader | `bootloader/efi/boot.c` | Finds GPU, loads kernel |
| Kernel Entry | `kernel/geos/entry.S` | x86_64 assembly entry |
| Kernel Main | `kernel/geos/main.c` | GPU init, glyph execution |
| AMDGPU Driver | `kernel/geos/amdgpu.c` | AMD GPU MMIO |
| SPIR-V Submit | `kernel/geos/spirv_submit.c` | Compute dispatch |

## Build Requirements

```bash
# Install UEFI development tools
sudo apt install gnu-efi

# Build bare metal kernel
cd kernel/geos
make

# Build UEFI bootloader (requires gnu-efi)
cd ../../bootloader
make
```

## Build Output

```
kernel/geos/geometry_os.kernel  # Bare metal kernel (~10KB)
bootloader/BOOTX64.EFI          # UEFI bootloader
```

## Create Bootable USB

```bash
# Create 64MB FAT32 image
dd if=/dev/zero of=boot.img bs=1M count=64
mkfs.vfat boot.img

# Mount and copy files
sudo mkdir /mnt/efi
sudo mount boot.img /mnt/efi
sudo mkdir -p /mnt/efi/EFI/BOOT
sudo cp bootloader/BOOTX64.EFI /mnt/efi/EFI/BOOT/
sudo cp kernel/geos/geometry_os.kernel /mnt/efi/
sudo umount /mnt/efi

# Write to USB
sudo dd if=boot.img of=/dev/sdX bs=1M
```

## QEMU Testing

```bash
# Test kernel directly (without UEFI)
qemu-system-x86_64 -kernel geometry_os.kernel -m 512M -nographic

# Test with UEFI (requires OVMF)
qemu-system-x86_64 -bios /usr/share/OVMF/OVMF_CODE.fd \
    -drive file=boot.img,format=raw -m 512M
```

## Boot Sequence

```
UEFI Firmware
     ↓
BOOTX64.EFI (bootloader)
     ↓ find_gpu(), map_mmio(), allocate_glyph_memory()
Load geometry_os.kernel
     ↓
entry.S: _start
     ↓ GDT, IDT, stack
kernel_main()
     ↓
GPU Init → Glyph Execution → Display
```

## Architecture

```
┌─────────────────────────────────────────┐
│           UEFI Bootloader               │
│  • Find AMD/Intel GPU via PCI           │
│  • Map GPU MMIO                         │
│  • Allocate 256MB glyph memory          │
│  • Load kernel at 1MB                   │
└─────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────┐
│           Geometry OS Kernel            │
│  • Serial debug output                  │
│  • Direct GPU MMIO access               │
│  • Glyph program execution              │
│  • Framebuffer rendering                │
└─────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────┐
│              GPU Hardware               │
│  • AMDGPU: MMIO at BAR0                 │
│  • Intel i915: MMIO at BAR0             │
│  • Compute dispatch via rings           │
│  • DMA-BUF for display                  │
└─────────────────────────────────────────┘
```

## Status

| Phase | Status |
|-------|--------|
| UEFI Bootloader | ✅ Scaffold |
| Kernel Entry | ✅ Compiles |
| GPU Init | ✅ Scaffold |
| Glyph Execution | ✅ Test |
| Display Output | ✅ Test pattern |
| AMDGPU MMIO | 🔧 In progress |
| Intel i915 | 🔧 In progress |
