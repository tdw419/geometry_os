/*
 * disk_loader_demo.c -- Phase 397 demo: runtime ELF loading from disk
 *
 * Demonstrates the new Phase 397 syscalls:
 *   geos_load_disk()  -- load ELF binary from virtio-blk into a process slot
 *   geos_exec()       -- execute a loaded process slot
 *   geos_open/read/close -- kernel-mediated file access
 *
 * This program runs as a guest under the GeOS kernel (geos_kern).
 * It loads a secondary program from disk sector 32 and executes it
 * in slot C (id=2), then demonstrates basic file I/O.
 */

#include "libgeos.h"

/* ---- Demo constants ---- */
#define DISK_ELF_START_SECTOR  32    /* sector where child ELF lives */
#define DEMO_SLOT              2     /* slot C for child program */
#define STATUS_Y               200   /* y position for status text */

static void draw_status(const char *msg, uint32_t color) {
    geos_draw_string(4, STATUS_Y, msg, color, COLOR_BLACK);
    geos_fb_present();
}

static void draw_status_hex(const char *prefix, long val, uint32_t color) {
    geos_draw_string(4, STATUS_Y, prefix, color, COLOR_BLACK);
    /* draw hex value after prefix */
    int x = 4;
    while (*prefix) { x += 8; prefix++; }
    geos_put_hex((uint32_t)val);
    geos_fb_present();
}

int c_start(void) {
    long my_id = geos_get_id();
    long ret;

    /* ---- Step 1: Claim our display region ---- */
    /* Each process gets a horizontal slice of the 256x256 screen */
    uint32_t y0 = (uint32_t)my_id * 64;
    geos_request_region(0, y0, 256, 64);

    /* ---- Step 2: Draw header ---- */
    geos_draw_string(4, y0 + 4,  "DISK LOADER DEMO", COLOR_GREEN, COLOR_BLACK);
    geos_draw_string(4, y0 + 16, "Phase 397 - Runtime ELF Loading", COLOR_WHITE, COLOR_BLACK);
    geos_fb_present();

    /* ---- Step 3: Initialize block device ---- */
    geos_draw_string(4, y0 + 28, "Init block device...", COLOR_YELLOW, COLOR_BLACK);
    geos_fb_present();

    /* ---- Step 4: Load ELF from disk into slot C ---- */
    geos_draw_string(4, y0 + 36, "Loading ELF from sector 32...", COLOR_YELLOW, COLOR_BLACK);
    geos_fb_present();

    ret = geos_load_disk(DEMO_SLOT, DISK_ELF_START_SECTOR);
    if (ret < 0) {
        geos_draw_string(4, y0 + 44, "load_disk FAILED", COLOR_RED, COLOR_BLACK);
        geos_draw_string(4, y0 + 52, "No ELF on disk - expected", COLOR_WHITE, COLOR_BLACK);
        /* Not fatal - continue with file I/O demo */
    } else {
        geos_draw_string(4, y0 + 44, "load_disk OK - executing...", COLOR_GREEN, COLOR_BLACK);
        geos_fb_present();

        /* ---- Step 5: Execute the loaded program ---- */
        ret = geos_exec(DEMO_SLOT);
        if (ret < 0) {
            geos_draw_string(4, y0 + 52, "exec FAILED (slot busy?)", COLOR_RED, COLOR_BLACK);
        } else {
            geos_draw_string(4, y0 + 52, "Child process running!", COLOR_GREEN, COLOR_BLACK);
        }
    }
    geos_fb_present();

    /* ---- Step 6: File I/O demo ---- */
    geos_draw_string(4, y0 + 60, "Testing file I/O...", COLOR_CYAN, COLOR_BLACK);
    geos_fb_present();

    /* Try to open a file through kernel mediation */
    ret = geos_open("hello.txt", GEO_O_RDONLY);
    if (ret < 0) {
        geos_draw_string(4, y0 + 68, "open: no file (expected)", COLOR_WHITE, COLOR_BLACK);
    } else {
        long fd = ret;
        char buf[64];
        geos_draw_string(4, y0 + 68, "opened hello.txt", COLOR_GREEN, COLOR_BLACK);

        long n = geos_read(fd, buf, sizeof(buf) - 1);
        if (n > 0) {
            buf[n] = '\0';
            geos_draw_string(4, y0 + 76, buf, COLOR_WHITE, COLOR_BLACK);
        }
        geos_close(fd);
    }
    geos_fb_present();

    /* ---- Step 7: Main loop ---- */
    /* Animate a marker to show we're alive */
    uint32_t frame = 0;
    while (1) {
        geos_yield();

        /* Draw a rotating color bar at the bottom of our region */
        for (int x = 0; x < 256; x++) {
            uint8_t r = (uint8_t)(frame + x);
            uint8_t g = (uint8_t)(frame * 2 + x);
            uint8_t b = 0xFF;
            geos_fb_pixel(x, y0 + 62, geos_rgb(r, g, b));
        }
        geos_fb_present();

        frame++;
    }
}
