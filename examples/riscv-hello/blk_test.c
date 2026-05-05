/*
 * blk_test.c -- Virtio-blk read/write test for Geometry OS
 *
 * Tests the virtio-blk driver by:
 *   1. Initializing the block device
 *   2. Writing a known pattern to sector 0
 *   3. Reading it back and verifying
 *   4. Displaying the result visually on the framebuffer
 *
 * The visual display uses spatial patterns for deterministic verification:
 *   - Top half (rows 0-127): Green if read matched write pattern
 *   - Bottom half (rows 128-255): Red if read did NOT match
 *   - Pattern text encoded as pixel brightness in the first sector data
 *
 * Build: build.sh blk_test.c
 * Run:   hypervisor_boot arch=riscv32 kernel=blk_test.elf ram=1
 */

#include "libgeos.h"

/* Test pattern written to sector 0. Must be < 512 bytes. */
static const char TEST_PATTERN[] = "GeometryOS_blk_v1";

/* Align the descriptor buffer to 16 bytes for safety. */
static uint8_t desc_buf[512] __attribute__((aligned(16)));
static uint8_t sector_buf[GEOS_BLK_SECTOR];

void c_start(void) {
    /* Clear framebuffer */
    for (int y = 0; y < GEOS_FB_HEIGHT; y++) {
        for (int x = 0; x < GEOS_FB_WIDTH; x++) {
            geos_fb_pixel(x, y, 0xFF000000); /* black */
        }
    }
    geos_fb_present();

    /* Step 1: Initialize virtio-blk */
    geos_puts("[blk_test] Initializing virtio-blk...\n");
    if (geos_blk_init(desc_buf) != 0) {
        geos_puts("[blk_test] FAIL: init returned error\n");
        /* Display red screen */
        for (int y = 0; y < GEOS_FB_HEIGHT; y++) {
            for (int x = 0; x < GEOS_FB_WIDTH; x++) {
                geos_fb_pixel(x, y, geos_rgb(0xFF, 0x00, 0x00));
            }
        }
        geos_fb_present();
        return;
    }
    geos_puts("[blk_test] init OK\n");

    /* Step 2: Write test pattern to sector 0 */
    geos_puts("[blk_test] Writing pattern to sector 0...\n");
    geos_memset(sector_buf, 0, GEOS_BLK_SECTOR);
    for (int i = 0; TEST_PATTERN[i]; i++) {
        sector_buf[i] = TEST_PATTERN[i];
    }
    /* Also write a visual marker: sector byte 20 = 0xAA for detection */
    sector_buf[20] = 0xAA;
    sector_buf[21] = 0xBB;
    sector_buf[22] = 0xCC;

    if (geos_blk_write(0, sector_buf, 1) != 0) {
        geos_puts("[blk_test] FAIL: write returned error\n");
        for (int y = 0; y < GEOS_FB_HEIGHT; y++) {
            for (int x = 0; x < GEOS_FB_WIDTH; x++) {
                geos_fb_pixel(x, y, geos_rgb(0xFF, 0x00, 0x00));
            }
        }
        geos_fb_present();
        return;
    }
    geos_puts("[blk_test] write OK\n");

    /* Verify what we wrote to sector_buf before read */
    geos_puts("[blk_test] sector_buf before read (first 20 bytes):\n");
    for (int i = 0; i < 20; i++) {
        geos_put_hex(sector_buf[i]);
        geos_puts(" ");
    }
    geos_puts("\n");

    /* Step 3: Read sector 0 back */
    geos_puts("[blk_test] Reading sector 0...\n");
    geos_memset(sector_buf, 0, GEOS_BLK_SECTOR);
    if (geos_blk_read(0, sector_buf, 1) != 0) {
        geos_puts("[blk_test] FAIL: read returned error\n");
        for (int y = 0; y < GEOS_FB_HEIGHT; y++) {
            for (int x = 0; x < GEOS_FB_WIDTH; x++) {
                geos_fb_pixel(x, y, geos_rgb(0xFF, 0x00, 0x00));
            }
        }
        geos_fb_present();
        return;
    }
    geos_puts("[blk_test] read OK\n");

    /* Step 4: Verify */
    geos_puts("[blk_test] Verifying data...\n");
    geos_puts("[blk_test] First 20 bytes of sector_buf after read:\n");
    for (int i = 0; i < 20 && i < 64; i++) {
        geos_put_hex(sector_buf[i]);
        geos_puts(" ");
    }
    geos_puts("\n");
    int match = 1;
    for (int i = 0; TEST_PATTERN[i]; i++) {
        if (sector_buf[i] != TEST_PATTERN[i]) {
            match = 0;
            geos_puts("[blk_test] FAIL: mismatch at byte ");
            geos_put_dec(i);
            geos_puts("\n");
            break;
        }
    }
    if (match && sector_buf[20] == 0xAA && sector_buf[21] == 0xBB && sector_buf[22] == 0xCC) {
        geos_puts("[blk_test] PASS: all data verified\n");
    } else {
        match = 0;
        geos_puts("[blk_test] FAIL: marker bytes mismatch\n");
    }

    /* Step 5: Visual display
     * Design rule: spatial pattern encoding for deterministic vision-gate.
     *
     * PASS layout (green screen with spatial pattern):
     *   Rows 0-63:   Full green fill (success indicator)
     *   Rows 64-127: Horizontal stripe pattern using sector data as brightness
     *                 Each row's pixels encode bytes 0..63 of sector_buf as
     *                 brightness values (byte/255 * green channel).
     *   Rows 128-191: Sector data as vertical columns (bytes 64..127)
     *   Rows 192-255: Sector data as checkerboard (bytes 128..191)
     *
     * FAIL layout (red screen):
     *   Rows 0-63:   Full red fill
     *   Rows 64-255: Black (error state)
     */
    if (match) {
        /* Top band: solid green */
        for (int y = 0; y < 64; y++) {
            for (int x = 0; x < GEOS_FB_WIDTH; x++) {
                geos_fb_pixel(x, y, geos_rgb(0x00, 0xFF, 0x00));
            }
        }
        /* Middle band: sector data as horizontal brightness */
        for (int y = 0; y < 64; y++) {
            for (int x = 0; x < GEOS_FB_WIDTH && x < 256; x++) {
                uint8_t val = sector_buf[y * 2 + (x / 2) % 2];
                uint8_t g = val; /* brightness from data */
                geos_fb_pixel(x, y + 64, geos_rgb(0x00, g, g / 2));
            }
        }
        /* Lower-middle: sector data as vertical columns */
        for (int y = 0; y < 64; y++) {
            for (int x = 0; x < GEOS_FB_WIDTH && x < 256; x++) {
                uint8_t val = sector_buf[64 + x];
                uint8_t b = val;
                geos_fb_pixel(x, y + 128, geos_rgb(b / 2, b, 0x00));
            }
        }
        /* Bottom: checkerboard encoding of sector bytes 128-191 */
        for (int y = 0; y < 64; y++) {
            for (int x = 0; x < GEOS_FB_WIDTH && x < 256; x++) {
                uint8_t val = sector_buf[128 + (y * 16 + x / 16) % 64];
                if ((x + y) % 2 == 0) {
                    geos_fb_pixel(x, y + 192, geos_rgb(0x00, val, val));
                } else {
                    geos_fb_pixel(x, y + 192, geos_rgb(0x00, val / 3, val / 3));
                }
            }
        }
    } else {
        /* FAIL: red top, black bottom */
        for (int y = 0; y < 128; y++) {
            for (int x = 0; x < GEOS_FB_WIDTH; x++) {
                geos_fb_pixel(x, y, geos_rgb(0xFF, 0x00, 0x00));
            }
        }
        for (int y = 128; y < GEOS_FB_HEIGHT; y++) {
            for (int x = 0; x < GEOS_FB_WIDTH; x++) {
                geos_fb_pixel(x, y, geos_rgb(0x00, 0x00, 0x00));
            }
        }
    }

    geos_fb_present();
    geos_puts("[blk_test] Done. Shutting down.\n");
}
