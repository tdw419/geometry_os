/*
 * editor.c -- Nano-like text editor for Geometry OS RISC-V guest
 *
 * A simple, non-modal text editor (like GNU nano) for editing text files
 * stored in the VFS pixel surface. Uses the libgeos 8x8 bitmap font and
 * keyboard input via geos_getchar (SBI console).
 *
 * Screen layout (256x256 framebuffer, 8x8 font):
 *   Rows 0-29:   Text viewport (30 rows x 32 columns)
 *   Row 30:      Status bar (filename, line/col, modified flag)
 *   Row 31:      Shortcut bar (Ctrl+O=Save  Ctrl+X=Exit  Ctrl+R=Open)
 *
 * Key bindings:
 *   Arrow keys      Move cursor
 *   Home/End        Move to start/end of line
 *   PageUp/PageDn   Scroll viewport
 *   Printable chars Insert at cursor
 *   Backspace       Delete char before cursor
 *   Delete (0x7F)   Delete char under cursor
 *   Enter           Insert new line
 *   Ctrl+O          Save file to VFS (prompts for filename)
 *   Ctrl+X          Exit (prompts to save if modified)
 *   Ctrl+R          Open file from VFS (shows file browser)
 *   Ctrl+K          Cut current line
 *   Ctrl+U          Paste (uncut) above current line
 *   Ctrl+G          Show help
 *
 * Build: ./build.sh editor.c editor.elf
 * Run:   cargo run --release --example riscv_run -- editor.elf
 */
#include "libgeos.h"

/* vfs_pixel.h has its own SBI helpers that conflict with libgeos.h.
   Define VFS_SKIP_SBI to skip them -- we use libgeos versions instead.
   We also need to provide vfs_puts since it depends on the skipped helper. */
#define VFS_SKIP_SBI
#include "vfs_pixel.h"

/* vfs_puts uses sbi_console_putchar which was skipped above.
   Provide it using the libgeos version. */
static inline void editor_vfs_puts(const char *s) {
    while (*s) sbi_console_putchar(*s++);
}

/* ---- Editor constants ---- */

#define CHAR_W      8       /* 8px per character (geos_draw_char) */
#define LINE_H      8       /* 8px per row */
#define COLS        32      /* 256 / 8 = 32 columns */
#define VIEW_ROWS   30      /* text viewport rows */
#define STATUS_ROW  240     /* y pixel for status bar (30 * 8) */
#define SHORTCUT_ROW 248    /* y pixel for shortcut bar (31 * 8) */

/* ---- Buffer limits ---- */

#define MAX_LINES    512
#define MAX_LINE_LEN 256

/* ---- Colors ---- */

#define COL_TEXT_FG   0xFFFFFFFFu   /* white */
#define COL_TEXT_BG   0x00000000u   /* black (transparent) */
#define COL_STATUS_BG 0xFFFFFFFFu   /* white background */
#define COL_STATUS_FG 0x000000FFu   /* black text */
#define COL_SHORT_BG  0x808080FFu   /* gray background */
#define COL_SHORT_FG  0x000000FFu   /* black text */
#define COL_CURBAR_BG 0x808080FFu   /* gray cursor block */
#define COL_MSG_BG    0x000000FFu   /* black background for messages */

/* ---- Editor state ---- */

static char lines[MAX_LINES][MAX_LINE_LEN];
static int  num_lines;           /* number of active lines (>= 1) */
static int  cur_row;             /* cursor line (0-based) */
static int  cur_col;             /* cursor column (0-based) */
static int  scroll_row;          /* top visible line */
static int  dirty;               /* modified since last save */
static char filename[MAX_LINE_LEN];

/* Cut buffer (single line) */
static char cut_buf[MAX_LINE_LEN];
static int  has_cut;

/* Message display */
static char msg[MAX_LINE_LEN];
static int  msg_timer;           /* frames remaining to show msg */

/* File browser state */
static int  browsing;            /* 1 if in file browser mode */
static int  browse_sel;          /* selected file index */
static struct vfs_entry browse_entries[32];
static int  browse_count;

/* Prompt state (for filename input on Ctrl+O) */
static int  prompting;           /* 1 if in filename prompt mode */
static char prompt_buf[MAX_LINE_LEN];
static int  prompt_len;
static int  prompt_save;         /* 1=save, 0=open */

/* ---- Helper: string length ---- */

static int my_strlen(const char *s) {
    int n = 0;
    while (s[n]) n++;
    return n;
}

/* ---- Initialize buffer with one empty line ---- */

