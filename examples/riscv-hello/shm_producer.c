/*
 * shm_producer.c -- Phase 235: Shared Memory IPC producer
 *
 * Allocates a shared memory slot, writes incrementing values into the
 * ring buffer, then signals done. Runs in the left half of the screen.
 *
 * Visual: displays a green progress bar that fills as values are written.
 *
 * Build: embedded into geos_kern.elf via build_kern.sh
 */

#include "libgeos.h"
#include "libfb.h"

/* Colors */
#define COLOR_BG      0x00101010u
#define COLOR_GREEN   0x0000FF00u
#define COLOR_YELLOW  0x00FFFF00u
#define COLOR_WHITE   0x00FFFFFFu
#define COLOR_RED     0x00FF0000u

int c_start(void) {
    fb_init();
    fb_fill(COLOR_BG);

    /* Draw label */
    fb_text(4, 2, COLOR_WHITE, "PRODUCER");
    fb_text(4, 12, COLOR_GREEN, "Writing to SHM...");

    /* Allocate shared memory slot */
    long slot = geos_shm_alloc(4096);
    if (slot < 0) {
        fb_text(4, 22, COLOR_RED, "SHM alloc FAILED!");
        while (1) { geos_yield(); }
    }

    /* Map to get base address */
    long base = geos_shm_map(slot);
    if (base < 0) {
        fb_text(4, 22, COLOR_RED, "SHM map FAILED!");
        while (1) { geos_yield(); }
    }

    volatile uint32_t *region = (volatile uint32_t *)base;

    /* Write 100 values into the ring buffer */
    uint32_t written = 0;
    uint32_t target = 100;

    for (uint32_t i = 0; i < target; i++) {
        if (geos_shm_write(region, 0xA000 + i) != 0) {
            /* Buffer full -- wait for consumer to read */
            geos_yield();
            /* Retry once */
            if (geos_shm_write(region, 0xA000 + i) != 0) {
                continue; /* still full, skip this value */
            }
        }
        written++;

        /* Update progress bar every value */
        uint32_t bar_x = 4;
        uint32_t bar_y = 34;
        uint32_t bar_w = 100;
        uint32_t bar_h = 8;
        uint32_t progress = (written * bar_w) / target;

        /* Clear bar area */
        fb_rect(bar_x, bar_y, bar_w, bar_h, 0x00333333u);

        /* Draw filled portion */
        if (progress > 0) {
            fb_rect(bar_x, bar_y, progress, bar_h, COLOR_GREEN);
        }

        fb_present();

        /* Yield every 5 values to let consumer run */
        if (written % 5 == 0) geos_yield();
    }

    /* Signal done */
    geos_shm_signal_done(region);

    /* Show completion status */
    fb_text(4, 46, COLOR_YELLOW, "DONE!");
    fb_present();

    /* Keep running to maintain display */
    while (1) {
        geos_yield();
        for (volatile int i = 0; i < 10000; i++);
    }

    return 0;
}
