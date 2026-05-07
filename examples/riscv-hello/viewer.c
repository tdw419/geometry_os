/*
 * viewer.c -- Interactive file viewer for Geometry OS RISC-V hypervisor.
 *
 * A bare-metal pager that reads files from the Pixel VFS Surface and
 * displays them with line numbers, scrolling, and search.
 *
 * Features:
 *   - 4-digit line numbers on the left
 *   - Up/Down arrow keys scroll by 1 line
 *   - PageUp/PageDown scroll by visible_lines
 *   - Home jumps to line 1, End jumps to last line
 *   - / enters search mode: type pattern, Enter searches forward
 *   - n jumps to next search match, p jumps to previous
 *   - Tab cycles through open files
 *   - q quits
 *   - Status bar shows filename, line, percentage, search state
 *
 * Uses libfb for framebuffer rendering, libgeos for SBI I/O,
 * vfs_pixel.h for file reading.
 *
 * Build: ./build.sh viewer.c viewer.elf
 * Run:   cargo run --release --example viewer_run
 */

#include "libgeos.h"
#include "libfb.h"
#include "vfs_pixel.h"

/* ---- Colors (0xRRGGBBAA) ---- */
#define COL_BG         0x0A0A14FFu
#define COL_LINENUM    0x506080FFu  /* dim blue-gray for line numbers */
#define COL_TEXT       0xC8D0D8FFu  /* light gray for file content */
#define COL_STATUSBG   0x1A1A2AFFu
#define COL_STATUSFG   0x90A0B0FFu
#define COL_TITLEBG    0x20203AFFu
#define COL_TITLEFG    0xD0D8E0FFu
#define COL_HIGHLIGHT  0x304060FFu  /* highlight for current line */
#define COL_SEARCH     0x80FF80FFu  /* green for search match indicator */
#define COL_SEARCHFG   0x000000FFu  /* black text on search highlight */
#define COL_EMPTY      0x303040FFu  /* for ~ (past-EOF) lines */
#define COL_EMPTYFG    0x505060FFu
#define COL_INPUTBG    0x20203AFFu  /* search input bar */
#define COL_INPUTFG    0xFFFFFFFFu

/* ---- Layout (256x256 framebuffer, 6x7 font) ---- */
#define FONT_W         6
#define FONT_H         7
#define FB_W           256
#define FB_H           256

/* Line number width: 4 digits + 1 space + 1 separator = 6 chars = 36px */
#define LINENUM_CHARS  6
#define LINENUM_PX     (LINENUM_CHARS * FONT_W)  /* 36 */
#define CONTENT_X      LINENUM_PX
#define CONTENT_W      (FB_W - CONTENT_X)        /* 220 */
#define CHARS_PER_LINE (CONTENT_W / FONT_W)       /* 36 chars */
#define TITLE_Y        0
#define TITLE_H        12
#define CONTENT_Y      TITLE_H
#define CONTENT_LINES  ((FB_H - TITLE_H - 10) / FONT_H)  /* ~32 lines */
#define STATUS_Y       (FB_H - 10)
#define STATUS_H       10
#define INPUT_Y        STATUS_Y

/* ---- File buffer ---- */
#define MAX_FILE_SIZE  8192
#define MAX_LINES      1024
#define MAX_FILES      16
#define SEARCH_BUF_LEN 64

/* Line info: pointer into file buffer + length */
struct line_info {
    const char *start;
    int len;      /* byte length (excluding newline) */
};

/* ---- Viewer state ---- */
static char file_buf[MAX_FILE_SIZE];
static struct line_info lines[MAX_LINES];
static int total_lines = 0;
static int file_size = 0;

/* View state */
static int scroll_offset = 0;    /* first visible line (0-based) */
static int cursor_line = 0;      /* highlighted line (0-based) */
static int active_file = 0;      /* index into open_files */