static void init_buffer(void) {
    num_lines = 1;
    cur_row = 0;
    cur_col = 0;
    scroll_row = 0;
    dirty = 0;
    lines[0][0] = '\0';
    filename[0] = '\0';
    has_cut = 0;
    cut_buf[0] = '\0';
    msg[0] = '\0';
    msg_timer = 0;
    browsing = 0;
    prompting = 0;
}

/* ---- Insert a character at cursor position ---- */

static void insert_char(char ch) {
    if (cur_row >= MAX_LINES) return;
    char *line = lines[cur_row];
    int len = my_strlen(line);

    if (len >= MAX_LINE_LEN - 1) return;  /* line full */

    /* Shift characters right to make room */
    int i;
    for (i = len; i > cur_col; i--) {
        line[i] = line[i - 1];
    }
    line[cur_col] = ch;
    line[len + 1] = '\0';
    cur_col++;
    dirty = 1;
}

/* ---- Delete character before cursor (backspace) ---- */

static void backspace(void) {
    if (cur_col > 0) {
        /* Delete within current line */
        char *line = lines[cur_row];
        int len = my_strlen(line);
        int i;
        for (i = cur_col - 1; i < len; i++) {
            line[i] = line[i + 1];
        }
        cur_col--;
        dirty = 1;
    } else if (cur_row > 0) {
        /* Merge with previous line */
        char *prev = lines[cur_row - 1];
        char *cur = lines[cur_row];
        int prev_len = my_strlen(prev);
        int cur_len = my_strlen(cur);

        if (prev_len + cur_len < MAX_LINE_LEN - 1) {
            /* Append current line to previous */
            int i;
            for (i = 0; i < cur_len; i++) {
                prev[prev_len + i] = cur[i];
            }
            prev[prev_len + cur_len] = '\0';
            cur_col = prev_len;

            /* Remove current line by shifting down */
            int j;
            for (j = cur_row; j < num_lines - 1; j++) {
                int k;
                for (k = 0; k < MAX_LINE_LEN; k++) {
                    lines[j][k] = lines[j + 1][k];
                }
            }
            num_lines--;
            cur_row--;
            dirty = 1;
        }
    }
}

/* ---- Delete character under cursor ---- */

static void delete_char(void) {
    char *line = lines[cur_row];
    int len = my_strlen(line);

    if (cur_col < len) {
        int i;
        for (i = cur_col; i < len; i++) {
            line[i] = line[i + 1];
        }
        dirty = 1;
    } else if (cur_row < num_lines - 1) {
        /* Merge with next line */
        char *next = lines[cur_row + 1];
        int cur_len = my_strlen(line);
        int next_len = my_strlen(next);

        if (cur_len + next_len < MAX_LINE_LEN - 1) {
            int i;
            for (i = 0; i < next_len; i++) {
                line[cur_len + i] = next[i];
            }
            line[cur_len + next_len] = '\0';

            int j;
            for (j = cur_row + 1; j < num_lines - 1; j++) {
                int k;
                for (k = 0; k < MAX_LINE_LEN; k++) {
                    lines[j][k] = lines[j + 1][k];
                }
            }
            num_lines--;
            dirty = 1;
        }
    }
}

/* ---- Insert new line (Enter) ---- */

static void insert_newline(void) {
    if (num_lines >= MAX_LINES) return;

    char *line = lines[cur_row];
    int len = my_strlen(line);

    /* Split current line at cursor */
    char rest[MAX_LINE_LEN];
    int i;
    for (i = cur_col; i <= len; i++) {
        rest[i - cur_col] = line[i];
    }
    line[cur_col] = '\0';

    /* Shift all lines below down by one */
    int j;
    for (j = num_lines; j > cur_row + 1; j--) {
        int k;
        for (k = 0; k < MAX_LINE_LEN; k++) {
            lines[j][k] = lines[j - 1][k];
        }
    }

    /* Insert the remainder as a new line */
    for (i = 0; i < MAX_LINE_LEN; i++) {
        lines[cur_row + 1][i] = rest[i];
    }

    num_lines++;
    cur_row++;
    cur_col = 0;
    dirty = 1;
}

/* ---- Cut current line (Ctrl+K) ---- */

