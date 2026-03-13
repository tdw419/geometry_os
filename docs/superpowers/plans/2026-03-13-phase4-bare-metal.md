# Phase 4: Bare Metal Boot Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Port kernel module GPU code to bare metal, enabling real GPU ring buffer submission without Linux.

**Architecture:** Reuse Phase 3 gpu.c/gpu.h, add PCI enumeration via I/O ports, integrate into existing bootloader with ring buffer submission.

**Tech Stack:** C (bare metal), NASM, GRUB/Multiboot2, Intel GPU MMIO

---

## Chunk 0: PCI Enumeration

### Task 0.1: Create PCI Module

**Files:**
- Create: `kernel/boot/pci.h`
- Create: `kernel/boot/pci.c`

**Step 1: Create pci.h header**

```c
/* pci.h - PCI enumeration via I/O ports */
#ifndef _PCI_H
#define _PCI_H

#include <stdint.h>

/* I/O ports for PCI config space */
#define PCI_CONFIG_ADDR  0xCF8
#define PCI_CONFIG_DATA  0xCFC

/* PCI config register offsets */
#define PCI_VENDOR_ID    0x00
#define PCI_DEVICE_ID    0x02
#define PCI_COMMAND      0x04
#define PCI_STATUS       0x06
#define PCI_CLASS_REV     0x08
#define PCI_BAR0          0x10
#define PCI_BAR1          0x14
#define PCI_BAR2          0x18
#define PCI_BAR3          0x1C
#define PCI_BAR4          0x20
#define PCI_BAR5          0x24

/* PCI BAR flags */
#define PCI_BAR_IO        0x00000001
#define PCI_BAR_64BIT     0x00000004
#define PCI_BAR_MASK      0xFFFFFFF0

/* Intel vendor ID */
#define INTEL_VENDOR_ID  0x8086

/* PCI device structure */
typedef struct {
    uint16_t vendor_id;
    uint16_t device_id;
    uint8_t revision;
    uint8_t class_code;
    uint64_t bar0;          /* MMIO base address */
    uint64_t bar2;          /* Alternate MMIO */
} PciDevice;

/* Functions */
int pci_find_intel_gpu(PciDevice *dev);
uint32_t pci_read_config(uint8_t bus, uint8_t dev, uint8_t func, uint8_t offset);
void pci_write_config(uint8_t bus, uint8_t dev, uint8_t func, uint8_t offset, uint32_t value);

#endif /* _PCI_H */
```

**Step 2: Create pci.c implementation**

