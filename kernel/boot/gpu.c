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
