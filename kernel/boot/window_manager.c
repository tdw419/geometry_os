/*
 * Geometry OS - Bare Metal Window Manager
 *
 * Integrates window_manager.glyph with bare metal kernel.
 * The GPU executes window management autonomously.
 */

#include <stdint.h>
#include "gpu.h"
#include "ring.h"

// Window manager glyph opcodes (from glyph_framework_rs)
#define WM_OP_INIT           1
#define WM_OP_READ_INTENT   2
#define WM_OP_PROCESS_CLICK  3
#define WM_OP_HIT_TEST      4
#define WM_OP_SET_FOCUS    5
#define WM_OP_UPDATE_REG    6
#define WM_OP_HALT          7

// Window table entry (matches GPU memory layout)
typedef struct {
    uint32_t app_id;
    uint32_t x, y;
    uint32_t width, height;
    uint32_t z_order;
    uint32_t flags;
    uint32_t focused;
    uint8_t reserved[8];
} WindowEntry;

#define MAX_WINDOWS 16

// Window table in GPU-accessible memory
static WindowEntry window_table[MAX_WINDOWS];
static uint32_t focused_app_id = 0;
static uint32_t intent_queue[16];
static uint32_t intent_head = 0;
static uint32_t intent_tail = 0;

// Initialize window manager
void window_manager_init(void) {
    // Clear window table
    for (int i = 0; i < MAX_WINDOWS; i++) {
        window_table[i].app_id = 0;
        window_table[i].x = 0;
        window_table[i].y = 0;
        window_table[i].width = 0;
        window_table[i].height = 0;
        window_table[i].z_order = 0;
        window_table[i].flags = 0;
        window_table[i].focused = 0;
    }
    focused_app_id = 0;
    intent_head = 0;
    intent_tail = 0;
}

// Register a new window
int window_register(uint32_t app_id, uint32_t x, uint32_t y,
                   uint32_t width, uint32_t height, uint32_t z_order) {
    // Find empty slot
    for (int i = 0; i < MAX_WINDOWS; i++) {
        if (window_table[i].app_id == 0) {
            window_table[i].app_id = app_id;
            window_table[i].x = x;
            window_table[i].y = y;
            window_table[i].width = width;
            window_table[i].height = height;
            window_table[i].z_order = z_order;
            window_table[i].focused = 0;
            return i;
        }
    }
    return -1;  // No slot
}

// Push intent to queue (simulates GPU interrupt)
void window_push_intent(uint32_t type, uint32_t x, uint32_t y) {
    uint32_t next_tail = (intent_tail + 1) % 16;
    if (next_tail != intent_head) {
        intent_queue[intent_tail * 2] = type;
        intent_queue[intent_tail * 2 + 1] = x;
        intent_queue[intent_tail * 2 + 2] = y;
        intent_tail = next_tail;
    }
}

// Z-order hit test: find top window at (x, y)
// This is what the GPU would execute autonomously
int window_hit_test(uint32_t x, uint32_t y) {
    int hit_window = -1;
    uint32_t top_z = 0;

    // Scan windows in Z-order (highest first)
    for (int i = 0; i < MAX_WINDOWS; i++) {
        if (window_table[i].app_id == 0) continue;

        // Check if point is in window bounds
        if (x >= window_table[i].x &&
            x < window_table[i].x + window_table[i].width &&
            y >= window_table[i].y &&
            y < window_table[i].y + window_table[i].height) {

            // Higher Z-order wins
            if (window_table[i].z_order > top_z) {
                top_z = window_table[i].z_order;
                hit_window = i;
            }
        }
    }

    return hit_window;
}

// Process click intent (GPU would do this)
void window_process_click(uint32_t x, uint32_t y) {
    int hit = window_hit_test(x, y);

    if (hit >= 0) {
        // Clear previous focus
        for (int i = 0; i < MAX_WINDOWS; i++) {
            window_table[i].focused = 0;
        }

        // Set new focus
        window_table[hit].focused = 1;
        focused_app_id = window_table[hit].app_id;
    }
}

// Move focused window (GPU would do this)
void window_move_focused(int32_t dx, int32_t dy) {
    for (int i = 0; i < MAX_WINDOWS; i++) {
        if (window_table[i].focused) {
            // Update position (with bounds checking would be done on GPU)
            window_table[i].x += dx;
            window_table[i].y += dy;
        }
    }
}

// Build MI batch buffer for GPU submission
int window_build_mi_batch(uint32_t *batch, uint32_t batch_size) {
    uint32_t count = 0;

    // MI_NOOP
    batch[count++] = 0x00000000;

    // Process any pending intents
    if (intent_head != intent_tail) {
        uint32_t type = intent_queue[intent_head * 2];
        uint32_t x = intent_queue[intent_head * 2 + 1];
        uint32_t y = intent_queue[intent_head * 2 + 2];
        intent_head = (intent_head + 1) % 16;

        if (type == 1) {  // CLICK
            // Run hit test
            int hit = window_hit_test(x, y);
            if (hit >= 0) {
                // MI_STORE to update focus
                batch[count++] = 0x00000000;  // Placeholder
            }
        }
    }

    // MI_BATCH_BUFFER_END
    batch[count] = 0x0A000000;

    return count;
}

// Test: create windows and verify Z-order
void window_manager_test(void) {
    // Register windows at different Z-orders
    window_register(1, 100, 100, 200, 200, 1);  // Background
    window_register(2, 150, 150, 200, 200, 2);  // Middle
    window_register(3, 200, 200, 200, 200, 3);  // Top

    // Test: click in overlapping region (250, 250)
    // Should hit window 3 (highest Z)
    window_process_click(250, 250);

    // Verify
    if (focused_app_id == 3) {
        // Success - would output to serial
    }
}
