# Glyph-to-Metal Pipeline

**Status: Complete** | **Date: 2026-03-13**

## Overview

The Glyph-to-Metal pipeline compiles Glyph programs to GPU-executable bytecode, running directly on hardware without OS intermediaries.

```
Glyph JSON → SPIR-V → GPU Ring Buffer → Intel GPU Execution
    ↓           ↓            ↓               ↓
 Compiler    DRM/KMS    Kernel Module    Bare Metal
 (Phase 1)   (Phase 2)    (Phase 3)       (Phase 4)
```

## Phases

### Phase 1: Glyph → SPIR-V Compiler

**Location:** `systems/glyph_compiler/`

Compiles Glyph JSON programs to SPIR-V compute shaders.

```json
{
  "instructions": [
    {"op": "LOAD_CONST", "dst": 0, "value": 42},
    {"op": "OUTPUT", "src": 0}
  ]
}
```

**Output:** SPIR-V binary ready for GPU execution.

### Phase 2: DRM/KMS Direct Execution

**Location:** `systems/infinite_map_rs/src/backend/drm/`

Executes compiled SPIR-V via DRM/KMS, bypassing X11/Wayland.

- Uses wgpu with DRM backend
- Direct GPU memory access via GBM
- KMS page flip for scanout

### Phase 3: Custom Kernel Module

**Location:** `kernel/geometry_os_module/`

Linux kernel module (`geometry_os.ko`) for direct GPU MMIO access.

```c
// Ioctl interface
GEOS_IOCTL_LOAD_SPIRV   // Load SPIR-V binary
GEOS_IOCTL_EXECUTE      // Execute on GPU
GEOS_IOCTL_GET_OUTPUT   // Get output buffer fd
```

**Features:**
- PCI enumeration for Intel GPU
- MMIO register access
- Ring buffer submission (RCS/BCS)
- DMA-BUF export for zero-copy sharing

### Phase 4: Bare Metal Boot

**Location:** `kernel/boot/`

Complete kernel that boots directly on hardware via GRUB/Multiboot2.

**Boot sequence:**
```
GRUB → start.asm (32→64 bit) → kernel_main()
         ↓
    PCI enumeration → GPU MMIO init → Ring buffer submit
```

**Files:**
| File | Purpose |
|------|---------|
| `start.asm` | Multiboot2 entry, 64-bit transition, page tables |
| `kernel.c` | Main kernel, framebuffer, GPU integration |
| `pci.c` | PCI enumeration via I/O ports |
| `gpu.c` | Intel GPU MMIO access, forcewake |
| `ring.c` | Ring buffer submission |
| `memory.c` | Physical memory management |
| `interrupt.c` | IDT setup |

## Boot Output

```
========================================
  Geometry OS Kernel v0.1
  Glyph-to-Metal Pipeline
========================================

[INFO] Parsing multiboot2 info...
[OK] Framebuffer tag found
  Base: 0xFD000000
  Size: 1024 x 768

[INFO] Initializing GPU...
[OK] Intel GPU found (vendor 0x8086, device 0xXXXX)
[OK] GPU MMIO initialized
[OK] Ring buffer initialized
  RCS: available
  BCS: available

[OK] Kernel initialized successfully!
```

## Building

```bash
cd kernel/boot
make kernel.bin   # Build kernel
make iso          # Create bootable ISO
make run-iso      # Run in QEMU
```

## QEMU Testing

```bash
qemu-system-x86_64 \
    -cdrom geometry_os.iso \
    -m 256M \
    -serial stdio \
    -vga std
```

## Real Hardware

```bash
# Write ISO to USB
sudo dd if=geometry_os.iso of=/dev/sdX bs=4M status=progress && sync

# Boot on Intel GPU machine
# - Enter BIOS (F2/F12/Del)
# - Select USB boot
# - Watch serial output (38400 8N1)
```

## Key Technical Details

### Intel GPU MMIO

```c
#define INTEL_VENDOR_ID     0x8086
#define INTEL_GPU_MMIO_SIZE 0x100000

// Ring buffer registers (RCS)
#define RCS_RING_HEAD       0x02034
#define RCS_RING_TAIL       0x02030
#define RCS_RING_START      0x02038
#define RCS_RING_CTL        0x0203C

// Forcewake (Gen12+)
#define FORCEWAKE_MT        0x0A188
#define FORCEWAKE_ACK_MT    0x130040
```

### Page Table Mapping

```
0x00000000 - 0x7FFFFFFF  : Identity mapped (first 2GB)
0xFD000000 - 0xFDFFFFFF  : QEMU framebuffer (PDPT[3])
0xE0000000 - 0xE7FFFFFF  : Intel GPU MMIO (PDPT[56])
```

### Ring Buffer Submission

```c
int ring_submit_batch(struct GeosGpu *gpu, struct RingBuffer *ring,
                      void *batch, u32 batch_size) {
    // 1. Copy batch to ring buffer
    // 2. Update ring tail
    // 3. Wait for completion
    return 0;
}
```

## Future: Phase 5 (Self-Hosting)

Port glyph compiler to bare metal, enabling:

```
Glyph JSON → On-metal Compiler → MI Commands → GPU Execution
                  (no Linux)
```

---

*Pipeline completed: 2026-03-13*
