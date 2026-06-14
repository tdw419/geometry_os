/*
 * graphics_demo.c -- Demonstration of libfb drawing primitives
 *
 * Draws a comprehensive scene showcasing all libfb functions:
 *   - Solid fill, horizontal and vertical gradients
 *   - Filled and outlined rectangles
 *   - Bresenham lines in various patterns
 *   - Filled and outlined circles
 *   - Filled triangle
 *   - Text rendering at multiple positions
 *   - Region blit (copies a rectangle)
 *   - Screen scroll
 *
 * Build: ./build.sh graphics_demo graphics_demo.elf
 * Run:   via RISC-V hypervisor or riscv_run
 */

#include "libfb.h"
#include "libgeos.h"

/* ---- Demo: Filled rectangles with color palette ---- */
static void demo_rectangles(void) {
    /* Four colored rectangles in a grid */
    fb_rect(10, 10, 50, 30, fb_rgb(255, 60, 60));    /* red */
    fb_rect(70, 10, 50, 30, fb_rgb(60, 255, 60));    /* green */
    fb_rect(130, 10, 50, 30, fb_rgb(60, 60, 255));   /* blue */
    fb_rect(190, 10, 50, 30, fb_rgb(255, 255, 60));  /* yellow */

    /* White outline around the grid */
    fb_rect_outline(8, 8, 236, 36, 0xFFFFFFFF);

    /* Labels */
    fb_text(15, 20, 0xFFFFFFFF, "RED");
    fb_text(75, 20, 0xFFFFFFFF, "GRN");
    fb_text(135, 20, 0xFFFFFFFF, "BLU");
    fb_text(198, 20, 0xFFFFFFFF, "YLW");
}

/* ---- Demo: Gradient fills ---- */
static void demo_gradients(void) {
    /* Horizontal gradient: red to blue */
    fb_gradient_h(10, 55, 236, 20, fb_rgb(255, 0, 0), fb_rgb(0, 0, 255));

    /* Vertical gradient: green to black */
    fb_gradient_v(10, 80, 80, 60, fb_rgb(0, 255, 0), fb_rgb(0, 0, 0));

    /* Vertical gradient: white to black */
    fb_gradient_v(100, 80, 80, 60, fb_rgb(255, 255, 255), fb_rgb(0, 0, 0));

    /* Labels */
    fb_text(85, 60, 0xFFFFFFFF, "H-GRADIENT");
    fb_text(12, 85, 0xFFFFFFFF, "V-GRN");
    fb_text(102, 85, 0xFFFFFFFF, "V-WHT");
}

/* ---- Demo: Lines (Bresenham) ---- */
static void demo_lines(void) {
    /* Starburst from center of right panel */
    int cx = 200, cy = 110;
    uint32_t colors[] = {
        fb_rgb(255, 100, 100), fb_rgb(100, 255, 100),
        fb_rgb(100, 100, 255), fb_rgb(255, 255, 100),
        fb_rgb(255, 100, 255), fb_rgb(100, 255, 255),
        fb_rgb(255, 200, 100), fb_rgb(200, 100, 255),
    };

    for (int i = 0; i < 8; i++) {
        int angle = i * 45;
        int dx = (angle < 180) ? 40 : -40;
        int dy = 40;
        if (angle == 45 || angle == 135) { dx = 30; dy = 30; }
        if (angle == 225 || angle == 315) { dx = -30; dy = -30; }
        if (angle == 0) { dx = 40; dy = 0; }
        if (angle == 90) { dx = 0; dy = 40; }
        if (angle == 180) { dx = -40; dy = 0; }
        if (angle == 270) { dx = 0; dy = -40; }

        fb_line(cx, cy, cx + dx, cy + dy, colors[i]);
    }

    /* Diagonal cross */
    fb_line(10, 150, 100, 200, fb_rgb(255, 128, 0));
    fb_line(100, 150, 10, 200, fb_rgb(0, 128, 255));

    fb_text(185, 80, 0xFFFFFFFF, "LINES");
}

/* ---- Demo: Circles ---- */
static void demo_circles(void) {
    /* Filled circles */
    fb_circle(40, 230, 20, fb_rgb(255, 0, 0));    /* red */
    fb_circle(90, 230, 15, fb_rgb(0, 200, 0));    /* green */
    fb_circle(130, 230, 25, fb_rgb(0, 100, 255)); /* blue */

    /* Circle outlines */
    fb_circle_outline(180, 230, 20, fb_rgb(255, 255, 0));  /* yellow outline */
    fb_circle_outline(220, 230, 15, fb_rgb(255, 0, 255));  /* magenta outline */

    fb_text(10, 200, 0xFFFFFFFF, "CIRCLES");
}

/* ---- Demo: Triangle ---- */
static void demo_triangles(void) {
    /* Filled triangle */
    fb_triangle(10, 145, 50, 145, 30, 120, fb_rgb(0, 255, 200));

    /* Another triangle */
    fb_triangle(60, 145, 100, 145, 80, 115, fb_rgb(200, 100, 255));

    fb_text(12, 127, 0xFFFFFFFF, "TRI");
}

/* ---- Demo: Blit (copy a rectangle) ---- */
static void demo_blit(void) {
    /* Draw a small pattern in the top-left corner area */
    fb_rect(200, 150, 20, 20, fb_rgb(255, 128, 64));
    fb_rect_outline(200, 150, 20, 20, 0xFFFFFFFF);
    fb_text(203, 157, 0xFFFFFFFF, "SRC");

    /* Copy it to two other positions */
    fb_blit(200, 150, 230, 150, 20, 20);
    fb_blit(200, 150, 200, 175, 20, 20);

    fb_text(230, 157, 0xFFFFFFFF, "C1");
    fb_text(203, 182, 0xFFFFFFFF, "C2");
}

/* ---- Main ---- */
int c_start(void) {
    geos_puts("=== libfb graphics demo ===\n");
    geos_puts("Drawing primitives showcase\n\n");

    /* Start with a dark background */
    fb_fill(fb_rgb(10, 10, 20));

    /* Run all demos */
    demo_rectangles();
    demo_gradients();
    demo_triangles();
    demo_lines();
    demo_circles();
    demo_blit();

    /* Title text */
    fb_text(80, 2, fb_rgb(255, 255, 255), "libfb Graphics Library");

    /* Info text at the bottom */
    fb_text(10, 248, fb_rgb(180, 180, 180), "fb_fill fb_rect fb_line fb_circle fb_text fb_blit fb_gradient");

    /* Present the frame */
    fb_present();

    geos_puts("Frame presented. All primitives rendered.\n");
    geos_puts("Shutting down.\n");
    sbi_shutdown();

    return 0;
}
