/*
 * hexedit.c -- Bare-metal interactive hex editor for Geometry OS RISC-V hypervisor.
 *
 * Features:
 *   - 16 bytes per line, hex + ASCII display
 *   - Arrow keys navigate, PageUp/PageDown scroll by 256 bytes
 *   - Enter toggles edit mode; type hex digits to modify bytes
 *   - S key enters search mode for hex byte patterns
 *   - G key enters goto-address mode
 *   - Renders to framebuffer using libfb pixel primitives
 *   - Status bar shows address, mode, and edit state
 *
 * Uses SBI_CONSOLE_GETCHAR (a7=2) for input, libfb for framebuffer rendering.
 *
 * Build: ./build.sh hexedit.c hexedit.elf
 * Run:   cargo run --release --example hexedit_run
 */

#include "libgeos.h"
#include "libfb.h"

/* ---- Colors (0xRRGGBBAA) ---- */
#define COL_BG         0x101010FFu
#define COL_TEXT       0xD0D0D0FFu
#define COL_ADDR       0x80C0FFFFu  /* cyan for addresses */
#define COL_HEX       0xD0D0D0FFu  /* white for hex bytes */
#define COL_ASCII     0xA0D0A0FFu  /* green for ASCII column */
#define COL_STATUS    0x000000FFu  /* black text on status bar */
#define COL_STATUSBG  0x404040FFu  /* dark gray status bar */
#define COL_CURSOR    0xFFFF00FFu  /* yellow cursor */
#define COL_EDIT_BG   0x4040FFFFu  /* blue highlight for edit mode */
#define COL_SEARCH_BG 0x40FF40FFu  /* green highlight for search match */
#define COL_TITLE_BG  0x303050FFu  /* title bar background */
#define COL_TITLE_FG  0xFFFFFFFFu  /* title bar text */
#define COL_MODIFIED  0xFF8080FFu  /* red for modified bytes */

/* ---- Layout ---- */
#define FONT_W        6   /* 5px glyph + 1px spacing */
#define FONT_H        7
#define ROWS_VISIBLE  18  /* hex data rows on screen */
#define COLS_PER_ROW  16
#define HEX_AREA_X    0
#define HEX_AREA_Y    14  /* below title bar */
#define STATUS_Y      246 /* status bar at bottom */

/* ---- Editor state ---- */
static uint32_t cursor_addr = 0x80000000u;
static uint32_t view_base   = 0x80000000u;
static int      cursor_col  = 0;      /* 0..15 within row */
static int      editing     = 0;      /* 1 = edit mode active */
static int      edit_nibble = 0;      /* 0 = high nibble, 1 = low nibble */
static int      searching   = 0;      /* 1 = search mode active */
static int      goting      = 0;      /* 1 = goto-address mode active */
static char     input_buf[16];
static int      input_pos   = 0;
static int      modified    = 0;      /* total bytes modified */

/* Search state */
static uint8_t  search_pattern[16];
static int      search_len = 0;
static uint32_t search_match_addr = 0;
static int      search_active = 0;   /* 1 = a match is highlighted */

/* ---- Helper: print hex digit ---- */
static void put_hex_nibble(uint32_t val) {
    geos_puts("0123456789ABCDEF" + (val & 0xF));
}

static void put_hex_byte(uint8_t b) {
    put_hex_nibble(b >> 4);
    put_hex_nibble(b);
}

static void put_hex_word(uint32_t w) {
    for (int i = 24; i >= 0; i -= 8) put_hex_byte((w >> i) & 0xFF);
}

/* ---- Helper: read/write memory ---- */
static volatile uint8_t *mem_ptr(uint32_t addr) {
    return (volatile uint8_t *)(unsigned long)addr;
}

