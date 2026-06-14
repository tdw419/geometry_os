/*
 * SPIR-V Direct Submission
 *
 * Submit compiled glyph SPIR-V directly to AMDGPU.
 * No Vulkan, no drivers - bare metal GPU execution.
 */

#include "gpu.h"

/* SPIR-V header structure */
struct spirv_header {
    unsigned int magic;
    unsigned int version;
    unsigned int generator;
    unsigned int bound;
    unsigned int schema;
};

/* Validate SPIR-V binary */
static int validate_spirv(const void *spirv, size_t size)
{
    const struct spirv_header *header = (const struct spirv_header *)spirv;

    if (size < sizeof(struct spirv_header)) {
        return -1;
    }

    if (header->magic != 0x07230203) {
        return -1;  /* Invalid magic */
    }

    /* Version check - we support 1.0 - 1.6 */
    unsigned int major = (header->version >> 16) & 0xFF;
    unsigned int minor = (header->version >> 8) & 0xFF;

    if (major != 1 || minor > 6) {
        return -1;  /* Unsupported version */
    }

    return 0;
}

/* Submit SPIR-V to GPU */
int spirv_submit(const void *spirv, size_t size, struct gpu_bo *shader_bo)
{
    if (validate_spirv(spirv, size) != 0) {
        return -1;
    }

    /* Copy SPIR-V to GPU-visible memory */
    unsigned char *dst = (unsigned char *)shader_bo->gpu_addr;
    const unsigned char *src = (const unsigned char *)spirv;

    for (size_t i = 0; i < size; i++) {
        dst[i] = src[i];
    }

    /* Flush cache */
    __asm__ volatile ("sfence" ::: "memory");

    return 0;
}

/* Build PM4 command buffer for compute dispatch */
int spirv_build_commands(void *cmd_buffer, size_t *size,
                         unsigned int shader_addr_lo,
                         unsigned int shader_addr_hi,
                         unsigned int x, unsigned int y, unsigned int z)
{
    unsigned int *cmds = (unsigned int *)cmd_buffer;
    unsigned int offset = 0;

    /* Header */
    cmds[offset++] = 0xC0001000;  /* IT_INDIRECT_BUFFER_CNST */
    cmds[offset++] = shader_addr_lo;
    cmds[offset++] = shader_addr_hi;
    cmds[offset++] = 0x00010000;  /* Size */

    /* SET_SH_REG for compute */
    cmds[offset++] = 0x00000000;  /* NOP */

    /* Dispatch dimensions */
    cmds[offset++] = 0x00000003;  /* SET_COMPUTE_DIM */
    cmds[offset++] = x;
    cmds[offset++] = y;
    cmds[offset++] = z;

    /* Dispatch init */
    cmds[offset++] = 0x00000010;  /* DISPATCH_INIT */

    /* Wait for completion */
    cmds[offset++] = 0x00000020;  /* WAIT_REG_MEM */

    *size = offset * 4;

    return 0;
}

/* Execute glyph program */
int spirv_execute(struct gpu_bo *shader_bo,
                  struct gpu_bo *input_bo,
                  struct gpu_bo *output_bo,
                  unsigned int x, unsigned int y, unsigned int z)
{
    char cmd_buffer[1024];
    size_t cmd_size;

    /* Build command buffer */
    unsigned int shader_addr_lo = (unsigned int)(shader_bo->gpu_addr & 0xFFFFFFFF);
    unsigned int shader_addr_hi = (unsigned int)(shader_bo->gpu_addr >> 32);

    if (spirv_build_commands(cmd_buffer, &cmd_size,
                             shader_addr_lo, shader_addr_hi,
                             x, y, z) != 0) {
        return -1;
    }

    /* Submit to ring buffer */
    /* TODO: Write commands to CP_RB0 */

    return 0;
}
