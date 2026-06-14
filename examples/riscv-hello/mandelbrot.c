/*
 * mandelbrot.c -- Interactive Mandelbrot fractal explorer for Geometry OS
 *
 * Fixed-point Q16.16 arithmetic, 256x256 framebuffer.
 * Zoom and pan with keyboard controls.
 *
 * Controls:
 *   +/-      Zoom in / out
 *   WASD     Pan
 *   R        Reset view
 *   Q        Quit
 *
 * Build:  ./build.sh mandelbrot.c
 * Boot:   hypervisor_boot arch=riscv32 kernel=mandelbrot.elf ram=1
 *
 * Vision-gate: recognizable Mandelbrot shape with cardioid, bulb,
 * filaments encoded as spatial pixel-intensity patterns.
 */

#include "libfb.h"
#include "libgeos.h"

/* ---- Fixed-point arithmetic (Q16.16) ---- */

#define FP(x)    ((int32_t)((x) << 16))
#define FP_HALF  (FP(1) / 2)
#define FP_TWO   (FP(2))
#define FP_FOUR  (FP(4))

static inline int32_t fp_mul(int32_t a, int32_t b) {
    /* 64-bit intermediate; RV32IM has MUL/MULH so this is efficient */
    int64_t r = ((int64_t)a * (int64_t)b) >> 16;
    return (int32_t)r;
}

static inline int32_t fp_mul_int(int32_t fp_val, int32_t n) {
    return (int32_t)(((int64_t)fp_val * (int64_t)n));
}

static inline int32_t fp_div_by_int(int32_t fp_val, int32_t denom) {
    return (int32_t)(((int64_t)fp_val) / ((int64_t)denom));
}

/* ---- View state ---- */

static int32_t view_cx;    /* center real (Q16.16) */
static int32_t view_cy;    /* center imaginary (Q16.16) */
static int32_t view_span;  /* view width in complex plane (Q16.16) */
#define MAX_ITER 64

/* ---- Color palette (iteration -> RGB) ---- */

static uint32_t iter_color(int iter) {
    if (iter >= MAX_ITER) {
        return fb_rgb(0, 0, 0);   /* Inside set: black */
    }
    int t = (iter * 255) / MAX_ITER;
    uint8_t r, g, b;
    if (t < 64) {
        /* Phase 1: black -> dark blue */
        r = 0; g = 0; b = (uint8_t)(t * 4);
    } else if (t < 128) {
        /* Phase 2: dark blue -> cyan */
        int s = t - 64;
        r = 0; g = (uint8_t)(s * 4); b = 255;
    } else if (t < 192) {
        /* Phase 3: cyan -> white */
        int s = t - 128;
        r = (uint8_t)(s * 4); g = 255; b = 255;
    } else {
        /* Phase 4: white -> warm white */
        int s = t - 192;
        r = 255; g = 255; b = (uint8_t)(255 - s * 2);
    }
    return fb_rgb(r, g, b);
}

/* ---- Render the full Mandelbrot set ---- */

static void render_mandelbrot(void) {
    int32_t x_scale = fp_div_by_int(view_span, FB_WIDTH);
    int32_t y_scale = x_scale;  /* square pixels */
    int32_t x0_start = view_cx - fp_mul_int(x_scale, FB_WIDTH >> 1);
    int32_t y0_start = view_cy - fp_mul_int(y_scale, FB_HEIGHT >> 1);

    for (int py = 0; py < FB_HEIGHT; py++) {
        int32_t ci = y0_start + fp_mul_int(y_scale, py);
        int32_t y_offset = py * FB_WIDTH;
        for (int px = 0; px < FB_WIDTH; px++) {
            int32_t cr = x0_start + fp_mul_int(x_scale, px);
            int32_t zr = 0, zi = 0;
            int iter = 0;
            while (iter < MAX_ITER) {
                int32_t zr2 = fp_mul(zr, zr);
                int32_t zi2 = fp_mul(zi, zi);
                if (zr2 + zi2 > FP_FOUR) break;
                int32_t new_zi = fp_mul(FP_TWO, fp_mul(zr, zi)) + ci;
                int32_t new_zr = zr2 - zi2 + cr;
                zi = new_zi;
                zr = new_zr;
                iter++;
            }
            *(volatile uint32_t *)(FB_BASE + (y_offset + px) * 4) =
                iter_color(iter);
        }
    }
}

/* ---- HUD helpers ---- */

/*
 * Draw a signed fixed-point number as "SIII.FFF" on the framebuffer.
 * Uses 8x8 font via geos_draw_char. Returns new x position.
 * Shows integer part (up to 4 digits) + '.' + 3 fractional digits.
 */
