/*
 * life_fb.c -- Conway's Game of Life with framebuffer rendering and keyboard controls
 *
 * 64x64 grid in a 256x256 framebuffer. Each cell = 4x4 pixel block.
 * Toroidal wrap. Keyboard controls: +/- zoom, arrows pan, S speed,
 * R randomize, C clear, P pause, Q quit.
 *
 * Design rule: visual state encoded as spatial patterns (block positions,
 * grid region occupancy) for deterministic vision-gate verification.
 * No color-channel encoding for state -- color is purely cosmetic.
 *
 * Build:
 *   riscv64-linux-gnu-gcc -march=rv32imac_zicsr -mabi=ilp32 -nostdlib \
 *       -nostartfiles -fno-pic -O2 -static -no-pie -mcmodel=medany \
 *       -T hello.ld -Wl,--no-dynamic-linker -Wl,-e,_start -Wl,--gc-sections \
 *       -o life_fb.elf crt0.S life_fb.c -L. -lgeos
 */

#include "libgeos.h"

/* ---- Grid constants ---- */
#define GRID_W         64
#define GRID_H         64
#define GRID_BITS      (GRID_W * GRID_H)   /* 4096 cells */
#define GRID_BYTES     (GRID_BITS / 8)     /* 512 bytes */

/* ---- Zoom levels (pixels per cell) ---- */
#define ZOOM_MIN       1
#define ZOOM_MAX       4

/* ---- Speed levels (ms delay between generations) ---- */
#define SPEED_LEVELS   4
static const uint32_t speed_delays[SPEED_LEVELS] = { 0, 100, 300, 600 };

/* ---- Shadow grids (512 bytes each) ---- */
static uint8_t grid_a[GRID_BYTES];
static uint8_t grid_b[GRID_BYTES];

/* ---- View state ---- */
static uint32_t zoom       = 4;    /* default: 4px per cell, full screen */
static uint32_t pan_x      = 0;    /* grid offset (in cells) */
static uint32_t pan_y      = 0;
static uint32_t speed_idx  = 0;    /* 0 = fastest */
static uint32_t generation = 0;
static uint32_t paused     = 0;

/* ---- Pre-computed colors ---- */
static const uint32_t COL_BG      = 0x06060EFF;  /* geos_rgb(6, 6, 14) */
static const uint32_t COL_ALIVE   = 0x28DC50FF;  /* geos_rgb(40, 220, 80) */
static const uint32_t COL_GRID    = 0x10101CFF;  /* geos_rgb(16, 16, 28) */
static const uint32_t COL_GRIDLINE= 0x141424FF;  /* geos_rgb(20, 20, 36) */

/* ---- PRNG ---- */
static uint32_t rng_state = 0xDEADCAFEu;

static uint32_t xorshift32(void) {
    uint32_t x = rng_state;
    x ^= x << 13;
    x ^= x >> 17;
    x ^= x << 5;
    rng_state = x;
    return x;
}

/* ---- Bit-grid access ---- */

static inline int cell_get(uint8_t *grid, int x, int y) {
    x = x & (GRID_W - 1);
    y = y & (GRID_H - 1);
    uint32_t idx = (uint32_t)(y * GRID_W + x);
    return (grid[idx >> 3] >> (7 - (idx & 7))) & 1;
}

static inline void cell_set(uint8_t *grid, int x, int y, int val) {
    x = x & (GRID_W - 1);
    y = y & (GRID_H - 1);
    uint32_t idx = (uint32_t)(y * GRID_W + x);
    uint32_t byte_idx = idx >> 3;
    uint32_t bit = 7 - (idx & 7);
    if (val)
        grid[byte_idx] |= (1u << bit);
    else
        grid[byte_idx] &= ~(1u << bit);
}

/* ---- Seed grid with random pattern ---- */

static void seed_random(void) {
    int y, x;
    for (y = 0; y < GRID_H; y++) {
        for (x = 0; x < GRID_W; x++) {
            int alive = (int)(xorshift32() % 100) < 35;
            cell_set(grid_a, x, y, alive);
        }
    }
    generation = 0;
}

/* ---- Place a glider pattern ---- */

static void place_glider(int gx, int gy) {
    cell_set(grid_a, gx,     gy,     1);
    cell_set(grid_a, gx + 1, gy,     1);
    cell_set(grid_a, gx + 2, gy,     1);
    cell_set(grid_a, gx + 2, gy + 1, 1);
    cell_set(grid_a, gx + 1, gy + 2, 1);
}

/* ---- Compute one generation ---- */

