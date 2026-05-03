/*
 * vi.c -- Minimal vi-like text editor for Geometry OS RISC-V guest
 *
 * A modal text editor inspired by vi/ex with normal mode, insert mode,
 * and command-line mode. Edits a single in-memory buffer, with save/load
 * via the VFS pixel surface.
 *
 * Screen layout (256x256 framebuffer):
 *   Rows 0-27:  Text viewport (28 rows of 8px = 224px)
 *   Row 28:     Status line (mode indicator, file info)
 *   Row 29-31: Command line (for : and / prompts)
 *
 * Font: 5x7 bitmap, 6px char advance, 8px line height
 * Viewport: 42 columns x 28 rows
 *
 * Normal mode commands:
 *   h/j/k/l      Move cursor left/down/up/right
 *   w/b          Move forward/backward by word
 *   0/$          Move to start/end of line
 *   x            Delete character under cursor
 *   dd           Delete current line (yanks)
 *   yy           Yank current line
 *   p            Paste yanked line below current
 *   P            Paste yanked line above current
 *   i/a          Enter insert mode (before/after cursor)
 *   o/O          Open new line below/above and enter insert mode
 *   A            Enter insert mode at end of line
 *   G            Go to last line
 *   1G           Go to first line (prefix number + G)
 *   u            Undo last change (single-level)
 *   :w           Save to VFS surface
 *   :q           Quit
 *   :wq          Save and quit
 *   :q!          Force quit without saving
 *   /pattern     Search forward
 *   n            Repeat last search
 *   N            Repeat last search backward
 *
 * Insert mode:
 *   Printable chars  Insert at cursor
 *   Backspace       Delete character before cursor
 *   Enter           Insert newline
 *   Escape          Return to normal mode
 *
 * Build: ./build.sh vi.c vi.elf
 * Run:   cargo run --release --example riscv_run -- vi.elf
 */
#include "libgeos.h"
#include "libfb.h"

/* ---- Editor dimensions ---- */

#define CHAR_W     6    /* 5px glyph + 1px spacing */
#define LINE_H     8    /* 7px glyph + 1px spacing */
#define VIEW_COLS  42   /* 256 / 6 = 42 cols */
#define VIEW_ROWS  28   /* text viewport rows */
#define STATUS_ROW 224  /* y pixel for status line (28 * 8) */
#define CMD_ROW    232  /* y pixel for command line (29 * 8) */

/* ---- Buffer limits ---- */

#define MAX_LINES    256
#define MAX_LINE_LEN 256

/* ---- Editor state ---- */

/* Line buffer: array of fixed-size line strings */
static char lines[MAX_LINES][MAX_LINE_LEN];
static int  num_lines;          /* number of active lines (>= 1) */
static int  cur_row;            /* cursor line (0-based) */
static int  cur_col;            /* cursor column (0-based) */
static int  scroll_row;         /* top of viewport (first visible line) */
static int  dirty;              /* buffer modified since last save */
static char filename[64];       /* display name (cosmetic) */

/* Yank buffer (single line) */
static char yank_buf[MAX_LINE_LEN];
static int  has_yank;

/* Undo state (single-level: saves full line before edit) */
static char undo_line[MAX_LINE_LEN];
static int  undo_row;
static int  undo_col;
static int  undo_num_lines;
static char undo_deleted[MAX_LINE_LEN]; /* for line delete undo */
static int  undo_had_deleted;

/* Search state */
static char search_pattern[MAX_LINE_LEN];
static int  has_search;
static int  search_dir;          /* 1=forward, -1=backward */

/* Mode: 0=normal, 1=insert, 2=command-line */
static int mode;

/* Command line buffer (for : and / prompts) */
static char cmdbuf[MAX_LINE_LEN];
static int  cmdbuf_len;
static char cmd_prompt;          /* ':' or '/' */

/* ---- Color palette ---- */

#define COL_TEXT      0xD0D0D0FF  /* light gray for text */
#define COL_CURSOR   0xFFFF00FF  /* yellow cursor block */
#define COL_STATUS   0x3C64FFFF  /* blue status line */
#define COL_STATUS_T 0xFFFFFFFF  /* white status text */
#define COL_CMDLINE  0x000000FF  /* black cmd line bg */
#define COL_CMDTEXT  0xFFFFFFFF  /* white cmd text */
#define COL_HILITE   0x3C3CFFFF  /* dim blue for search match */
#define COL_MSG      0x00FF00FF  /* green for messages */

