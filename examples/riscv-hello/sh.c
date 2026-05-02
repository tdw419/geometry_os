/*
 * sh.c -- Bare-metal interactive mini-shell for Geometry OS RISC-V hypervisor.
 *
 * Features:
 *   - Built-ins: help, echo, clear, peek, poke, mem, hexdump, regs, ver, shutdown
 *   - New built-ins: cat, pwd, cd, export, env, history
 *   - Pipe support: cmd1 | cmd2  (up to 4 pipe stages)
 *   - Output redirection: cmd > file, cmd >> file
 *   - Input redirection: cmd < file
 *   - Pipe + redirect: cmd1 | cmd2 > file
 *   - File storage: named buffers in memory (up to 16 files, 256 bytes each)
 *
 * Uses SBI_CONSOLE_PUTCHAR (a7=1) and SBI_CONSOLE_GETCHAR (a7=2).
 * Loops forever until "shutdown" command.
 *
 * Build: ./build.sh sh.c
 * Run:   cargo run --release --example sh_run
 */

#define UART_BASE  0x10000000
#define UART_THR   (*(volatile unsigned char *)UART_BASE)
#define UART_LSR   (*(volatile unsigned char *)(UART_BASE + 5))
#define UART_LSR_DR  0x01
#define UART_LSR_THRE 0x20

/* SBI console calls */
static inline int sbi_putchar(int ch) {
    register int a0 asm("a0") = ch;
    register int a7 asm("a7") = 1;
    asm volatile("ecall" : "+r"(a0) : "r"(a7) : "memory", "a1");
    return a0;
}

static inline int sbi_getchar(void) {
    register int a0 asm("a0");
    register int a7 asm("a7") = 2;
    asm volatile("ecall" : "=r"(a0) : "r"(a7) : "memory", "a1");
    return a0;
}

static inline void sbi_shutdown(void) {
    register int a7 asm("a7") = 8;
    asm volatile("ecall" : : "r"(a7) : "memory", "a0", "a1");
    __builtin_unreachable();
}

/* UART MMIO -- used as fallback / alternative to SBI */
static inline void uart_putc(char c) {
    while (!(UART_LSR & UART_LSR_THRE))
        ;
    UART_THR = c;
}

static inline int uart_getc(void) {
    if (UART_LSR & UART_LSR_DR)
        return UART_THR;
    return -1;
}

/* ---- Output abstraction ----
 *
 * All command output goes through xputchar/xputs. When a pipe or redirect
 * is active, output is captured to a buffer instead of the console.
 */

/* Maximum pipe stages */
#define MAX_PIPE_STAGES 4
/* Pipe buffer size (per stage) */
#define PIPE_BUF_SIZE 1024
/* Maximum stored files */
#define MAX_FILES 16
/* File data size */
#define FILE_DATA_SIZE 256

/* Pipe state: when a pipe is set up, output goes here */
static char pipe_buf[MAX_PIPE_STAGES][PIPE_BUF_SIZE];
static int pipe_len[MAX_PIPE_STAGES];
static int pipe_active = 0;  /* number of active pipe stages */
static int pipe_stage = 0;   /* current stage being written */

/* Redirect state: when redirect is active, output goes to a file */
#define REDIR_NONE   0
#define REDIR_WRITE  1  /* >  (truncate) */
#define REDIR_APPEND 2  /* >> (append) */
static int redir_mode = REDIR_NONE;
static char redir_filename[64];

/* Input redirect state: when set, getchar reads from buffer */
static char *input_buf = (void *)0;
static int input_buf_len = 0;
static int input_buf_pos = 0;

/* ---- Output functions ---- */

static void xputchar(char c) {
    if (pipe_active && pipe_stage < MAX_PIPE_STAGES) {
        /* Capture to pipe buffer */
        if (pipe_len[pipe_stage] < PIPE_BUF_SIZE - 1) {
            pipe_buf[pipe_stage][pipe_len[pipe_stage]++] = c;
        }
        return;
    }
    if (redir_mode != REDIR_NONE) {
        /* Will be flushed to file storage on completion */
        if (pipe_active && pipe_stage < MAX_PIPE_STAGES) {
            if (pipe_len[pipe_stage] < PIPE_BUF_SIZE - 1) {
                pipe_buf[pipe_stage][pipe_len[pipe_stage]++] = c;
            }
        }
        return;
    }
    sbi_putchar(c);
}

static void xputs(const char *s) {
    while (*s) xputchar(*s++);
}

/* ---- Flat file storage ----
 *
 * Simple named memory buffers. Each file has a name (up to 31 chars)
 * and 256 bytes of data. Stored in a static array.
 */