static void cut_line(void) {
    int i;
    for (i = 0; i < MAX_LINE_LEN; i++) {
        cut_buf[i] = lines[cur_row][i];
    }
    has_cut = 1;

    if (num_lines <= 1) {
        /* Only one line: just clear it */
        lines[0][0] = '\0';
        cur_col = 0;
    } else {
        /* Remove line by shifting down */
        for (i = cur_row; i < num_lines - 1; i++) {
            int j;
            for (j = 0; j < MAX_LINE_LEN; j++) {
                lines[i][j] = lines[i + 1][j];
            }
        }
        num_lines--;
        if (cur_row >= num_lines) cur_row = num_lines - 1;
        if (cur_col > my_strlen(lines[cur_row])) {
            cur_col = my_strlen(lines[cur_row]);
        }
    }
    dirty = 1;
}

/* ---- Paste (uncut) above current line (Ctrl+U) ---- */

static void paste_line(void) {
    if (!has_cut) {
        msg[0] = '\0';
        int i;
        for (i = 0; i < 14; i++) msg[i] = "Nothing to paste"[i];
        msg[14] = '\0';
        msg_timer = 120;
        return;
    }
    if (num_lines >= MAX_LINES) return;

    /* Shift all lines from cur_row down */
    int i, j;
    for (i = num_lines; i > cur_row; i--) {
        for (j = 0; j < MAX_LINE_LEN; j++) {
            lines[i][j] = lines[i - 1][j];
        }
    }

    /* Insert cut buffer at cur_row */
    for (i = 0; i < MAX_LINE_LEN; i++) {
        lines[cur_row][i] = cut_buf[i];
    }
    num_lines++;
    dirty = 1;
}

/* ---- Ensure cursor is visible (scroll viewport) ---- */

static void ensure_cursor_visible(void) {
    if (cur_row < scroll_row) {
        scroll_row = cur_row;
    } else if (cur_row >= scroll_row + VIEW_ROWS) {
        scroll_row = cur_row - VIEW_ROWS + 1;
    }
    if (scroll_row < 0) scroll_row = 0;
}

/* ---- Render the entire screen ---- */

