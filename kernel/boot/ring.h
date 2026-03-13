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
