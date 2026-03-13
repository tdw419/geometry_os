/* kernel/geometry_os_module/gpu.c */
#include <linux/pci.h>
#include <linux/io.h>
#include <linux/delay.h>
#include <linux/slab.h>

#include "gpu.h"

/* Read 32-bit from GPU MMIO */
u32 geos_gpu_read32(struct geos_gpu *gpu, u32 offset)
{
    return readl(gpu->mmio_base + offset);
}

/* Write 32-bit to GPU MMIO */
void geos_gpu_write32(struct geos_gpu *gpu, u32 offset, u32 value)
{
    writel(value, gpu->mmio_base + offset);
}

/* Wait for bits to be set */
int geos_gpu_wait_set(struct geos_gpu *gpu, u32 offset, u32 mask, int timeout_ms)
{
    while (timeout_ms-- > 0) {
        if (geos_gpu_read32(gpu, offset) & mask)
            return 0;
        msleep(1);
    }
    return -ETIMEDOUT;
}

/* Wait for bits to be clear */
int geos_gpu_wait_clear(struct geos_gpu *gpu, u32 offset, u32 mask, int timeout_ms)
{
    while (timeout_ms-- > 0) {
        if (!(geos_gpu_read32(gpu, offset) & mask))
            return 0;
        msleep(1);
    }
    return -ETIMEDOUT;
}

/* Request forcewake for GPU access */
void geos_gpu_forcewake(struct geos_gpu *gpu)
{
    geos_gpu_write32(gpu, FORCEWAKE_MT, 0x00010001);
    geos_gpu_wait_set(gpu, FORCEWAKE_ACK_MT, 0x00010001, 100);
}

/* Initialize GPU access - find Intel GPU via PCI */
int geos_gpu_init(struct geos_gpu *gpu)
{
    struct pci_dev *pdev;

    /* Find Intel GPU (vendor 0x8086) */
    pdev = pci_get_device(0x8086, PCI_ANY_ID, NULL);
    if (!pdev) {
        pr_err("geometry_os: Intel GPU not found\n");
        return -ENODEV;
    }

    /* Get MMIO BAR (usually BAR 0 or 2) */
    gpu->mmio_phys = pci_resource_start(pdev, 0);
    if (!gpu->mmio_phys) {
        gpu->mmio_phys = pci_resource_start(pdev, 2);
    }

    if (!gpu->mmio_phys) {
        pr_err("geometry_os: Could not find GPU MMIO BAR\n");
        pci_dev_put(pdev);
        return -ENODEV;
    }

    /* Remap MMIO space */
    gpu->mmio_base = ioremap(gpu->mmio_phys, INTEL_GPU_MMIO_SIZE);
    if (!gpu->mmio_base) {
        pr_err("geometry_os: Failed to remap GPU MMIO\n");
        pci_dev_put(pdev);
        return -EIO;
    }

    gpu->device_id = pdev->device;
    gpu->has_rcs = false;  /* Will probe later */
    gpu->has_bcs = false;

    pr_info("geometry_os: GPU MMIO at 0x%pa (device 0x%04x)\n",
            &gpu->mmio_phys, gpu->device_id);

    pci_dev_put(pdev);
    return 0;
}

/* Cleanup GPU access */
void geos_gpu_fini(struct geos_gpu *gpu)
{
    if (gpu->mmio_base) {
        iounmap(gpu->mmio_base);
        gpu->mmio_base = NULL;
    }
}
