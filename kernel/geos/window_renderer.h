/*
 * Window Renderer for Bare Metal Kernel
 *
 * Renders VM windows as colored rectangles with state-based borders.
 */

#ifndef _WINDOW_RENDERER_H
#define _WINDOW_RENDERER_H

#include "gpu.h"

/* Window states - matches Rust bare_metal::WindowState */
#define WINDOW_STATE_INACTIVE 0
#define WINDOW_STATE_RUNNING  1
#define WINDOW_STATE_HALTED   2
#define WINDOW_STATE_WAITING  3

/* State colors (RGB) */
#define COLOR_INACTIVE 0x333333
#define COLOR_RUNNING  0x00FF00
#define COLOR_HALTED   0xFF0000
#define COLOR_WAITING  0xFFFF00

/* Window background */
#define WINDOW_BG_COLOR 0x220000

/* Border thickness in pixels */
#define BORDER_THICKNESS 3

/* Window instance */
typedef struct {
    unsigned int id;
    unsigned int vm_id;
    int x, y;
    int width, height;
    unsigned int border_color;
    unsigned int state;
} WindowInstance;

/* Window renderer */
typedef struct {
    unsigned int *framebuffer;
    int fb_width;
    int fb_height;
    WindowInstance windows[8];
    int window_count;
    int max_windows;
} WindowRenderer;

/* Initialize window renderer */
void window_renderer_init(WindowRenderer *ren, unsigned int *fb, int fb_width, int fb_height);

/* Add a window */
int window_renderer_add(WindowRenderer *ren, WindowInstance *win);

/* Render all windows to framebuffer */
void window_renderer_render(WindowRenderer *ren);

/* Get state color */
unsigned int get_state_color(unsigned int state);

#endif /* _WINDOW_RENDERER_H */
