/*
 * net_get.c -- Phase 244: HTTP GET demo over TCP via SBI
 *
 * Connects to a local TCP server (default 127.0.0.1:8888), sends an
 * HTTP GET request, reads the response, and displays the first N bytes
 * on the framebuffer using the 8x8 bitmap font.
 *
 * Usage with Geometry OS hypervisor:
 *   1. Start an HTTP server on port 8888:
 *      python3 -m http.server 8888
 *   2. Boot: hypervisor_boot arch=riscv32 kernel=net_get.elf ram=1
 *
 * Build: ./build.sh net_get.c net_get.elf
 */

#include "libgeos.h"

#define SERVER_IP   geos_net_ip(127, 0, 0, 1)
#define SERVER_PORT 8888

/* HTTP request to send */
static const char http_request[] =
    "GET / HTTP/1.0\r\n"
    "Host: localhost\r\n"
    "Connection: close\r\n"
    "\r\n";

/* Receive buffer in BSS (guest RAM) */
static char rx_buf[4096];

/* Colors for framebuffer display */
#define COLOR_BG    0x101010FFu
#define COLOR_TEXT  0x00FF88FFu
#define COLOR_TITLE 0xFFDD44FFu
#define COLOR_ERR   0xFF3333FFu
#define COLOR_BG_TEXT 0x101010FFu

/* Draw a filled rectangle on the framebuffer. */
static void draw_rect(uint32_t x, uint32_t y, uint32_t w, uint32_t h,
                      uint32_t color) {
    for (uint32_t row = y; row < y + h && row < GEOS_FB_HEIGHT; row++) {
        for (uint32_t col = x; col < x + w && col < GEOS_FB_WIDTH; col++) {
            geos_fb_pixel(col, row, color);
        }
    }
}

/* Draw a string at (x, y) with line wrapping. */
static void draw_text_wrapped(const char *str, uint32_t x, uint32_t y,
                              uint32_t max_width, uint32_t fg, uint32_t bg) {
    uint32_t cy = y;
    uint32_t char_w = 8;
    uint32_t chars_per_line = max_width / char_w;

    int i = 0;
    while (str[i] && cy < GEOS_FB_HEIGHT - 8) {
        int line_len = 0;
        /* Count chars until newline or line full */
        while (str[i] && str[i] != '\n' && str[i] != '\r' &&
               line_len < (int)chars_per_line) {
            i++;
            line_len++;
        }
        /* Build a temp buffer for one line */
        char tmp[64];
        int len = line_len;
        if (len > 63) len = 63;
        for (int j = 0; j < len; j++) {
            tmp[j] = str[i - line_len + j];
        }
        tmp[len] = '\0';

        /* geos_draw_string(int x, int y, const char *str, uint32_t fg, uint32_t bg) */
        geos_draw_string((int)x, (int)cy, tmp, fg, bg);
        cy += 10; /* 8px font + 2px spacing */

        /* Skip CR/LF */
        while (str[i] == '\r' || str[i] == '\n') i++;
    }
}

/* Draw a simple progress bar during connect. */
static void draw_connecting(void) {
    draw_rect(0, 0, GEOS_FB_WIDTH, GEOS_FB_HEIGHT, COLOR_BG);

    /* Title bar */
    draw_rect(0, 0, GEOS_FB_WIDTH, 16, 0x202020FFu);
    geos_draw_string(8, 4, "GEOS NET -- HTTP GET", COLOR_TITLE, 0x202020FFu);

    geos_draw_string(8, 30, "Connecting to 127.0.0.1:8888 ...", COLOR_TEXT,
                     COLOR_BG_TEXT);
    geos_fb_present();
}

