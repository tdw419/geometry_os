#ifndef GEOS_PROTOCOL_H
#define GEOS_PROTOCOL_H

#include <stdint.h>

typedef struct {
    uint32_t op;
    uint32_t x;
    uint32_t y;
    uint32_t w;
    uint32_t h;
    uint32_t color;
} Command;

typedef struct {
    volatile uint32_t head;
    volatile uint32_t tail;
    Command buf[64];
} CommandQueue;

#define QUEUE_ADDR ((CommandQueue*)0x6003F000)

static inline void submit_command(Command cmd) {
    CommandQueue* q = QUEUE_ADDR;
    // Simple non-blocking drop if full
    uint32_t t = q->tail;
    uint32_t h = q->head;
    if ((t + 1) % 64 == h) {
        return; // Drop command
    }
    q->buf[t % 64] = cmd;
    q->tail = t + 1;
}

#endif