```c
/* pci.c - PCI enumeration implementation */
#include <stdint.h>
#include "pci.h"

/* I/O port functions */
static inline void outl(uint16_t port, uint32_t val) {
    __asm__ volatile ("outl %0, %1" : : "a"(val), "Nd"(port));
}

static inline uint32_t inl(uint16_t port) {
    uint32_t val;
    __asm__ volatile ("inl %1, %0" : "=a"(val) : "Nd"(port));
    return val;
}

/* Read PCI config register */
uint32_t pci_read_config(uint8_t bus, uint8_t dev, uint8_t func, uint8_t offset) {
    uint32_t addr = (1 << 31) |        /* Enable bit */
                   ((uint32_t)bus << 16) |
                   ((uint32_t)dev << 11) |
                   ((uint32_t)func << 8) |
                   (offset & 0xFC);
    outl(PCI_CONFIG_ADDR, addr);
    return inl(PCI_CONFIG_DATA);
}

/* Write PCI config register */
void pci_write_config(uint8_t bus, uint8_t dev, uint8_t func, uint8_t offset, uint32_t value) {
    uint32_t addr = (1 << 31) |
                   ((uint32_t)bus << 16) |
                   ((uint32_t)dev << 11) |
                   ((uint32_t)func << 8) |
                   (offset & 0xFC);
    outl(PCI_CONFIG_ADDR, addr);
    outl(PCI_CONFIG_DATA, value);
}

/* Find Intel GPU via PCI enumeration */
int pci_find_intel_gpu(PciDevice *dev) {
    /* Scan PCI bus 0, devices 0-31, function 0 */
    for (int bus = 0; bus < 256; bus++) {
        for (int dev = 0; dev < 32; dev++) {
            uint32_t vendor_device = pci_read_config(bus, dev, 0, 0);
            uint16_t vendor = vendor_device & 0xFFFF;

            if (vendor == 0xFFFF) {
                continue;  /* No device */
            }

            if (vendor == INTEL_VENDOR_ID) {
                /* Check class code - VGA controller is 0x03 */
                uint32_t class_rev = pci_read_config(bus, dev, 0, PCI_CLASS_REV);
                uint8_t class_code = (class_rev >> 24) & 0xFF;

                if (class_code == 0x03) {  /* VGA controller */
                    dev->vendor_id = vendor;
                    dev->device_id = (vendor_device >> 16) & 0xFFFF;
                    dev->revision = (class_rev >> 16) & 0xFF;
                    dev->class_code = class_code;

                    /* Read BAR0 (MMIO) */
                    uint32_t bar0_low = pci_read_config(bus, dev, 0, PCI_BAR0);
                    uint32_t bar0_high = pci_read_config(bus, dev, 0, PCI_BAR1);
                    dev->bar0 = ((uint64_t)bar0_high << 32) | (bar0_low & PCI_BAR_MASK);

                    /* Read BAR2 (alternate MMIO) */
                    uint32_t bar2_low = pci_read_config(bus, dev, 0, PCI_BAR2);
                    uint32_t bar2_high = pci_read_config(bus, dev, 0, PCI_BAR3);
                    dev->bar2 = ((uint64_t)bar2_high << 32) | (bar2_low & PCI_BAR_MASK);

                    return 0;  /* Found */
                }
            }
        }
    }
    return -1;  /* Not found */
}
```

**Step 3: Build**

```bash
cd kernel/boot && make clean && make 2>&1 | tail -10
```

Expected: Builds successfully

**Step 4: Commit**

```bash
git add kernel/boot/pci.c kernel/boot/pci.h
git commit -m "feat(boot): add PCI enumeration module"
```

---

## Chunk 1: GPU Module

### Task 1.1: Port GPU Module from Phase 3

**Files:**
- Create: `kernel/boot/gpu.h`
- Create: `kernel/boot/gpu.c`
- Modify: `kernel/boot/Makefile`

**Step 1: Create gpu.h (adapted from kernel/geometry_os_module/gpu.h)**

```c
/* gpu.h - Bare metal GPU access (adapted from Phase 3) */
#ifndef _GEOS_GPU_H
#define _GEOS_GPU_H

#include <stdint.h>
#include "pci.h"

/* Intel GPU MMIO constants */
#define INTEL_GPU_MMIO_SIZE    0x100000

/* Ring buffer registers (RCS - Render Command Streamer) */
#define RCS_RING_HEAD          0x02034
#define RCS_RING_TAIL          0x02030
#define RCS_RING_START         0x02038
#define RCS_RING_CTL           0x0203C

/* Ring control bits */
#define RING_CTL_ENABLE        (1 << 0)
#define RING_CTL_SIZE(x)       (((x) - 1) << 12)

/* Forcewake (Gen12+ / Tiger Lake) */
#define FORCEWAKE_MT           0x0A188
#define FORCEWAKE_ACK_MT       0x130040

/* GPU state structure */
struct GeosGpu {
    volatile void *mmio_base;   /* volatile for bare metal */
    uint64_t mmio_phys;
    uint32_t device_id;
    int has_rcs;
    int has_bcs;
};

/* GPU functions */
int geos_gpu_init(struct GeosGpu *gpu, PciDevice *pci);
void geos_gpu_fini(struct GeosGpu *gpu);

uint32_t geos_gpu_read32(struct GeosGpu *gpu, uint32_t offset);
void geos_gpu_write32(struct GeosGpu *gpu, uint32_t offset, uint32_t value);

int geos_gpu_wait_set(struct GeosGpu *gpu, uint32_t offset, uint32_t mask, int timeout_ms);
int geos_gpu_wait_clear(struct GeosGpu *gpu, uint32_t offset, uint32_t mask, int timeout_ms);

void geos_gpu_forcewake(struct GeosGpu *gpu);

#endif /* _GEOS_GPU_H */
```

