/*
 * libfb.c -- framebuffer graphics library for Geometry OS guest programs
 *
 * Drawing primitives for the 256x256 MMIO framebuffer at 0x60000000.
 * Builds as libfb.a. All functions are self-contained (no libc dependency).
 *
 * Build: riscv64-linux-gnu-gcc -c -march=rv32imac_zicsr -mabi=ilp32 -O2 libfb.c
 *        riscv64-linux-gnu-ar rcs libfb.a libfb.o
 */

#include "libfb.h"

/* Pointer to the framebuffer MMIO region */
static volatile uint32_t *fb = (volatile uint32_t *)FB_BASE;

/* ---- 5x7 Font (printable ASCII 32-126) ----
 * Each character is 5 bytes wide, 7 pixels tall.
 * Stored column-major: byte N is column N, bit 0 = top pixel.
 * 95 characters * 5 bytes = 475 bytes.
 *
 * Font source: public domain 5x7 bitmap font (VGA-derived).
 * Only printable ASCII (0x20-0x7E) is included.
 */
static const uint8_t font5x7[95][5] = {
    /* ' ' (0x20) */ {0x00,0x00,0x00,0x00,0x00},
    /* '!' */        {0x00,0x00,0x5F,0x00,0x00},
    /* '"' */        {0x00,0x07,0x00,0x07,0x00},
    /* '#' */        {0x14,0x7F,0x14,0x7F,0x14},
    /* '$' */        {0x24,0x2A,0x7F,0x2A,0x12},
    /* '%' */        {0x23,0x13,0x08,0x64,0x62},
    /* '&' */        {0x36,0x49,0x55,0x22,0x50},
    /* '\'' */       {0x00,0x05,0x03,0x00,0x00},
    /* '(' */        {0x00,0x1C,0x22,0x41,0x00},
    /* ')' */        {0x00,0x41,0x22,0x1C,0x00},
    /* '*' */        {0x14,0x08,0x3E,0x08,0x14},
    /* '+' */        {0x08,0x08,0x3E,0x08,0x08},
    /* ',' */        {0x00,0x50,0x30,0x00,0x00},
    /* '-' */        {0x08,0x08,0x08,0x08,0x08},
    /* '.' */        {0x00,0x60,0x60,0x00,0x00},
    /* '/' */        {0x20,0x10,0x08,0x04,0x02},
    /* '0' */        {0x3E,0x51,0x49,0x45,0x3E},
    /* '1' */        {0x00,0x42,0x7F,0x40,0x00},
    /* '2' */        {0x42,0x61,0x51,0x49,0x46},
    /* '3' */        {0x21,0x41,0x45,0x4B,0x31},
    /* '4' */        {0x18,0x14,0x12,0x7F,0x10},
    /* '5' */        {0x27,0x45,0x45,0x45,0x39},
    /* '6' */        {0x3C,0x4A,0x49,0x49,0x30},
    /* '7' */        {0x01,0x71,0x09,0x05,0x03},
    /* '8' */        {0x36,0x49,0x49,0x49,0x36},
    /* '9' */        {0x06,0x49,0x49,0x29,0x1E},
    /* ':' */        {0x00,0x36,0x36,0x00,0x00},
    /* ';' */        {0x00,0x56,0x36,0x00,0x00},
    /* '<' */        {0x08,0x14,0x22,0x41,0x00},
    /* '=' */        {0x14,0x14,0x14,0x14,0x14},
    /* '>' */        {0x00,0x41,0x22,0x14,0x08},
    /* '?' */        {0x02,0x01,0x51,0x09,0x06},
    /* '@' */        {0x32,0x49,0x79,0x41,0x3E},
    /* 'A' */        {0x7E,0x11,0x11,0x11,0x7E},
    /* 'B' */        {0x7F,0x49,0x49,0x49,0x36},
    /* 'C' */        {0x3E,0x41,0x41,0x41,0x22},
    /* 'D' */        {0x7F,0x41,0x41,0x22,0x1C},
    /* 'E' */        {0x7F,0x49,0x49,0x49,0x41},
    /* 'F' */        {0x7F,0x09,0x09,0x09,0x01},
    /* 'G' */        {0x3E,0x41,0x49,0x49,0x7A},
    /* 'H' */        {0x7F,0x08,0x08,0x08,0x7F},
    /* 'I' */        {0x00,0x41,0x7F,0x41,0x00},
    /* 'J' */        {0x20,0x40,0x41,0x3F,0x01},
    /* 'K' */        {0x7F,0x08,0x14,0x22,0x41},
    /* 'L' */        {0x7F,0x40,0x40,0x40,0x40},
    /* 'M' */        {0x7F,0x02,0x0C,0x02,0x7F},
    /* 'N' */        {0x7F,0x04,0x08,0x10,0x7F},
    /* 'O' */        {0x3E,0x41,0x41,0x41,0x3E},
    /* 'P' */        {0x7F,0x09,0x09,0x09,0x06},
    /* 'Q' */        {0x3E,0x41,0x51,0x21,0x5E},
    /* 'R' */        {0x7F,0x09,0x19,0x29,0x46},
    /* 'S' */        {0x46,0x49,0x49,0x49,0x31},
    /* 'T' */        {0x01,0x01,0x7F,0x01,0x01},
    /* 'U' */        {0x3F,0x40,0x40,0x40,0x3F},
    /* 'V' */        {0x1F,0x20,0x40,0x20,0x1F},
    /* 'W' */        {0x3F,0x40,0x38,0x40,0x3F},
    /* 'X' */        {0x63,0x14,0x08,0x14,0x63},
    /* 'Y' */        {0x07,0x08,0x70,0x08,0x07},
    /* 'Z' */        {0x61,0x51,0x49,0x45,0x43},
    /* '[' */        {0x00,0x7F,0x41,0x41,0x00},
    /* '\' */        {0x02,0x04,0x08,0x10,0x20},
    /* ']' */        {0x00,0x41,0x41,0x7F,0x00},
    /* '^' */        {0x04,0x02,0x01,0x02,0x04},
    /* '_' */        {0x40,0x40,0x40,0x40,0x40},
    /* '`' */        {0x00,0x01,0x02,0x04,0x00},
    /* 'a' */        {0x20,0x54,0x54,0x54,0x78},
    /* 'b' */        {0x7F,0x48,0x44,0x44,0x38},
    /* 'c' */        {0x38,0x44,0x44,0x44,0x20},
    /* 'd' */        {0x38,0x44,0x44,0x48,0x7F},
    /* 'e' */        {0x38,0x54,0x54,0x54,0x18},
    /* 'f' */        {0x08,0x7E,0x09,0x01,0x02},
    /* 'g' */        {0x0C,0x52,0x52,0x52,0x3E},
    /* 'h' */        {0x7F,0x08,0x04,0x04,0x78},
    /* 'i' */        {0x00,0x44,0x7D,0x40,0x00},
    /* 'j' */        {0x20,0x40,0x44,0x3D,0x00},
    /* 'k' */        {0x7F,0x10,0x28,0x44,0x00},
    /* 'l' */        {0x00,0x41,0x7F,0x40,0x00},
    /* 'm' */        {0x7C,0x04,0x18,0x04,0x78},
    /* 'n' */        {0x7C,0x08,0x04,0x04,0x78},
    /* 'o' */        {0x38,0x44,0x44,0x44,0x38},
    /* 'p' */        {0x7C,0x14,0x14,0x14,0x08},
    /* 'q' */        {0x08,0x14,0x14,0x18,0x7C},
    /* 'r' */        {0x7C,0x08,0x04,0x04,0x08},
    /* 's' */        {0x48,0x54,0x54,0x54,0x20},
    /* 't' */        {0x04,0x3F,0x44,0x40,0x20},
    /* 'u' */        {0x3C,0x40,0x40,0x20,0x7C},
    /* 'v' */        {0x1C,0x20,0x40,0x20,0x1C},
    /* 'w' */        {0x3C,0x40,0x30,0x40,0x3C},
    /* 'x' */        {0x44,0x28,0x10,0x28,0x44},
    /* 'y' */        {0x0C,0x50,0x50,0x50,0x3C},
    /* 'z' */        {0x44,0x64,0x54,0x4C,0x44},
    /* '{' */        {0x00,0x08,0x36,0x41,0x00},
    /* '|' */        {0x00,0x00,0x7F,0x00,0x00},
    /* '}' */        {0x00,0x41,0x36,0x08,0x00},
    /* '~' */        {0x10,0x08,0x08,0x10,0x08},
};