/* ---- Drawing helpers ---- */

/* Draw a character with inverse video (cursor block) */
static void draw_cursor_char(int x, int y, char ch) {
    /* Draw background block */
    fb_rect(x * CHAR_W, y * LINE_H, CHAR_W, LINE_H, COL_CURSOR);
    /* Draw character in black on yellow */
    fb_char(x * CHAR_W, y * LINE_H, 0x000000FF, ch);
}

/* Clear the status line and draw new content */
static void draw_status(const char *text) {
    fb_rect(0, STATUS_ROW, 256, LINE_H, COL_STATUS);
    fb_text(2, STATUS_ROW + 1, COL_STATUS_T, text);
}

/* Clear the command line */
static void clear_cmdline(void) {
    fb_rect(0, CMD_ROW, 256, 24, COL_CMDLINE);
}

/* Draw text on command line */
static void draw_cmdline(const char *prompt, const char *text) {
    clear_cmdline();
    char buf[MAX_LINE_LEN + 4];
    int i = 0;
    if (prompt) {
        for (const char *p = prompt; *p && i < (int)sizeof(buf) - 1; p++) {
            buf[i++] = *p;
        }
    }
    if (text) {
        for (int j = 0; text[j] && i < (int)sizeof(buf) - 1; j++) {
            buf[i++] = text[j];
        }
    }
    buf[i] = '\0';
    fb_text(2, CMD_ROW + 1, COL_CMDTEXT, buf);
}

/* ---- Screen rendering ---- */

/* Render the visible portion of the buffer to the framebuffer */
static void render_screen(void) {
    /* Clear viewport area */
    fb_rect(0, 0, 256, STATUS_ROW, 0x000000FF);

    /* Draw visible lines */
    for (int row = 0; row < VIEW_ROWS; row++) {
        int line_idx = scroll_row + row;
        int y_px = row * LINE_H;

        if (line_idx < num_lines) {
            const char *text = lines[line_idx];
            /* Draw line number gutter (6 chars wide) */
            char gutter[8];
            /* Simple line number (modulo 1000) */
            int lnum = (line_idx + 1) % 1000;
            gutter[0] = '0' + (lnum / 100);
            gutter[1] = '0' + ((lnum / 10) % 10);
            gutter[2] = '0' + (lnum % 10);
            gutter[3] = ' ';
            gutter[4] = '\0';
            fb_text(0, y_px + 1, 0x448844FF, gutter);

            /* Draw text content starting at column 6 (after gutter) */
            for (int col = 0; col < VIEW_COLS - 7 && text[col]; col++) {
                fb_char((7 + col) * CHAR_W, y_px + 1, COL_TEXT, text[col]);
            }
        } else {
            /* Empty line: draw ~ marker like vi */
            fb_text(7 * CHAR_W, y_px + 1, 0x3C3C3CFF, "~");
        }
    }

    /* Draw cursor (only if cursor is visible) */
    int vis_row = cur_row - scroll_row;
    if (vis_row >= 0 && vis_row < VIEW_ROWS) {
        char ch = ' ';
        if (cur_row < num_lines && cur_col < geos_strlen(lines[cur_row])) {
            ch = lines[cur_row][cur_col];
        }
        draw_cursor_char(7 + cur_col, vis_row, ch);
    }

    /* Draw status line */
    char status[64];
    if (mode == 0) {
        /* Normal mode */
        const char *mod = dirty ? " [modified]" : "";
        int len = 0;
        status[len++] = '-';
        status[len++] = '-';
        status[len++] = ' ';
        status[len++] = 'N';
        status[len++] = 'O';
        status[len++] = 'R';
        status[len++] = 'M';
        status[len++] = 'A';
        status[len++] = 'L';
        status[len++] = ' ';
        status[len++] = '-';
        status[len++] = '-';
        for (int i = 0; mod[i] && len < 62; i++) status[len++] = mod[i];
        /* cursor position */
        {
            char pos[16];
            pos[0] = ' ';
            pos[1] = 'r';
            pos[2] = '0' + ((cur_row + 1) / 10);
            pos[3] = '0' + ((cur_row + 1) % 10);
            pos[4] = 'c';
            pos[5] = '0' + ((cur_col + 1) / 10);
            pos[6] = '0' + ((cur_col + 1) % 10);
            pos[7] = '\0';
            for (int i = 0; pos[i] && len < 62; i++) status[len++] = pos[i];
        }
        status[len] = '\0';
    } else if (mode == 1) {
        /* Insert mode */
        int len = 0;
        status[len++] = '-';
        status[len++] = '-';
        status[len++] = ' ';
        status[len++] = 'I';
        status[len++] = 'N';
        status[len++] = 'S';
        status[len++] = 'E';
        status[len++] = 'R';
        status[len++] = 'T';
        status[len++] = ' ';
        status[len++] = '-';
        status[len++] = '-';
        status[len] = '\0';
    } else {
        status[0] = '\0';
    }
    draw_status(status);
}

