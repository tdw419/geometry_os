/*
 * hello_user.c -- A custom C program for Geometry OS.
 * Demonstrates basic framebuffer manipulation and timing.
 */
#include "libgeos.h"
#include "libfb.h"

void c_start(void) {
    geos_puts("Starting custom user demo...\n");

    /* Clear screen to a dark purple */
    uint32_t bg = geos_rgb(20, 10, 30);
    fb_fill(bg);
    geos_fb_present();

    int x = 128;
    int y = 128;
    int dx = 2;
    int dy = 1;
    uint32_t color = geos_rgb(0, 255, 128); /* Neon Green */

    geos_puts("Entering animation loop...\n");

    /* Run for a few hundred frames */
    for (int frame = 0; frame < 500; frame++) {
        /* Erase old position */
        geos_fb_pixel(x, y, bg);
        geos_fb_pixel(x+1, y, bg);
        geos_fb_pixel(x, y+1, bg);
        geos_fb_pixel(x+1, y+1, bg);

        /* Update position */
        x += dx;
        y += dy;

        /* Bounce off walls */
        if (x <= 0 || x >= GEOS_FB_WIDTH - 2) dx = -dx;
        if (y <= 0 || y >= GEOS_FB_HEIGHT - 2) dy = -dy;

        /* Draw new position */
        geos_fb_pixel(x, y, color);
        geos_fb_pixel(x+1, y, color);
        geos_fb_pixel(x, y+1, color);
        geos_fb_pixel(x+1, y+1, color);

        /* Update display */
        geos_fb_present();

        /* Small delay (approx 16ms for ~60fps) */
        geos_wait_ms(16);

        /* Print every 100 frames to UART */
        if (frame % 100 == 0) {
            geos_puts("Frame: ");
            geos_put_dec(frame);
            geos_puts("\n");
        }
    }

    geos_puts("Demo complete. Shutting down.\n");
    sbi_shutdown();
}