/* ---- Initialization ---- */

void fb_init(void) {
    for (int i = 0; i < FB_WIDTH * FB_HEIGHT; i++) {
        fb[i] = 0x000000FF; /* opaque black */
    }
}

/* ---- Pixel operations ---- */

void fb_pixel(int x, int y, uint32_t color) {
    if (x >= 0 && x < FB_WIDTH && y >= 0 && y < FB_HEIGHT) {
        fb[y * FB_WIDTH + x] = color;
    }
}

uint32_t fb_read(int x, int y) {
    if (x >= 0 && x < FB_WIDTH && y >= 0 && y < FB_HEIGHT) {
        return fb[y * FB_WIDTH + x];
    }
    return 0;
}

/* ---- Fill ---- */

void fb_fill(uint32_t color) {
    for (int i = 0; i < FB_WIDTH * FB_HEIGHT; i++) {
        fb[i] = color;
    }
}

/* ---- Rectangle ---- */

void fb_rect(int x, int y, int w, int h, uint32_t color) {
    /* Clip to framebuffer bounds */
    if (x < 0) { w += x; x = 0; }
    if (y < 0) { h += y; y = 0; }
    if (x + w > FB_WIDTH) w = FB_WIDTH - x;
    if (y + h > FB_HEIGHT) h = FB_HEIGHT - y;
    if (w <= 0 || h <= 0) return;

    for (int row = y; row < y + h; row++) {
        for (int col = x; col < x + w; col++) {
            fb[row * FB_WIDTH + col] = color;
        }
    }
}