/* Open file list */
static struct vfs_entry open_files[MAX_FILES];
static int open_file_count = 0;

/* Search state */
static int searching = 0;
static char search_buf[SEARCH_BUF_LEN];
static int search_len = 0;
static int search_match_line = -1;  /* current match (0-based), -1 = none */
static int search_match_count = 0; /* total matches */

/* Input state (for search mode) */
static int input_mode = 0;  /* 1 = accepting search input */
static char input_buf[SEARCH_BUF_LEN];
static int input_pos = 0;

/* ---- Forward declarations ---- */
static void load_file(int file_index);
static void render(void);
static void render_title(void);
static void render_content(void);
static void render_status(void);
static void render_search_input(void);
static void parse_lines(void);
static int find_next_match(int from_line);
static int find_prev_match(int from_line);
static void do_search(void);

/* ---- Parse file buffer into lines ---- */
static void parse_lines(void) {
    total_lines = 0;
    if (file_size == 0) return;

    int i = 0;
    while (i < file_size && total_lines < MAX_LINES) {
        lines[total_lines].start = &file_buf[i];
        int len = 0;
        while (i + len < file_size && file_buf[i + len] != '\n') {
            len++;
        }
        lines[total_lines].len = len;
        total_lines++;
        i += len + 1;  /* skip newline */
        if (i > file_size) break;
    }
}

/* ---- Load a file from VFS into buffer ---- */
static void load_file(int file_index) {
    if (file_index < 0 || file_index >= open_file_count) return;

    struct vfs_entry *e = &open_files[file_index];
    file_size = vfs_read((int)e->start_row, file_buf, MAX_FILE_SIZE - 1);
    if (file_size < 0) file_size = 0;
    file_buf[file_size] = '\0';

    parse_lines();
    scroll_offset = 0;
    cursor_line = 0;
    search_match_line = -1;
    search_match_count = 0;
}

/* ---- Find next search match from a given line ---- */
static int find_next_match(int from_line) {
    if (search_len == 0) return -1;
    for (int i = from_line + 1; i < total_lines; i++) {
        /* Simple substring search */
        const char *s = lines[i].start;
        int slen = lines[i].len;
        for (int j = 0; j <= slen - search_len; j++) {
            int match = 1;
            for (int k = 0; k < search_len; k++) {
                if (s[j + k] != search_buf[k]) { match = 0; break; }
            }
            if (match) return i;
        }
    }
    /* Wrap around */
    for (int i = 0; i <= from_line && i < total_lines; i++) {
        const char *s = lines[i].start;
        int slen = lines[i].len;
        for (int j = 0; j <= slen - search_len; j++) {
            int match = 1;
            for (int k = 0; k < search_len; k++) {
                if (s[j + k] != search_buf[k]) { match = 0; break; }
            }
            if (match) return i;
        }
    }
    return -1;
}

/* ---- Find previous search match ---- */
static int find_prev_match(int from_line) {
    if (search_len == 0) return -1;
    for (int i = from_line - 1; i >= 0; i--) {
        const char *s = lines[i].start;
        int slen = lines[i].len;
        for (int j = 0; j <= slen - search_len; j++) {
            int match = 1;
            for (int k = 0; k < search_len; k++) {
                if (s[j + k] != search_buf[k]) { match = 0; break; }
            }
            if (match) return i;
        }
    }
    /* Wrap around */
    for (int i = total_lines - 1; i >= from_line && i >= 0; i--) {
        const char *s = lines[i].start;
        int slen = lines[i].len;
        for (int j = 0; j <= slen - search_len; j++) {
            int match = 1;
            for (int k = 0; k < search_len; k++) {
                if (s[j + k] != search_buf[k]) { match = 0; break; }
            }
            if (match) return i;
        }
    }
    return -1;
}