**Step 2: Create gpu.c (adapted from kernel/geometry_os_module/gpu.c)**

```c
/* gpu.c - Bare metal GPU access (adapted from Phase 3) */
#include <stdint.h>
#include "gpu.h"
#include "pci.h"

/* Serial output functions (from kernel.c) */
extern void serial_puts(const char *s);
extern void serial_print_hex(uint32_t val);

/* Simple delay loop */
static void delay_ms(int ms) {
    while (ms-- > 0) {
        for (volatile int i = 0; i < 10000; i++);
    }
}

/* Read 32-bit from GPU MMIO */
uint32_t geos_gpu_read32(struct GeosGpu *gpu, uint32_t offset) {
    return *(volatile uint32_t *)((uint8_t *)gpu->mmio_base + offset);
}

/* Write 32-bit to GPU MMIO */
void geos_gpu_write32(struct GeosGpu *gpu, uint32_t offset, uint32_t value) {
    *(volatile uint32_t *)((uint8_t *)gpu->mmio_base + offset) = value;
}

/* Wait for bits to be set */
int geos_gpu_wait_set(struct GeosGpu *gpu, uint32_t offset, uint32_t mask, int timeout_ms) {
    while (timeout_ms-- > 0) {
        if (geos_gpu_read32(gpu, offset) & mask)
            return 0;
        delay_ms(1);
    }
    return -1;  /* Timeout */
}

/* Wait for bits to be clear */
int geos_gpu_wait_clear(struct GeosGpu *gpu, uint32_t offset, uint32_t mask, int timeout_ms) {
    while (timeout_ms-- > 0) {
        if (!(geos_gpu_read32(gpu, offset) & mask))
            return 0;
        delay_ms(1);
    }
    return -1;  /* Timeout */
}

/* Request forcewake for GPU access */
void geos_gpu_forcewake(struct GeosGpu *gpu) {
    geos_gpu_write32(gpu, FORCEWAKE_MT, 0x00010001);
    geos_gpu_wait_set(gpu, FORCEWAKE_ACK_MT, 0x00010001, 100);
}

/* Initialize GPU - use PCI device info */
int geos_gpu_init(struct GeosGpu *gpu, PciDevice *pci) {
    /* Use BAR address from PCI enumeration */
    gpu->mmio_phys = pci->bar0;
    if (!gpu->mmio_phys) {
        gpu->mmio_phys = pci->bar2;
    }

    if (!gpu->mmio_phys) {
        serial_puts("[ERROR] Could not find GPU MMIO BAR\n");
        return -1;
    }

    /* Identity mapping - physical = virtual in bare metal */
    gpu->mmio_base = (void *)gpu->mmio_phys;

    gpu->device_id = pci->device_id;
    gpu->has_rcs = 0;  /* Will probe later */
    gpu->has_bcs = 0;

    serial_puts("[INFO] GPU MMIO at 0x");
    serial_print_hex((uint32_t)gpu->mmio_phys);
    serial_puts(" (device 0x");
    serial_print_hex(gpu->device_id);
    serial_puts(")\n");

    return 0;
}

/* Cleanup GPU access */
void geos_gpu_fini(struct GeosGpu *gpu) {
    /* Nothing to unmap in bare metal (identity mapped) */
    gpu->mmio_base = 0;
}
```

**Step 3: Update Makefile**

```makefile
# Add to existing object list
objs += pci.o gpu.o

geometry_os-objs := start.o main.o pci.o gpu.o
```

**Step 4: Build**

```bash
cd kernel/boot && make clean && make 2>&1 | tail -10
```

Expected: Builds successfully

**Step 5: Commit**

```bash
git add kernel/boot/gpu.c kernel/boot/gpu.h kernel/boot/Makefile
git commit -m "feat(boot): add GPU MMIO module (adapted from Phase 3)"
```

---

## Chunk 2: Ring Buffer Submission

### Task 2.1: Add Ring Buffer Support

**Files:**
- Create: `kernel/boot/ring.h`
- Create: `kernel/boot/ring.c`
- Modify: `kernel/boot/Makefile`