struct flat_file {
    char name[32];
    char data[FILE_DATA_SIZE];
    int used;
    int len;  /* valid bytes in data */
};

static struct flat_file files[MAX_FILES];

/* Forward declarations */
static int streq(const char *a, const char *b);
static int strstarts(const char *prefix, const char *s);

/* Find a file by name, returns index or -1 */
static int file_find(const char *name) {
    for (int i = 0; i < MAX_FILES; i++) {
        if (files[i].used && streq(files[i].name, name))
            return i;
    }
    return -1;
}

/* Find or create a file, returns index or -1 */
static int file_create(const char *name) {
    int idx = file_find(name);
    if (idx >= 0) return idx;
    for (int i = 0; i < MAX_FILES; i++) {
        if (!files[i].used) {
            /* Copy name */
            int j;
            for (j = 0; j < 31 && name[j]; j++)
                files[i].name[j] = name[j];
            files[i].name[j] = 0;
            files[i].used = 1;
            files[i].len = 0;
            return i;
        }
    }
    return -1;  /* no space */
}

/* Write data to a file (truncate or append) */
static int file_write(const char *name, const char *data, int len, int append) {
    int idx = file_create(name);
    if (idx < 0) return -1;
    if (!append) {
        files[idx].len = 0;
    }
    int space = FILE_DATA_SIZE - files[idx].len;
    if (len > space) len = space;
    for (int i = 0; i < len; i++) {
        files[idx].data[files[idx].len++] = data[i];
    }
    return files[idx].len;
}

/* Read data from a file, returns length or -1 */
static int file_read(const char *name, char *buf, int bufsize) {
    int idx = file_find(name);
    if (idx < 0) return -1;
    int len = files[idx].len;
    if (len > bufsize) len = bufsize;
    for (int i = 0; i < len; i++)
        buf[i] = files[idx].data[i];
    return len;
}

/* ---- Console I/O wrappers ---- */

static void puts(const char *s) {
    while (*s) {
        sbi_putchar(*s++);
    }
}

static void putchar_console(char c) {
    sbi_putchar(c);
}

/* Read one char, blocking -- checks input redirect first */
static int getchar(void) {
    if (input_buf && input_buf_pos < input_buf_len) {
        return (unsigned char)input_buf[input_buf_pos++];
    }
    /* Reset input redirect after consuming */
    input_buf = (void *)0;
    input_buf_len = 0;
    input_buf_pos = 0;

    int c;
    c = sbi_getchar();
    if (c >= 0 && c != 0xFF) return c;
    c = uart_getc();
    if (c >= 0) return c;
    return -1;
}

/* Poll for char with tiny delay (busy-wait) */
static int getchar_wait(void) {
    if (input_buf && input_buf_pos < input_buf_len) {
        return (unsigned char)input_buf[input_buf_pos++];
    }
    for (volatile int i = 0; i < 1000; i++) {
        int c = getchar();
        if (c >= 0) return c;
    }
    return -1;
}

/* ---- Print helpers (for captured output) ---- */

static void print_uint(char c) {
    /* xputchar version of print_uint -- writes to pipe/redirect if active */
    char buf[12];
    int i = 0;
    unsigned int v = (unsigned char)c;
    if (v == 0) { xputchar('0'); return; }
    while (v > 0) {
        buf[i++] = '0' + (v % 10);
        v /= 10;
    }
    while (--i >= 0)
        xputchar(buf[i]);
}

static void print_uint_full(unsigned int v) {
    char buf[12];
    int i = 0;
    if (v == 0) { xputchar('0'); return; }
    while (v > 0) {
        buf[i++] = '0' + (v % 10);
        v /= 10;
    }
    while (--i >= 0)
        xputchar(buf[i]);
}

static void print_hex(unsigned int v) {
    const char hex[] = "0123456789abcdef";
    xputs("0x");
    for (int i = 28; i >= 0; i -= 4) {
        xputchar(hex[(v >> i) & 0xF]);
    }
}

/* Console-only versions (for prompt, errors, etc.) */
static void print_uint_console(unsigned int v) {
    char buf[12];
    int i = 0;
    if (v == 0) { putchar_console('0'); return; }
    while (v > 0) {
        buf[i++] = '0' + (v % 10);
        v /= 10;
    }
    while (--i >= 0)
        putchar_console(buf[i]);
}

static void print_hex_console(unsigned int v) {
    const char hex[] = "0123456789abcdef";
    putchar_console('0');
    putchar_console('x');
    for (int i = 28; i >= 0; i -= 4) {
        putchar_console(hex[(v >> i) & 0xF]);
    }
}

