#include "libgeos.h"
void c_start(void) {
    /* Request left half of screen */
    long offset = geos_request_region(0, 0, 128, 256);

    /* Paint our region red (0xRRGGBBAA) */
    for (uint32_t y = 0; y < 256; y++) {
        for (uint32_t x = 0; x < 128; x++) {
            geos_fb_pixel(x, y, geos_rgb(0xFF, 0x00, 0x00));
        }
    }
    geos_fb_present();

    geos_puts("[A] painted left half red\n");

    /* Now try to paint the right half white -- should be CLIPPED */
    for (uint32_t y = 0; y < 256; y++) {
        for (uint32_t x = 128; x < 256; x++) {
            geos_fb_pixel(x, y, geos_rgb(0xFF, 0xFF, 0xFF));
        }
    }
    geos_fb_present();

    geos_puts("[A] attempted right half white (clipped)\n");

    /* Spin so the kernel can switch to B */
    while(1) {
        for (volatile int i = 0; i < 100000; i++);
    }
}