static int draw_fp(int x, int y, int32_t val, uint32_t fg) {
    int neg = 0;
    if (val < 0) {
        neg = 1;
        val = -val;
    }

    int int_part = val >> 16;
    int frac_part = ((val & 0xFFFF) * 1000) >> 16;
    if (frac_part > 999) frac_part = 999;

    /* Draw sign */
    if (neg) {
        geos_draw_char(x, y, '-', fg, 0);
        x += 8;
    }

    /* Draw integer part (up to 4 digits, reversed) */
    char digits[5];
    int nd = 0;
    if (int_part == 0) {
        digits[nd++] = '0';
    } else {
        while (int_part > 0 && nd < 4) {
            digits[nd++] = '0' + (int_part % 10);
            int_part /= 10;
        }
    }
    for (int i = nd - 1; i >= 0; i--) {
        geos_draw_char(x, y, digits[i], fg, 0);
        x += 8;
    }

    /* Decimal point */
    geos_draw_char(x, y, '.', fg, 0);
    x += 8;

    /* 3 fractional digits */
    geos_draw_char(x, y, '0' + (frac_part / 100) % 10, fg, 0); x += 8;
    geos_draw_char(x, y, '0' + (frac_part / 10) % 10, fg, 0); x += 8;
    geos_draw_char(x, y, '0' + frac_part % 10, fg, 0); x += 8;

    return x;
}

/* Draw the HUD overlay at the bottom of the screen */
static void draw_hud(void) {
    uint32_t fg = fb_rgb(255, 255, 255);
    uint32_t dim = fb_rgb(180, 180, 180);

    /* Background bar */
    fb_rect(0, FB_HEIGHT - 16, FB_WIDTH, 16, 0x000000AA);

    /* Line 1: C:(<real>,<imag>) S:<span> */
    int x = 2;
    geos_draw_string(x, FB_HEIGHT - 16, "C:(", fg, 0);
    x += 24;
    x = draw_fp(x, FB_HEIGHT - 16, view_cx, fg);
    geos_draw_char(x, FB_HEIGHT - 16, ',', fg, 0);
    x += 8;
    x = draw_fp(x, FB_HEIGHT - 16, view_cy, fg);
    geos_draw_char(x, FB_HEIGHT - 16, ')', fg, 0);
    x += 8;
    geos_draw_string(x, FB_HEIGHT - 16, " S:", fg, 0);
    x += 16;
    draw_fp(x, FB_HEIGHT - 16, view_span, fg);

    /* Line 2: help text */
    geos_draw_string(2, FB_HEIGHT - 8,
                     "+/-:zoom WASD:pan R:reset Q:quit", dim, 0);
}

/* ---- Reset to default view ---- */

static void reset_view(void) {
    view_cx = FP(-1);      /* center at (-1, 0) shows full set */
    view_cy = FP(0);
    view_span = FP(3);     /* 3.0 units wide */
}

/* ---- Main ---- */

void c_start(void) {
    geos_puts("mandelbrot: Interactive Mandelbrot Explorer\n");
    geos_puts("mandelbrot: Q16.16 fixed-point, ");
    geos_put_dec(MAX_ITER);
    geos_puts(" max iterations\n");
    geos_puts("Controls: +/- zoom, WASD pan, R reset, Q quit\n\n");

    fb_init();
    reset_view();

    /* Initial render */
    geos_puts("mandelbrot: rendering initial view...\n");
    render_mandelbrot();
    draw_hud();
    fb_present();
    geos_puts("mandelbrot: ready.\n");

    /* Interactive loop */
    while (1) {
        char ch = geos_getchar();
        int changed = 0;
        int32_t pan_amt;

        switch (ch) {
        case '+': case '=':
            /* Zoom in: halve the span */
            view_span >>= 1;  /* exact halving in Q16.16 */
            if (view_span < FP(1) / 64) view_span = FP(1) / 64;
            changed = 1;
            geos_puts("zoom in\n");
            break;

        case '-': case '_':
            /* Zoom out: double the span */
            view_span <<= 1;
            if (view_span > FP(16)) view_span = FP(16);
            changed = 1;
            geos_puts("zoom out\n");
            break;

        case 'w': case 'W':
            /* Pan up: decrease center imaginary */
            pan_amt = fp_div_by_int(view_span, 8);
            view_cy -= pan_amt;
            changed = 1;
            geos_puts("pan up\n");
            break;

        case 's': case 'S':
            /* Pan down: increase center imaginary */
            pan_amt = fp_div_by_int(view_span, 8);
            view_cy += pan_amt;
            changed = 1;
            geos_puts("pan down\n");
            break;

        case 'a': case 'A':
            /* Pan left: decrease center real */
            pan_amt = fp_div_by_int(view_span, 8);
            view_cx -= pan_amt;
            changed = 1;
            geos_puts("pan left\n");
            break;

        case 'd': case 'D':
            /* Pan right: increase center real */
            pan_amt = fp_div_by_int(view_span, 8);
            view_cx += pan_amt;
            changed = 1;
            geos_puts("pan right\n");
            break;

        case 'r': case 'R':
            reset_view();
            changed = 1;
            geos_puts("reset view\n");
            break;

        case 'q': case 'Q':
            geos_puts("mandelbrot: quitting.\n");
            sbi_shutdown();
            break;
        }

        if (changed) {
            render_mandelbrot();
            draw_hud();
            fb_present();
        }
    }
}