/* Ensure cursor is visible by adjusting scroll */
static void ensure_cursor_visible(void) {
    if (cur_row < scroll_row) {
        scroll_row = cur_row;
    } else if (cur_row >= scroll_row + VIEW_ROWS) {
        scroll_row = cur_row - VIEW_ROWS + 1;
    }
    /* Clamp scroll */
    if (scroll_row < 0) scroll_row = 0;
    if (scroll_row > num_lines - VIEW_ROWS) scroll_row = num_lines - VIEW_ROWS;
    if (scroll_row < 0) scroll_row = 0;
}

/* ---- Undo system (single-level) ---- */

static void save_undo(void) {
    undo_row = cur_row;
    undo_col = cur_col;
    undo_num_lines = num_lines;
    if (cur_row < num_lines) {
        for (int i = 0; i < MAX_LINE_LEN; i++) {
            undo_line[i] = lines[cur_row][i];
        }
    } else {
        undo_line[0] = '\0';
    }
    undo_had_deleted = 0;
}

static void save_undo_delete(int row) {
    save_undo();
    if (row < num_lines) {
        for (int i = 0; i < MAX_LINE_LEN; i++) {
            undo_deleted[i] = lines[row][i];
        }
        undo_had_deleted = 1;
    }
}

/* ---- Line management ---- */

/* Insert a new empty line at position `at`, shifting lines down */
static void insert_line(int at) {
    if (num_lines >= MAX_LINES) return;
    for (int i = num_lines; i > at; i--) {
        for (int j = 0; j < MAX_LINE_LEN; j++) {
            lines[i][j] = lines[i - 1][j];
        }
    }
    lines[at][0] = '\0';
    num_lines++;
}

/* Delete line at position `at`, shifting lines up */
static void delete_line(int at) {
    if (at < 0 || at >= num_lines) return;
    for (int i = at; i < num_lines - 1; i++) {
        for (int j = 0; j < MAX_LINE_LEN; j++) {
            lines[i][j] = lines[i + 1][j];
        }
    }
    num_lines--;
    if (num_lines < 1) {
        lines[0][0] = '\0';
        num_lines = 1;
    }
}

/* Get line length (clamped to MAX_LINE_LEN) */
static int line_len(int row) {
    if (row < 0 || row >= num_lines) return 0;
    int len = 0;
    while (len < MAX_LINE_LEN - 1 && lines[row][len]) len++;
    return len;
}

/* ---- Normal mode commands ---- */

static void cmd_move_left(void) {
    if (cur_col > 0) cur_col--;
}

static void cmd_move_right(void) {
    int len = line_len(cur_row);
    if (cur_col < len) cur_col++;
}

static void cmd_move_down(void) {
    if (cur_row < num_lines - 1) {
        cur_row++;
        /* Clamp column to new line length */
        int len = line_len(cur_row);
        if (cur_col > len) cur_col = len;
    }
}

static void cmd_move_up(void) {
    if (cur_row > 0) {
        cur_row--;
        /* Clamp column to new line length */
        int len = line_len(cur_row);
        if (cur_col > len) cur_col = len;
    }
}

static void cmd_move_home(void) {
    cur_col = 0;
}

static void cmd_move_end(void) {
    cur_col = line_len(cur_row);
}

