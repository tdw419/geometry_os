/*
 * clip_test.c -- Region clipping demonstration for Layer 2
 *
 * Left half (0,0,128,256): fill red
 * Right half (128,0,128,256): fill blue
 * Then try to write green to the right half while clipped to left.
 * Verify the right half stays blue (clipping prevented the write).
 *
 * Build: ./build.sh clip_test clip_test.elf
 * Run: via riscv_run MCP tool or examples/riscv_run.rs
 */

#include "libgeos.h"

int c_start(void) {
    geos_puts("[clip] test start\n");

    /* Phase 1: Fill left half red */
    geos_request_region(0, 0, 128, 256);
    for (uint32_t y = 0; y < 256; y++) {
        for (uint32_t x = 0; x < 256; x++) {
            geos_fb_pixel(x, y, geos_rgb(255, 60, 60)); /* red */
        }
    }
    geos_fb_present();
    geos_puts("[clip] left half filled (red)\n");

    /* Phase 2: Fill right half blue */
    geos_request_region(128, 0, 128, 256);
    for (uint32_t y = 0; y < 256; y++) {
        for (uint32_t x = 0; x < 256; x++) {
            geos_fb_pixel(x, y, geos_rgb(60, 100, 255)); /* blue */
        }
    }
    geos_fb_present();
    geos_puts("[clip] right half filled (blue)\n");

    /* Phase 3: Try to overwrite right half with green while clipped to left */
    geos_request_region(0, 0, 128, 256);
    for (uint32_t y = 0; y < 256; y++) {
        for (uint32_t x = 0; x < 256; x++) {
            geos_fb_pixel(x, y, geos_rgb(60, 255, 60)); /* green -- should be clipped */
        }
    }
    geos_fb_present();
    geos_puts("[clip] attempted overwrite (should be clipped)\n");

    /* Phase 4: Verify right half is still blue (spot check) */
    uint32_t sample = geos_fb_read(200, 128);
    uint32_t r = (sample >> 24) & 0xFF;
    uint32_t g = (sample >> 16) & 0xFF;
    uint32_t b = (sample >> 8) & 0xFF;

    if (b > 200 && r < 100 && g < 150) {
        geos_puts("[clip] PASS: right half still blue (clipping works)\n");
    } else {
        geos_puts("[clip] FAIL: right half was overwritten!\n");
        geos_puts("[clip] sample pixel: r=");
        geos_put_dec(r);
        geos_puts(" g=");
        geos_put_dec(g);
        geos_puts(" b=");
        geos_put_dec(b);
        geos_puts("\n");
    }

    /* Phase 5: Test geos_yield() returns 0 (no kernel running) */
    long yield_result = geos_yield();
    if (yield_result == 0) {
        geos_puts("[clip] PASS: geos_yield() returned 0\n");
    } else {
        geos_puts("[clip] FAIL: geos_yield() returned ");
        geos_put_dec(yield_result);
        geos_puts("\n");
    }

    geos_puts("[clip] test complete\n");
    sbi_shutdown();

    /* unreachable */
    return 0;
}