/* Draw received data on screen. */
static void draw_response(const char *data, long total) {
    draw_rect(0, 0, GEOS_FB_WIDTH, GEOS_FB_HEIGHT, COLOR_BG);

    /* Title bar */
    draw_rect(0, 0, GEOS_FB_WIDTH, 16, 0x202020FFu);
    geos_draw_string(8, 4, "GEOS NET -- Response", COLOR_TITLE, 0x202020FFu);

    /* Status line */
    char status[64];
    status[0] = '\0';
    int pos = 0;

    /* Append byte count */
    const char *prefix = "Received: ";
    while (*prefix) status[pos++] = *prefix++;

    /* Simple decimal conversion */
    long n = total;
    char digits[16];
    int dpos = 0;
    if (n == 0) {
        digits[dpos++] = '0';
    } else {
        while (n > 0 && dpos < 15) {
            digits[dpos++] = '0' + (n % 10);
            n /= 10;
        }
    }
    /* Reverse digits */
    for (int j = dpos - 1; j >= 0; j--) {
        status[pos++] = digits[j];
    }
    status[pos++] = ' ';
    status[pos++] = 'b';
    status[pos++] = 'y';
    status[pos++] = 't';
    status[pos++] = 'e';
    status[pos++] = 's';
    status[pos++] = '\0';

    geos_draw_string(8, 22, status, COLOR_TEXT, COLOR_BG_TEXT);

    /* Separator line */
    draw_rect(0, 34, GEOS_FB_WIDTH, 1, 0x444444FFu);

    /* Response body (wrapped text, starting at y=40) */
    draw_text_wrapped(data, 8, 40, GEOS_FB_WIDTH - 16, COLOR_TEXT, COLOR_BG_TEXT);

    geos_fb_present();
}

/* Draw an error screen. */
static void draw_error(const char *msg, long code) {
    draw_rect(0, 0, GEOS_FB_WIDTH, GEOS_FB_HEIGHT, COLOR_BG);
    draw_rect(0, 0, GEOS_FB_WIDTH, 16, 0x401010FFu);
    geos_draw_string(8, 4, "GEOS NET -- Error", COLOR_ERR, 0x401010FFu);

    geos_draw_string(8, 30, msg, COLOR_ERR, COLOR_BG_TEXT);

    /* Show error code */
    char buf[32];
    buf[0] = 'E';
    buf[1] = 'r';
    buf[2] = 'r';
    buf[3] = 'o';
    buf[4] = 'r';
    buf[5] = ' ';
    buf[6] = 'c';
    buf[7] = 'o';
    buf[8] = 'd';
    buf[9] = 'e';
    buf[10] = ':';
    buf[11] = ' ';
    int pos = 12;
    long c = code;
    char digits[16];
    int dpos = 0;
    if (c == 0) {
        digits[dpos++] = '0';
    } else {
        int neg = 0;
        if (c < 0) { neg = 1; c = -c; }
        while (c > 0 && dpos < 15) {
            digits[dpos++] = '0' + (c % 10);
            c /= 10;
        }
        if (neg) digits[dpos++] = '-';
    }
    for (int j = dpos - 1; j >= 0; j--) {
        buf[pos++] = digits[j];
    }
    buf[pos] = '\0';
    geos_draw_string(8, 46, buf, COLOR_ERR, COLOR_BG_TEXT);

    geos_fb_present();
}

void c_start(void) {
    long sock;

    /* Step 1: Connect */
    draw_connecting();

    sock = geos_net_connect(SERVER_IP, SERVER_PORT);
    if (sock < 0) {
        draw_error("Connect failed", sock);
        return;
    }

    /* Step 2: Send HTTP GET request */
    long sent = geos_net_send(sock, http_request,
                              sizeof(http_request) - 1);
    if (sent < 0) {
        draw_error("Send failed", sent);
        geos_net_disconnect(sock);
        return;
    }

    /* Step 3: Receive response */
    long total = 0;
    long chunk;
    int retries = 0;

    do {
        chunk = geos_net_recv(sock, rx_buf + total,
                              (long)(sizeof(rx_buf) - 1 - total));
        if (chunk > 0) {
            total += chunk;
            retries = 0;
        } else if (chunk == 0) {
            /* Server closed connection */
            break;
        } else {
            /* Error or timeout -- retry a few times */
            retries++;
            if (retries > 3) break;
            geos_wait_ms(100);
        }
    } while (total < (long)(sizeof(rx_buf) - 1));

    rx_buf[total] = '\0'; /* null-terminate for display */

    /* Step 4: Disconnect */
    geos_net_disconnect(sock);

    /* Step 5: Display response on framebuffer */
    if (total > 0) {
        draw_response(rx_buf, total);
    } else {
        draw_error("No data received", 0);
    }

    /* Done -- halt the CPU */
    sbi_shutdown();
}