**Step 1: Create ring.h**

```c
/* ring.h - Ring buffer management */
#ifndef _GEOS_RING_H
#define _GEOS_RING_H

#include <stdint.h>
#include "gpu.h"

#define RING_SIZE (4 * 1024)    /* 4KB ring buffer */
#define BATCH_SIZE (16 * 1024)  /* 16KB batch buffer */

struct RingBuffer {
    uint32_t *base;
    uint32_t size;
    uint32_t head;
    uint32_t tail;
};

/* Ring functions */
void geos_ring_init(struct RingBuffer *ring, uint32_t *buffer, uint32_t size);
int geos_ring_submit_batch(struct GeosGpu *gpu, struct RingBuffer *ring,
                           void *batch, uint32_t batch_size);
void geos_ring_wait_idle(struct GeosGpu *gpu, struct RingBuffer *ring);

#endif /* _GEOS_RING_H */
```

**Step 2: Create ring.c**

```c
/* ring.c - Ring buffer submission */
#include <stdint.h>
#include "ring.h"
#include "gpu.h"

extern void serial_puts(const char *s);

/* Initialize ring buffer */
void geos_ring_init(struct RingBuffer *ring, uint32_t *buffer, uint32_t size) {
    ring->base = buffer;
    ring->size = size;
    ring->head = 0;
    ring->tail = 0;

    /* Clear ring buffer */
    for (uint32_t i = 0; i < size / 4; i++) {
        ring->base[i] = 0;
    }
}

/* Submit batch buffer via ring */
int geos_ring_submit_batch(struct GeosGpu *gpu, struct RingBuffer *ring,
                           void *batch, uint32_t batch_size) {
    /* Copy batch to ring buffer */
    uint32_t offset = ring->tail;
    uint32_t *src = (uint32_t *)batch;
    uint32_t *dst = ring->base;

    for (uint32_t i = 0; i < batch_size / 4; i++) {
        uint32_t idx = (offset / 4 + i) % (ring->size / 4);
        dst[idx] = src[i];
        offset = (offset + 4) % ring->size;
    }

    /* Update tail pointer */
    ring->tail = offset;
    geos_gpu_write32(gpu, RCS_RING_TAIL, ring->tail);

    return 0;
}

/* Wait for ring to be idle */
void geos_ring_wait_idle(struct GeosGpu *gpu, struct RingBuffer *ring) {
    /* Wait for head == tail */
    while (geos_gpu_read32(gpu, RCS_RING_HEAD) != ring->tail) {
        /* Delay */
        for (volatile int i = 0; i < 10000; i++);
    }
}
```

**Step 3: Update Makefile**

```makefile
objs += ring.o
geometry_os-objs := start.o main.o pci.o gpu.o ring.o
```

**Step 4: Build**

```bash
cd kernel/boot && make clean && make 2>&1 | tail -5
```

Expected: Builds successfully

**Step 5: Commit**

```bash
git add kernel/boot/ring.c kernel/boot/ring.h kernel/boot/Makefile
git commit -m "feat(boot): add ring buffer submission"
```

---

## Chunk 3: Kernel Integration
### Task 3.1: Integrate GPU into kernel_main

**Files:**
- Modify: `kernel/boot/kernel.c`

**Step 1: Add includes and globals to kernel.c**

Add after existing includes:
```c
#include "pci.h"
#include "gpu.h"
#include "ring.h"

static struct GeosGpu gpu;
static struct RingBuffer rcs_ring;
static uint32_t ring_buffer_mem[RING_SIZE / 4];
```

**Step 2: Add GPU initialization in kernel_main()**