/* ---- Helper: parse hex string to uint32_t ---- */
static int parse_hex(const char *s, uint32_t *out) {
    uint32_t val = 0;
    while (*s) {
        char c = *s++;
        val <<= 4;
        if (c >= '0' && c <= '9') val |= (c - '0');
        else if (c >= 'a' && c <= 'f') val |= (c - 'a' + 10);
        else if (c >= 'A' && c <= 'F') val |= (c - 'A' + 10);
        else return 0;
    }
    *out = val;
    return 1;
}

/* ---- Render the hex editor screen ---- */
static void render(void) {
    fb_fill(COL_BG);

    /* Title bar */
    fb_rect(0, 0, FB_WIDTH, 12, COL_TITLE_BG);
    fb_text(2, 2, COL_TITLE_FG, "GeOS Hex Editor");
    /* Show modification count in title */
    if (modified > 0) {
        char modbuf[16];
        modbuf[0] = '[';
        int p = 1;
        /* decimal to string */
        uint32_t m = (uint32_t)modified;
        char mbuf[12];
        int mi = 0;
        if (m == 0) { mbuf[mi++] = '0'; }
        else { while (m > 0) { mbuf[mi++] = '0' + (m % 10); m /= 10; } }
        for (int k = mi - 1; k >= 0; k--) modbuf[p++] = mbuf[k];
        modbuf[p++] = ']';
        modbuf[p] = 0;
        fb_text(120, 2, COL_MODIFIED, modbuf);
    }

    /* Hex data area */
    for (int row = 0; row < ROWS_VISIBLE; row++) {
        uint32_t addr = view_base + (uint32_t)(row * COLS_PER_ROW);
        int y = HEX_AREA_Y + row * FONT_H + 2;

        /* Address column */
        int px = HEX_AREA_X + 1;
        fb_text(px, y, COL_ADDR, "0x");
        px += 2 * FONT_W;
        /* Print 8 hex digits of address */
        char abuf[16];
        for (int i = 7; i >= 0; i--) {
            abuf[7 - i] = "0123456789ABCDEF"[(addr >> (i * 4)) & 0xF];
        }
        abuf[8] = 0;
        fb_text(px, y, COL_ADDR, abuf);
        px += 8 * FONT_W;

        /* Separator */
        fb_text(px, y, COL_TEXT, ":");
        px += FONT_W;
        px += 2; /* gap */

        /* Hex bytes */
        int hex_start_x = px;
        for (int col = 0; col < COLS_PER_ROW; col++) {
            int bx = px + col * 3 * FONT_W;
            uint8_t byte_val = *mem_ptr(addr + col);
            char hbuf[4];
            hbuf[0] = "0123456789ABCDEF"[(byte_val >> 4) & 0xF];
            hbuf[1] = "0123456789ABCDEF"[byte_val & 0xF];
            hbuf[2] = 0;

            /* Highlight cursor position */
            if (addr + col == cursor_addr && !searching && !goting) {
                fb_rect(bx - 1, y - 1, FONT_W * 2 + 2, FONT_H + 2,
                        editing ? COL_EDIT_BG : COL_CURSOR);
            }

            /* Highlight search match */
            if (search_active && addr + col >= search_match_addr &&
                addr + col < search_match_addr + search_len) {
                fb_rect(bx - 1, y - 1, FONT_W * 2 + 2, FONT_H + 2, COL_SEARCH_BG);
            }

            fb_text(bx, y, COL_HEX, hbuf);
        }

        /* ASCII column */
        int ascii_x = hex_start_x + COLS_PER_ROW * 3 * FONT_W + 6;
        fb_text(ascii_x - FONT_W, y, COL_TEXT, "|");
        for (int col = 0; col < COLS_PER_ROW; col++) {
            uint8_t byte_val = *mem_ptr(addr + col);
            char ch = (byte_val >= 32 && byte_val < 127) ? (char)byte_val : '.';
            char cbuf[2] = { ch, 0 };
            fb_text(ascii_x + col * FONT_W, y, COL_ASCII, cbuf);
        }
    }

    /* Status bar */
    fb_rect(0, STATUS_Y, FB_WIDTH, 10, COL_STATUSBG);

    int sx = 4;
    int sy = STATUS_Y + 1;

    if (searching) {
        fb_text(sx, sy, 0xFFFF80FF, "SEARCH:");
        sx += 7 * FONT_W;
        fb_text(sx, sy, COL_TEXT, input_buf);
        sx += input_pos * FONT_W;
        /* blinking cursor effect: draw block */
        fb_rect(sx, sy, FONT_W, FONT_H, COL_TEXT);
    } else if (goting) {
        fb_text(sx, sy, 0x80FFFF80, "GOTO:");
        sx += 5 * FONT_W;
        fb_text(sx, sy, COL_TEXT, input_buf);
        sx += input_pos * FONT_W;
        fb_rect(sx, sy, FONT_W, FONT_H, COL_TEXT);
    } else if (editing) {
        fb_text(sx, sy, 0xFF8080FF, "EDIT");
        sx += 4 * FONT_W;
        fb_text(sx, sy, COL_TEXT, "nibble:");
        sx += 7 * FONT_W;
        put_hex_nibble(edit_nibble);
        sx += FONT_W;
        fb_text(sx, sy, COL_TEXT, " [ESC=cancel]");
    } else {
        fb_text(sx, sy, COL_TEXT, "Addr:");
        sx += 5 * FONT_W;
        char abuf[16];
        for (int i = 7; i >= 0; i--) {
            abuf[7 - i] = "0123456789ABCDEF"[(cursor_addr >> (i * 4)) & 0xF];
        }
        abuf[8] = 0;
        fb_text(sx, sy, COL_ADDR, abuf);
        sx += 8 * FONT_W + FONT_W;
        fb_text(sx, sy, COL_TEXT, "Arrows/PGUP/PGDN=Move ENTER=Edit S=Search G=Goto Q=Quit");
    }

    /* Right side: current byte value */
    {
        uint8_t cur = *mem_ptr(cursor_addr);
        char vbuf[8];
        vbuf[0] = '[';
        vbuf[1] = "0123456789ABCDEF"[(cur >> 4) & 0xF];
        vbuf[2] = "0123456789ABCDEF"[cur & 0xF];
        vbuf[3] = ']';
        vbuf[4] = 0;
        fb_text(FB_WIDTH - 4 * FONT_W, sy, COL_MODIFIED, vbuf);
    }

    fb_present();
}