void fb_rect_outline(int x, int y, int w, int h, uint32_t color) {
    /* Top and bottom edges */
    for (int col = x; col < x + w; col++) {
        fb_pixel(col, y, color);
        fb_pixel(col, y + h - 1, color);
    }
    /* Left and right edges */
    for (int row = y; row < y + h; row++) {
        fb_pixel(x, row, color);
        fb_pixel(x + w - 1, row, color);
    }
}

/* ---- Line (Bresenham) ---- */

void fb_line(int x0, int y0, int x1, int y1, uint32_t color) {
    int dx = x1 > x0 ? x1 - x0 : x0 - x1;
    int dy = y1 > y0 ? y1 - y0 : y0 - y1;
    int sx = x0 < x1 ? 1 : -1;
    int sy = y0 < y1 ? 1 : -1;
    int err = dx - dy;

    for (;;) {
        fb_pixel(x0, y0, color);
        if (x0 == x1 && y0 == y1) break;
        int e2 = 2 * err;
        if (e2 > -dy) { err -= dy; x0 += sx; }
        if (e2 < dx)  { err += dx; y0 += sy; }
    }
}

/* ---- Circle (midpoint) ---- */

void fb_circle(int cx, int cy, int r, uint32_t color) {
    /* Midpoint circle: draw horizontal scan lines for each y from cy-r to cy+r.
       For each y, compute x extent using x^2 + y^2 = r^2. */
    int r2 = r * r;
    for (int dy = -r; dy <= r; dy++) {
        int y = cy + dy;
        if (y < 0 || y >= FB_HEIGHT) continue;
        /* x = sqrt(r^2 - dy^2), computed with integer approximation */
        int dx = 0;
        int dx2 = 0;
        while (dx2 + (2 * dx + 1) <= r2 - dy * dy) {
            dx2 += 2 * dx + 1;
            dx++;
        }
        /* Draw from cx-dx to cx+dx */
        int x_start = cx - dx;
        int x_end = cx + dx;
        if (x_start < 0) x_start = 0;
        if (x_end >= FB_WIDTH) x_end = FB_WIDTH - 1;
        for (int x = x_start; x <= x_end; x++) {
            fb[y * FB_WIDTH + x] = color;
        }
    }
}