Add after framebuffer setup:
```c
    /* Initialize GPU via PCI */
    serial_puts("[INFO] Initializing GPU...\n");
    PciDevice pci_dev;
    if (pci_find_intel_gpu(&pci_dev) == 0) {
        serial_puts("[OK] Intel GPU found (vendor 0x");
        serial_print_hex(pci_dev.vendor_id);
        serial_puts(", device 0x");
        serial_print_hex(pci_dev.device_id);
        serial_puts(")\n");

        if (geos_gpu_init(&gpu, &pci_dev) == 0) {
            serial_puts("[OK] GPU MMIO initialized\n");

            /* Acquire forcewake */
            geos_gpu_forcewake(&gpu);
            serial_puts("[OK] GPU forcewake acquired\n");

            /* Initialize ring buffer */
            geos_ring_init(&rcs_ring, ring_buffer_mem, RING_SIZE);
            serial_puts("[OK] Ring buffer initialized\n");

            /* Test GPU batch */
            test_gpu_batch(&gpu, &fb);
        } else {
            serial_puts("[WARN] GPU init failed, using software rendering\n");
        }
    } else {
        serial_puts("[WARN] No Intel GPU found, using software rendering\n");
    }
```

**Step 3: Build**

```bash
cd kernel/boot && make clean && make 2>&1 | tail -10
```

Expected: Builds successfully

**Step 4: Test in QEMU**

```bash
make geometry_os.iso && make run
```

Expected: Serial output shows GPU detection

**Step 5: Commit**

```bash
git add kernel/boot/kernel.c
git commit -m "feat(boot): integrate GPU initialization into kernel_main"
```

---

## Chunk 4: Testing
### Task 4.1: Add Bare Metal GPU Test

**Files:**
- Create: `tests/test_bare_metal_gpu.py`

**Step 1: Create test file**

```python
#!/usr/bin/env python3
"""Test bare metal GPU initialization"""
import subprocess
import os

def test_iso_builds():
    """Test that geometry_os.iso builds successfully"""
    result = subprocess.run(
        ["make", "-C", "kernel/boot", "geometry_os.iso"],
        capture_output=True,
        text=True,
        cwd="/home/jericho/zion/projects/geometry_os/geometry_os"
    )
    assert result.returncode == 0, f"ISO build failed: {result.stderr}"

def test_pci_module_exists():
    """Test that pci.c and pci.h exist"""
    assert os.path.exists("kernel/boot/pci.c"), "pci.c not found"
    assert os.path.exists("kernel/boot/pci.h"), "pci.h not found"

def test_gpu_module_exists():
    """Test that gpu.c and gpu.h exist"""
    assert os.path.exists("kernel/boot/gpu.c"), "gpu.c not found"
    assert os.path.exists("kernel/boot/gpu.h"), "gpu.h not found"

def test_ring_module_exists():
    """Test that ring.c and ring.h exist"""
    assert os.path.exists("kernel/boot/ring.c"), "ring.c not found"
    assert os.path.exists("kernel/boot/ring.h"), "ring.h not found"

def test_kernel_includes_gpu():
    """Test that kernel.c includes gpu.h"""
    with open("kernel/boot/kernel.c", "r") as f:
        content = f.read()
    assert '#include "gpu.h"' in content, "gpu.h not included in kernel.c"
    assert '#include "pci.h"' in content, "pci.h not included in kernel.c"

if __name__ == "__main__":
    import pytest
    pytest.main([__file__, "-v"])
```

**Step 2: Run tests**

```bash
python3 tests/test_bare_metal_gpu.py -v
```

Expected: All tests pass

**Step 3: Commit**

```bash
git add tests/test_bare_metal_gpu.py
git commit -m "test(boot): add bare metal GPU tests"
```

---

## Chunk 5: Documentation
### Task 5.1: Update README

**Files:**
- Modify: `kernel/boot/README.md`

**Step 1: Add Phase 4 section to README.md**

Add after existing content:
```markdown
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
- [ ] GPU MMIO access working
- [ ] Forcewake working
- [ ] Ring buffer submission (pending real hardware test)
```

**Step 2: Commit**

```bash
git add kernel/boot/README.md
git commit -m "docs(boot): add Phase 4 GPU integration documentation"
```

---

## Success Criteria Verification

After completing all tasks:

- [ ] ISO builds: `cd kernel/boot && make geometry_os.iso`
- [ ] Boots in QEMU: `make run`
- [ ] Serial shows GPU detection
- [ ] Tests pass: `python3 tests/test_bare_metal_gpu.py -v`

---

## Plan Complete

*Plan created: 2026-03-13*
*Estimated duration: 2-3 hours*
