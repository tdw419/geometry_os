/*
 * AMDGPU Direct Register Access
 *
 * Phase 4: Direct GPU control without amdgpu driver
 *
 * Initialize AMD GPU via MMIO writes for compute.
 */

#include "gpu.h"

/* PM4 Packet Macros */
#define PACKET_TYPE0	0
#define PACKET_TYPE1	1
#define PACKET_TYPE2	2
#define PACKET_TYPE3	3

#define PACKET3(op, n)	((PACKET_TYPE3 << 30) | (((op) & 0xFF) << 8) | (((n) & 0x3FFF) << 16))

/* PM4 Opcodes */
#define PACKET3_NOP                     0x10
#define PACKET3_SET_SH_REG              0x76
#define PACKET3_DISPATCH_DIRECT         0x10
#define PACKET3_RELEASE_MEM             0x49
#define PACKET3_ACQUIRE_MEM             0x58
#define PACKET3_WRITE_DATA              0x37

/* AMD GPU MMIO register offsets (GCN/RDNA style) */
#define CP_RB0_BASE_LO                  0x2F00
#define CP_RB0_BASE_HI                  0x2F04
#define CP_RB0_CNTL                     0x2F08
#define CP_RB0_RPTR                     0x2F0C
#define CP_RB0_WPTR                     0x2F10
#define CP_RB0_WPTR_HI                  0x2F14

/* Compute registers (Relative to SH_REG_BASE) */
#define COMPUTE_PGM_LO                  0x2E00
#define COMPUTE_PGM_HI                  0x2E04
#define COMPUTE_PGM_RSRC1               0x2E08
#define COMPUTE_PGM_RSRC2               0x2E0C
#define COMPUTE_PGM_RSRC3               0x2E10

/* Doorbell */
#define DOORBELL_OFFSET                 0x1000  /* Generic offset */

/* GPU state */
static struct {
    volatile unsigned int *mmio;
    struct gpu_ring ring;
    struct gpu_bo shader_bo;
} gpu_state;

/* Write to ring buffer */
static void ring_write(unsigned int val)
{
    unsigned int wptr = *gpu_state.ring.write_ptr;
    gpu_state.ring.ring_base[wptr] = val;
    
    /* Increment and wrap */
    wptr = (wptr + 1) & gpu_state.ring.align_mask;
    *gpu_state.ring.write_ptr = wptr;
}

/* Kick the CP (Command Processor) */
static void ring_commit(void)
{
    unsigned int wptr = *gpu_state.ring.write_ptr;
    
    /* Update WPIO register */
    gpu_state.mmio[CP_RB0_WPTR / 4] = wptr;
    
    /* Ring doorbell */
    unsigned int *doorbell = (unsigned int *)((unsigned char *)gpu_state.mmio + DOORBELL_OFFSET);
    *doorbell = wptr;
}

/* Initialize AMDGPU MMIO */
int amdgpu_init(void *mmio_base)
{
    gpu_state.mmio = (volatile unsigned int *)mmio_base;

    /* Setup ring structure - assumes memory allocated by UEFI at 0x100000000 */
    gpu_state.ring.ring_base = (volatile unsigned long *)0x100000000;
    gpu_state.ring.write_ptr = (volatile unsigned long *)((unsigned char *)0x100000000 + 0x10000); /* 64KB offset */
    gpu_state.ring.read_ptr = (volatile unsigned long *)((unsigned char *)0x100000000 + 0x10008);
    gpu_state.ring.ring_size = 0x10000 / 4; /* 64KB ring */
    gpu_state.ring.align_mask = gpu_state.ring.ring_size - 1;

    /* Initialize registers */
    gpu_state.mmio[CP_RB0_BASE_LO / 4] = (unsigned int)(0x100000000 & 0xFFFFFFFF);
    gpu_state.mmio[CP_RB0_BASE_HI / 4] = (unsigned int)(0x100000000 >> 32);
    gpu_state.mmio[CP_RB0_CNTL / 4] = 0x11; /* Enable, size = 64KB */

    return 0;
}

/* Submit shader binary */
int amdgpu_submit_shader(const void *binary, size_t size)
{
    /* Copy to shader BO (allocated in VRAM) */
    unsigned int *dst = (unsigned int *)0x100100000; /* After the ring */
    const unsigned int *src = (const unsigned int *)binary;
    
    for (size_t i = 0; i < size / 4; i++) {
        dst[i] = src[i];
    }
    
    gpu_state.shader_bo.gpu_addr = 0x100100000;
    gpu_state.shader_bo.size = size;

    return 0;
}

/* Dispatch compute workgroups using PM4 packets */
int amdgpu_dispatch(unsigned int x, unsigned int y, unsigned int z)
{
    if (!gpu_state.mmio) return -1;

    /* 1. Set Compute Shader Address */
    ring_write(PACKET3(PACKET3_SET_SH_REG, 2));
    ring_write(COMPUTE_PGM_LO);
    ring_write((unsigned int)(gpu_state.shader_bo.gpu_addr & 0xFFFFFFFF));
    ring_write((unsigned int)(gpu_state.shader_bo.gpu_addr >> 32));

    /* 2. Set Resource Config (Registers, etc) */
    ring_write(PACKET3(PACKET3_SET_SH_REG, 2));
    ring_write(COMPUTE_PGM_RSRC1);
    ring_write(0x000000BF); /* 64 GPRS, 128 SGPRS */
    ring_write(0x00000001); /* LDS size */

    /* 3. Dispatch Packet */
    ring_write(PACKET3(PACKET3_DISPATCH_DIRECT, 3));
    ring_write(x);
    ring_write(y);
    ring_write(z);
    ring_write(1); /* Dispatch flags */

    /* 4. Commit to hardware */
    ring_commit();

    return 0;
}

/* Wait for completion */
int amdgpu_wait(unsigned int timeout_ms)
{
    for (unsigned int i = 0; i < timeout_ms; i++) {
        unsigned int rptr = gpu_state.mmio[CP_RB0_RPTR / 4];
        unsigned int wptr = gpu_state.mmio[CP_RB0_WPTR / 4];
        
        if (rptr == wptr) return 0;
        
        /* Delay 1ms */
        for (volatile int j = 0; j < 100000; j++);
    }
    return -1;
}

/* Export for window renderer */
int amdgpu_export_dmabuf(struct gpu_bo *bo, struct dmabuf *dmabuf)
{
    dmabuf->fd = -1;
    dmabuf->size = bo->size;
    dmabuf->width = 1920;
    dmabuf->height = 1080;
    dmabuf->stride = 1920 * 4;
    dmabuf->format = 0x34325241;
    return 0;
}
