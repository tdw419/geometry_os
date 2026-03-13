# Phase 4: Bare Metal Boot - Design Document

**Created:** 2026-03-13
**Status:** Approved
**Approach:** Port Kernel Module GPU Code to Bare Metal

---

## Overview

Phase 4 adapts the Phase 3 kernel module GPU code for bare metal execution. The kernel boots directly via GRUB/Multiboot2, initializes the Intel GPU via PCI enumeration, and submits batch buffers via ring buffer.

---

## Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                  Phase 4: Bare Metal Boot                    │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  GRUB / Multiboot2                                          │
│         │                                                   │
│         ▼                                                   │
│  start.asm (32→64 bit, page tables)                        │
│         │                                                   │
│         ▼                                                   │
│  kernel_main()                                              │
│         │                                                   │
│         ├──► pci.c: Find Intel GPU (vendor 0x8086)          │
│         │                                                   │
│         ├──► gpu.c: Map MMIO, forcewake, ring init         │
│         │                                                   │
│         ├──► ring.c: Build batch, submit via ring tail     │
│         │                                                   │
│         ▼                                                   │
│  Intel GPU executes batch buffer                            │
│         │                                                   │
│         ▼                                                   │
│  Framebuffer shows output                                   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Components

### 4.1 PCI Enumeration

**Files:**
- Create: `kernel/boot/pci.c`
- Create: `kernel/boot/pci.h`

**Purpose:** Discover Intel GPU via PCI configuration space using I/O ports.

```c
// pci.h
#define PCI_CONFIG_ADDR  0xCF8
#define PCI_CONFIG_DATA  0xCFC

#define PCI_VENDOR_ID    0x00
#define PCI_DEVICE_ID    0x02
#define PCI_BAR0         0x10
#define PCI_BAR2         0x18

typedef struct {
    u16 vendor_id;
    u16 device_id;
    u64 bar0;        // MMIO base
    u64 bar2;        // Alternate MMIO
} PciDevice;

int pci_find_intel_gpu(PciDevice *dev);
```

### 4.2 GPU Module (Ported from Phase 3)

**Files:**
- Create: `kernel/boot/gpu.c`
- Create: `kernel/boot/gpu.h`

**Purpose:** Intel GPU MMIO access, forcewake, ring buffer management.

```c
// gpu.h - Bare metal version
#define INTEL_GPU_MMIO_SIZE    0x100000

/* Ring buffer registers (RCS) */
#define RCS_RING_HEAD          0x02034
#define RCS_RING_TAIL          0x02030
#define RCS_RING_START         0x02038
#define RCS_RING_CTL           0x0203C

/* Forcewake (Gen12+) */
#define FORCEWAKE_MT           0x0A188
#define FORCEWAKE_ACK_MT       0x130040

struct GeosGpu {
    volatile void *mmio_base;  // volatile for bare metal
    u64 mmio_phys;
    u32 device_id;
    int has_rcs;
    int has_bcs;
};

int gpu_init(struct GeosGpu *gpu);
void gpu_forcewake(struct GeosGpu *gpu);
u32 gpu_read32(struct GeosGpu *gpu, u32 offset);
void gpu_write32(struct GeosGpu *gpu, u32 offset, u32 value);
```

### 4.3 Ring Buffer Submission

**Files:**
- Create: `kernel/boot/ring.c`
- Create: `kernel/boot/ring.h`

**Purpose:** Build and submit batch buffers via GPU ring buffer.

```c
// ring.h
#define RING_SIZE (4 * 1024)

struct RingBuffer {
    u32 *base;
    u32 size;
    u32 head;
    u32 tail;
};

void ring_init(struct RingBuffer *ring, void *base, u32 size);
int ring_submit_batch(struct GeosGpu *gpu, struct RingBuffer *ring,
                      void *batch, u32 batch_size);
void ring_wait_idle(struct GeosGpu *gpu, struct RingBuffer *ring);
```