/* Parse hex string to unsigned int. Returns 1 on success. */
static int parse_hex(const char *s, unsigned int *out) {
    *out = 0;
    if (s[0] == '0' && (s[1] == 'x' || s[1] == 'X'))
        s += 2;
    if (!*s) return 0;
    while (*s) {
        char c = *s++;
        *out <<= 4;
        if (c >= '0' && c <= '9') *out |= c - '0';
        else if (c >= 'a' && c <= 'f') *out |= 10 + c - 'a';
        else if (c >= 'A' && c <= 'F') *out |= 10 + c - 'A';
        else return 0;
    }
    return 1;
}

/* Parse decimal string to unsigned int. Returns 1 on success. */
static int parse_dec(const char *s, unsigned int *out) {
    *out = 0;
    if (!*s) return 0;
    while (*s) {
        char c = *s++;
        if (c < '0' || c > '9') return 0;
        *out = *out * 10 + (c - '0');
    }
    return 1;
}

/* Memory read (volatile) */
static volatile unsigned int *mem_ptr(unsigned int addr) {
    return (volatile unsigned int *)(unsigned long)addr;
}

/* ---- Input buffer ---- */
#define IBUF_SIZE 256
static char ibuf[IBUF_SIZE];
static int ibuf_len = 0;

/* Command history */
#define HIST_SIZE 8
static char history[HIST_SIZE][IBUF_SIZE];
static int hist_count = 0;
static int hist_pos = -1;  /* -1 = not browsing */

/* Skip leading whitespace */
static const char *skip_spaces(const char *s) {
    while (*s == ' ' || *s == '\t') s++;
    return s;
}

/* Compare string with prefix */
static int streq(const char *a, const char *b) {
    while (*a && *b) {
        if (*a != *b) return 0;
        a++; b++;
    }
    return *a == 0 && *b == 0;
}

/* String prefix match (matches first N chars of b) */
static int strstarts(const char *prefix, const char *s) {
    while (*prefix) {
        if (*prefix != *s) return 0;
        prefix++; s++;
    }
    return 1;
}

/* Find next space-delimited token. Returns pointer to next non-space char. */
static const char *next_token(const char *s) {
    while (*s && *s != ' ') s++;
    return skip_spaces(s);
}

/* Copy at most n chars from src to dst, null-terminate. Returns length. */
static int strlcpy(char *dst, const char *src, int n) {
    int i;
    for (i = 0; i < n - 1 && src[i]; i++)
        dst[i] = src[i];
    dst[i] = 0;
    return i;
}

/* ---- Pipe / Redirect Parser ----
 *
 * Parses a command line into stages separated by '|' and detects
 * '>' '>>' '<' for redirection. Returns number of stages (0 on error).
 *
 * Format: cmd1 [args] [| cmd2 [args]]* [> file] [>> file] [< file]
 * Redirects are detected on the LAST stage only.
 *
 * Output: stages[] filled with pointers into (modified) ibuf,
 *         redirect info filled into redir_* globals.
 */

static char *stages[MAX_PIPE_STAGES];
static int stage_count = 0;

