/*
 * substrate_test.c -- Phase W: Substrate Driver Test
 *
 * This program runs inside the RISC-V guest and tests the '/dev/substrate'
 * driver implemented in geos_kern.c.
 */

#include "libgeos.h"

void c_start() {
    geos_puts("[user] substrate driver test starting...\n");

    int fd = (int)geos_open("/dev/substrate", GEO_O_RDWR);
    if (fd < 0) {
        geos_puts("[ERROR] Failed to open /dev/substrate\n");
        return 1;
    }

    /* 1. Set coordinates */
    geos_ioctl(fd, SUB_IOCTL_SET_X, 128);
    geos_ioctl(fd, SUB_IOCTL_SET_Y, 128);

    /* 2. Patch a pixel (Surgically update color)
     * TAX_SIGNAL (12) << 28 | Payload (0xFF)
     */
    uint32_t signal_pixel = (12u << 28) | 0xFF;
    geos_ioctl(fd, SUB_IOCTL_PATCH, signal_pixel);
    geos_puts("[user] patched signal pixel at (128,128)\n");

    /* 3. Tick the substrate */
    geos_puts("[user] ticking substrate 10 times...\n");
    geos_ioctl(fd, SUB_IOCTL_TICK, 10);

    /* 4. Query ticks executed */
    uint32_t ticks = (uint32_t)geos_ioctl(fd, SUB_IOCTL_QUERY, SUB_QUERY_TICKS);
    geos_puts("[user] substrate ticks reported: ");
    geos_put_dec(ticks);
    geos_puts("\n");

    /* 5. Close device */
    geos_close(fd);
    geos_puts("[user] substrate test complete.\n");

    return 0;
}