void fb_circle_outline(int cx, int cy, int r, uint32_t color) {
    /* Midpoint circle algorithm for outline only */
    int x = r, y = 0;
    int d = 1 - r;

    while (x >= y) {
        /* Draw 8 octant points */
        fb_pixel(cx + x, cy + y, color);
        fb_pixel(cx - x, cy + y, color);
        fb_pixel(cx + x, cy - y, color);
        fb_pixel(cx - x, cy - y, color);
        fb_pixel(cx + y, cy + x, color);
        fb_pixel(cx - y, cy + x, color);
        fb_pixel(cx + y, cy - x, color);
        fb_pixel(cx - y, cy - x, color);

        y++;
        if (d <= 0) {
            d += 2 * y + 1;
        } else {
            x--;
            d += 2 * (y - x) + 1;
        }
    }
}

/* ---- Triangle ---- */

/* Helper: horizontal line with bounds checking */
static void hline(int x0, int x1, int y, uint32_t color) {
    if (y < 0 || y >= FB_HEIGHT) return;
    if (x0 > x1) { int t = x0; x0 = x1; x1 = t; }
    if (x0 < 0) x0 = 0;
    if (x1 >= FB_WIDTH) x1 = FB_WIDTH - 1;
    for (int x = x0; x <= x1; x++) {
        fb[y * FB_WIDTH + x] = color;
    }
}

void fb_triangle(int x0, int y0, int x1, int y1, int x2, int y2, uint32_t color) {
    /* Sort vertices by y coordinate: v0 (top), v1 (mid), v2 (bottom) */
    if (y0 > y1) { int t; t=x0; x0=x1; x1=t; t=y0; y0=y1; y1=t; }
    if (y0 > y2) { int t; t=x0; x0=x2; x2=t; t=y0; y0=y2; y2=t; }
    if (y1 > y2) { int t; t=x1; x1=x2; x2=t; t=y1; y1=y2; y2=t; }

    /* Scanline fill */
    for (int y = y0; y <= y2; y++) {
        if (y < 0) continue;
        if (y >= FB_HEIGHT) break;

        /* Compute x intersections with the two edges spanning this y */
        int xa, xb;

        if (y <= y1) {
            /* Upper half: edges are v0->v1 and v0->v2 */
            int dy01 = y1 - y0;
            xa = dy01 ? x0 + (x1 - x0) * (y - y0) / dy01 : x0;
            int dy02 = y2 - y0;
            xb = dy02 ? x0 + (x2 - x0) * (y - y0) / dy02 : x0;
        } else {
            /* Lower half: edges are v0->v2 and v1->v2 */
            int dy02 = y2 - y0;
            xa = dy02 ? x0 + (x2 - x0) * (y - y0) / dy02 : x0;
            int dy12 = y2 - y1;
            xb = dy12 ? x1 + (x2 - x1) * (y - y1) / dy12 : x1;
        }

        hline(xa, xb, y, color);
    }
}

/* ---- Text ---- */