static int parse_pipeline(void) {
    /* Null-terminate ibuf */
    ibuf[ibuf_len] = 0;

    stage_count = 0;
    redir_mode = REDIR_NONE;
    redir_filename[0] = 0;

    char *p = ibuf;

    while (*p) {
        p = (char *)skip_spaces(p);
        if (!*p) break;

        /* Check for redirect tokens on the LAST potential stage */
        /* We first collect all stages, then check the last one for redirects */
        stages[stage_count] = p;

        /* Find end of this stage (pipe or end of line) */
        char *stage_end = p;
        int in_pipe = 0;
        while (*stage_end) {
            if (*stage_end == '|') {
                /* Check it's not inside a word (basic: must have space before/after) */
                /* Simple approach: treat any | as pipe separator */
                in_pipe = 1;
                break;
            }
            stage_end++;
        }

        if (in_pipe) {
            *stage_end = 0;  /* terminate this stage */
            stage_count++;
            p = stage_end + 1;
            if (stage_count >= MAX_PIPE_STAGES) {
                puts("error: too many pipe stages (max ");
                print_uint_console(MAX_PIPE_STAGES);
                puts(")\r\n");
                return 0;
            }
        } else {
            stage_count++;
            break;
        }
    }

    if (stage_count == 0) return 0;

    /* Now check the LAST stage for redirection */
    char *last = stages[stage_count - 1];
    int last_len = 0;
    while (last[last_len]) last_len++;

    /* Scan backwards for < > >> tokens */
    /* We need to find the LAST redirect token and separate it */
    char *redir_out_file = (void *)0;
    int redir_out_append = 0;
    char *redir_in_file = (void *)0;

    /* Tokenize the last stage from the end */
    char *tokens[16];
    int ntokens = 0;
    char tmp[IBUF_SIZE];
    strlcpy(tmp, last, IBUF_SIZE);

    char *tok = tmp;
    while (*tok && ntokens < 16) {
        tok = (char *)skip_spaces(tok);
        if (!*tok) break;
        tokens[ntokens++] = tok;
        while (*tok && *tok != ' ') tok++;
        if (*tok) *tok++ = 0;
    }

    /* Rebuild the command without redirect tokens */
    int cmd_end = ntokens;
    for (int i = 0; i < ntokens; i++) {
        if (streq(tokens[i], ">>") && i + 1 < ntokens) {
            redir_out_file = tokens[i + 1];
            redir_out_append = 1;
            if (cmd_end > i) cmd_end = i;
        } else if (streq(tokens[i], ">") && i + 1 < ntokens) {
            redir_out_file = tokens[i + 1];
            redir_out_append = 0;
            if (cmd_end > i) cmd_end = i;
        } else if (streq(tokens[i], "<") && i + 1 < ntokens) {
            redir_in_file = tokens[i + 1];
            if (cmd_end > i) cmd_end = i;
        }
    }

    /* Rebuild the last stage without redirect tokens */
    if (cmd_end < ntokens) {
        char rebuilt[IBUF_SIZE];
        int pos = 0;
        for (int i = 0; i < cmd_end; i++) {
            if (i > 0) rebuilt[pos++] = ' ';
            int tlen = 0;
            while (tokens[i][tlen]) tlen++;
            for (int j = 0; j < tlen && pos < IBUF_SIZE - 1; j++)
                rebuilt[pos++] = tokens[i][j];
        }
        rebuilt[pos] = 0;
        strlcpy(stages[stage_count - 1], rebuilt, IBUF_SIZE);
    }

    /* Set up redirect state */
    if (redir_out_file) {
        strlcpy(redir_filename, redir_out_file, 63);
        redir_mode = redir_out_append ? REDIR_APPEND : REDIR_WRITE;
    }

    /* Set up input redirect */
    if (redir_in_file) {
        static char input_storage[FILE_DATA_SIZE];
        int len = file_read(redir_in_file, input_storage, FILE_DATA_SIZE);
        if (len < 0) {
            puts("error: file not found: ");
            puts(redir_in_file);
            puts("\r\n");
            return 0;
        }
        input_buf = input_storage;
        input_buf_len = len;
        input_buf_pos = 0;
    }

    return stage_count;
}

/* ---- Built-in Commands (output via xputchar/xputs for pipe/redirect) ---- */

static void cmd_help(void) {
    xputs(
        "Commands:\r\n"
        "  help            - show this help\r\n"
        "  echo <text>     - print text\r\n"
        "  clear           - clear screen (ANSI)\r\n"
        "  peek <addr>     - read 32-bit word from address\r\n"
        "  poke <addr> <val> - write 32-bit word to address\r\n"
        "  mem <addr> [n]  - dump n words (default 4)\r\n"
        "  hexdump <addr> [n] - dump n bytes in hex+ascii\r\n"
        "  regs            - dump CSRs\r\n"
        "  ver             - version info\r\n"
        "  cat <file>      - display file contents\r\n"
        "  save <name>     - save pipe input to file\r\n"
        "  ls              - list stored files\r\n"
        "  rm <file>       - delete a stored file\r\n"
        "  pwd             - print working directory\r\n"
        "  cd <dir>        - change directory (stub)\r\n"
        "  export <k=v>    - set environment variable (stub)\r\n"
        "  env             - list environment (stub)\r\n"
        "  history         - show command history\r\n"
        "  shutdown        - halt the VM\r\n"
        "\r\n"
        "Pipeline:  cmd1 | cmd2 | cmd3\r\n"
        "Redirect: cmd > file, cmd >> file, cmd < file\r\n"
    );
}

static void cmd_echo(const char *arg) {
    /* Handle -n flag (no trailing newline) */
    int no_newline = 0;
    if (strstarts("-n ", arg) || strstarts("-n\t", arg)) {
        no_newline = 1;
        arg += 3;
    }
    /* Handle unquoted $? and $$ */
    while (*arg) {
        if (arg[0] == '$' && arg[1] == '?') {
            xputs("0");
            arg += 2;
        } else if (arg[0] == '$' && arg[1] == '$') {
            print_uint_full(1);
            arg += 2;
        } else {
            xputchar(*arg++);
        }
    }
    if (!no_newline)
        xputs("\r\n");
}

static void cmd_clear(void) {
    /* ANSI escape: clear screen + home cursor */
    puts("\x1b[2J\x1b[H");
}