/* ---- Execute search: count all matches, jump to first ---- */
static void do_search(void) {
    if (search_len == 0) {
        search_match_line = -1;
        search_match_count = 0;
        return;
    }
    search_match_count = 0;
    int first_match = -1;
    for (int i = 0; i < total_lines; i++) {
        const char *s = lines[i].start;
        int slen = lines[i].len;
        for (int j = 0; j <= slen - search_len; j++) {
            int match = 1;
            for (int k = 0; k < search_len; k++) {
                if (s[j + k] != search_buf[k]) { match = 0; break; }
            }
            if (match) {
                search_match_count++;
                if (first_match < 0) first_match = i;
            }
        }
    }
    if (first_match >= 0) {
        search_match_line = first_match;
        cursor_line = first_match;
        scroll_offset = first_match;
        if (scroll_offset > total_lines - CONTENT_LINES)
            scroll_offset = total_lines - CONTENT_LINES;
        if (scroll_offset < 0) scroll_offset = 0;
    } else {
        search_match_line = -1;
    }
}

/* ---- Render: title bar ---- */
static void render_title(void) {
    fb_rect(0, TITLE_Y, FB_W, TITLE_H, COL_TITLEBG);

    /* File indicator: [1/3] filename */
    char title[64];
    int pos = 0;
    title[pos++] = '[';
    /* decimal for active_file+1 */
    {
        uint32_t v = (uint32_t)(active_file + 1);
        char tmp[8];
        int ti = 0;
        if (v == 0) { tmp[ti++] = '0'; }
        while (v > 0) { tmp[ti++] = '0' + (v % 10); v /= 10; }
        while (ti > 0) title[pos++] = tmp[--ti];
    }
    title[pos++] = '/';
    {
        uint32_t v = (uint32_t)open_file_count;
        char tmp[8];
        int ti = 0;
        if (v == 0) { tmp[ti++] = '0'; }
        while (v > 0) { tmp[ti++] = '0' + (v % 10); v /= 10; }
        while (ti > 0) title[pos++] = tmp[--ti];
    }
    title[pos++] = ']';
    title[pos++] = ' ';
    /* Show "viewer" as placeholder (no filename in VFS) */
    const char *label = "viewer";
    while (*label) title[pos++] = *label++;
    title[pos] = '\0';

    fb_text(4, TITLE_Y + 2, COL_TITLEFG, title);

    /* Right side: line info */
    char info[32];
    int ip = 0;
    {
        uint32_t v = (uint32_t)(cursor_line + 1);
        char tmp[8];
        int ti = 0;
        if (v == 0) { tmp[ti++] = '0'; }
        while (v > 0) { tmp[ti++] = '0' + (v % 10); v /= 10; }
        while (ti > 0) info[ip++] = tmp[--ti];
    }
    info[ip++] = '/';
    {
        uint32_t v = (uint32_t)total_lines;
        char tmp[8];
        int ti = 0;
        if (v == 0) { tmp[ti++] = '0'; }
        while (v > 0) { tmp[ti++] = '0' + (v % 10); v /= 10; }
        while (ti > 0) info[ip++] = tmp[--ti];
    }
    info[ip] = '\0';
    /* Right-align: measure string width */
    int info_w = ip * FONT_W;
    fb_text(FB_W - info_w - 4, TITLE_Y + 2, COL_TITLEFG, info);
}

