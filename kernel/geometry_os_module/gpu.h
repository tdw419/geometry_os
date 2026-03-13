/* kernel/geometry_os_module/gpu.h */
#ifndef _GEOS_GPU_H
#define _GEOS_GPU_H

#include <linux/types.h>

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
struct geos_gpu {
    void __iomem *mmio_base;
    resource_size_t mmio_phys;
    u32 device_id;
    bool has_rcs;
    bool has_bcs;
};

/* GPU functions */
int geos_gpu_init(struct geos_gpu *gpu);
void geos_gpu_fini(struct geos_gpu *gpu);

u32 geos_gpu_read32(struct geos_gpu *gpu, u32 offset);
void geos_gpu_write32(struct geos_gpu *gpu, u32 offset, u32 value);

int geos_gpu_wait_set(struct geos_gpu *gpu, u32 offset, u32 mask, int timeout_ms);
int geos_gpu_wait_clear(struct geos_gpu *gpu, u32 offset, u32 mask, int timeout_ms);

void geos_gpu_forcewake(struct geos_gpu *gpu);

#endif /* _GEOS_GPU_H */