/* ---- Search for byte pattern in memory ---- */
static int do_search(uint32_t start_addr) {
    if (search_len == 0) return 0;

    /* Search from start_addr, wrap around at 4MB boundary */
    uint32_t limit = start_addr + (4 * 1024 * 1024);
    for (uint32_t addr = start_addr; addr < limit; addr++) {
        int match = 1;
        for (int i = 0; i < search_len; i++) {
            if (*mem_ptr(addr + i) != search_pattern[i]) {
                match = 0;
                break;
            }
        }
        if (match) {
            search_match_addr = addr;
            search_active = 1;
            cursor_addr = addr;
            cursor_col = 0;
            /* Center view on match */
            view_base = addr & ~0xFu;
            if (view_base > 0x80u) view_base -= 0x80u;
            return 1;
        }
    }
    return 0;
}

/* ---- Parse search pattern from hex string ---- */
static int parse_search(const char *s, uint8_t *pattern, int *len) {
    int count = 0;
    while (*s && count < 16) {
        char c = *s++;
        if (c == ' ') continue;
        int hi = -1;
        if (c >= '0' && c <= '9') hi = c - '0';
        else if (c >= 'a' && c <= 'f') hi = c - 'a' + 10;
        else if (c >= 'A' && c <= 'F') hi = c - 'A' + 10;
        if (hi < 0) return 0;

        if (*s) {
            char c2 = *s;
            int lo = -1;
            if (c2 >= '0' && c2 <= '9') lo = c2 - '0';
            else if (c2 >= 'a' && c2 <= 'f') lo = c2 - 'a' + 10;
            else if (c2 >= 'A' && c2 <= 'F') lo = c2 - 'A' + 10;
            if (lo >= 0) {
                pattern[count++] = (uint8_t)((hi << 4) | lo);
                s++;
                continue;
            }
        }
        /* Single nibble = high nibble of byte */
        pattern[count++] = (uint8_t)(hi << 4);
    }
    *len = count;
    return count > 0;
}

