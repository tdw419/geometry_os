/*
 * life32.c -- Conway's Game of Life, 32x32 grid in a 128x256 framebuffer region.
 *
 * Designed for the Layer 2 split-screen demo (right half of screen).
 * Each cell is a 4x4 pixel block. 32x32 grid fills 128x128 of the 128x256
 * region. The top half shows the life grid; bottom half is dark.
 *
 * Uses geos_request_region() to claim the right half, then renders only
 * within that region. The kernel's clip rect enforces isolation.
 *
 * Run mode: infinite loop with geos_wait_ms() pacing (~3 generations/sec).
 * In split-screen mode the kernel's timer preempts this program.
 *
 * Build:
 *   riscv64-linux-gnu-gcc -march=rv32imac_zicsr -mabi=ilp32 -nostdlib \
 *       -nostartfiles -fno-pic -O2 -static -no-pie -mcmodel=medany \
 *       -Wl,--defsym,BASE_ADDR=0x80050000 -T guest.ld \
 *       -Wl,--no-dynamic-linker -Wl,-e,_start -Wl,--gc-sections \
 *       -o life32.elf guest_crt0.S life32.c -L. -lgeos
 */

#include "libgeos.h"

/* Grid dimensions and cell block size */
#define GRID_W         32
#define GRID_H         32
#define CELL_PX        4    /* pixels per cell block */
#define REGION_X       128  /* right half */
#define REGION_Y       0
#define REGION_W       128
#define REGION_H       256

/* BSS-allocated grids (32x32 bits = 128 bytes each) */
static uint8_t grid_a[(GRID_W * GRID_H + 7) / 8];
static uint8_t grid_b[(GRID_W * GRID_H + 7) / 8];

/* ---- Bit-grid access ---- */

static inline int cell_get(uint8_t *grid, uint32_t x, uint32_t y) {
    x &= (GRID_W - 1);   /* power-of-2 wrap */
    y &= (GRID_H - 1);
    uint32_t idx = y * GRID_W + x;
    return (grid[idx >> 3] >> (7 - (idx & 7))) & 1;
}

static inline void cell_set(uint8_t *grid, uint32_t x, uint32_t y, int val) {
    x &= (GRID_W - 1);
    y &= (GRID_H - 1);
    uint32_t idx = y * GRID_W + x;
    uint32_t byte_idx = idx >> 3;
    uint32_t bit = 7 - (idx & 7);
    if (val)
        grid[byte_idx] |= (1u << bit);
    else
        grid[byte_idx] &= ~(1u << bit);
}

/* ---- PRNG ---- */

static uint32_t rng_state = 0xCAFECAFEu;

static uint32_t xorshift32(void) {
    uint32_t x = rng_state;
    x ^= x << 13;
    x ^= x >> 17;
    x ^= x << 5;
    rng_state = x;
    return x;
}

/* ---- Seed with random pattern in center ---- */

static void seed_grid(uint8_t *grid) {
    /* Fill center 16x16 area (~25% density) */
    uint32_t ox = 8, oy = 8;
    for (uint32_t y = 0; y < 16; y++) {
        for (uint32_t x = 0; x < 16; x++) {
            int alive = (xorshift32() % 5) < 2;
            cell_set(grid, ox + x, oy + y, alive);
        }
    }
    /* Add a glider gun seed for guaranteed activity */
    /* Gosper glider gun (standard pattern, top-left corner at 2,2) */
    static const uint8_t gun[] = {
        /* (x, y) pairs relative to origin */
        0,4, 0,5, 1,4, 1,5,                     /* block */
        10,4, 10,5, 10,6, 11,3, 11,7, 12,2, 12,8, 13,2, 13,8,
        14,5, 15,3, 15,7, 16,4, 16,5, 16,6, 17,5, /* left ship */
        20,2, 20,3, 20,4, 21,2, 21,3, 21,4, 22,1, 22,5, /* right ship */
        24,0, 24,1, 24,5, 24,6,
        34,2, 34,3, 35,2, 35,3,                     /* block */
    };
    uint32_t gx = 2, gy = 2;
    for (uint32_t i = 0; i < sizeof(gun); i += 2) {
        cell_set(grid, gx + gun[i], gy + gun[i + 1], 1);
    }
}

/* ---- Render grid to framebuffer ---- */

static void render_grid(uint8_t *grid) {
    uint32_t gy, gx, px, py;
    for (gy = 0; gy < GRID_H; gy++) {
        for (gx = 0; gx < GRID_W; gx++) {
            int alive = cell_get(grid, gx, gy);
            uint32_t color;
            if (alive) {
                /* Green-cyan gradient based on position */
                uint8_t r = (uint8_t)(20 + (gx * 60) / GRID_W);
                uint8_t g = (uint8_t)(180 + (gy * 75) / GRID_H);
                uint8_t b = (uint8_t)(100 + (gx * 100) / GRID_W);
                color = geos_rgb(r, g, b);
            } else {
                color = geos_rgb(6, 6, 12);
            }
            /* Fill CELL_Px x CELL_PX block */
            uint32_t base_x = REGION_X + gx * CELL_PX;
            uint32_t base_y = REGION_Y + gy * CELL_PX;
            for (py = 0; py < CELL_PX; py++) {
                for (px = 0; px < CELL_PX; px++) {
                    geos_fb_pixel(base_x + px, base_y + py, color);
                }
            }
        }
    }
    geos_fb_present();
}

/* ---- Compute one generation ---- */

static void compute_generation(uint8_t *src, uint8_t *dst) {
    uint32_t y, x;
    for (y = 0; y < GRID_H; y++) {
        for (x = 0; x < GRID_W; x++) {
            int n = 0;
            int dy, dx;
            for (dy = -1; dy <= 1; dy++) {
                for (dx = -1; dx <= 1; dx++) {
                    if (dx == 0 && dy == 0) continue;
                    n += cell_get(src, (uint32_t)(x + dx), (uint32_t)(y + dy));
                }
            }
            int alive = cell_get(src, x, y);
            if (alive)
                cell_set(dst, x, y, (n == 2 || n == 3) ? 1 : 0);
            else
                cell_set(dst, x, y, (n == 3) ? 1 : 0);
        }
    }
}

/* ---- Entry point ---- */

void c_start(void) {
    uint8_t *cur = grid_a;
    uint8_t *nxt = grid_b;

    geos_puts("[life32] 32x32 Conway's Life in 128x256 region\n");

    /* Claim our region (right half) */
    geos_request_region(REGION_X, REGION_Y, REGION_W, REGION_H);

    /* Clear our region to dark background */
    for (uint32_t y = 0; y < REGION_H; y++) {
        for (uint32_t x = REGION_X; x < REGION_X + REGION_W; x++) {
            geos_fb_pixel(x, y, geos_rgb(6, 6, 12));
        }
    }
    geos_fb_present();

    /* Seed and render generation 0 */
    seed_grid(cur);
    render_grid(cur);
    geos_puts("[life32] gen 0 rendered\n");

    /* Run forever (~3 generations per second) */
    for (uint32_t gen = 1; ; gen++) {
        compute_generation(cur, nxt);
        render_grid(nxt);

        uint8_t *tmp = cur;
        cur = nxt;
        nxt = tmp;

        /* Pace: ~3 gens/sec at 52 MIPS */
        geos_wait_ms(333);

        /* Print status every 50 generations */
        if ((gen & 0x3F) == 0) {
            geos_puts("[life32] gen ");
            geos_put_dec(gen);
            geos_puts("\n");
        }
    }
}
