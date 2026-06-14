/*
 * libfb.h -- framebuffer graphics library for Geometry OS guest programs
 *
 * Drawing primitives for the 256x256 MMIO framebuffer.
 * Builds as libfb.a and links alongside libgeos.a.
 *
 * All functions write to the MMIO framebuffer at 0x60000000.
 * Pixel format: 0xRRGGBBAA (alpha=0xFF for opaque).
 *
 * Usage:
 *   #include "libfb.h"
 *   fb_init();             // clear screen to black
 *   fb_fill(0xFF0000FF);   // fill red
 *   fb_rect(10, 10, 50, 30, 0x00FF00FF); // green rectangle
 *   fb_line(0, 0, 255, 255, 0xFFFFFFFF); // white diagonal
 *   fb_circle(128, 128, 40, 0x0000FFFF); // blue circle
 *   fb_text(10, 120, 0xFFFFFFFF, "Hello!"); // white text
 *   fb_present();          // signal host to display
 *
 * Build: linked via build.sh (libfb.a built automatically)
 */

#ifndef LIBFB_H
#define LIBFB_H

#include <stdint.h>

/* ---- Constants ---- */

#define FB_WIDTH    256
#define FB_HEIGHT   256
#define FB_BASE     0x60000000u
#define FB_CONTROL  (FB_BASE + (FB_WIDTH * FB_HEIGHT) * 4)

/* ---- Initialization ---- */

/* Clear the framebuffer to black. */
void fb_init(void);

/* ---- Pixel operations ---- */

/* Set a single pixel at (x, y). Bounds-checked. */
void fb_pixel(int x, int y, uint32_t color);

/* Read a single pixel at (x, y). Returns 0 if out of bounds. */
uint32_t fb_read(int x, int y);

/* ---- Fill ---- */

/* Fill the entire framebuffer with a solid color. */
void fb_fill(uint32_t color);

/* ---- Rectangle ---- */

/* Draw a filled rectangle from (x, y) with width w and height h. */
void fb_rect(int x, int y, int w, int h, uint32_t color);

/* Draw a rectangle outline (1px border). */
void fb_rect_outline(int x, int y, int w, int h, uint32_t color);

/* ---- Line (Bresenham) ---- */

/* Draw a line from (x0, y0) to (x1, y1). */
void fb_line(int x0, int y0, int x1, int y1, uint32_t color);

/* ---- Circle (midpoint) ---- */

/* Draw a filled circle centered at (cx, cy) with radius r. */
void fb_circle(int cx, int cy, int r, uint32_t color);

/* Draw a circle outline (1px ring) centered at (cx, cy) with radius r. */
void fb_circle_outline(int cx, int cy, int r, uint32_t color);

/* ---- Triangle ---- */

/* Draw a filled triangle with vertices (x0,y0), (x1,y1), (x2,y2). */
void fb_triangle(int x0, int y0, int x1, int y1, int x2, int y2, uint32_t color);

/* ---- Text ---- */

/* Render a null-terminated string at (x, y) using the embedded 5x7 font.
   Characters that go past the right or bottom edge are clipped. */
void fb_text(int x, int y, uint32_t color, const char *str);

/* Render a single character at (x, y) using the embedded 5x7 font.
   Returns the width (6 pixels) so callers can advance x manually. */
int fb_char(int x, int y, uint32_t color, char ch);

/* ---- Blit (region copy) ---- */

/* Copy a rectangular region of the framebuffer.
   (src_x, src_y) -> (dst_x, dst_y), width w, height h.
   Handles overlapping regions correctly. */
void fb_blit(int src_x, int src_y, int dst_x, int dst_y, int w, int h);

/* ---- Scroll ---- */

/* Scroll the screen up by 'pixels' rows. Bottom rows fill with black. */
void fb_scroll(int pixels);

/* ---- Gradient ---- */

/* Fill a horizontal gradient from color_left to color_right in a rectangle.
   Each column blends between the two colors based on x position. */
void fb_gradient_h(int x, int y, int w, int h, uint32_t color_left, uint32_t color_right);

/* Fill a vertical gradient from color_top to color_bottom in a rectangle. */
void fb_gradient_v(int x, int y, int w, int h, uint32_t color_top, uint32_t color_bottom);

/* ---- Present ---- */

/* Signal the host to display the current framebuffer contents. */
void fb_present(void);

/* ---- Utility ---- */

/* Blend two colors by a factor (0=color_a, 255=color_b). */
static inline uint32_t fb_blend(uint32_t color_a, uint32_t color_b, int factor) {
    uint32_t inv = 255 - factor;
    uint8_t r = (uint8_t)((((color_a >> 24) & 0xFF) * inv + ((color_b >> 24) & 0xFF) * factor) / 255);
    uint8_t g = (uint8_t)((((color_a >> 16) & 0xFF) * inv + ((color_b >> 16) & 0xFF) * factor) / 255);
    uint8_t b = (uint8_t)((((color_a >>  8) & 0xFF) * inv + ((color_b >>  8) & 0xFF) * factor) / 255);
    return ((uint32_t)r << 24) | ((uint32_t)g << 16) | ((uint32_t)b << 8) | 0xFF;
}

/* Pack RGB into framebuffer pixel format (0xRRGGBBAA). */
static inline uint32_t fb_rgb(uint8_t r, uint8_t g, uint8_t b) {
    return ((uint32_t)r << 24) | ((uint32_t)g << 16) | ((uint32_t)b << 8) | 0xFF;
}

/* Extract red channel from a pixel. */
static inline uint8_t fb_r(uint32_t c) { return (c >> 24) & 0xFF; }

/* Extract green channel from a pixel. */
static inline uint8_t fb_g(uint32_t c) { return (c >> 16) & 0xFF; }

/* Extract blue channel from a pixel. */
static inline uint8_t fb_b(uint32_t c) { return (c >> 8) & 0xFF; }

#endif /* LIBFB_H */
