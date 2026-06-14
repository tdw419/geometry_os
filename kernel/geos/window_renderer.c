/*
 * Window Renderer for Bare Metal Kernel
 *
 * Renders VM windows as colored rectangles with state-based borders.
 */

#include "window_renderer.h"

void window_renderer_init(WindowRenderer *ren, unsigned int *fb, int fb_width, int fb_height)
{
    ren->framebuffer = fb;
    ren->fb_width = fb_width;
    ren->fb_height = fb_height;
    ren->window_count = 0;
    ren->max_windows = 8;

    /* Clear windows array */
    for (int i = 0; i < 8; i++) {
        ren->windows[i].id = 0;
        ren->windows[i].vm_id = 0;
        ren->windows[i].x = 0;
        ren->windows[i].y = 0;
        ren->windows[i].width = 400;
        ren->windows[i].height = 300;
        ren->windows[i].border_color = COLOR_INACTIVE;
        ren->windows[i].state = WINDOW_STATE_INACTIVE;
    }
}

int window_renderer_add(WindowRenderer *ren, WindowInstance *win)
{
    if (ren->window_count >= ren->max_windows) {
        return -1; /* Max windows reached */
    }
    ren->windows[ren->window_count] = *win;
    ren->window_count++;
    return 0;
}

unsigned int get_state_color(unsigned int state)
{
    switch (state) {
        case WINDOW_STATE_RUNNING:  return COLOR_RUNNING;
        case WINDOW_STATE_HALTED:   return COLOR_HALTED;
        case WINDOW_STATE_WAITING:  return COLOR_WAITING;
        default:                    return COLOR_INACTIVE;
    }
}

void window_renderer_render(WindowRenderer *ren)
{
    if (!ren->framebuffer) return;

    /* Draw each window */
    for (int i = 0; i < ren->window_count; i++) {
        WindowInstance *win = &ren->windows[i];

        /* Skip inactive windows */
        if (win->state == WINDOW_STATE_INACTIVE) continue;

        /* Draw window rectangle */
        for (int y = win->y; y < win->y + win->height; y++) {
            if (y < 0 || y >= ren->fb_height) continue;

            for (int x = win->x; x < win->x + win->width; x++) {
                if (x < 0 || x >= ren->fb_width) continue;

                int px = x - win->x;
                int py = y - win->y;

                /* Calculate border distances */
                int dist_left = px;
                int dist_right = win->width - px - 1;
                int dist_top = py;
                int dist_bottom = win->height - py - 1;

                int min_dist = dist_left;
                if (dist_right < min_dist) min_dist = dist_right;
                if (dist_top < min_dist) min_dist = dist_top;
                if (dist_bottom < min_dist) min_dist = dist_bottom;

                /* Draw border or background */
                unsigned int color;
                if (min_dist < BORDER_THICKNESS) {
                    color = win->border_color;
                } else {
                    color = WINDOW_BG_COLOR;
                }

                /* Write to framebuffer with alpha */
                ren->framebuffer[y * ren->fb_width + x] = 0xFF000000 | color;
            }
        }
    }
}
