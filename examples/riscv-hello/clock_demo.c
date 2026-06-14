/*
 * Phase 240: clock_demo.c -- Animated digital clock using timer syscalls.
 *
 * Demonstrates:
 *   - geos_uptime() to read kernel boot time
 *   - geos_wait_ms() for frame-rate-controlled animation
 *   - geos_alarm_set() / geos_alarm_cancel() for async callback timer
 *
 * Display: a large "HH:MM:SS" digital clock centered on the 256x256 framebuffer,
 * with a blinking colon separator (toggles every 500ms via alarm callback).
 *
 * The uptime counter starts at 0 and counts real elapsed milliseconds since boot.
 * The clock display converts elapsed seconds into HH:MM:SS format.
 *
 * Build: ./build_clock_demo.sh
 * Run:   cargo run --example kern_verify -- examples/riscv-hello/geos_clock_demo.elf
 *
 * Note: guest_crt0.S defines _start and calls c_start().
 *       This file provides c_start() as the C entry point.
 */

#include "libgeos.h"
#include "libfb.h"

/* Colors */
#define COL_BG       0x001020u   /* dark navy background */
#define COL_DIGIT    0x00FF88u   /* green digits */
#define COL_COLON    0x00AA55u   /* dimmer green for colons */
#define COL_LABEL    0x006633u   /* muted green for label text */
#define COL_TITLE    0x00CCAAu   /* teal for title */
#define COL_BAR_BG   0x002218u   /* progress bar background */
#define COL_BAR_FG   0x00FF88u   /* progress bar foreground */

/* Layout */
#define DIGIT_W      24         /* width per digit (5 cols * ~5px scale) */
#define DIGIT_H      32         /* height per digit (3 rows * ~10px scale) */
#define DIGIT_GAP    4          /* gap between digits */
#define CLOCK_Y      80         /* Y position of clock digits */
#define CLOCK_X      32         /* X start of clock (6 digits + 2 colons) */
#define COLON_W      12         /* colon width */

/* Alarm ID for blink toggle */
static long blink_alarm = -1;
static volatile int colon_visible = 1;  /* toggled by alarm callback */

/*
 * Blink alarm callback -- fires every 500ms to toggle colon visibility.
 * Called by kernel via context modification (a0 = alarm_id).
 */
static void blink_callback(long alarm_id) {
    (void)alarm_id;
    colon_visible = !colon_visible;
    /* Re-arm: set another 500ms alarm */
    geos_alarm_set(500 * 52000, blink_callback);
}

/* ---- 3x5 pixel digit patterns (each digit is 5 columns wide, stored row-major) ---- */
static const uint8_t digit_patterns[10][15] = {
    /* 0 */ { 1,1,1, 1,0,1, 1,0,1, 1,0,1, 1,1,1 },
    /* 1 */ { 0,1,0, 1,1,0, 0,1,0, 0,1,0, 1,1,1 },
    /* 2 */ { 1,1,1, 0,0,1, 1,1,1, 1,0,0, 1,1,1 },
    /* 3 */ { 1,1,1, 0,0,1, 1,1,1, 0,0,1, 1,1,1 },
    /* 4 */ { 1,0,1, 1,0,1, 1,1,1, 0,0,1, 0,0,1 },
    /* 5 */ { 1,1,1, 1,0,0, 1,1,1, 0,0,1, 1,1,1 },
    /* 6 */ { 1,1,1, 1,0,0, 1,1,1, 1,0,1, 1,1,1 },
    /* 7 */ { 1,1,1, 0,0,1, 0,1,0, 0,1,0, 0,1,0 },
    /* 8 */ { 1,1,1, 1,0,1, 1,1,1, 1,0,1, 1,1,1 },
    /* 9 */ { 1,1,1, 1,0,1, 1,1,1, 0,0,1, 1,1,1 },
};

/*
 * Draw a single large digit at (x, y) with the given color.
 * Each pixel of the 3x5 pattern is scaled to (scale_x x scale_y).
 */
static void draw_digit(int x, int y, int digit, uint32_t color) {
    const uint8_t *pat = digit_patterns[digit];
    int scale_x = DIGIT_W / 5;
    int scale_y = DIGIT_H / 3;
    int r, c, sr, sc;
    for (r = 0; r < 3; r++) {
        for (c = 0; c < 5; c++) {
            if (pat[r * 5 + c]) {
                for (sr = 0; sr < scale_y; sr++) {
                    for (sc = 0; sc < scale_x; sc++) {
                        fb_pixel(x + c * scale_x + sc,
                                 y + r * scale_y + sr,
                                 color);
                    }
                }
            }
        }
    }
}

/*
 * Draw a colon (two dots) at (x, y).
 */
static void draw_colon(int x, int y, uint32_t color) {
    int dot_r = 3;
    int cx = x + COLON_W / 2;
    int cy1 = y + DIGIT_H / 3;
    int cy2 = y + 2 * DIGIT_H / 3;
    int dx, dy;
    for (dy = -dot_r; dy <= dot_r; dy++) {
        for (dx = -dot_r; dx <= dot_r; dx++) {
            if (dx * dx + dy * dy <= dot_r * dot_r) {
                fb_pixel(cx + dx, cy1 + dy, color);
                fb_pixel(cx + dx, cy2 + dy, color);
            }
        }
    }
}

