/*
 * Geometry OS - Bare Metal Glyph Compiler Header
 */

#ifndef GLYPH_COMPILER_H
#define GLYPH_COMPILER_H

#include <stdint.h>

// MI command buffer
#define MI_BATCH_SIZE 4096

typedef struct {
    uint32_t commands[MI_BATCH_SIZE / 4];
    uint32_t count;
} MiBatchBuffer;

// Test function
int glyph_test_compile(MiBatchBuffer *batch);

#endif
