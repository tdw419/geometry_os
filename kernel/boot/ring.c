/* ring.c - Ring buffer submission */
#include <stdint.h>
#include "ring.h"
#include "gpu.h"

extern void serial_puts(const char *s);

/* Initialize ring buffer */
void geos_ring_init(struct RingBuffer *ring, uint32_t *buffer, uint32_t size) {
    if (!ring || !buffer || size == 0) {
        return;  /* Invalid parameters */
    }

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
    if (!gpu || !ring || !ring->base || !batch || batch_size == 0) {
        return -1;  /* Invalid parameters */
    }

    /* Check if batch fits in ring */
    uint32_t available = (ring->head > ring->tail)
        ? (ring->head - ring->tail)
        : (ring->size - ring->tail + ring->head);

    if (batch_size > available) {
        return -1;  /* Not enough space */
    }

    /* Copy batch to ring buffer */
    uint32_t offset = ring->tail;
    uint32_t *src = (uint32_t *)batch;
    uint32_t *dst = ring->base;

    for (uint32_t i = 0; i < batch_size / 4; i++) {
        uint32_t idx = (offset / 4 + i) % (ring->size / 4);
        dst[idx] = src[i];
    }

    offset = (offset + batch_size) % ring->size;

    /* Update tail pointer */
    ring->tail = offset;
    geos_gpu_write32(gpu, RCS_RING_TAIL, ring->tail);

    return 0;
}

/* Wait for ring to be idle */
void geos_ring_wait_idle(struct GeosGpu *gpu, struct RingBuffer *ring) {
    if (!gpu || !ring) {
        return;  /* Invalid parameters */
    }

    /* Wait for head == tail */
    while (geos_gpu_read32(gpu, RCS_RING_HEAD) != ring->tail) {
        /* Delay */
        for (volatile int i = 0; i < 10000; i++);
    }
}
