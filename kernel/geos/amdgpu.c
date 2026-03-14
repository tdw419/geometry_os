/*
 * AMDGPU Direct Register Access
 *
 * Phase 4: Direct GPU control without amdgpu driver
 *
 * Initialize AMD GPU via MMIO writes for compute.
 */

#include "gpu.h"

/* AMD GPU MMIO register offsets */
#define MM_RB_BASE_LO  0x1F00
#define MM_RB_BASE_HI  0x1F04
#define MM_RB_CNTL  0x1F08
#define MM_RPTR_LO  0x1F10
#define MM_RPTR_HI  0x1F14

/* Command buffer management */
#define CP_RB0_BASE_LO  0x2F00
#define CP_RB0_BASE_HI  0x2F04
#define CP_RB0_CNTL  0x2F08
#define CP_RB0_RPTR  0x2F0C
#define CP_RB0_WPTR  0x2F10
#define CP_RB0_WPTR_HI  0x2F14

/* Compute registers */
#define COMPUTE_PGM_LO  0x2E00
#define COMPUTE_PGM_HI  0x2E04
#define COMPUTE_PGM_RSRC1  0x2E08
#define COMPUTE_PGM_RSRC2  0x2E0C
#define COMPUTE_PGM_RSRC3  0x2E10

/* Dispatch registers */
#define COMPUTE_DIM_X  0x1F62
#define COMPUTE_DIM_Y  0x1F64
#define COMPUTE_DIM_Z  0x1F66
#define COMPUTE_START_X  0x1F68
#define COMPUTE_START_Y  0x1F6A
#define COMPUTE_START_Z  0x1F6C

/* Queue control */
#define CP_HQD_QUEUE0  0x30F8
#define CP_HQD_QUEUE1  0x30FC
#define CP_HQD_QUEUE2  0x3100
#define CP_HQD_QUEUE3  0x3104
#define CP_HQD_ACTIVE_QUEUE_ID  0x3118
#define CP_HQD_Vmid 0x311C

/* Doorbell */
#define CP_HPD_EOP_EXEC_ADDR_LO 0x3140
#define CP_HPD_EOP_EXEC_ADDR_HI 0x3144
#define CP_HPD_EOP_EXEC_DATA_LO 0x3148
#define CP_HPD_EOP_EXEC_DATA_HI 0x314C
#define CP_HPD_EOP_EXEC_CNT0  0x3150
#define CP_HPD_EOP_EXEC_CNT1  0x3154

/* GPU MMIO base */
static volatile unsigned int *mmio;

/* Command buffer */
static struct gpu_bo command_buffer;
static struct gpu_bo shader_buffer;

/* Initialize AMDGPU MMIO */
int amdgpu_init(void *mmio_base)
{
    mmio = (volatile unsigned int *)mmio_base;

    /* TODO: Full init sequence:
     * 1. Reset GPU
     * 2. Upload firmware
     * 3. Initialize ring buffers
     * 4. Enable compute
     */

    return 0;
}

/* Submit SPIR-V compute shader */
int amdgpu_submit_shader(const void *spirv, size_t size)
{
    if (!shader_buffer.gpu_addr) {
        return -1;
    }

    /* Copy SPIR-V to GPU memory */
    __builtin_memcpy((void *)shader_buffer.gpu_addr, spirv, size);

    return 0;
}

/* Dispatch compute workgroups */
int amdgpu_dispatch(unsigned int x, unsigned int y, unsigned int z)
{
    if (!mmio) return -1;

    /* Set dispatch dimensions */
    mmio[COMPUTE_DIM_X / 4] = x;
    mmio[COMPUTE_DIM_Y / 4] = y;
    mmio[COMPUTE_DIM_Z / 4] = z;

    /* Set start to 0 */
    mmio[COMPUTE_START_X / 4] = 0;
    mmio[COMPUTE_START_Y / 4] = 0;
    mmio[COMPUTE_START_Z / 4] = 0;

    /* Ring doorbell */
    mmio[CP_HPD_EOP_EXEC_DATA_LO / 4] = 1;

    return 0;
}

/* Wait for GPU completion */
int amdgpu_wait(unsigned int timeout_ms)
{
    if (!mmio) return -1;

    volatile unsigned int *wptr = &mmio[CP_RB0_WPTR / 4];
    volatile unsigned int *rptr = &mmio[CP_RB0_RPTR / 4];

    unsigned int target = *wptr;

    for (unsigned int i = 0; i < timeout_ms; i++) {
        if (*rptr >= target) {
            return 0;  /* Complete */
        }
        /* Delay 1ms */
        for (volatile int j = 0; j < 100000; j++);
    }

    return -1;  /* Timeout */
}

/* Export buffer as DMA-BUF */
int amdgpu_export_dmabuf(struct gpu_bo *bo, struct dmabuf *dmabuf)
{
    /* In bare metal, DMA-BUF is just the physical address */
    dmabuf->fd = -1;  /* No fd in bare metal */
    dmabuf->size = bo->size;
    dmabuf->width = 1920;
    dmabuf->height = 1080;
    dmabuf->stride = 1920 * 4;
    dmabuf->format = 0x34325241;  /* ARGB8888 */

    return 0;
}
