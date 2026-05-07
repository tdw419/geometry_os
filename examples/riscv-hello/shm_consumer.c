/*
 * shm_consumer.c -- Phase 235: Shared Memory IPC consumer
 *
 * Polls shared memory slot 0 for data. Reads values from the ring buffer
 * and displays them on screen. Shows a red progress bar that fills as
 * values are consumed. Runs in the right half of the screen.
 *
 * Stops reading when the producer signals DONE and buffer is empty.
 *
 * Build: embedded into geos_kern.elf via build_kern.sh
 */

#include "libgeos.h"
#include "libfb.h"

/* The producer allocates slot 0 */
#define SHM_SLOT  0

/* Colors */
#define COLOR_BG      0x00101010u
#define COLOR_RED     0x00FF0000u
#define COLOR_CYAN    0x0000FFFFu
#define COLOR_WHITE   0x00FFFFFFu
#define COLOR_YELLOW  0x00FFFF00u

int c_start(void) {
    fb_init();
    fb_fill(COLOR_BG);

    /* Draw label */
    fb_text(4, 2, COLOR_WHITE, "CONSUMER");
    fb_text(4, 12, COLOR_CYAN, "Reading from SHM...");

    /*
     * Wait for the producer to allocate the shared memory slot.
     * Retry periodically since we don't know when producer runs
     * (cooperative scheduling).
     */
    long base = -1;
    int retries = 0;
    while (base < 0 && retries < 1000) {
        base = geos_shm_map(SHM_SLOT);
        if (base < 0) {
            geos_yield();
            retries++;
        }
    }

    if (base < 0) {
        fb_text(4, 22, COLOR_RED, "SHM map FAILED!");
        fb_text(4, 32, COLOR_RED, "(producer not ready)");
        while (1) { geos_yield(); }
    }

    volatile uint32_t *region = (volatile uint32_t *)base;

    /* Read values until producer signals done AND buffer is empty */
    uint32_t read_count = 0;
    uint32_t target = 100; /* producer writes 100 values */
    uint32_t busy_count = 0;

    while (1) {
        uint32_t val;
        if (geos_shm_read(region, &val) == 0) {
            read_count++;
            busy_count = 0;

            /* Update progress bar */
            uint32_t bar_x = 4;
            uint32_t bar_y = 34;
            uint32_t bar_w = 100;
            uint32_t bar_h = 8;
            uint32_t progress = (read_count > target) ? bar_w
                             : (read_count * bar_w) / target;

            fb_rect(bar_x, bar_y, bar_w, bar_h, 0x00333333u);
            if (progress > 0) {
                fb_rect(bar_x, bar_y, progress, bar_h, COLOR_RED);
            }

            fb_present();
        } else if (geos_shm_is_done(region)) {
            /* Producer done + buffer empty = finished */
            break;
        } else {
            /* Buffer empty, producer not done -- yield */
            busy_count++;
            geos_yield();
            /* Extra yield every 10 idle loops to be fair */
            if (busy_count % 10 == 0) geos_yield();
        }
    }

    /* Show completion */
    fb_text(4, 46, COLOR_YELLOW, "ALL READ!");
    fb_present();

    /* Keep running to maintain display */
    while (1) {
        geos_yield();
        for (volatile int i = 0; i < 10000; i++);
    }

    return 0;
}
