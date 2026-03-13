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