/* ---- Render: file content with line numbers ---- */
static void render_content(void) {
    fb_rect(0, CONTENT_Y, FB_W, CONTENT_LINES * FONT_H, COL_BG);

    for (int row = 0; row < CONTENT_LINES; row++) {
        int line_idx = scroll_offset + row;
        int y = CONTENT_Y + row * FONT_H;

        /* Highlight current line */
        if (line_idx == cursor_line && line_idx < total_lines) {
            fb_rect(0, y, FB_W, FONT_H, COL_HIGHLIGHT);
        }

        /* Past-EOF indicator */
        if (line_idx >= total_lines) {
            if (line_idx == cursor_line) {
                fb_rect(0, y, FB_W, FONT_H, COL_HIGHLIGHT);
            }
            fb_text(CONTENT_X, y, COL_EMPTYFG, "~");
            continue;
        }

        /* Line number (4 digits, right-aligned in 5 chars + space) */
        char lnum[8];
        int lp = 0;
        uint32_t ln = (uint32_t)(line_idx + 1);
        if (ln < 10) { lnum[lp++] = ' '; lnum[lp++] = ' '; lnum[lp++] = ' '; }
        else if (ln < 100) { lnum[lp++] = ' '; lnum[lp++] = ' '; }
        else if (ln < 1000) { lnum[lp++] = ' '; }
        {
            char tmp[8];
            int ti = 0;
            uint32_t v = ln;
            if (v == 0) { tmp[ti++] = '0'; }
            while (v > 0) { tmp[ti++] = '0' + (v % 10); v /= 10; }
            while (ti > 0) lnum[lp++] = tmp[--ti];
        }
        lnum[lp++] = ' ';
        lnum[lp] = '\0';
        fb_text(2, y, COL_LINENUM, lnum);

        /* Separator: thin vertical line at LINENUM_PX - 2 */
        for (int sy = 0; sy < FONT_H; sy++) {
            fb_pixel(LINENUM_PX - 2, y + sy, 0x303050FFu);
        }

        /* File content (truncate to CHARS_PER_LINE) */
        const char *start = lines[line_idx].start;
        int len = lines[line_idx].len;
        if (len > CHARS_PER_LINE) len = CHARS_PER_LINE;

        /* Search match highlighting */
        int is_match = (line_idx == search_match_line && search_len > 0);

        if (is_match && len > 0) {
            /* Find match position within line */
            int match_col = -1;
            for (int j = 0; j <= len - search_len; j++) {
                int ok = 1;
                for (int k = 0; k < search_len; k++) {
                    if (start[j + k] != search_buf[k]) { ok = 0; break; }
                }
                if (ok) { match_col = j; break; }
            }
            if (match_col >= 0) {
                /* Draw before match */
                if (match_col > 0) {
                    char before[40];
                    int bl = match_col;
                    if (bl > (int)sizeof(before) - 1) bl = (int)sizeof(before) - 1;
                    for (int bi = 0; bi < bl; bi++) before[bi] = start[bi];
                    before[bl] = '\0';
                    fb_text(CONTENT_X, y, COL_TEXT, before);
                }
                /* Draw match highlight */
                int hl_w = search_len * FONT_W;
                int hl_x = CONTENT_X + match_col * FONT_W;
                fb_rect(hl_x - 1, y, hl_w + 2, FONT_H, COL_SEARCH);
                char match_str[SEARCH_BUF_LEN + 1];
                int ml = search_len;
                if (ml > (int)sizeof(match_str) - 1) ml = (int)sizeof(match_str) - 1;
                for (int mi = 0; mi < ml; mi++) match_str[mi] = start[match_col + mi];
                match_str[ml] = '\0';
                fb_text(hl_x, y, COL_SEARCHFG, match_str);
                /* Draw after match */
                int after_start = match_col + search_len;
                if (after_start < len) {
                    char after[40];
                    int al = len - after_start;
                    if (al > (int)sizeof(after) - 1) al = (int)sizeof(after) - 1;
                    for (int ai = 0; ai < al; ai++) after[ai] = start[after_start + ai];
                    after[al] = '\0';
                    fb_text(CONTENT_X + after_start * FONT_W, y, COL_TEXT, after);
                }
                continue;
            }
        }

        /* Normal text rendering */
        if (len > 0) {
            char line_buf[40];
            if (len > (int)sizeof(line_buf) - 1) len = (int)sizeof(line_buf) - 1;
            for (int ci = 0; ci < len; ci++) line_buf[ci] = start[ci];
            line_buf[len] = '\0';
            fb_text(CONTENT_X, y, COL_TEXT, line_buf);
        }
    }
}