int fb_char(int x, int y, uint32_t color, char ch) {
    unsigned int idx = (unsigned char)ch - 0x20;
    if (idx >= 95) return 6; /* non-printable: skip */

    const uint8_t *glyph = font5x7[idx];
    for (int col = 0; col < 5; col++) {
        uint8_t col_bits = glyph[col];
        for (int row = 0; row < 7; row++) {
            if (col_bits & (1 << row)) {
                fb_pixel(x + col, y + row, color);
            }
        }
    }
    return 6; /* character width = 5 + 1 spacing */
}

void fb_text(int x, int y, uint32_t color, const char *str) {
    while (*str) {
        x += fb_char(x, y, color, *str);
        if (x >= FB_WIDTH) break;
        str++;
    }
}

/* ---- Blit ---- */

void fb_blit(int src_x, int src_y, int dst_x, int dst_y, int w, int h) {
    /* Copy bottom-to-top to handle overlapping regions */
    for (int row = h - 1; row >= 0; row--) {
        for (int col = 0; col < w; col++) {
            int sx = src_x + col;
            int sy = src_y + row;
            int dx = dst_x + col;
            int dy = dst_y + row;
            if (sx >= 0 && sx < FB_WIDTH && sy >= 0 && sy < FB_HEIGHT &&
                dx >= 0 && dx < FB_WIDTH && dy >= 0 && dy < FB_HEIGHT) {
                fb[dy * FB_WIDTH + dx] = fb[sy * FB_WIDTH + sx];
            }
        }
    }
}

/* ---- Scroll ---- */

void fb_scroll(int pixels) {
    if (pixels <= 0) return;
    if (pixels >= FB_HEIGHT) {
        fb_init(); /* clear everything */
        return;
    }
    /* Copy rows [pixels..255] up to [0..255-pixels] */
    for (int row = 0; row < FB_HEIGHT - pixels; row++) {
        for (int col = 0; col < FB_WIDTH; col++) {
            fb[row * FB_WIDTH + col] = fb[(row + pixels) * FB_WIDTH + col];
        }
    }
    /* Clear bottom 'pixels' rows */
    for (int row = FB_HEIGHT - pixels; row < FB_HEIGHT; row++) {
        for (int col = 0; col < FB_WIDTH; col++) {
            fb[row * FB_WIDTH + col] = 0x000000FF; /* opaque black */
        }
    }
}

/* ---- Gradient ---- */

void fb_gradient_h(int x, int y, int w, int h, uint32_t color_left, uint32_t color_right) {
    /* Clip to framebuffer bounds */
    if (x < 0) { w += x; x = 0; }
    if (y < 0) { h += y; y = 0; }
    if (x + w > FB_WIDTH) w = FB_WIDTH - x;
    if (y + h > FB_HEIGHT) h = FB_HEIGHT - y;
    if (w <= 0 || h <= 0) return;

    for (int col = 0; col < w; col++) {
        int factor = (w > 1) ? (col * 255 / (w - 1)) : 0;
        uint32_t c = fb_blend(color_left, color_right, factor);
        for (int row = 0; row < h; row++) {
            fb[(y + row) * FB_WIDTH + (x + col)] = c;
        }
    }
}

void fb_gradient_v(int x, int y, int w, int h, uint32_t color_top, uint32_t color_bottom) {
    /* Clip to framebuffer bounds */
    if (x < 0) { w += x; x = 0; }
    if (y < 0) { h += y; y = 0; }
    if (x + w > FB_WIDTH) w = FB_WIDTH - x;
    if (y + h > FB_HEIGHT) h = FB_HEIGHT - y;
    if (w <= 0 || h <= 0) return;

    for (int row = 0; row < h; row++) {
        int factor = (h > 1) ? (row * 255 / (h - 1)) : 0;
        uint32_t c = fb_blend(color_top, color_bottom, factor);
        for (int col = 0; col < w; col++) {
            fb[(y + row) * FB_WIDTH + (x + col)] = c;
        }
    }
}

/* ---- Present ---- */

void fb_present(void) {
    *(volatile uint32_t *)FB_CONTROL = 1;
}