static void cmd_peek(const char *arg) {
    unsigned int addr;
    arg = skip_spaces(arg);
    if (!parse_hex(arg, &addr) && !parse_dec(arg, &addr)) {
        xputs("Usage: peek <hex_addr>\r\n");
        return;
    }
    xputs("[");
    print_hex(addr);
    xputs("] = ");
    print_hex(*mem_ptr(addr));
    xputs("\r\n");
}

static void cmd_poke(const char *arg) {
    unsigned int addr, val;
    arg = skip_spaces(arg);
    const char *next = arg;
    while (*next && *next != ' ') next++;
    char tmp[32];
    int len = next - arg;
    if (len >= 32) { xputs("addr too long\r\n"); return; }
    for (int i = 0; i < len; i++) tmp[i] = arg[i];
    tmp[len] = 0;
    if (!parse_hex(tmp, &addr) && !parse_dec(tmp, &addr)) {
        xputs("Usage: poke <hex_addr> <hex_val>\r\n");
        return;
    }
    arg = skip_spaces(next);
    if (!parse_hex(arg, &val) && !parse_dec(arg, &val)) {
        xputs("Usage: poke <hex_addr> <hex_val>\r\n");
        return;
    }
    *mem_ptr(addr) = val;
    xputs("[");
    print_hex(addr);
    xputs("] = ");
    print_hex(val);
    xputs("\r\n");
}

static void cmd_mem(const char *arg) {
    unsigned int addr;
    unsigned int count = 4;
    arg = skip_spaces(arg);
    const char *next = arg;
    while (*next && *next != ' ') next++;
    char tmp[32];
    int len = next - arg;
    if (len >= 32) return;
    for (int i = 0; i < len; i++) tmp[i] = arg[i];
    tmp[len] = 0;
    if (!parse_hex(tmp, &addr) && !parse_dec(tmp, &addr)) {
        xputs("Usage: mem <hex_addr> [count]\r\n");
        return;
    }
    arg = skip_spaces(next);
    if (*arg) {
        parse_dec(arg, &count);
        if (count > 64) count = 64;
    }
    for (unsigned int i = 0; i < count; i++) {
        print_hex(addr + i * 4);
        xputs(": ");
        print_hex(*mem_ptr(addr + i * 4));
        xputs("\r\n");
    }
}

static void cmd_hexdump(const char *arg) {
    unsigned int addr;
    unsigned int count = 16;
    arg = skip_spaces(arg);
    const char *next = arg;
    while (*next && *next != ' ') next++;
    char tmp[32];
    int len = next - arg;
    if (len >= 32) return;
    for (int i = 0; i < len; i++) tmp[i] = arg[i];
    tmp[len] = 0;
    if (!parse_hex(tmp, &addr) && !parse_dec(tmp, &addr)) {
        xputs("Usage: hexdump <hex_addr> [bytes]\r\n");
        return;
    }
    arg = skip_spaces(next);
    if (*arg) {
        parse_dec(arg, &count);
        if (count > 256) count = 256;
    }
    volatile unsigned char *p = (volatile unsigned char *)(unsigned long)addr;
    for (unsigned int row = 0; row < count; row += 16) {
        print_hex(addr + row);
        xputs(": ");
        for (unsigned int col = 0; col < 16; col++) {
            if (row + col < count) {
                const char hex[] = "0123456789abcdef";
                unsigned char b = p[row + col];
                xputchar(hex[(b >> 4) & 0xF]);
                xputchar(hex[b & 0xF]);
            } else {
                xputchar(' ');
                xputchar(' ');
            }
            xputchar(' ');
        }
        xputs(" |");
        for (unsigned int col = 0; col < 16 && row + col < count; col++) {
            unsigned char b = p[row + col];
            xputchar((b >= 32 && b < 127) ? b : '.');
        }
        xputs("|\r\n");
    }
}

static void cmd_regs(void) {
    unsigned int mhartid, mstatus, mepc, mcause;
    asm volatile("csrr %0, mhartid" : "=r"(mhartid));
    asm volatile("csrr %0, mstatus" : "=r"(mstatus));
    asm volatile("csrr %0, mepc" : "=r"(mepc));
    asm volatile("csrr %0, mcause" : "=r"(mcause));
    xputs("mhartid: "); print_hex(mhartid); xputs("\r\n");
    xputs("mstatus: "); print_hex(mstatus); xputs("\r\n");
    xputs("mepc:    "); print_hex(mepc);    xputs("\r\n");
    xputs("mcause:  "); print_hex(mcause);  xputs("\r\n");
}

static void cmd_ver(void) {
    xputs("GeOS Mini-Shell v0.2 (bare-metal RV32IMAC)\r\n");
    xputs("Geometry OS RISC-V Hypervisor\r\n");
    xputs("Pipe + Redirection support\r\n");
}