/* Move forward by word */
static void cmd_word_forward(void) {
    int len = line_len(cur_row);
    int col = cur_col;

    /* Skip current word (alphanumeric) */
    while (col < len && ((lines[cur_row][col] >= 'a' && lines[cur_row][col] <= 'z') ||
                         (lines[cur_row][col] >= 'A' && lines[cur_row][col] <= 'Z') ||
                         (lines[cur_row][col] >= '0' && lines[cur_row][col] <= '9'))) {
        col++;
    }
    /* Skip whitespace/punctuation */
    while (col < len && !((lines[cur_row][col] >= 'a' && lines[cur_row][col] <= 'z') ||
                          (lines[cur_row][col] >= 'A' && lines[cur_row][col] <= 'Z') ||
                          (lines[cur_row][col] >= '0' && lines[cur_row][col] <= '9'))) {
        col++;
    }

    if (col >= len && cur_row < num_lines - 1) {
        /* Move to start of next line */
        cur_row++;
        cur_col = 0;
    } else {
        cur_col = col;
    }
}

/* Move backward by word */
static void cmd_word_backward(void) {
    int col = cur_col;

    if (col == 0) {
        if (cur_row > 0) {
            cur_row--;
            cur_col = line_len(cur_row);
        }
        return;
    }

    col--;
    /* Skip whitespace/punctuation backward */
    while (col > 0 && !((lines[cur_row][col] >= 'a' && lines[cur_row][col] <= 'z') ||
                         (lines[cur_row][col] >= 'A' && lines[cur_row][col] <= 'Z') ||
                         (lines[cur_row][col] >= '0' && lines[cur_row][col] <= '9'))) {
        col--;
    }
    /* Skip word backward */
    while (col > 0 && ((lines[cur_row][col - 1] >= 'a' && lines[cur_row][col - 1] <= 'z') ||
                        (lines[cur_row][col - 1] >= 'A' && lines[cur_row][col - 1] <= 'Z') ||
                        (lines[cur_row][col - 1] >= '0' && lines[cur_row][col - 1] <= '9'))) {
        col--;
    }

    cur_col = col;
}

static void cmd_delete_char(void) {
    int len = line_len(cur_row);
    if (cur_col >= len) return;

    save_undo();
    /* Shift characters left */
    for (int i = cur_col; i < len - 1; i++) {
        lines[cur_row][i] = lines[cur_row][i + 1];
    }
    lines[cur_row][len - 1] = '\0';
    dirty = 1;
}

static void cmd_delete_line(void) {
    if (num_lines <= 1) {
        /* Only line: just clear it */
        save_undo();
        lines[0][0] = '\0';
        cur_col = 0;
        dirty = 1;
        return;
    }

    save_undo_delete(cur_row);
    /* Copy line to yank buffer */
    for (int i = 0; i < MAX_LINE_LEN; i++) {
        yank_buf[i] = lines[cur_row][i];
    }
    has_yank = 1;

    delete_line(cur_row);
    /* Adjust cursor if past end */
    if (cur_row >= num_lines) cur_row = num_lines - 1;
    int len = line_len(cur_row);
    if (cur_col > len) cur_col = len;
    dirty = 1;
}

static void cmd_yank_line(void) {
    for (int i = 0; i < MAX_LINE_LEN; i++) {
        yank_buf[i] = lines[cur_row][i];
    }
    has_yank = 1;
}

static void cmd_paste_below(void) {
    if (!has_yank) return;
    save_undo();
    insert_line(cur_row + 1);
    for (int i = 0; i < MAX_LINE_LEN; i++) {
        lines[cur_row + 1][i] = yank_buf[i];
    }
    cur_row++;
    dirty = 1;
}

static void cmd_paste_above(void) {
    if (!has_yank) return;
    save_undo();
    insert_line(cur_row);
    for (int i = 0; i < MAX_LINE_LEN; i++) {
        lines[cur_row][i] = yank_buf[i];
    }
    dirty = 1;
}

static void cmd_goto_line(int target) {
    if (target < 1) target = 1;
    if (target > num_lines) target = num_lines;
    cur_row = target - 1;
    int len = line_len(cur_row);
    if (cur_col > len) cur_col = len;
}