/*
 * Draw the full clock display: HH:MM:SS from total_seconds.
 */
static void draw_clock(int total_seconds) {
    int hours   = (total_seconds / 3600) % 24;
    int minutes = (total_seconds / 60) % 60;
    int seconds = total_seconds % 60;
    int x = CLOCK_X;
    uint32_t col_color = colon_visible ? COL_COLON : COL_BG;

    /* HH */
    draw_digit(x, CLOCK_Y, hours / 10, COL_DIGIT);
    x += DIGIT_W + DIGIT_GAP;
    draw_digit(x, CLOCK_Y, hours % 10, COL_DIGIT);
    x += DIGIT_W + DIGIT_GAP;

    /* : */
    draw_colon(x, CLOCK_Y, col_color);
    x += COLON_W + DIGIT_GAP;

    /* MM */
    draw_digit(x, CLOCK_Y, minutes / 10, COL_DIGIT);
    x += DIGIT_W + DIGIT_GAP;
    draw_digit(x, CLOCK_Y, minutes % 10, COL_DIGIT);
    x += DIGIT_W + DIGIT_GAP;

    /* : */
    draw_colon(x, CLOCK_Y, col_color);
    x += COLON_W + DIGIT_GAP;

    /* SS */
    draw_digit(x, CLOCK_Y, seconds / 10, COL_DIGIT);
    x += DIGIT_W + DIGIT_GAP;
    draw_digit(x, CLOCK_Y, seconds % 10, COL_DIGIT);
}

/*
 * Draw a progress bar showing seconds progress (0-59).
 */
static void draw_seconds_bar(int seconds) {
    int bar_x = 40;
    int bar_y = CLOCK_Y + DIGIT_H + 24;
    int bar_w = 176;
    int bar_h = 8;
    int fill_w;
    if (seconds >= 59) {
        fill_w = bar_w;
    } else {
        fill_w = (bar_w * seconds) / 59;
    }

    fb_rect(bar_x, bar_y, bar_w, bar_h, COL_BAR_BG);
    if (fill_w > 0) {
        fb_rect(bar_x, bar_y, fill_w, bar_h, COL_BAR_FG);
    }
}

/*
 * Draw static labels and decorations.
 */
static void draw_frame(uint64_t uptime_ms) {
    /* Truncate to 32-bit BEFORE division to avoid __udivdi3 on RV32.
     * Casting after (uint32_t)(uptime_ms / 1000ULL) doesn't help because
     * the compiler promotes to 64-bit for the ULL literal first. */
    uint32_t uptime32 = (uint32_t)uptime_ms;
    uint32_t ms_only = uptime32 % 1000;
    uint32_t total_sec = uptime32 / 1000;

    /* Title */
    fb_text(64, 20, COL_TITLE, "GEOS CLOCK");
    fb_text(60, 36, COL_LABEL, "Phase 240");

    /* "UPTIME" label */
    fb_text(88, CLOCK_Y - 16, COL_LABEL, "UPTIME");

    /* Milliseconds counter below bar */
    {
        char ms_str[16];
        ms_str[0] = 'm';
        ms_str[1] = 's';
        ms_str[2] = ':';
        ms_str[3] = '0' + (ms_only / 100);
        ms_str[4] = '0' + ((ms_only / 10) % 10);
        ms_str[5] = '0' + (ms_only % 10);
        ms_str[6] = '\0';
        fb_text(96, CLOCK_Y + DIGIT_H + 40, COL_LABEL, ms_str);
    }

    /* Tick count at bottom (use 32-bit to avoid __udivdi3 on RV32) */
    {
        uint32_t ticks_lo = (uint32_t)(uptime_ms & 0xFFFF); /* lower 16 bits of ms */
        uint32_t tick_est = ticks_lo * 52; /* approximate ticks (32-bit mul) */
        char tick_str[16];
        int i = 14;
        tick_str[i] = '\0';
        if (tick_est == 0) {
            tick_str[--i] = '0';
        } else {
            while (tick_est > 0 && i >= 0) {
                tick_str[--i] = '0' + (int)(tick_est % 10);
                tick_est /= 10;
            }
        }
        fb_text(40, 230, COL_LABEL, "ticks:");
        fb_text(88, 230, COL_LABEL, &tick_str[i]);
    }

    /* Draw clock and bar */
    draw_clock(total_sec);
    draw_seconds_bar(total_sec % 60);
}

/*
 * C entry point -- called from guest_crt0.S _start.
 */
void c_start(void) {
    long uptime_ticks;

    /* Initialize uptime */
    uptime_ticks = geos_uptime();

    /* Set up blink alarm: fire every 500ms (500 * 52000 ticks) */
    blink_alarm = geos_alarm_set(500 * 52000, blink_callback);

    /* Main render loop */
    for (;;) {
        /* Clear screen */
        fb_fill(COL_BG);

        /* Read uptime */
        uptime_ticks = geos_uptime();

        /* Draw frame (convert ticks to ms for display) */
        draw_frame((uint64_t)uptime_ticks);

        /* Yield to kernel (~16ms frame time) */
        geos_wait_ms(16);
    }
}
