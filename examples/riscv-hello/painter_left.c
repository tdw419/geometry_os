/*
 * painter_left.c -- Animated painter for the LEFT half of split-screen demo
 *
 * Continuously renders an animated scene in the left 128x256 region:
 *   - Time-varying gradient background
 *   - Bouncing colored ball
 *   - Animated horizontal stripes
 *
 * Designed as guest A for the Layer 2 kernel (geos_kern.c).
 * The kernel's clip rect enforces that writes stay in the left half.
 *
 * Build (via build_kern.sh):
 *   riscv64-linux-gnu-gcc -march=rv32imac_zicsr -mabi=ilp32 -nostdlib \
 *       -nostartfiles -fno-pic -O2 -static -no-pie -mcmodel=medany \
 *       -Wl,--defsym,BASE_ADDR=0x80010000 -T guest.ld \
 *       -Wl,--no-dynamic-linker -Wl,-e,_start -Wl,--gc-sections \
 *       -o painter_left.elf guest_crt0.S painter_left.c -L. -lgeos
 */

#include "libgeos.h"

/* Region: left half of 256x256 framebuffer */
#define REGION_X       0
#define REGION_Y       0
#define REGION_W       128
#define REGION_H       256

/* Ball state */
static int32_t ball_x = 30;
static int32_t ball_y = 60;
static int32_t ball_vx = 2;
static int32_t ball_vy = 3;
#define BALL_R        8

/* Simple LCG PRNG */
static uint32_t rng = 0xDEADBEEFu;

static uint32_t rand_next(void) {
    rng = rng * 1664525u + 1013904223u;
    return rng;
}

/*
 * Fill the left-half region with a time-varying gradient.
 * Each frame shifts the color phase based on the frame counter.
 */
static void draw_gradient(uint32_t frame) {
    for (uint32_t y = 0; y < REGION_H; y++) {
        for (uint32_t x = 0; x < REGION_W; x++) {
            uint8_t r = (uint8_t)((x * 100 + frame * 2) & 0xFF);
            uint8_t g = (uint8_t)((y * 80 + frame) & 0xFF);
            uint8_t b = (uint8_t)(40 + ((x + y + frame) * 60) / (REGION_W + REGION_H));
            geos_fb_pixel(x, y, geos_rgb(r, g, b));
        }
    }
}

/*
 * Draw animated horizontal stripes that scroll over time.
 * Uses the region's width so it stays in the left half.
 */
static void draw_stripes(uint32_t frame) {
    uint32_t stripe_h = 16;
    uint32_t offset = (frame * 2) % (stripe_h * 2);
    for (uint32_t y = offset; y < REGION_H; y += stripe_h * 2) {
        for (uint32_t x = 0; x < REGION_W; x++) {
            /* Semi-transparent stripes: blend with existing content */
            uint32_t existing = geos_fb_read(x, y);
            uint8_t er = (uint8_t)(existing >> 24);
            uint8_t eg = (uint8_t)(existing >> 16);
            uint8_t eb = (uint8_t)(existing >> 8);
            /* Stripe color: warm orange, 50% blend */
            er = (uint8_t)((er + 200) / 2);
            eg = (uint8_t)((eg + 100) / 2);
            eb = (uint8_t)((eb + 30) / 2);
            geos_fb_pixel(x, y, geos_rgb(er, eg, eb));
        }
    }
}

/*
 * Draw a filled circle (the bouncing ball).
 * Only writes pixels within the ball radius.
 */
static void draw_ball(void) {
    /* Color based on ball velocity direction */
    uint8_t r = (ball_vx > 0) ? 255 : 100;
    uint8_t g = 180;
    uint8_t b = (ball_vy > 0) ? 255 : 80;
    uint32_t color = geos_rgb(r, g, b);

    for (int32_t dy = -BALL_R; dy <= BALL_R; dy++) {
        for (int32_t dx = -BALL_R; dx <= BALL_R; dx++) {
            if (dx * dx + dy * dy <= BALL_R * BALL_R) {
                uint32_t px = (uint32_t)(ball_x + dx);
                uint32_t py = (uint32_t)(ball_y + dy);
                if (px < REGION_W && py < REGION_H) {
                    geos_fb_pixel(px, py, color);
                }
            }
        }
    }
}

/*
 * Update ball position and bounce off region walls.
 */
static void update_ball(void) {
    ball_x += ball_vx;
    ball_y += ball_vy;

    /* Bounce off left/right walls (0 to REGION_W-1) */
    if (ball_x - BALL_R < 0) {
        ball_x = BALL_R;
        ball_vx = -ball_vx;
    }
    if (ball_x + BALL_R >= REGION_W) {
        ball_x = REGION_W - 1 - BALL_R;
        ball_vx = -ball_vx;
    }

    /* Bounce off top/bottom walls (0 to REGION_H-1) */
    if (ball_y - BALL_R < 0) {
        ball_y = BALL_R;
        ball_vy = -ball_vy;
    }
    if (ball_y + BALL_R >= REGION_H) {
        ball_y = REGION_H - 1 - BALL_R;
        ball_vy = -ball_vy;
    }
}

/*
 * Draw a small "PAINTER" label at the top of the region.
 * Uses simple 3x5 pixel font for each character.
 */
static void draw_label(void) {
    /* 3x5 pixel font for "PAINTER" */
    static const uint8_t font[][5] = {
        /* P */ {0x7, 0x5, 0x7, 0x4, 0x4},
        /* A */ {0x2, 0x5, 0x7, 0x5, 0x5},
        /* I */ {0x7, 0x2, 0x2, 0x2, 0x7},
        /* N */ {0x5, 0x7, 0x7, 0x5, 0x5},
        /* T */ {0x7, 0x2, 0x2, 0x2, 0x2},
        /* E */ {0x7, 0x4, 0x6, 0x4, 0x7},
        /* R */ {0x6, 0x5, 0x6, 0x5, 0x5},
    };
    const char *label = "PAINTER";
    uint32_t start_x = 4;
    uint32_t start_y = 4;
    uint32_t color = geos_rgb(255, 255, 255);

    for (uint32_t ci = 0; label[ci]; ci++) {
        uint8_t ch = (uint8_t)(label[ci] - 'A');
        if (ch >= 26) continue;
        for (uint32_t row = 0; row < 5; row++) {
            uint8_t row_bits = font[ch][row];
            for (uint32_t col = 0; col < 3; col++) {
                if (row_bits & (4 >> col)) {
                    geos_fb_pixel(start_x + ci * 5 + col, start_y + row, color);
                }
            }
        }
    }
}

/* ---- Entry point ---- */

void c_start(void) {
    geos_puts("[painter] left-half animated painter started\n");

    /* Claim left half region */
    geos_request_region(REGION_X, REGION_Y, REGION_W, REGION_H);

    /* Initial fill */
    draw_gradient(0);
    draw_label();
    geos_fb_present();
    geos_puts("[painter] initial frame rendered\n");

    /* Main animation loop -- runs forever (kernel preempts via timer) */
    for (uint32_t frame = 1; ; frame++) {
        /* Draw animated background */
        draw_gradient(frame);

        /* Scrolling stripes overlay */
        draw_stripes(frame);

        /* Update and draw bouncing ball */
        update_ball();
        draw_ball();

        /* Re-draw label on top */
        draw_label();

        /* Present to host */
        geos_fb_present();

        /* Pace: ~15 fps at 52 MIPS */
        geos_wait_ms(66);

        /* Status every 100 frames */
        if ((frame & 0x7F) == 0) {
            geos_puts("[painter] frame ");
            geos_put_dec(frame);
            geos_puts("\n");
        }
    }
}