static void cmd_undo(void) {
    /* Restore the saved line */
    if (undo_num_lines == num_lines) {
        for (int i = 0; i < MAX_LINE_LEN; i++) {
            lines[undo_row][i] = undo_line[i];
        }
    }
}

/* ---- Search ---- */

static int find_in_line(int row, const char *pattern, int start_col) {
    if (!pattern[0]) return -1;
    int plen = 0;
    while (pattern[plen]) plen++;

    int len = line_len(row);
    for (int col = start_col; col + plen <= len; col++) {
        int match = 1;
        for (int j = 0; j < plen; j++) {
            if (lines[row][col + j] != pattern[j]) {
                match = 0;
                break;
            }
        }
        if (match) return col;
    }
    return -1;
}

static void cmd_search_forward(void) {
    if (!has_search || !search_pattern[0]) return;

    /* Search from current position (start after cursor) */
    int col = find_in_line(cur_row, search_pattern, cur_col + 1);
    if (col >= 0) {
        cur_col = col;
        return;
    }

    /* Search subsequent lines */
    for (int row = cur_row + 1; row < num_lines; row++) {
        col = find_in_line(row, search_pattern, 0);
        if (col >= 0) {
            cur_row = row;
            cur_col = col;
            return;
        }
    }

    /* Wrap around to beginning */
    for (int row = 0; row <= cur_row; row++) {
        int start = (row == cur_row) ? cur_col + 1 : 0;
        col = find_in_line(row, search_pattern, start);
        if (col >= 0) {
            cur_row = row;
            cur_col = col;
            return;
        }
    }

    geos_puts("vi: Pattern not found\n");
}

static void cmd_search_backward(void) {
    if (!has_search || !search_pattern[0]) return;

    /* Search backward from current position */
    for (int row = cur_row; row >= 0; row--) {
        int start = (row == cur_row) ? cur_col - 1 : line_len(row) - 1;
        /* Simple reverse search: find last occurrence before start */
        int last_match = -1;
        int plen = 0;
        while (search_pattern[plen]) plen++;
        for (int col = 0; col + plen <= start + 1; col++) {
            int match = 1;
            for (int j = 0; j < plen; j++) {
                if (lines[row][col + j] != search_pattern[j]) {
                    match = 0;
                    break;
                }
            }
            if (match) last_match = col;
        }
        if (last_match >= 0) {
            cur_row = row;
            cur_col = last_match;
            return;
        }
    }

    /* Wrap around from end */
    for (int row = num_lines - 1; row > cur_row; row--) {
        int last_match = -1;
        int plen = 0;
        while (search_pattern[plen]) plen++;
        for (int col = 0; col + plen <= line_len(row); col++) {
            int match = 1;
            for (int j = 0; j < plen; j++) {
                if (lines[row][col + j] != search_pattern[j]) {
                    match = 0;
                    break;
                }
            }
            if (match) last_match = col;
        }
        if (last_match >= 0) {
            cur_row = row;
            cur_col = last_match;
            return;
        }
    }

    geos_puts("vi: Pattern not found\n");
}

/* ---- Command-line execution ---- */

static int execute_command(const char *cmd) {
    /* Skip leading whitespace */
    while (*cmd == ' ') cmd++;

    if (cmd[0] == 'w') {
        if (cmd[1] == 'q' && (cmd[2] == '\0' || cmd[2] == ' ')) {
            /* :wq - save and quit */
            geos_puts("vi: saving...\n");
            if (geos_save_canvas() == 0) {
                dirty = 0;
                geos_puts("vi: saved\n");
                return -1;
            } else {
                geos_puts("vi: save failed\n");
                return 1;
            }
        } else if (cmd[1] == '\0' || cmd[1] == ' ') {
            /* :w - save */
            geos_puts("vi: saving...\n");
            if (geos_save_canvas() == 0) {
                dirty = 0;
                geos_puts("vi: saved\n");
                return 0;
            } else {
                geos_puts("vi: save failed\n");
                return 1;
            }
        }
    } else if (cmd[0] == 'q') {
        if (cmd[1] == '!' || (!dirty && cmd[1] == '\0')) {
            /* :q! or :q (if not dirty) */
            return -1; /* signal quit */
        } else if (cmd[1] == '\0') {
            geos_puts("vi: No write since last change (use :q!)\n");
            return 1;
        } else if (cmd[1] == 'w' && (cmd[2] == '\0' || cmd[2] == ' ')) {
            /* :qw or :wq - save and quit */
            geos_puts("vi: saving...\n");
            if (geos_save_canvas() == 0) {
                dirty = 0;
                geos_puts("vi: saved\n");
                return -1;
            } else {
                geos_puts("vi: save failed\n");
                return 1;
            }
        }
    } else if (cmd[0] >= '0' && cmd[0] <= '9') {
        /* :N - go to line N */
        int line_num = 0;
        while (*cmd >= '0' && *cmd <= '9') {
            line_num = line_num * 10 + (*cmd - '0');
            cmd++;
        }
        cmd_goto_line(line_num);
        return 0;
    } else if (cmd[0] == 's' && cmd[1] == 'e' && cmd[2] == 't') {
        /* :set - minimal (ignore) */
        geos_puts("vi: set not implemented\n");
        return 1;
    } else {
        geos_puts("vi: Unknown command: ");
        geos_puts(cmd);
        geos_puts("\n");
        return 1;
    }
    return 1;
}