/* New: cat - display file contents */
static void cmd_cat(const char *arg) {
    arg = skip_spaces(arg);

    /* If reading from pipe input, output that first */
    if (input_buf && input_buf_pos < input_buf_len) {
        while (input_buf_pos < input_buf_len)
            xputchar(input_buf[input_buf_pos++]);
        input_buf = (void *)0;
        /* If also given a filename, fall through to read it too */
    }

    if (!*arg) {
        return;  /* no file argument, just piped input (or nothing) */
    }
    char name[64];
    strlcpy(name, arg, 63);
    /* Trim trailing whitespace */
    int nlen = 0;
    while (name[nlen] && name[nlen] != ' ' && name[nlen] != '\r' && name[nlen] != '\n')
        nlen++;
    name[nlen] = 0;

    char data[FILE_DATA_SIZE];
    int len = file_read(name, data, FILE_DATA_SIZE);
    if (len < 0) {
        xputs("cat: ");
        xputs(name);
        xputs(": not found\r\n");
        return;
    }
    for (int i = 0; i < len; i++)
        xputchar(data[i]);
}

/* New: save - write pipe/stdin data to a file */
static void cmd_save(const char *arg) {
    arg = skip_spaces(arg);
    if (!*arg) {
        xputs("Usage: save <filename>\r\n");
        return;
    }
    char name[64];
    strlcpy(name, arg, 63);
    int nlen = 0;
    while (name[nlen] && name[nlen] != ' ' && name[nlen] != '\r' && name[nlen] != '\n')
        nlen++;
    name[nlen] = 0;

    /* If we have pipe input, save that */
    if (input_buf && input_buf_pos < input_buf_len) {
        int remaining = input_buf_len - input_buf_pos;
        file_write(name, input_buf + input_buf_pos, remaining, 0);
        xputs("Saved ");
        print_uint_full(remaining);
        xputs(" bytes to ");
        xputs(name);
        xputs("\r\n");
        input_buf = (void *)0;
        return;
    }

    /* Otherwise read lines from stdin until empty line */
    char buf[FILE_DATA_SIZE];
    int total = 0;
    xputs("(reading stdin, empty line to end)\r\n");
    for (;;) {
        int pos = 0;
        int c;
        while ((c = getchar()) >= 0 && c != '\r' && c != '\n' && pos < FILE_DATA_SIZE - 2) {
            putchar_console(c);
            buf[total + pos++] = c;
        }
        putchar_console('\r');
        putchar_console('\n');
        if (pos == 0) break;
        buf[total + pos++] = '\r';
        buf[total + pos++] = '\n';
        total += pos;
        if (total >= FILE_DATA_SIZE - 2) break;
    }
    file_write(name, buf, total, 0);
    xputs("Saved ");
    print_uint_full(total);
    xputs(" bytes to ");
    xputs(name);
    xputs("\r\n");
}

/* New: ls - list stored files */
static void cmd_ls(void) {
    int found = 0;
    for (int i = 0; i < MAX_FILES; i++) {
        if (files[i].used) {
            xputs("  ");
            xputs(files[i].name);
            xputs(" (");
            print_uint_full(files[i].len);
            xputs(" bytes)\r\n");
            found++;
        }
    }
    if (!found)
        xputs("(no files)\r\n");
}

/* New: rm - delete a file */
static void cmd_rm(const char *arg) {
    arg = skip_spaces(arg);
    if (!*arg) {
        xputs("Usage: rm <file>\r\n");
        return;
    }
    char name[64];
    strlcpy(name, arg, 63);
    int nlen = 0;
    while (name[nlen] && name[nlen] != ' ' && name[nlen] != '\r' && name[nlen] != '\n')
        nlen++;
    name[nlen] = 0;

    int idx = file_find(name);
    if (idx < 0) {
        xputs("rm: ");
        xputs(name);
        xputs(": not found\r\n");
        return;
    }
    files[idx].used = 0;
    files[idx].len = 0;
    xputs("Removed ");
    xputs(name);
    xputs("\r\n");
}

/* New: pwd */
static void cmd_pwd(void) {
    xputs("/\r\n");
}

/* New: cd (stub) */
static void cmd_cd(const char *arg) {
    (void)arg;
    xputs("cd: only root filesystem available\r\n");
}

/* New: export (stub) */
static void cmd_export(const char *arg) {
    if (!*arg) {
        xputs("export: usage: export KEY=VALUE\r\n");
        return;
    }
    xputs("export: environment variables not supported (stub)\r\n");
}

/* New: env (stub) */
static void cmd_env(void) {
    xputs("SHELL=/geos/sh\r\n");
    xputs("HOME=/\r\n");
    xputs("PATH=/\r\n");
    xputs("TERM=vt100\r\n");
}

