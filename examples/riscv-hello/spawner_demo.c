/*
 * spawner_demo.c -- Dynamic process lifecycle + auto-tiling demo
 *
 * Starts as a single process covering the full 256x256 framebuffer.
 * Press 'S' to spawn life32 -- the kernel auto-tiles to left/right halves.
 * Press 'K' to kill it -- the kernel gives the spawner full screen again.
 * Press 'R' to query the current display region (auto-tiling info).
 */

#include "libgeos.h"

#define SLOT_B 0x80050000u

static void print_rect(const char *label, long packed) {
    uint32_t r = (uint32_t)packed;
    uint32_t x = (r >> 16) & 0xFF;
    uint32_t y = (r >> 24) & 0xFF;
    uint32_t w = r & 0xFF;        if (w == 0) w = 256;
    uint32_t h = (r >> 8) & 0xFF;  if (h == 0) h = 256;
    geos_puts(label);
    geos_put_dec(x);
    geos_puts(",");
    geos_put_dec(y);
    geos_puts(" ");
    geos_put_dec(w);
    geos_puts("x");
    geos_put_dec(h);
    geos_puts("\n");
}

void c_start(void) {
    geos_puts("=== Spawner Demo (auto-tiling) ===\n");
    geos_puts("Controls:\n");
    geos_puts("  [S] Spawn life32\n");
    geos_puts("  [K] Kill life32\n");
    geos_puts("  [R] Show rect info\n");
    geos_puts("  [TAB] Cycle focus\n");

    long guest_b_id = -1;

    /* Show initial rect (full screen since we're the only process) */
    print_rect("[spawner] initial rect: ", geos_get_rect());

    while (1) {
        long ch = sbi_console_getchar();
        if (ch > 0) {
            if (ch == 's' || ch == 'S') {
                if (guest_b_id != -1) {
                    geos_puts("[spawner] already active (id=");
                    geos_put_dec(guest_b_id);
                    geos_puts(")\n");
                } else {
                    geos_puts("[spawner] spawning life32...\n");
                    guest_b_id = geos_spawn(SLOT_B);
                    if (guest_b_id >= 0) {
                        geos_puts("[spawner] spawned id=");
                        geos_put_dec(guest_b_id);
                        geos_puts(", procs=");
                        geos_put_dec(geos_proc_count());
                        geos_puts("\n");
                        print_rect("[spawner] new rect: ", geos_get_rect());
                    } else {
                        geos_puts("[spawner] spawn failed!\n");
                    }
                }
            } else if (ch == 'k' || ch == 'K') {
                if (guest_b_id == -1) {
                    geos_puts("[spawner] nothing to kill\n");
                } else {
                    geos_puts("[spawner] killing id=");
                    geos_put_dec(guest_b_id);
                    geos_puts("...\n");
                    if (geos_kill(guest_b_id) == 0) {
                        geos_puts("[spawner] killed, procs=");
                        geos_put_dec(geos_proc_count());
                        geos_puts("\n");
                        print_rect("[spawner] new rect: ", geos_get_rect());
                        guest_b_id = -1;
                    } else {
                        geos_puts("[spawner] kill failed\n");
                    }
                }
            } else if (ch == 'r' || ch == 'R') {
                print_rect("[spawner] rect: ", geos_get_rect());
                geos_puts("[spawner] procs: ");
                geos_put_dec(geos_proc_count());
                geos_puts("\n");
            } else if (ch == 'y' || ch == 'Y') {
                if (guest_b_id == -1) {
                    geos_puts("[spawner] nothing to yield to\n");
                } else {
                    geos_yield_to(guest_b_id);
                }
            }
        }

        /* Draw heartbeat animation */
        static uint32_t frame = 0;
        frame++;
        uint8_t pulse = (frame * 4) & 0xFF;
        uint32_t color = geos_rgb(pulse, 100, 255 - pulse);
        for (int y = 0; y < 20; y++)
            for (int x = 0; x < 20; x++)
                geos_fb_pixel(x, y, color);

        geos_draw_string(25, 5, "S:SPAWN K:KILL R:RECT", geos_rgb(255, 255, 255), 0);
        if (guest_b_id != -1) {
            geos_draw_string(25, 15, "LIFE32 ACTIVE", geos_rgb(0, 255, 0), 0);
        } else {
            geos_draw_string(25, 15, "SOLE PROCESS ", geos_rgb(255, 100, 100), 0);
        }
        geos_fb_present();

        geos_yield();
        for (volatile int i = 0; i < 20000; i++);
    }
}