static void render_screen(void) {
    /* Clear viewport area */
    geos_memset((void *)GEOS_FB_BASE, 0, GEOS_FB_WIDTH * STATUS_ROW * 4);

    /* Draw text lines */
    for (int r = 0; r < VIEW_ROWS; r++) {
        int line_idx = scroll_row + r;
        int y = r * LINE_H;

        if (line_idx < num_lines) {
            const char *text = lines[line_idx];
            int col = 0;
            while (*text && col < COLS) {
                geos_draw_char(col * CHAR_W, y, *text, COL_TEXT_FG, COL_TEXT_BG);
                text++;
                col++;
            }
            /* Clear rest of line */
            while (col < COLS) {
                geos_draw_char(col * CHAR_W, y, ' ', COL_TEXT_FG, COL_TEXT_BG);
                col++;
            }
        } else {
            /* Empty line below buffer: draw tilde */
            geos_draw_char(0, y, '~', 0x808080FFu, COL_TEXT_BG);
        }
    }

    /* Draw cursor (inverted block) */
    {
        int vis_row = cur_row - scroll_row;
        int cx = cur_col * CHAR_W;
        int cy = vis_row * LINE_H;
        /* Draw a block cursor */
        if (vis_row >= 0 && vis_row < VIEW_ROWS) {
            char ch = ' ';
            if (cur_row < num_lines) {
                int len = my_strlen(lines[cur_row]);
                if (cur_col < len) ch = lines[cur_row][cur_col];
            }
            /* Draw inverted char (bg=white, fg=black) */
            geos_draw_char(cx, cy, ch, COL_STATUS_FG, COL_STATUS_BG);
        }
    }

    /* Draw status bar (row 30) */
    {
        /* Background */
        int y = STATUS_ROW;
        for (int c = 0; c < COLS; c++) {
            geos_draw_char(c * CHAR_W, y, ' ', COL_STATUS_FG, COL_STATUS_BG);
        }

        /* Filename or "New Buffer" */
        const char *fname = filename[0] ? filename : "New Buffer";
        int x = 0;
        while (*fname && x < 18) {
            geos_draw_char(x * CHAR_W, y, *fname, COL_STATUS_FG, COL_STATUS_BG);
            fname++;
            x++;
        }

        /* Line/col indicator */
        char lbuf[16];
        int li = 0;
        int ln = cur_row + 1;
        int tmp;
        /* Convert line number */
        if (ln == 0) { lbuf[li++] = '0'; }
        else {
            char nbuf[8]; int ni = 0;
            while (ln > 0) { nbuf[ni++] = '0' + (ln % 10); ln /= 10; }
            while (ni > 0) lbuf[li++] = nbuf[--ni];
        }
        lbuf[li++] = ',';
        int cn = cur_col + 1;
        if (cn == 0) { lbuf[li++] = '0'; }
        else {
            char nbuf[8]; int ni = 0;
            while (cn > 0) { nbuf[ni++] = '0' + (cn % 10); cn /= 10; }
            while (ni > 0) lbuf[li++] = nbuf[--ni];
        }
        lbuf[li] = '\0';

        /* Draw at right side */
        int lbuf_len = my_strlen(lbuf);
        int lbuf_x = COLS - lbuf_len - (dirty ? 2 : 0);
        if (lbuf_x < 0) lbuf_x = 0;
        for (int i = 0; i < lbuf_len; i++) {
            geos_draw_char((lbuf_x + i) * CHAR_W, y, lbuf[i],
                           COL_STATUS_FG, COL_STATUS_BG);
        }

        /* Modified indicator */
        if (dirty) {
            geos_draw_char((COLS - 2) * CHAR_W, y, '[',
                           COL_STATUS_FG, COL_STATUS_BG);
            geos_draw_char((COLS - 1) * CHAR_W, y, '+',
                           COL_STATUS_FG, COL_STATUS_BG);
        }
    }

    /* Draw shortcut bar (row 31) */
    {
        int y = SHORTCUT_ROW;
        const char *shortcuts = "^O Save ^X Exit ^R Open ^K Cut ^U Paste";
        int x = 0;
        while (*shortcuts && x < COLS) {
            geos_draw_char(x * CHAR_W, y, *shortcuts, COL_SHORT_FG, COL_SHORT_BG);
            shortcuts++;
            x++;
        }
        /* Fill rest */
        while (x < COLS) {
            geos_draw_char(x * CHAR_W, y, ' ', COL_SHORT_FG, COL_SHORT_BG);
            x++;
        }
    }

    /* Draw message overlay if active */
    if (msg_timer > 0) {
        int y = STATUS_ROW;
        int x = 0;
        /* Background */
        for (int c = 0; c < COLS; c++) {
            geos_draw_char(c * CHAR_W, y, ' ', COL_STATUS_FG, COL_STATUS_BG);
        }
        while (msg[x] && x < COLS) {
            geos_draw_char(x * CHAR_W, y, msg[x], COL_STATUS_FG, COL_STATUS_BG);
            x++;
        }
    }

    /* Draw prompt input if active */
    if (prompting) {
        int y = STATUS_ROW;
        int x = 0;
        /* Background */
        for (int c = 0; c < COLS; c++) {
            geos_draw_char(c * CHAR_W, y, ' ', COL_STATUS_FG, COL_STATUS_BG);
        }
        /* Prompt label */
        const char *label = prompt_save ? "Save as: " : "Open: ";
        while (*label && x < COLS) {
            geos_draw_char(x * CHAR_W, y, *label, COL_STATUS_FG, COL_STATUS_BG);
            label++;
            x++;
        }
        /* Typed text */
        for (int i = 0; i < prompt_len && x < COLS; i++) {
            geos_draw_char(x * CHAR_W, y, prompt_buf[i], COL_STATUS_FG, COL_STATUS_BG);
            x++;
        }
        /* Cursor blink (block) */
        if (x < COLS) {
            geos_draw_char(x * CHAR_W, y, ' ', COL_STATUS_BG, COL_STATUS_FG);
        }
    }

    /* Draw file browser if active */
    if (browsing) {
        /* Darken viewport */
        /* (skip - just draw browser list) */
        int y = 0;
        /* Header */
        const char *hdr = "  -- Open File --";
        int x = 0;
        while (hdr[x] && x < COLS) {
            geos_draw_char(x * CHAR_W, y, hdr[x], COL_STATUS_FG, COL_STATUS_BG);
            x++;
        }
        while (x < COLS) {
            geos_draw_char(x * CHAR_W, y, ' ', COL_STATUS_FG, COL_STATUS_BG);
            x++;
        }
        y = LINE_H;

        /* File list */
        for (int i = 0; i < browse_count && y < STATUS_ROW - LINE_H; i++) {
            x = 0;
            if (i == browse_sel) {
                /* Highlight selected */
                for (int c = 0; c < COLS; c++) {
                    geos_draw_char(c * CHAR_W, y, ' ',
                                   COL_STATUS_FG, COL_STATUS_BG);
                }
                /* Arrow indicator */
                geos_draw_char(0, y, '>', COL_STATUS_FG, COL_STATUS_BG);
            } else {
                for (int c = 0; c < COLS; c++) {
                    geos_draw_char(c * CHAR_W, y, ' ',
                                   COL_TEXT_FG, COL_TEXT_BG);
                }
            }
            /* File index */
            char idx_str[8];
            int fi = 0;
            int num = i + 1;
            if (num == 0) { idx_str[fi++] = '0'; }
            else {
                char nb[8]; int ni = 0;
                while (num > 0) { nb[ni++] = '0' + (num % 10); num /= 10; }
                while (ni > 0) idx_str[fi++] = nb[--ni];
            }
            idx_str[fi++] = ':';
            idx_str[fi++] = ' ';
            idx_str[fi] = '\0';
            x = 2;
            for (int j = 0; idx_str[j] && x < COLS; j++, x++) {
                uint32_t fg = (i == browse_sel) ? COL_STATUS_FG : COL_TEXT_FG;
                uint32_t bg = (i == browse_sel) ? COL_STATUS_BG : COL_TEXT_BG;
                geos_draw_char(x * CHAR_W, y, idx_str[j], fg, bg);
            }
            /* Show row and hash info */
            char info[24];
            int ii = 0;
            /* "row=N hash=0xNNNN" */
            const char *r1 = "row=";
            while (*r1) info[ii++] = *r1++;
            int rv = (int)browse_entries[i].start_row;
            if (rv == 0) info[ii++] = '0';
            else {
                char nb[8]; int ni = 0;
                while (rv > 0) { nb[ni++] = '0' + (rv % 10); rv /= 10; }
                while (ni > 0) info[ii++] = nb[--ni];
            }
            info[ii++] = ' ';
            const char *r2 = "h=0x";
            while (*r2) info[ii++] = *r2++;
            uint32_t hv = browse_entries[i].name_hash;
            const char *hx = "0123456789ABCDEF";
            for (int b = 12; b >= 0; b -= 4) {
                info[ii++] = hx[(hv >> b) & 0xF];
            }
            info[ii] = '\0';
            for (int j = 0; info[j] && x < COLS; j++, x++) {
                uint32_t fg = (i == browse_sel) ? COL_STATUS_FG : COL_TEXT_FG;
                uint32_t bg = (i == browse_sel) ? COL_STATUS_BG : COL_TEXT_BG;
                geos_draw_char(x * CHAR_W, y, info[j], fg, bg);
            }
            y += LINE_H;
        }

        /* Footer */
        const char *ft = "Up/Down=Select  Enter=Open  Esc=Cancel";
        x = 0;
        y = STATUS_ROW;
        while (ft[x] && x < COLS) {
            geos_draw_char(x * CHAR_W, y, ft[x], COL_STATUS_FG, COL_STATUS_BG);
            x++;
        }
        while (x < COLS) {
            geos_draw_char(x * CHAR_W, y, ' ', COL_STATUS_FG, COL_STATUS_BG);
            x++;
        }
    }
}