/* ---- Insert mode ---- */

static void insert_char_at_cursor(char ch) {
    int len = line_len(cur_row);
    if (len >= MAX_LINE_LEN - 1) return; /* line full */

    save_undo();

    /* Shift characters right */
    for (int i = len; i > cur_col; i--) {
        lines[cur_row][i] = lines[cur_row][i - 1];
    }
    lines[cur_row][cur_col] = ch;
    lines[cur_row][len + 1] = '\0';
    cur_col++;
    dirty = 1;
}

static void backspace_in_insert(void) {
    if (cur_col == 0) {
        /* At start of line: merge with previous line */
        if (cur_row == 0) return;
        save_undo();

        int prev_len = line_len(cur_row - 1);
        int cur_len = line_len(cur_row);

        /* Check if combined line fits */
        if (prev_len + cur_len >= MAX_LINE_LEN - 1) return;

        /* Append current line to previous */
        for (int i = 0; i < cur_len; i++) {
            lines[cur_row - 1][prev_len + i] = lines[cur_row][i];
        }
        lines[cur_row - 1][prev_len + cur_len] = '\0';

        delete_line(cur_row);
        cur_row--;
        cur_col = prev_len;
        dirty = 1;
    } else {
        save_undo();
        int len = line_len(cur_row);
        /* Shift characters left */
        for (int i = cur_col - 1; i < len - 1; i++) {
            lines[cur_row][i] = lines[cur_row][i + 1];
        }
        lines[cur_row][len - 1] = '\0';
        cur_col--;
        dirty = 1;
    }
}

static void enter_in_insert(void) {
    save_undo();

    int len = line_len(cur_row);
    if (len - cur_col >= MAX_LINE_LEN - 1) return; /* rest too long */

    /* Split line at cursor */
    insert_line(cur_row + 1);

    /* Move text after cursor to new line */
    int rest_len = 0;
    for (int i = cur_col; i < len; i++) {
        lines[cur_row + 1][rest_len++] = lines[cur_row][i];
    }
    lines[cur_row + 1][rest_len] = '\0';
    lines[cur_row][cur_col] = '\0';

    cur_row++;
    cur_col = 0;
    dirty = 1;
}

/* ---- Default buffer content ---- */

static void init_buffer(void) {
    num_lines = 1;
    lines[0][0] = '\0';
    cur_row = 0;
    cur_col = 0;
    scroll_row = 0;
    dirty = 0;
    has_yank = 0;
    has_search = 0;
    mode = 0;
    filename[0] = '\0';
    cmdbuf[0] = '\0';
    cmdbuf_len = 0;
}

