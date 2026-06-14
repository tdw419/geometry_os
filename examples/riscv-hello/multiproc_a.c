/*
 * multiproc_a.c -- Cooperative multi-process demo: bouncing ball (Context A)
 *
 * Draws a bouncing ball on the framebuffer. Yields to the scheduler
 * after each frame so Context B can also draw.
 *
 * Build: riscv64-unknown-elf-gcc -O2 -nostdlib -T guest.ld \
 *        -I. multiproc_a.c libfb.a libgeos.a -o multiproc_a.elf
 */

#include "libfb.h"
#include "libgeos.h"

#define COLOR_RED    0xFF0000FFu
#define COLOR_BLACK  0x000000FFu

void _start(void) {
    int x = 50, y = 50;
    int dx = 3, dy = 2;
    int radius = 8;

    fb_init();

    while (1) {
        /* Erase old position */
        fb_circle(x, y, radius, COLOR_BLACK);

        /* Move */
        x += dx;
        y += dy;

        /* Bounce off walls */
        if (x - radius <= 0 || x + radius >= 255) dx = -dx;
        if (y - radius <= 0 || y + radius >= 255) dy = -dy;

        /* Clamp to screen */
        if (x < radius) x = radius;
        if (x > 255 - radius) x = 255 - radius;
        if (y < radius) y = radius;
        if (y > 255 - radius) y = 255 - radius;

        /* Draw new position */
        fb_circle(x, y, radius, COLOR_RED);

        /* Present and yield */
        fb_present();
        geos_yield();

        /* Small delay loop to slow down animation */
        for (volatile int i = 0; i < 5000; i++);
    }
}
