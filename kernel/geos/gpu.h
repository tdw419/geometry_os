/*
 * Geometry OS GPU Interface
 *
 * Direct GPU access for bare metal execution
 */

#ifndef _GEOMETRY_OS_GPU_H
#define _GEOMETRY_OS_GPU_H

/* AMD GPU register offsets */
#define AMD_MM_INDEX			0x0000
#define AMD_MM_DATA			0x0004
#define AMD_MM_INDEX_HI			0x0008

/* AMD GPU register indices */
#define AMD_PCIE_INDEX			0x000C
#define AMD_PCIE_DATA			0x0010

/* GPU command buffer ring */
struct gpu_ring {
    volatile unsigned long *ring_base;
    volatile unsigned long *read_ptr;
    volatile unsigned long *write_ptr;
    unsigned int ring_size;
    unsigned int align_mask;
};

/* GPU memory allocation */
struct gpu_bo {
    unsigned long gpu_addr;
    unsigned long size;
    unsigned int domain;  /* VRAM or GTT */
    unsigned int flags;
};

/* DMA-BUF handle */
struct dmabuf {
    int fd;
    unsigned long size;
    unsigned int width;
    unsigned int height;
    unsigned int stride;
    unsigned int format;
};

/* GPU functions */
int gpu_init_mmio(void *mmio_base);
int gpu_alloc_vram(size_t size, struct gpu_bo *bo);
void gpu_free_bo(struct gpu_bo *bo);
int gpu_upload_shader(struct gpu_bo *bo, const void *spirv, size_t size);
int gpu_dispatch_compute(unsigned int x, unsigned int y, unsigned int z);
int gpu_wait_completion(unsigned int timeout_ms);
int gpu_export_dmabuf(struct gpu_bo *bo, struct dmabuf *dmabuf);

#endif /* _GEOMETRY_OS_GPU_H */