/* New: history */
static void cmd_history(void) {
    int start = hist_count - HIST_SIZE;
    if (start < 0) start = 0;
    for (int i = start; i < hist_count; i++) {
        int idx = i % HIST_SIZE;
        print_uint_full(i + 1);
        xputs("  ");
        xputs(history[idx]);
        xputs("\r\n");
    }
}

/* ---- Command executor ----
 *
 * Runs a single command (no pipe). Output goes through xputchar/xputs
 * so it can be captured by pipe or redirect.
 */

static void execute_single(const char *cmdline) {
    const char *cmd = skip_spaces(cmdline);
    if (!*cmd) return;

    /* Dispatch built-in commands */
    if (streq(cmd, "help")) {
        cmd_help();
    } else if (streq(cmd, "clear")) {
        cmd_clear();
    } else if (streq(cmd, "regs")) {
        cmd_regs();
    } else if (streq(cmd, "ver") || streq(cmd, "version")) {
        cmd_ver();
    } else if (streq(cmd, "shutdown") || streq(cmd, "exit") || streq(cmd, "quit")) {
        xputs("Goodbye!\r\n");
        /* Flush output before shutdown */
        if (pipe_active) {
            xputchar(0);  /* null-terminate pipe buffer */
        }
        sbi_shutdown();
    } else if (streq(cmd, "ls")) {
        cmd_ls();
    } else if (streq(cmd, "pwd")) {
        cmd_pwd();
    } else if (streq(cmd, "env")) {
        cmd_env();
    } else if (streq(cmd, "history")) {
        cmd_history();
    } else {
        /* Commands with arguments */
        const char *arg = cmd;
        while (*arg && *arg != ' ') arg++;
        char name[16];
        int nlen = arg - cmd;
        if (nlen >= 16) nlen = 15;
        for (int i = 0; i < nlen; i++) name[i] = cmd[i];
        name[nlen] = 0;
        arg = skip_spaces(arg);

        if (streq(name, "echo"))
            cmd_echo(arg);
        else if (streq(name, "peek"))
            cmd_peek(arg);
        else if (streq(name, "poke"))
            cmd_poke(arg);
        else if (streq(name, "mem"))
            cmd_mem(arg);
        else if (streq(name, "hexdump"))
            cmd_hexdump(arg);
        else if (streq(name, "cat"))
            cmd_cat(arg);
        else if (streq(name, "save"))
            cmd_save(arg);
        else if (streq(name, "rm"))
            cmd_rm(arg);
        else if (streq(name, "cd"))
            cmd_cd(arg);
        else if (streq(name, "export"))
            cmd_export(arg);
        else {
            xputs("unknown: ");
            xputs(cmd);
            xputs("\r\n");
        }
    }
}

/* ---- Pipeline executor ----
 *
 * For single commands: just execute with optional redirect.
 * For pipelines (cmd1 | cmd2):
 *   1. Execute cmd1 with output captured to pipe_buf[0]
 *   2. Set pipe_buf[0] as input for cmd2
 *   3. Execute cmd2 (output goes to console or redirect)
 *
 * For longer pipelines (cmd1 | cmd2 | cmd3):
 *   1. cmd1 output -> pipe_buf[0]
 *   2. pipe_buf[0] -> cmd2 input, cmd2 output -> pipe_buf[1]
 *   3. pipe_buf[1] -> cmd3 input, cmd3 output -> console/redirect
 */