/* ---- Render: status bar ---- */
static void render_status(void) {
    fb_rect(0, STATUS_Y, FB_W, STATUS_H, COL_STATUSBG);

    if (input_mode) return;  /* input bar drawn separately */

    char status[48];
    int pos = 0;

    /* Left: percentage */
    int pct = 0;
    if (total_lines > 1) {
        pct = (cursor_line * 100) / (total_lines - 1);
        if (pct > 100) pct = 100;
    }
    {
        char tmp[8];
        int ti = 0;
        uint32_t v = (uint32_t)pct;
        if (v == 0) { tmp[ti++] = '0'; }
        while (v > 0) { tmp[ti++] = '0' + (v % 10); v /= 10; }
        while (ti > 0) status[pos++] = tmp[--ti];
    }
    status[pos++] = '%';
    status[pos++] = ' ';

    /* Search info */
    if (search_len > 0) {
        status[pos++] = '/';
        for (int i = 0; i < search_len && i < 12; i++)
            status[pos++] = search_buf[i];
        if (search_len > 12) { status[pos++] = '.'; status[pos++] = '.'; }
        status[pos++] = ' ';
        if (search_match_count > 0) {
            /* show match index */
            uint32_t v = (uint32_t)(search_match_line + 1);
            char tmp[8];
            int ti = 0;
            if (v == 0) { tmp[ti++] = '0'; }
            while (v > 0) { tmp[ti++] = '0' + (v % 10); v /= 10; }
            while (ti > 0) status[pos++] = tmp[--ti];
            status[pos++] = '/';
            v = (uint32_t)search_match_count;
            ti = 0;
            if (v == 0) { tmp[ti++] = '0'; }
            while (v > 0) { tmp[ti++] = '0' + (v % 10); v /= 10; }
            while (ti > 0) status[pos++] = tmp[--ti];
        } else {
            const char *no = "(none)";
            while (*no) status[pos++] = *no++;
        }
    }
    status[pos] = '\0';

    fb_text(4, STATUS_Y + 2, COL_STATUSFG, status);

    /* Right side: key hints */
    fb_text(FB_W - 120, STATUS_Y + 2, COL_STATUSFG, "q=quit /=search Tab");
}

/* ---- Render: search input bar ---- */
static void render_search_input(void) {
    fb_rect(0, INPUT_Y, FB_W, STATUS_H, COL_INPUTBG);

    char prompt[SEARCH_BUF_LEN + 16];
    int pos = 0;
    prompt[pos++] = '/';
    for (int i = 0; i < input_pos && i < SEARCH_BUF_LEN - 1; i++)
        prompt[pos++] = input_buf[i];
    /* Cursor */
    prompt[pos++] = '_';
    prompt[pos] = '\0';

    fb_text(4, INPUT_Y + 2, COL_INPUTFG, prompt);
}

/* ---- Full render ---- */
static void render(void) {
    if (input_mode) {
        render_title();
        render_content();
        render_search_input();
    } else {
        render_title();
        render_content();
        render_status();
    }
    fb_present();
}

/* ---- Clamp scroll so cursor is visible ---- */
static void clamp_scroll(void) {
    if (cursor_line < 0) cursor_line = 0;
    if (cursor_line >= total_lines) cursor_line = total_lines - 1;
    if (cursor_line < 0) cursor_line = 0;  /* empty file */

    if (scroll_offset > cursor_line) scroll_offset = cursor_line;
    if (scroll_offset + CONTENT_LINES <= cursor_line)
        scroll_offset = cursor_line - CONTENT_LINES + 1;
    if (scroll_offset < 0) scroll_offset = 0;
}