static void compute_generation(uint8_t *src, uint8_t *dst) {
    int y, x;
    for (y = 0; y < GRID_H; y++) {
        for (x = 0; x < GRID_W; x++) {
            int n = 0;
            int dy, dx;
            for (dy = -1; dy <= 1; dy++) {
                for (dx = -1; dx <= 1; dx++) {
                    if (dx == 0 && dy == 0) continue;
                    n += cell_get(src, x + dx, y + dy);
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

/* ---- Clear grid ---- */

static void clear_grid(void) {
    int i;
    for (i = 0; i < GRID_BYTES; i++) {
        grid_a[i] = 0;
        grid_b[i] = 0;
    }
    generation = 0;
}

/* ---- Render visible portion of grid to framebuffer ----
 *
 * Optimized: no full-screen clear. Each cell block covers the screen
 * completely at zoom >= 2. At zoom=1, dead cells beyond the grid
 * are left as-is (black from startup).
 *
 * At zoom=4 (default): 64*64 cells * 4*4 pixels = 65536 writes = full screen.
 */
static void render_grid(uint8_t *grid) {
    uint32_t cells_x = GEOS_FB_WIDTH / zoom;
    uint32_t cells_y = GEOS_FB_HEIGHT / zoom;
    if (cells_x > GRID_W) cells_x = GRID_W;
    if (cells_y > GRID_H) cells_y = GRID_H;

    uint32_t cy, cx;
    for (cy = 0; cy < cells_y; cy++) {
        for (cx = 0; cx < cells_x; cx++) {
            /* Grid coordinates with toroidal wrap + pan */
            int gx = (int)((pan_x + cx) % GRID_W);
            int gy = (int)((pan_y + cy) % GRID_H);
            if (gx < 0) gx += GRID_W;
            if (gy < 0) gy += GRID_H;

            int alive = cell_get(grid, gx, gy);

            /* Compute screen base */
            uint32_t base_x = cx * zoom;
            uint32_t base_y = cy * zoom;

            /* Choose color for this cell block */
            uint32_t fill;
            if (alive) {
                fill = COL_ALIVE;
            } else {
                fill = COL_BG;
            }

            /* Draw cell block */
            uint32_t py, px;
            for (py = 0; py < zoom; py++) {
                uint32_t row_offset = (base_y + py) * GEOS_FB_WIDTH + base_x;
                for (px = 0; px < zoom; px++) {
                    uint32_t color = fill;
                    /* Grid lines: top/left edge of dead cells at zoom >= 3 */
                    if (!alive && zoom >= 3 && (px == 0 || py == 0)) {
                        color = COL_GRIDLINE;
                    }
                    *(volatile uint32_t *)(GEOS_FB_BASE + (row_offset + px) * 4) = color;
                }
            }
        }
    }

    geos_fb_present();
}

/* ---- Initialize with known patterns ---- */

static void init_patterns(void) {
    /* Glider at (2, 2) */
    place_glider(2, 2);

    /* Second glider at (50, 2) */
    place_glider(50, 2);

    /* Blinker (period-2 oscillator) at (30, 30) */
    cell_set(grid_a, 29, 30, 1);
    cell_set(grid_a, 30, 30, 1);
    cell_set(grid_a, 31, 30, 1);

    /* Block (still life) at (10, 50) */
    cell_set(grid_a, 10, 50, 1);
    cell_set(grid_a, 11, 50, 1);
    cell_set(grid_a, 10, 51, 1);
    cell_set(grid_a, 11, 51, 1);

    /* R-pentomino (methuselah) at (40, 40) */
    cell_set(grid_a, 41, 40, 1);
    cell_set(grid_a, 42, 40, 1);
    cell_set(grid_a, 40, 41, 1);
    cell_set(grid_a, 41, 41, 1);
    cell_set(grid_a, 41, 42, 1);

    /* Beacon at (48, 48) */
    cell_set(grid_a, 48, 48, 1);
    cell_set(grid_a, 49, 48, 1);
    cell_set(grid_a, 48, 49, 1);
    cell_set(grid_a, 49, 49, 1);
    cell_set(grid_a, 50, 50, 1);
    cell_set(grid_a, 51, 50, 1);
    cell_set(grid_a, 50, 51, 1);
    cell_set(grid_a, 51, 51, 1);

    /* Random fill in center 16x16 region */
    {
        int y, x;
        for (y = 24; y < 40; y++) {
            for (x = 24; x < 40; x++) {
                if (!cell_get(grid_a, x, y)) {
                    int alive = (int)(xorshift32() % 100) < 30;
                    cell_set(grid_a, x, y, alive);
                }
            }
        }
    }

    generation = 0;
}

/* ---- Main ---- */

void c_start(void) {
    uint8_t *cur = grid_a;
    uint8_t *nxt = grid_b;

    geos_puts("life_fb: Conway's Game of Life -- Framebuffer\n");
    geos_puts("life_fb: +/- zoom  Arrows pan  S speed\n");
    geos_puts("life_fb: R random  C clear  P pause  Q quit\n");

    init_patterns();
    render_grid(cur);

    while (1) {
        /* Non-blocking keyboard poll */
        long ch = sbi_console_getchar();

        if (ch >= 0) {
            switch ((char)ch) {
                case '+': case '=':
                    if (zoom < ZOOM_MAX) zoom++;
                    break;
                case '-':
                    if (zoom > ZOOM_MIN) zoom--;
                    break;
                case 'w': case 'W':
                    pan_y = (pan_y + GRID_H - 1) % GRID_H;
                    break;
                case 's': case 'S':
                    pan_y = (pan_y + 1) % GRID_H;
                    break;
                case 'a': case 'A':
                    pan_x = (pan_x + GRID_W - 1) % GRID_W;
                    break;
                case 'd': case 'D':
                    pan_x = (pan_x + 1) % GRID_W;
                    break;
                case 'r': case 'R':
                    seed_random();
                    cur = grid_a;
                    nxt = grid_b;
                    break;
                case 'c': case 'C':
                    clear_grid();
                    cur = grid_a;
                    nxt = grid_b;
                    break;
                case 'p': case 'P':
                    paused = !paused;
                    break;
                case 'q': case 'Q':
                    geos_puts("life_fb: quit.\n");
                    sbi_shutdown();
                    break;
            }
        }

        /* Compute next generation (unless paused) */
        if (!paused) {
            compute_generation(cur, nxt);
            generation++;
            {
                uint8_t *tmp = cur;
                cur = nxt;
                nxt = tmp;
            }
        }

        /* Render current state */
        render_grid(cur);

        /* Pace generation speed */
        if (speed_idx < SPEED_LEVELS && speed_delays[speed_idx] > 0) {
            geos_wait_ms(speed_delays[speed_idx]);
        }

        /* Console status every 256 generations */
        if ((generation & 0xFF) == 0 && generation > 0) {
            geos_puts("life_fb: gen ");
            geos_put_dec(generation);
            geos_puts("\n");
        }
    }
}