/* Load a demo file into the buffer */
static void load_demo(void) {
    init_buffer();

    const char *demo_lines[] = {
        "Welcome to vi for Geometry OS!",
        "",
        "This is a minimal vi-like text editor.",
        "It supports normal mode, insert mode,",
        "and command-line mode.",
        "",
        "Normal mode commands:",
        "  h/j/k/l  - move cursor",
        "  i/a/o    - enter insert mode",
        "  x        - delete character",
        "  dd       - delete line",
        "  yy       - yank line",
        "  p        - paste below",
        "  w/b      - word movement",
        "  0/$      - line home/end",
        "  G        - go to last line",
        "  u        - undo",
        "  /pattern - search forward",
        "  n/N      - next/prev search",
        "",
        "Command-line mode (: commands):",
        "  :w  - save canvas to VFS",
        "  :q  - quit",
        "  :wq - save and quit",
        "  :N  - go to line N",
        "",
        "Press i to start editing!",
        0
    };

    int i = 0;
    while (demo_lines[i] && num_lines < MAX_LINES) {
        int j = 0;
        while (demo_lines[i][j] && j < MAX_LINE_LEN - 1) {
            lines[num_lines - 1][j] = demo_lines[i][j];
            j++;
        }
        lines[num_lines - 1][j] = '\0';
        num_lines++;
        i++;
    }
    /* num_lines was incremented one extra time */
    if (num_lines > 1) num_lines--;

    /* Fix: we started with 1 line and added demo_lines for each */
    /* Actually let me redo this properly */
    num_lines = 0;
    i = 0;
    while (demo_lines[i] && num_lines < MAX_LINES) {
        int j = 0;
        while (demo_lines[i][j] && j < MAX_LINE_LEN - 1) {
            lines[num_lines][j] = demo_lines[i][j];
            j++;
        }
        lines[num_lines][j] = '\0';
        num_lines++;
        i++;
    }
    if (num_lines == 0) {
        num_lines = 1;
        lines[0][0] = '\0';
    }
}

/* ---- Main loop ---- */