/* ---- Handle input character ---- */
static void handle_key(char ch) {
    if (searching) {
        if (ch == '\n' || ch == '\r') {
            /* Execute search */
            input_buf[input_pos] = 0;
            if (parse_search(input_buf, search_pattern, &search_len)) {
                do_search(cursor_addr + 1);
            }
            searching = 0;
        } else if (ch == 27) {
            searching = 0;
        } else if (ch == 127 || ch == 8) {
            if (input_pos > 0) input_pos--;
        } else if (input_pos < 15) {
            input_buf[input_pos++] = ch;
        }
        render();
        return;
    }

    if (goting) {
        if (ch == '\n' || ch == '\r') {
            input_buf[input_pos] = 0;
            uint32_t addr;
            if (parse_hex(input_buf, &addr)) {
                cursor_addr = addr & ~0x3u; /* align to word */
                cursor_col = 0;
                view_base = cursor_addr;
            }
            goting = 0;
        } else if (ch == 27) {
            goting = 0;
        } else if (ch == 127 || ch == 8) {
            if (input_pos > 0) input_pos--;
        } else if (input_pos < 15) {
            input_buf[input_pos++] = ch;
        }
        render();
        return;
    }

    if (editing) {
        if (ch == 27) {
            /* Cancel edit */
            editing = 0;
            edit_nibble = 0;
        } else if (ch >= '0' && ch <= '9') {
            int nib = ch - '0';
            uint8_t old = *mem_ptr(cursor_addr);
            uint8_t new_val;
            if (edit_nibble == 0) {
                new_val = (uint8_t)((nib << 4) | (old & 0x0F));
                edit_nibble = 1;
            } else {
                new_val = (uint8_t)((old & 0xF0) | nib);
                *mem_ptr(cursor_addr) = new_val;
                modified++;
                editing = 0;
                edit_nibble = 0;
                /* Advance cursor */
                cursor_col++;
                if (cursor_col >= COLS_PER_ROW) {
                    cursor_col = 0;
                    cursor_addr += COLS_PER_ROW;
                } else {
                    cursor_addr++;
                }
            }
            if (editing) *mem_ptr(cursor_addr) = new_val; /* preview high nibble */
        } else if ((ch >= 'a' && ch <= 'f') || (ch >= 'A' && ch <= 'F')) {
            int nib = (ch >= 'a') ? (ch - 'a' + 10) : (ch - 'A' + 10);
            uint8_t old = *mem_ptr(cursor_addr);
            uint8_t new_val;
            if (edit_nibble == 0) {
                new_val = (uint8_t)((nib << 4) | (old & 0x0F));
                edit_nibble = 1;
            } else {
                new_val = (uint8_t)((old & 0xF0) | nib);
                *mem_ptr(cursor_addr) = new_val;
                modified++;
                editing = 0;
                edit_nibble = 0;
                cursor_col++;
                if (cursor_col >= COLS_PER_ROW) {
                    cursor_col = 0;
                    cursor_addr += COLS_PER_ROW;
                } else {
                    cursor_addr++;
                }
            }
            if (editing) *mem_ptr(cursor_addr) = new_val;
        }
        render();
        return;
    }

    /* Normal mode */
    /* Handle escape sequences for arrow keys */
    if (ch == 27) {
        /* Read next two chars for arrow keys */
        char seq[2];
        seq[0] = geos_getchar();
        seq[1] = geos_getchar();

        if (seq[0] == '[') {
            switch (seq[1]) {
            case 'A': /* Up */
                if (cursor_addr >= COLS_PER_ROW)
                    cursor_addr -= COLS_PER_ROW;
                break;
            case 'B': /* Down */
                cursor_addr += COLS_PER_ROW;
                break;
            case 'C': /* Right */
                cursor_addr++;
                cursor_col++;
                if (cursor_col >= COLS_PER_ROW) {
                    cursor_col = 0;
                }
                break;
            case 'D': /* Left */
                if (cursor_addr > 0) {
                    cursor_addr--;
                    cursor_col--;
                    if (cursor_col < 0) cursor_col = COLS_PER_ROW - 1;
                }
                break;
            case '5': /* PageUp */
                if (cursor_addr >= 256) cursor_addr -= 256;
                break;
            case '6': /* PageDown */
                cursor_addr += 256;
                break;
            case '3': /* Delete - skip next char if ~ */
                geos_getchar(); /* consume ~ */
                break;
            }
        }

        /* Keep cursor_col in sync */
        cursor_col = (int)(cursor_addr % COLS_PER_ROW);

        /* Scroll view to keep cursor visible */
        if (cursor_addr < view_base) {
            view_base = cursor_addr & ~0xFu;
        } else if (cursor_addr >= view_base + (uint32_t)(ROWS_VISIBLE * COLS_PER_ROW)) {
            view_base = (cursor_addr - (uint32_t)((ROWS_VISIBLE - 1) * COLS_PER_ROW)) & ~0xFu;
        }
        render();
        return;
    }

    switch (ch) {
    case '\n': case '\r':
        /* Enter edit mode */
        editing = 1;
        edit_nibble = 0;
        break;
    case 's': case 'S':
        /* Enter search mode */
        searching = 1;
        input_pos = 0;
        input_buf[0] = 0;
        break;
    case 'g': case 'G':
        /* Enter goto-address mode */
        goting = 1;
        input_pos = 0;
        input_buf[0] = 0;
        break;
    case 'n': case 'N':
        /* Find next search match */
        if (search_len > 0) {
            do_search(search_match_addr + 1);
        }
        break;
    case 'q': case 'Q':
        sbi_shutdown();
        break;
    case 'h': case 'H':
        /* Help - move cursor to beginning of RAM region */
        cursor_addr = 0x80000000u;
        view_base = cursor_addr;
        cursor_col = 0;
        break;
    }

    /* Keep view scrolled to cursor */
    if (cursor_addr < view_base) {
        view_base = cursor_addr & ~0xFu;
    } else if (cursor_addr >= view_base + (uint32_t)(ROWS_VISIBLE * COLS_PER_ROW)) {
        view_base = (cursor_addr - (uint32_t)((ROWS_VISIBLE - 1) * COLS_PER_ROW)) & ~0xFu;
    }

    render();
}

/* ---- Main entry point ---- */
void c_start(void) {
    fb_init();

    /* Place a test pattern at a safe address (well past code/data/BSS)
       so the display isn't just zeros on first load.
       Code occupies 0x80000000..0x80001D14, stack grows down from 0x80100000.
       We put test data at 0x80002000 to avoid colliding with either. */
    #define TEST_DATA_BASE  0x80002000u
    {
        volatile uint8_t *p = mem_ptr(TEST_DATA_BASE);
        /* Write "GeOS HEX" as ASCII */
        const char *msg = "GeOS Hex Editor v1.0 -- Bare Metal RISC-V";
        for (int i = 0; msg[i]; i++) {
            p[i] = (uint8_t)msg[i];
        }
        /* Some test bytes */
        for (int i = 32; i < 64; i++) {
            p[i] = (uint8_t)(i * 7 + 0x42);
        }
    }

    cursor_addr = TEST_DATA_BASE;
    view_base = cursor_addr;
    cursor_col = 0;

    render();

    /* Main input loop */
    while (1) {
        long ch = sbi_console_getchar();
        if (ch >= 0) {
            handle_key((char)ch);
        }
    }
}