/* ---- Serialize buffer to flat text ---- */

static int serialize_buffer(char *out, int max_len) {
    int pos = 0;
    for (int i = 0; i < num_lines && pos < max_len - 1; i++) {
        const char *line = lines[i];
        while (*line && pos < max_len - 1) {
            out[pos++] = *line++;
        }
        if (i < num_lines - 1 && pos < max_len - 1) {
            out[pos++] = '\n';
        }
    }
    out[pos] = '\0';
    return pos;
}

/* ---- Parse flat text into lines ---- */

static void parse_text_to_lines(const char *text, int len) {
    num_lines = 0;
    int line_pos = 0;

    for (int i = 0; i < len && num_lines < MAX_LINES; i++) {
        if (text[i] == '\n') {
            lines[num_lines][line_pos] = '\0';
            num_lines++;
            line_pos = 0;
        } else if (line_pos < MAX_LINE_LEN - 1) {
            lines[num_lines][line_pos++] = text[i];
        }
    }
    /* Last line (no trailing newline) */
    lines[num_lines][line_pos] = '\0';
    num_lines++;
    if (num_lines == 0) {
        num_lines = 1;
        lines[0][0] = '\0';
    }
}

/* ---- Save buffer to VFS ---- */

static int save_to_vfs(const char *name) {
    char buf[65536];
    int len = serialize_buffer(buf, sizeof(buf));

    /* Check if file already exists */
    struct vfs_entry entries[32];
    int n = vfs_list(entries, 32);
    int idx = vfs_find_by_name(name, entries, 32);

    if (idx >= 0) {
        /* Overwrite existing file */
        vfs_write((int)entries[idx].start_row, buf, len);
    } else {
        /* Create new file */
        int row = vfs_find_free_row();
        if (row < 0) {
            msg[0] = '\0';
            const char *e = "VFS full!";
            int i;
            for (i = 0; e[i]; i++) msg[i] = e[i];
            msg[i] = '\0';
            msg_timer = 120;
            return -1;
        }
        vfs_create(name, row, buf, len);
    }

    vfs_flush();

    /* Copy filename */
    int i;
    for (i = 0; name[i] && i < MAX_LINE_LEN - 1; i++) {
        filename[i] = name[i];
    }
    filename[i] = '\0';
    dirty = 0;

    msg[0] = '\0';
    const char *s = "Saved ";
    int j;
    for (j = 0; s[j]; j++) msg[j] = s[j];
    for (i = 0; name[i] && j < MAX_LINE_LEN - 1; i++, j++) {
        msg[j] = name[i];
    }
    msg[j] = '\0';
    msg_timer = 120;
    return 0;
}