void c_start(void) {
    geos_puts("vi: Geometry OS text editor\n");
    geos_puts("h/j/k/l=move i/a=insert dd=delete :w=save :q=quit /=search\n");

    /* Initialize framebuffer */
    fb_init();

    /* Load demo content */
    load_demo();

    /* Initial render */
    ensure_cursor_visible();
    render_screen();
    fb_present();
    geos_puts("vi: ready\n");

    /* Normal mode pending command (for 'd' prefix, 'y' prefix, etc.) */
    int pending = 0; /* 0=none, 'd'=dd pending, 'y'=yy pending, 'g'=g prefix */

    /* Number prefix for commands like 5j, 10G */
    int num_prefix = 0;

    while (1) {
        char ch = geos_getchar();

        if (mode == 0) {
            /* ---- NORMAL MODE ---- */
            if (pending == 'd') {
                if (ch == 'd') {
                    cmd_delete_line();
                }
                pending = 0;
            } else if (pending == 'y') {
                if (ch == 'y') {
                    cmd_yank_line();
                }
                pending = 0;
            } else if (pending == 'g') {
                if (ch == 'g') {
                    cmd_goto_line(1);
                }
                pending = 0;
            } else if (ch == 'h') {
                cmd_move_left();
            } else if (ch == 'j') {
                if (num_prefix > 0) {
                    for (int i = 0; i < num_prefix; i++) cmd_move_down();
                    num_prefix = 0;
                } else {
                    cmd_move_down();
                }
            } else if (ch == 'k') {
                if (num_prefix > 0) {
                    for (int i = 0; i < num_prefix; i++) cmd_move_up();
                    num_prefix = 0;
                } else {
                    cmd_move_up();
                }
            } else if (ch == 'l') {
                cmd_move_right();
            } else if (ch == 'w') {
                cmd_word_forward();
            } else if (ch == 'b') {
                cmd_word_backward();
            } else if (ch == '0') {
                if (num_prefix > 0) {
                    num_prefix = num_prefix * 10;
                } else {
                    cmd_move_home();
                }
            } else if (ch == '$') {
                cmd_move_end();
            } else if (ch == 'x') {
                if (num_prefix > 0) {
                    for (int i = 0; i < num_prefix; i++) cmd_delete_char();
                    num_prefix = 0;
                } else {
                    cmd_delete_char();
                }
            } else if (ch == 'd') {
                pending = 'd';
            } else if (ch == 'y') {
                pending = 'y';
            } else if (ch == 'p') {
                cmd_paste_below();
            } else if (ch == 'P') {
                cmd_paste_above();
            } else if (ch == 'i') {
                save_undo();
                mode = 1;
            } else if (ch == 'a') {
                save_undo();
                /* Move cursor one position right (or to end of line) */
                int len = line_len(cur_row);
                if (cur_col < len) cur_col++;
                mode = 1;
            } else if (ch == 'A') {
                save_undo();
                cur_col = line_len(cur_row);
                mode = 1;
            } else if (ch == 'o') {
                save_undo();
                insert_line(cur_row + 1);
                cur_row++;
                cur_col = 0;
                mode = 1;
                dirty = 1;
            } else if (ch == 'O') {
                save_undo();
                insert_line(cur_row);
                cur_col = 0;
                mode = 1;
                dirty = 1;
            } else if (ch == 'G') {
                if (num_prefix > 0) {
                    cmd_goto_line(num_prefix);
                    num_prefix = 0;
                } else {
                    cmd_goto_line(num_lines);
                }
            } else if (ch == 'g') {
                pending = 'g';
            } else if (ch == 'u') {
                cmd_undo();
            } else if (ch == 'n') {
                if (search_dir == 1) cmd_search_forward();
                else cmd_search_backward();
            } else if (ch == 'N') {
                if (search_dir == 1) cmd_search_backward();
                else cmd_search_forward();
            } else if (ch == ':') {
                /* Enter command-line mode */
                mode = 2;
                cmd_prompt = ':';
                cmdbuf[0] = '\0';
                cmdbuf_len = 0;
                clear_cmdline();
                draw_cmdline(":", "");
            } else if (ch == '/') {
                /* Enter search mode */
                mode = 2;
                cmd_prompt = '/';
                cmdbuf[0] = '\0';
                cmdbuf_len = 0;
                clear_cmdline();
                draw_cmdline("/", "");
            } else if (ch >= '1' && ch <= '9') {
                num_prefix = num_prefix * 10 + (ch - '0');
            } else {
                /* Unknown key in normal mode: reset state */
                num_prefix = 0;
                pending = 0;
            }

        } else if (mode == 1) {
            /* ---- INSERT MODE ---- */
            if (ch == 0x1B) {
                /* Escape -> return to normal mode */
                mode = 0;
                /* Move cursor back one if possible (vi convention) */
                if (cur_col > 0) cur_col--;
                num_prefix = 0;
            } else if (ch == 0x7F || ch == 0x08) {
                /* Backspace */
                backspace_in_insert();
            } else if (ch == 0x0D || ch == 0x0A) {
                /* Enter */
                enter_in_insert();
            } else if (ch >= 0x20 && ch < 0x7F) {
                /* Printable character */
                insert_char_at_cursor(ch);
            }

        } else if (mode == 2) {
            /* ---- COMMAND-LINE MODE ---- */
            if (ch == 0x1B) {
                /* Escape -> cancel and return to normal mode */
                mode = 0;
                clear_cmdline();
            } else if (ch == 0x0D || ch == 0x0A) {
                /* Enter -> execute command */
                if (cmd_prompt == ':') {
                    int result = execute_command(cmdbuf);
                    if (result < 0) {
                        /* Quit */
                        geos_puts("vi: goodbye\n");
                        fb_init();
                        fb_present();
                        sbi_shutdown();
                    }
                } else if (cmd_prompt == '/') {
                    /* Execute search */
                    if (cmdbuf[0]) {
                        for (int i = 0; i < MAX_LINE_LEN; i++) {
                            search_pattern[i] = cmdbuf[i];
                        }
                        has_search = 1;
                        search_dir = 1;
                        cmd_search_forward();
                    }
                }
                mode = 0;
                clear_cmdline();
            } else if (ch == 0x7F || ch == 0x08) {
                /* Backspace */
                if (cmdbuf_len > 0) {
                    cmdbuf_len--;
                    cmdbuf[cmdbuf_len] = '\0';
                }
                draw_cmdline(&cmd_prompt, cmdbuf);
            } else if (ch >= 0x20 && ch < 0x7F) {
                /* Append to command buffer */
                if (cmdbuf_len < MAX_LINE_LEN - 1) {
                    cmdbuf[cmdbuf_len++] = ch;
                    cmdbuf[cmdbuf_len] = '\0';
                }
                draw_cmdline(&cmd_prompt, cmdbuf);
            }
        }

        /* Render after each keystroke */
        ensure_cursor_visible();
        render_screen();
        fb_present();
    }

    sbi_shutdown();
}
