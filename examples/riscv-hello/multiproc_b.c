/*
 * multiproc_b.c -- Cooperative multi-process demo: rotating line (Context B)
 *
 * Draws a rotating line from the center of the screen. Yields to the
 * scheduler after each frame so Context A can also draw.
 *
 * Build: riscv64-unknown-elf-gcc -O2 -nostdlib -T guest.ld \
 *        -I. multiproc_b.c libfb.a libgeos.a -o multiproc_b.elf
 */

#include "libfb.h"
#include "libgeos.h"

#define COLOR_CYAN   0x00FFFFFFu
#define COLOR_BLACK  0x000000FFu

/* Simple 64-entry sine table (Q8 fixed point, values 0-255) */
static const unsigned char sin_tab[64] = {
    0, 6, 12, 18, 25, 31, 37, 43, 49, 55, 60, 66, 71, 76, 81, 86,
    90, 95, 99, 103, 106, 109, 112, 115, 117, 119, 121, 123, 124, 125,
    126, 126, 126, 126, 126, 125, 124, 123, 121, 119, 117, 115, 112,
    109, 106, 103, 99, 95, 90, 86, 81, 76, 71, 66, 60, 55, 49, 43,
    37, 31, 25, 18, 12, 6
};

void _start(void) {
    int step = 0;
    int cx = 192, cy = 192;
    int len = 30;
    int prev_x = cx + len, prev_y = cy;

    while (1) {
        /* Erase previous line */
        fb_line(cx, cy, prev_x, prev_y, COLOR_BLACK);

        /* Compute new endpoint using sine table */
        int idx = step & 63;
        int s = sin_tab[idx];
        int c = sin_tab[(idx + 16) & 63];  /* cos = sin shifted by 90 degrees */
        int nx = cx + (len * c) / 128;
        int ny = cy + (len * s) / 128;

        /* Draw new line */
        fb_line(cx, cy, nx, ny, COLOR_CYAN);
        fb_pixel(cx, cy, COLOR_CYAN);

        prev_x = nx;
        prev_y = ny;
        step += 2;

        /* Present and yield */
        fb_present();
        geos_yield();

        /* Small delay */
        for (volatile int i = 0; i < 5000; i++);
    }
}