### 4.4 Kernel Integration

**Files:**
- Modify: `kernel/boot/kernel.c`
- Modify: `kernel/boot/Makefile`

**Changes to kernel.c:**

```c
#include "pci.h"
#include "gpu.h"
#include "ring.h"

static struct GeosGpu gpu;
static struct RingBuffer rcs_ring;
static u32 ring_buffer_mem[RING_SIZE / 4];

void kernel_main(void *fb, u32 width, u32 height, u32 pitch, u32 bpp) {
    // ... existing framebuffer setup ...

    // NEW: Initialize GPU via PCI
    PciDevice pci_dev;
    if (pci_find_intel_gpu(&pci_dev) == 0) {
        gpu_init(&gpu);
        ring_init(&rcs_ring, ring_buffer_mem, RING_SIZE);
        test_gpu_batch(&gpu, &fb);  // Submit test batch
    }
}
```

---

## Data Flow

### Boot Sequence

```
1. GRUB loads kernel.elf
2. start.asm: 32-bit → 64-bit transition, page tables
3. kernel_main() called with framebuffer params
4. pci_find_intel_gpu() scans bus for vendor 0x8086
5. gpu_init() maps MMIO via identity mapping
6. gpu_forcewake() wakes GPU for register access
7. Ring buffer allocated in kernel memory
8. Batch buffer built with MI commands
9. ring_submit_batch() writes to ring tail
10. GPU executes batch, writes to framebuffer
11. Screen shows output
```

### Memory Map

```
0x00000000 - 0x000FFFFF  : Low memory (page tables at 0x1000-0x5000)
0x00100000 - 0x00FFFFFF  : Kernel code/data (identity mapped)
0xE0000000 - 0xE7FFFFFF  : Framebuffer (identity mapped)
0xB03000000 - 0xB030FFFFF  : Intel GPU MMIO (identity mapped)
```

---

## Testing Strategy

| Test | Verification |
|------|--------------|
| PCI enumeration finds device | Serial output shows vendor/device ID |
| GPU MMIO reads return valid data | Forcewake succeeds, registers readable |
| Batch buffer builds correctly | Serial shows MI commands |
| GPU writes to framebuffer | Test rectangle appears on screen |
| Boot completes without hang | Final "OK" message in serial |

**Test command:** `make run` (QEMU with stdvga)

---

## Success Criteria

| Criterion | Verification |
|-----------|--------------|
| Boots from ISO | `geometry_os.iso` boots in QEMU |
| GPU detected | Serial shows "Intel GPU found" |
| Framebuffer test pattern | Gradient + "G" glyph visible |
| Batch submission works | Test rectangle in corner (green = success) |

---

## Differences from Phase 3 (Kernel Module)

| Aspect | Phase 3 (Kernel Module) | Phase 4 (Bare Metal) |
|--------|------------------------|----------------------|
| PCI access | `pci_get_device()` | I/O ports 0xCF8/0xCFC |
| MMIO mapping | `ioremap()` | Identity mapping |
| Memory allocation | `kmalloc()` | Static arrays |
| Synchronization | Mutex | Single-threaded (none) |
| Logging | `pr_info()` | Serial port |

---

## Files Summary

| File | Action | Purpose |
|------|--------|---------|
| `kernel/boot/pci.c` | CREATE | PCI enumeration via I/O ports |
| `kernel/boot/pci.h` | CREATE | PCI constants and structs |
| `kernel/boot/gpu.c` | CREATE | GPU MMIO (adapted from Phase 3) |
| `kernel/boot/gpu.h` | CREATE | GPU constants and structs |
| `kernel/boot/ring.c` | CREATE | Ring buffer submission |
| `kernel/boot/ring.h` | CREATE | Ring buffer structs |
| `kernel/boot/kernel.c` | MODIFY | Integrate GPU init |
| `kernel/boot/Makefile` | MODIFY | Add new files to build |

---

*Design approved: 2026-03-13*