/* ---- Load file from VFS ---- */

static int load_from_vfs(const char *name) {
    struct vfs_entry entries[32];
    int n = vfs_list(entries, 32);
    int idx = vfs_find_by_name(name, entries, 32);

    if (idx < 0) {
        msg[0] = '\0';
        const char *e = "File not found!";
        int i;
        for (i = 0; e[i]; i++) msg[i] = e[i];
        msg[i] = '\0';
        msg_timer = 120;
        return -1;
    }

    char buf[65536];
    int bytes = vfs_read((int)entries[idx].start_row, buf, sizeof(buf));
    if (bytes <= 0) {
        msg[0] = '\0';
        const char *e = "Read error!";
        int i;
        for (i = 0; e[i]; i++) msg[i] = e[i];
        msg[i] = '\0';
        msg_timer = 120;
        return -1;
    }

    parse_text_to_lines(buf, bytes);
    cur_row = 0;
    cur_col = 0;
    scroll_row = 0;
    dirty = 0;

    /* Copy filename */
    int i;
    for (i = 0; name[i] && i < MAX_LINE_LEN - 1; i++) {
        filename[i] = name[i];
    }
    filename[i] = '\0';

    msg[0] = '\0';
    const char *o = "Opened ";
    int j;
    for (j = 0; o[j]; j++) msg[j] = o[j];
    for (i = 0; name[i] && j < MAX_LINE_LEN - 1; i++, j++) {
        msg[j] = name[i];
    }
    msg[j] = '\0';
    msg_timer = 120;
    return 0;
}

/* ---- Show help ---- */

static void show_help(void) {
    msg[0] = '\0';
    const char *h = "Arrows=Move  BS=Del  ^O=Save  ^X=Exit  ^R=Open";
    int i;
    for (i = 0; h[i] && i < MAX_LINE_LEN - 1; i++) {
        msg[i] = h[i];
    }
    msg[i] = '\0';
    msg_timer = 180;
}

/* ---- Main entry point ---- */

