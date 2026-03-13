# Geometry OS UEFI Bootloader

## Overview

This directory contains a bare-metal bootloader for Geometry OS that can boot without the Linux kernel. It initializes the display via GOP (Graphics Output Protocol) and prepares for kernel execution.

## Files

| File | Description |
|------|-------------|
| `main.c` | UEFI bootloader main entry point (C with gnu-efi) |
| `kernel_stub.c` | Minimal kernel that runs after ExitBootServices |
| `linker.ld` | Linker script for kernel |
| `Makefile` | Build instructions |
| `bootx64.asm` | Alternative NASM assembly bootloader |

## Building

### Prerequisites

```bash
# Ubuntu
sudo apt install gnu-efi

# Arch Linux
sudo pacman -S gnu-efi
```

### Compile

```bash
make check-deps  # Verify dependencies
make           # Build bootloader
make boot.img   # Create bootable USB image
```

### Run in QEMU

```bash
# Install OVMF (UEFI firmware for QEMU)
sudo apt install ovmf

# Run
make boot_dir
make run
```

## Boot Process

```
UEFI Firmware
    ↓
bootx64.efi (Geometry OS Bootloader)
    ↓
[1] Locate GOP (Graphics Output Protocol)
    ↓
[2] Find best video mode
    ↓
[3] Set video mode
    ↓
[4] Get framebuffer info
    ↓
[5] Draw test pattern
    ↓
[6] Load kernel.bin (optional)
    ↓
[7] ExitBootServices → Jump to kernel
    ↓
kernel.bin (Bare Metal Kernel)
    ↓
Direct GPU programming via MMIO
```

## Framebuffer Info

The bootloader passes the following to the kernel:

```c
void kernel_main(
    void *fb_base,      // Framebuffer base address
    uint32_t fb_width,   // Width in pixels
    uint32_t fb_height,  // Height in pixels
    uint32_t fb_pitch,  // Bytes per scanline
    uint32_t fb_bpp     // Bits per pixel (usually 32)
);
```

## Test Pattern

The bootloader draws a test pattern:
- Gradient (red → green → blue) across screen
- White "G" glyph in center
- White rectangle around glyph

## Next Steps

1. **Add kernel loading** - Load kernel.bin from ESP partition
2. **Memory management** - Set up page tables for kernel
3. **GPU MMIO** - Map Intel GPU registers for direct programming
4. **Batch submission** - Submit batch buffers via ring
5. **Interrupt handling** - Set up IDT for keyboard/timer

## Memory Map

After ExitBootServices:
```
0x00000000 - 0x000FFFFF  : Conventional memory (low 1MB)
0x00100000 - 0x000FFFFF  : Reserved
0x00100000 - 0xBFFFFFFF  : Available RAM
0xC0000000 - 0xFFFFFFFF  : Reserved (kernel space)
MMIO regions (from ACPI):
0xB03000000 - 0xB030FFFFF  : Intel GPU registers (BAR0)
```

## GOP Pixel Formats

The bootloader prefers these formats:
- `PixelRedGreenBlueReserved8BitPerColor` (RGBX)
- `PixelBlueGreenRedReserved8BitPerColor` (BGRX)

Both are 32 bits per pixel with 8 bits per channel.

## Phase 4: GPU Integration (Current)

Phase 4 adds real GPU support via PCI enumeration and ring buffer submission.

### Architecture

```
Boot → start.asm → kernel_main()
                         ↓
                   pci.c: Find Intel GPU
                         ↓
                   gpu.c: Map MMIO, forcewake
                         ↓
                   ring.c: Submit batch buffers
                         ↓
                   GPU executes → Framebuffer
```

### Files

| File | Description |
|------|-------------|
| `pci.c`, `pci.h` | PCI enumeration via I/O ports 0xCF8/0xCFC |
| `gpu.c`, `gpu.h` | GPU MMIO access (from Phase 3) |
| `ring.c`, `ring.h` | Ring buffer submission |

### Build

```bash
cd kernel/boot
make geometry_os.iso
```

### Test in QEMU

```bash
make run
```

Expected output in serial:
```
[INFO] Initializing GPU...
[OK] Intel GPU found (vendor 0x8086, device 0xXXXX)
[OK] GPU MMIO initialized
[OK] GPU forcewake acquired
[OK] Ring buffer initialized
```

### Status

- [x] PCI enumeration working
- [ ] GPU MMIO access working (pending real hardware test)
- [ ] Forcewake working (pending real hardware test)
- [ ] Ring buffer submission (pending real hardware test)

## License

MIT License - Geometry OS