static void execute_pipeline(void) {
    if (stage_count == 0) return;

    if (stage_count == 1) {
        /* Single command, possible redirect */
        pipe_active = 0;
        pipe_stage = 0;
        execute_single(stages[0]);

        /* Handle output redirect */
        if (redir_mode != REDIR_NONE && redir_filename[0]) {
            /* We need to re-execute with capture */
            pipe_active = 1;
            pipe_stage = 0;
            pipe_len[0] = 0;
            execute_single(stages[0]);
            /* Null-terminate */
            pipe_buf[0][pipe_len[0]] = 0;
            pipe_active = 0;

            /* Write to file */
            file_write(redir_filename, pipe_buf[0], pipe_len[0],
                       redir_mode == REDIR_APPEND);
        }
        return;
    }

    /* Multi-stage pipeline */
    /* Stage 0: capture output */
    pipe_active = 1;
    pipe_stage = 0;
    pipe_len[0] = 0;
    execute_single(stages[0]);
    pipe_buf[0][pipe_len[0]] = 0;  /* null-terminate */
    pipe_active = 0;

    /* Middle stages: chain input/output */
    for (int i = 1; i < stage_count - 1; i++) {
        /* Set previous stage's output as input */
        static char chain_buf[PIPE_BUF_SIZE];
        int chain_len = pipe_len[i - 1];
        for (int j = 0; j < chain_len; j++)
            chain_buf[j] = pipe_buf[i - 1][j];
        chain_buf[chain_len] = 0;
        input_buf = chain_buf;
        input_buf_len = chain_len;
        input_buf_pos = 0;

        /* Capture this stage's output */
        pipe_active = 1;
        pipe_stage = i;
        pipe_len[i] = 0;
        execute_single(stages[i]);
        pipe_buf[i][pipe_len[i]] = 0;
        pipe_active = 0;
    }

    /* Last stage: input from previous, output to console or redirect */
    {
        static char final_input[PIPE_BUF_SIZE];
        int in_len = pipe_len[stage_count - 2];
        for (int j = 0; j < in_len; j++)
            final_input[j] = pipe_buf[stage_count - 2][j];
        final_input[in_len] = 0;
        input_buf = final_input;
        input_buf_len = in_len;
        input_buf_pos = 0;

        if (redir_mode != REDIR_NONE && redir_filename[0]) {
            /* Capture output to file */
            pipe_active = 1;
            pipe_stage = stage_count - 1;
            pipe_len[stage_count - 1] = 0;
            execute_single(stages[stage_count - 1]);
            pipe_buf[stage_count - 1][pipe_len[stage_count - 1]] = 0;
            pipe_active = 0;

            file_write(redir_filename,
                       pipe_buf[stage_count - 1],
                       pipe_len[stage_count - 1],
                       redir_mode == REDIR_APPEND);
        } else {
            /* Output to console */
            execute_single(stages[stage_count - 1]);
        }
    }

    /* Reset input redirect */
    input_buf = (void *)0;
    input_buf_len = 0;
    input_buf_pos = 0;
}

/* ---- Main REPL ---- */

static void add_history(const char *cmd) {
    if (!*cmd) return;
    /* Don't add duplicates of the last entry */
    if (hist_count > 0) {
        int last = (hist_count - 1) % HIST_SIZE;
        if (streq(history[last], cmd)) return;
    }
    int idx = hist_count % HIST_SIZE;
    strlcpy(history[idx], cmd, IBUF_SIZE);
    hist_count++;
}

static void process_command(void) {
    /* Add to history */
    add_history(ibuf);

    /* Parse pipeline */
    int nstages = parse_pipeline();
    if (nstages == 0) return;

    /* Execute the pipeline */
    execute_pipeline();

    /* Reset all state */
    pipe_active = 0;
    pipe_stage = 0;
    redir_mode = REDIR_NONE;
    redir_filename[0] = 0;
    input_buf = (void *)0;
    input_buf_len = 0;
    input_buf_pos = 0;
    for (int i = 0; i < MAX_PIPE_STAGES; i++)
        pipe_len[i] = 0;
}

void c_start(void) {
    /* Small delay for UART init */
    for (volatile int i = 0; i < 50000; i++);

    /* Initialize file storage */
    for (int i = 0; i < MAX_FILES; i++)
        files[i].used = 0;

    puts("\r\n=== GeOS Mini-Shell v0.2 ===\r\n");
    puts("Pipe + Redirection support enabled.\r\n");
    puts("Type 'help' for commands.\r\n\r\n");

    for (;;) {
        puts("geos> ");

        ibuf_len = 0;
        hist_pos = -1;
        int collecting = 1;
        while (collecting) {
            int c = getchar_wait();
            if (c < 0) continue;

            if (c == '\r' || c == '\n') {
                /* Enter */
                putchar_console('\r');
                putchar_console('\n');
                collecting = 0;
            } else if (c == 127 || c == 8) {
                /* Backspace */
                if (ibuf_len > 0) {
                    ibuf_len--;
                    putchar_console(8);
                    putchar_console(' ');
                    putchar_console(8);
                }
            } else if (c == 3) {
                /* Ctrl-C: cancel line */
                puts("^C\r\n");
                ibuf_len = 0;
                collecting = 0;
            } else if (c == 21) {
                /* Ctrl-U: kill line */
                while (ibuf_len > 0) {
                    ibuf_len--;
                    putchar_console(8);
                    putchar_console(' ');
                    putchar_console(8);
                }
            } else if (c == 27) {
                /* Escape: ignore (might be arrow key sequence) */
                /* Consume any following bytes */
                for (int i = 0; i < 2; i++) {
                    int c2 = getchar_wait();
                    if (c2 < 0) break;
                }
            } else if (c >= 32 && c < 127 && ibuf_len < IBUF_SIZE - 1) {
                /* Printable char */
                ibuf[ibuf_len++] = c;
                putchar_console(c);
            }
        }

        process_command();
    }
}
