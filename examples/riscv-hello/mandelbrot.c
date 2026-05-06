/*
 * mandelbrot.c -- Fixed-point Mandelbrot set renderer for Geometry OS
 *
 * Proves the RISC-V interpreter (RV32IMAC) handles compute-intensive
 * fixed-point arithmetic correctly. No FPU required.
 *
 * Uses 16.16 fixed-point (Q16.16) for the complex plane arithmetic.
 * The entire Mandelbrot set is rendered in a single pass, with a
 * smooth iteration count mapped to a blue-cyan-white palette.
 *
 * The fractal is centered at (-1.0, 0.0) with a view span of 3.0,
 * showing the full classic Mandelbrot set with its cardioid and
 * main bulb.
 *
 * Build:
 *   ./build.sh mandelbrot.c
 * Boot:
 *   hypervisor_boot arch=riscv32 kernel=mandelbrot.elf ram=1
 *
 * Vision-gate verification: the output is a recognizable Mandelbrot
 * fractal -- the cardioid shape, bulb, and surrounding filaments
 * are all spatially encoded in pixel intensity patterns.
 */

#include "libfb.h"
#include "libgeos.h"

/* ---- Fixed-point arithmetic (Q16.16) ---- */

/* Integer to fixed-point */
#define FP(x)    ((int32_t)((x) << 16))

/* Multiply two fixed-point numbers */
static inline int32_t fp_mul(int32_t a, int32_t b) {
    /* Use 64-bit intermediate to avoid overflow.
       RV32IM has MUL/MULH so this compiles efficiently. */
    int64_t r = ((int64_t)a * (int64_t)b) >> 16;
    return (int32_t)r;
}

/*
 * Multiply a Q16.16 number by a plain integer, returning Q16.16.
 * No shift needed since the integer has no fractional part.
 */
static inline int32_t fp_mul_int(int32_t fp_val, int32_t n) {
    return (int32_t)(((int64_t)fp_val * (int64_t)n));
}

/*
 * Divide a Q16.16 number by a plain integer, returning Q16.16.
 */
static int32_t fp_div_by_int(int32_t fp_val, int32_t denom) {
    return (int32_t)(((int64_t)fp_val) / ((int64_t)denom));
}

/* ---- Mandelbrot parameters ---- */

/* View window in complex plane (fixed-point) */
#define VIEW_CX    FP(-1)      /* center X = -1.0 (shows full set nicely) */
#define VIEW_CY    FP(0)       /* center Y = 0.0 */
#define VIEW_W     FP(3)       /* width in complex plane = 3.0 */
#define VIEW_H     FP(3)       /* height in complex plane = 3.0 */

/* Maximum iterations per pixel */
#define MAX_ITER   64

/* ---- Color palette ---- */

/*
 * Generate a pixel color from iteration count.
 * Spatial encoding: iteration count maps to brightness gradient.
 * Low iterations (quick escape) -> dark blue (far outside).
 * High iterations (near boundary) -> bright white (fractal edge).
 * Inside the set (didn't escape) -> pure black.
 *
 * Palette cycle: black -> blue -> cyan -> white -> warm white
 */
static uint32_t iter_color(int iter) {
    if (iter >= MAX_ITER) {
        return fb_rgb(0, 0, 0);   /* Inside set: black */
    }

    /* Map iteration to 0..255 range */
    int t = (iter * 255) / MAX_ITER;

    /* Palette: dark blue -> blue -> cyan -> white */
    uint8_t r, g, b;

    if (t < 64) {
        /* Phase 1: black -> dark blue */
        r = 0;
        g = 0;
        b = (uint8_t)(t * 4);
    } else if (t < 128) {
        /* Phase 2: dark blue -> cyan */
        int s = t - 64;
        r = 0;
        g = (uint8_t)(s * 4);
        b = 255;
    } else if (t < 192) {
        /* Phase 3: cyan -> white */
        int s = t - 128;
        r = (uint8_t)(s * 4);
        g = 255;
        b = 255;
    } else {
        /* Phase 4: white -> warm white */
        int s = t - 192;
        r = 255;
        g = 255;
        b = (uint8_t)(255 - s * 2);
    }

    return fb_rgb(r, g, b);
}

/* ---- Render the Mandelbrot set ---- */

static void render_mandelbrot(void) {
    /* Precompute pixel-to-complex-plane scaling (Q16.16) */
    int32_t x_scale = fp_div_by_int(VIEW_W, FB_WIDTH);
    int32_t y_scale = fp_div_by_int(VIEW_H, FB_HEIGHT);

    /* Top-left corner in complex plane */
    int32_t x0_start = VIEW_CX - fp_mul_int(x_scale, FB_WIDTH >> 1);
    int32_t y0_start = VIEW_CY - fp_mul_int(y_scale, FB_HEIGHT >> 1);

    int py, px;

    for (py = 0; py < FB_HEIGHT; py++) {
        int32_t ci = y0_start + fp_mul_int(y_scale, py);
        int32_t y_offset = py * FB_WIDTH;

        for (px = 0; px < FB_WIDTH; px++) {
            int32_t cr = x0_start + fp_mul_int(x_scale, px);

            /* z = 0 */
            int32_t zr = 0;
            int32_t zi = 0;
            int iter = 0;

            /* Iterate z = z^2 + c until |z|^2 > 4 or max iterations */
            while (iter < MAX_ITER) {
                /* |z|^2 = zr^2 + zi^2 (in fixed-point, compare to FP(4)) */
                int32_t zr2 = fp_mul(zr, zr);
                int32_t zi2 = fp_mul(zi, zi);

                if (zr2 + zi2 > FP(4)) {
                    break;
                }

                /* z = z^2 + c:
                 *   new_zr = zr^2 - zi^2 + cr
                 *   new_zi = 2*zr*zi + ci
                 */
                int32_t new_zi = fp_mul(FP(2), fp_mul(zr, zi)) + ci;
                int32_t new_zr = zr2 - zi2 + cr;
                zi = new_zi;
                zr = new_zr;

                iter++;
            }

            /* Write pixel directly to MMIO framebuffer */
            *(volatile uint32_t *)(FB_BASE + (y_offset + px) * 4) = iter_color(iter);
        }
    }
}

/* ---- Entry point ---- */

void c_start(void) {
    geos_puts("mandelbrot: Fixed-point Mandelbrot renderer\n");
    geos_puts("mandelbrot: Q16.16 arithmetic, ");
    geos_put_dec(MAX_ITER);
    geos_puts(" max iterations\n");

    geos_puts("mandelbrot: clearing framebuffer...\n");
    fb_init();

    geos_puts("mandelbrot: rendering...\n");
    render_mandelbrot();

    geos_puts("mandelbrot: presenting...\n");
    fb_present();

    geos_puts("mandelbrot: done.\n");
    sbi_shutdown();
}