void c_start(void) {
    geos_puts("editor: Geometry OS nano-like text editor\n");
    geos_puts("^O=Save ^X=Exit ^R=Open ^K=Cut ^U=Paste\n");

    init_buffer();

    /* Initialize framebuffer */
    geos_memset((void *)GEOS_FB_BASE, 0, GEOS_FB_WIDTH * GEOS_FB_HEIGHT * 4);

    /* Load welcome text */
    const char *welcome[] = {
        "Welcome to editor!",
        "",
        "This is a nano-like text editor",
        "for Geometry OS.",
        "",
        "Key bindings:",
        "  Arrow keys   Move cursor",
        "  Type         Insert text",
        "  Backspace    Delete char",
        "  Enter        New line",
        "  Ctrl+O       Save file",
        "  Ctrl+X       Exit editor",
        "  Ctrl+R       Open file",
        "  Ctrl+K       Cut line",
        "  Ctrl+U       Paste line",
        "  Ctrl+G       Help",
        "  PageUp/Dn    Scroll",
        "",
        "Files are stored in the VFS",
        "pixel surface.",
        "",
        "Start typing to edit!",
        0
    };
    num_lines = 0;
    int wi = 0;
    while (welcome[wi] && num_lines < MAX_LINES) {
        int j = 0;
        while (welcome[wi][j] && j < MAX_LINE_LEN - 1) {
            lines[num_lines][j] = welcome[wi][j];
            j++;
        }
        lines[num_lines][j] = '\0';
        num_lines++;
        wi++;
    }

    /* Initial render */
    ensure_cursor_visible();
    render_screen();
    geos_fb_present();
    geos_puts("editor: ready\n");

    /* Main event loop */
    while (1) {
        char ch = geos_getchar();

        /* Handle message timer */
        if (msg_timer > 0) msg_timer--;

        /* ---- Prompt mode (filename input) ---- */
        if (prompting) {
            if (ch == '\n' || ch == '\r') {
                /* Confirm */
                prompt_buf[prompt_len] = '\0';
                prompting = 0;
                if (prompt_len > 0) {
                    if (prompt_save) {
                        save_to_vfs(prompt_buf);
                    } else {
                        load_from_vfs(prompt_buf);
                    }
                }
            } else if (ch == 27) {
                /* Escape: cancel */
                prompting = 0;
            } else if (ch == 127 || ch == 8) {
                /* Backspace in prompt */
                if (prompt_len > 0) prompt_len--;
            } else if (prompt_len < MAX_LINE_LEN - 1 && ch >= 32 && ch < 127) {
                prompt_buf[prompt_len++] = ch;
            }
            ensure_cursor_visible();
            render_screen();
            geos_fb_present();
            continue;
        }

        /* ---- File browser mode ---- */
        if (browsing) {
            if (ch == 27) {
                /* Escape: cancel */
                browsing = 0;
            } else if (ch == '\n' || ch == '\r') {
                /* Enter: open selected file */
                if (browse_count > 0 && browse_sel < browse_count) {
                    browsing = 0;
                    /* We can't get the filename from hash alone, so load by row */
                    char buf[65536];
                    int bytes = vfs_read((int)browse_entries[browse_sel].start_row,
                                        buf, sizeof(buf));
                    if (bytes > 0) {
                        parse_text_to_lines(buf, bytes);
                        cur_row = 0;
                        cur_col = 0;
                        scroll_row = 0;
                        dirty = 0;
                        filename[0] = '\0';
                    }
                }
            } else if (ch == 'A' || ch == 'a') {
                /* Up arrow (SBI sends 'A' for arrow) */
                if (browse_sel > 0) browse_sel--;
            } else if (ch == 'B' || ch == 'b') {
                /* Down arrow */
                if (browse_sel < browse_count - 1) browse_sel++;
            }
            ensure_cursor_visible();
            render_screen();
            geos_fb_present();
            continue;
        }

        /* ---- Normal editing mode ---- */

        /* Control characters */
        if (ch == 15) {
            /* Ctrl+O: Save */
            prompting = 1;
            prompt_save = 1;
            prompt_len = 0;
            /* Pre-fill with current filename */
            int i;
            for (i = 0; filename[i] && i < MAX_LINE_LEN - 1; i++) {
                prompt_buf[i] = filename[i];
            }
            prompt_len = i;
            ensure_cursor_visible();
            render_screen();
            geos_fb_present();
            continue;
        }

        if (ch == 24) {
            /* Ctrl+X: Exit */
            if (dirty) {
                prompting = 1;
                prompt_save = 1;
                prompt_len = 0;
                int i;
                for (i = 0; filename[i] && i < MAX_LINE_LEN - 1; i++) {
                    prompt_buf[i] = filename[i];
                }
                prompt_len = i;
                msg[0] = '\0';
                const char *w = "Save before exit? (^O) or ^X again to quit";
                int j;
                for (j = 0; w[j] && j < MAX_LINE_LEN - 1; j++) msg[j] = w[j];
                msg[j] = '\0';
                msg_timer = 180;
                ensure_cursor_visible();
                render_screen();
                geos_fb_present();
                continue;
            }
            /* Not dirty: exit */
            break;
        }

        if (ch == 18) {
            /* Ctrl+R: Open file from VFS */
            browse_count = vfs_list(browse_entries, 32);
            if (browse_count <= 0) {
                msg[0] = '\0';
                const char *e = "No files in VFS";
                int i;
                for (i = 0; e[i]; i++) msg[i] = e[i];
                msg[i] = '\0';
                msg_timer = 120;
            } else {
                browsing = 1;
                browse_sel = 0;
            }
            ensure_cursor_visible();
            render_screen();
            geos_fb_present();
            continue;
        }

        if (ch == 11) {
            /* Ctrl+K: Cut line */
            cut_line();
            ensure_cursor_visible();
            render_screen();
            geos_fb_present();
            continue;
        }

        if (ch == 21) {
            /* Ctrl+U: Paste line */
            paste_line();
            ensure_cursor_visible();
            render_screen();
            geos_fb_present();
            continue;
        }

        if (ch == 7) {
            /* Ctrl+G: Help */
            show_help();
            ensure_cursor_visible();
            render_screen();
            geos_fb_present();
            continue;
        }

        /* Arrow keys (SBI sends escape sequences) */
        if (ch == 27) {
            /* Escape sequence: read next two chars */
            char seq1 = geos_getchar();
            char seq2 = geos_getchar();

            if (seq1 == '[') {
                if (seq2 == 'A') {
                    /* Up arrow */
                    if (cur_row > 0) {
                        cur_row--;
                        if (cur_col > my_strlen(lines[cur_row])) {
                            cur_col = my_strlen(lines[cur_row]);
                        }
                    }
                } else if (seq2 == 'B') {
                    /* Down arrow */
                    if (cur_row < num_lines - 1) {
                        cur_row++;
                        if (cur_col > my_strlen(lines[cur_row])) {
                            cur_col = my_strlen(lines[cur_row]);
                        }
                    }
                } else if (seq2 == 'C') {
                    /* Right arrow */
                    if (cur_col < my_strlen(lines[cur_row])) {
                        cur_col++;
                    }
                } else if (seq2 == 'D') {
                    /* Left arrow */
                    if (cur_col > 0) {
                        cur_col--;
                    }
                } else if (seq2 == '5') {
                    /* PageUp: read '~' */
                    geos_getchar();
                    scroll_row -= VIEW_ROWS;
                    if (scroll_row < 0) scroll_row = 0;
                    cur_row = scroll_row;
                    if (cur_col > my_strlen(lines[cur_row])) {
                        cur_col = my_strlen(lines[cur_row]);
                    }
                } else if (seq2 == '6') {
                    /* PageDown: read '~' */
                    geos_getchar();
                    scroll_row += VIEW_ROWS;
                    if (scroll_row > num_lines - VIEW_ROWS) {
                        scroll_row = num_lines - VIEW_ROWS;
                    }
                    if (scroll_row < 0) scroll_row = 0;
                    cur_row = scroll_row + VIEW_ROWS - 1;
                    if (cur_row >= num_lines) cur_row = num_lines - 1;
                    if (cur_col > my_strlen(lines[cur_row])) {
                        cur_col = my_strlen(lines[cur_row]);
                    }
                } else if (seq2 == '1') {
                    /* Home or PageUp variant: read next char */
                    char seq3 = geos_getchar();
                    if (seq3 == '~') {
                        /* Home */
                        cur_col = 0;
                    } else if (seq3 == '5') {
                        /* PageUp: read '~' */
                        geos_getchar();
                        scroll_row -= VIEW_ROWS;
                        if (scroll_row < 0) scroll_row = 0;
                        cur_row = scroll_row;
                        if (cur_col > my_strlen(lines[cur_row])) {
                            cur_col = my_strlen(lines[cur_row]);
                        }
                    }
                } else if (seq2 == '4') {
                    /* End variant: read '~' */
                    char seq3 = geos_getchar();
                    if (seq3 == '~') {
                        /* End */
                        cur_col = my_strlen(lines[cur_row]);
                    }
                }
            }
            ensure_cursor_visible();
            render_screen();
            geos_fb_present();
            continue;
        }

        /* Backspace */
        if (ch == 127 || ch == 8) {
            backspace();
            ensure_cursor_visible();
            render_screen();
            geos_fb_present();
            continue;
        }

        /* Delete */
        if (ch == 0x7F) {
            delete_char();
            ensure_cursor_visible();
            render_screen();
            geos_fb_present();
            continue;
        }

        /* Enter / Newline */
        if (ch == '\n' || ch == '\r') {
            insert_newline();
            ensure_cursor_visible();
            render_screen();
            geos_fb_present();
            continue;
        }

        /* Printable characters: insert at cursor */
        if (ch >= 32 && ch < 127) {
            insert_char(ch);
            ensure_cursor_visible();
            render_screen();
            geos_fb_present();
            continue;
        }

        /* Ignore other control characters */
    }

    /* Exit: clear screen and shut down */
    geos_memset((void *)GEOS_FB_BASE, 0, GEOS_FB_WIDTH * GEOS_FB_HEIGHT * 4);
    geos_fb_present();
    geos_puts("editor: exited\n");
    sbi_shutdown();
}
