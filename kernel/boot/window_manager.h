/*
 * Geometry OS - Bare Metal Window Manager Header
 */

#ifndef WINDOW_MANAGER_H
#define WINDOW_MANAGER_H

#include <stdint.h>

// Initialize window manager
void window_manager_init(void);

// Register a new window
int window_register(uint32_t app_id, uint32_t x, uint32_t y,
                   uint32_t width, uint32_t height, uint32_t z_order);

// Process click at (x, y)
void window_process_click(uint32_t x, uint32_t y);

// Move focused window
void window_move_focused(int32_t dx, int32_t dy);

// Build MI batch for GPU
int window_build_mi_batch(uint32_t *batch, uint32_t batch_size);

// Test window manager
void window_manager_test(void);

// Push intent to queue
void window_push_intent(uint32_t type, uint32_t x, uint32_t y);

#endif