/* ---- Main loop ---- */
void c_start(void) {
    /* 1. List VFS files */
    open_file_count = vfs_list(open_files, MAX_FILES);
    if (open_file_count <= 0) {
        fb_init();
        fb_text(4, 100, 0xFF8080FFu, "No files in VFS");
        fb_present();
        geos_wait_ms(3000);
        sbi_shutdown();
    }

    /* 2. Load first file */
    load_file(0);
    fb_init();
    render();

    /* 3. Input loop */
    for (;;) {
        char ch = geos_getchar();
        if (ch < 0) {
            geos_wait_ms(1);
            continue;
        }

        /* ---- Search input mode ---- */
        if (input_mode) {
            if (ch == '\n' || ch == '\r') {
                /* Execute search */
                search_len = input_pos;
                for (int i = 0; i < search_len; i++) search_buf[i] = input_buf[i];
                search_buf[search_len] = '\0';
                input_mode = 0;
                do_search();
                render();
                continue;
            }
            if (ch == 0x7F || ch == 0x08) {  /* backspace */
                if (input_pos > 0) input_pos--;
                render();
                continue;
            }
            if (ch == 0x1B) {  /* escape cancels */
                input_mode = 0;
                render();
                continue;
            }
            /* Regular character */
            if (input_pos < SEARCH_BUF_LEN - 1 && ch >= ' ' && ch <= '~') {
                input_buf[input_pos++] = ch;
                render();
            }
            continue;
        }

        /* ---- Normal mode ---- */
        switch (ch) {
        case 'q':
            sbi_shutdown();
            break;

        case '/':
            /* Enter search mode */
            input_mode = 1;
            input_pos = 0;
            render();
            break;

        case 'n':
            /* Next search match */
            if (search_len > 0) {
                search_match_line = find_next_match(search_match_line >= 0 ? search_match_line : 0);
                if (search_match_line >= 0) {
                    cursor_line = search_match_line;
                    clamp_scroll();
                }
                render();
            }
            break;

        case 'p':
            /* Previous search match */
            if (search_len > 0) {
                search_match_line = find_prev_match(search_match_line >= 0 ? search_match_line : 0);
                if (search_match_line >= 0) {
                    cursor_line = search_match_line;
                    clamp_scroll();
                }
                render();
            }
            break;

        case '\t':
            /* Cycle to next file */
            if (open_file_count > 1) {
                active_file = (active_file + 1) % open_file_count;
                load_file(active_file);
                render();
            }
            break;

        /* Arrow keys: ESC [ A/B/C/D */
        case 0x1B: {
            /* Read next two chars of escape sequence */
            char c1 = geos_getchar();
            if (c1 != '[') break;
            char c2 = geos_getchar();
            switch (c2) {
            case 'A':  /* Up */
                cursor_line--;
                clamp_scroll();
                render();
                break;
            case 'B':  /* Down */
                cursor_line++;
                clamp_scroll();
                render();
                break;
            case '5': {  /* PageUp: ESC [ 5 ~ */
                char c3 = geos_getchar();  /* consume '~' */
                (void)c3;
                scroll_offset -= CONTENT_LINES;
                cursor_line = scroll_offset + CONTENT_LINES / 2;
                clamp_scroll();
                render();
                break;
            }
            case '6': {  /* PageDown: ESC [ 6 ~ */
                char c3 = geos_getchar();  /* consume '~' */
                (void)c3;
                scroll_offset += CONTENT_LINES;
                cursor_line = scroll_offset + CONTENT_LINES / 2;
                clamp_scroll();
                render();
                break;
            }
            case 'H':  /* Home */
                cursor_line = 0;
                scroll_offset = 0;
                render();
                break;
            case 'F':  /* End */
                cursor_line = total_lines - 1;
                if (cursor_line < 0) cursor_line = 0;
                scroll_offset = cursor_line - CONTENT_LINES + 1;
                if (scroll_offset < 0) scroll_offset = 0;
                render();
                break;
            }
            break;
        }

        default:
            /* Ignore unknown keys */
            break;
        }
    }
}
