/*
 * palace_daemon.c — Memory Palace userspace coordinator
 *
 * Runs as PID 1 (or launched by init) after /dev/palace is loaded.
 * Opens /dev/palace, mmaps the 256KB pixel buffer, and provides
 * coordinate-based pixel management for the Memory Palace.
 *
 * Zero external dependencies — uses Linux syscalls directly.
 * Compile: riscv64-linux-gnu-gcc -march=rv32imac -mabi=ilp32
 *          -nostdlib -static -nostartfiles -o palace_daemon palace_daemon.c
 *
 * SBI debug console is used for early boot messages before /dev is ready.
 * After that, /dev/console (or stderr) is used for diagnostics.
 *
 * All types are defined locally since we compile with -nostdlib.
 */

/* Type definitions (no stdint/stddef available) */
typedef unsigned long   ulong;
typedef unsigned int    uint;
typedef unsigned char   uchar;
#define NULL            ((void*)0)

#define PALACE_SIZE     (256 * 1024)   /* 256 KB = 256x256 RGBA pixels */
#define PALACE_W        256
#define PALACE_H        256

/* ── Syscall numbers (RV32 Linux) ──────────────────────────────────── */
#define SYS_exit        93
#define SYS_read        63
#define SYS_write       64
#define SYS_openat      56
#define SYS_close       57
#define SYS_mmap2       222
#define SYS_munmap      215
#define SYS_getpid      172

#define AT_FDCWD        -100

/* ── mmap flags ────────────────────────────────────────────────────── */
#define PROT_READ       0x1
#define PROT_WRITE      0x2
#define MAP_SHARED      0x01
#define MAP_FAILED      ((void*)-1)

/* Simple busy-loop delay (~10ms on a ~100MHz RV32) */
static void delay(ulong cycles) {
    volatile ulong i = 0;
    while (i < cycles) i++;
}



/* ── Inline syscall helpers ────────────────────────────────────────── */
static inline long syscall3(long n, long a0, long a1, long a2) {
    register long r0 asm("a0") = a0;
    register long r1 asm("a1") = a1;
    register long r2 asm("a2") = a2;
    register long r7 asm("a7") = n;
    asm volatile("ecall" : "+r"(r0) : "r"(r1), "r"(r2), "r"(r7) : "memory");
    return r0;
}

static inline long syscall1(long n, long a0) {
    return syscall3(n, a0, 0, 0);
}

/* mmap2 needs 6 args on RV32: a0-a5 */
static inline long syscall6(long n, long a0, long a1, long a2,
                            long a3, long a4, long a5) {
    register long r0 asm("a0") = a0;
    register long r1 asm("a1") = a1;
    register long r2 asm("a2") = a2;
    register long r3 asm("a3") = a3;
    register long r4 asm("a4") = a4;
    register long r5 asm("a5") = a5;
    register long r7 asm("a7") = n;
    asm volatile("ecall" : "+r"(r0) : "r"(r1), "r"(r2), "r"(r3),
                          "r"(r4), "r"(r5), "r"(r7) : "memory");
    return r0;
}

/* ── Libc stand-ins ────────────────────────────────────────────────── */
static void _exit(int code) { syscall1(SYS_exit, code); for(;;); }

static long write(int fd, const void *buf, ulong count) {
    return syscall3(SYS_write, fd, (long)buf, count);
}
static long read(int fd, void *buf, ulong count) {
    return syscall3(SYS_read, fd, (long)buf, count);
}
static int open(const char *path, int flags) {
    return (int)syscall3(SYS_openat, AT_FDCWD, (long)path, flags);
}
static int close(int fd) { return (int)syscall1(SYS_close, fd); }

static void print(const char *s) {
    ulong len = 0;
    while (s[len]) len++;
    write(1, s, len);
}

static void print_char(char c) {
    write(1, &c, 1);
}

static void *mmap(void *addr, ulong length, int prot, int flags,
                  int fd, ulong offset_pages) {
    return (void*)syscall6(SYS_mmap2, (long)addr, length,
                           prot, flags, fd, offset_pages);
}
static int munmap(void *addr, ulong length) {
    return (int)syscall3(SYS_munmap, (long)addr, length, 0);
}
static int getpid(void) { return (int)syscall1(SYS_getpid, 0); }

/* ── Palace buffer (mapped from /dev/palace) ───────────────────────── */
static volatile uint *palace = NULL;

static int palace_init(void) {
    int fd = open("/dev/palace", 2);  /* O_RDWR */
    if (fd < 0) return -1;

    palace = (volatile uint *)mmap(NULL, PALACE_SIZE,
                                   PROT_READ | PROT_WRITE,
                                   MAP_SHARED, fd, 0);
    close(fd);
    if (palace == MAP_FAILED) return -1;
    return 0;
}

/* ── Pixel operations ──────────────────────────────────────────────── */
static inline void set_pixel(int x, int y, uint rgba) {
    if (x < 0 || x >= PALACE_W || y < 0 || y >= PALACE_H) return;
    palace[y * PALACE_W + x] = rgba;
}

static inline uint get_pixel(int x, int y) {
    if (x < 0 || x >= PALACE_W || y < 0 || y >= PALACE_H) return 0;
    return palace[y * PALACE_W + x];
}

static void fill_rect(int x, int y, int w, int h, uint rgba) {
    int x2 = x + w; if (x2 > PALACE_W) x2 = PALACE_W;
    int y2 = y + h; if (y2 > PALACE_H) y2 = PALACE_H;
    for (int row = y; row < y2; row++)
        for (int col = x; col < x2; col++)
            palace[row * PALACE_W + col] = rgba;
}

/* ── Hilbert curve pixel mapper ───────────────────────────────────────
 * Maps a linear index [0..65535] to (x,y) coordinates using
 * an order-8 Hilbert curve over the 256x256 grid.
 * This gives spatial locality: nearby indices = nearby pixels.
 */
static int hilbert_xy(int idx, int *xp, int *yp) {
    if (idx < 0 || idx >= PALACE_W * PALACE_H) return -1;
    int x = 0, y = 0;
    for (int s = 1; s < PALACE_W; s <<= 1) {
        int rx = 1 & (idx >> 1);
        int ry = 1 & (idx ^ rx);
        if (ry == 0) {
            if (rx == 1) { x = s - 1 - x; y = s - 1 - y; }
            int t = x; x = y; y = t;
        }
        x += s * rx;
        y += s * ry;
        idx >>= 2;
    }
    *xp = x; *yp = y;
    return 0;
}

/* ── Draw diagnostic pattern ───────────────────────────────────────── */
static void draw_diagnostics(void) {
    /* Black background */
    fill_rect(0, 0, PALACE_W, PALACE_H, 0x000000FF);

    /* Border: red */
    fill_rect(0, 0, PALACE_W, 1, 0xFF0000FF);
    fill_rect(0, PALACE_H-1, PALACE_W, 1, 0xFF0000FF);
    fill_rect(0, 0, 1, PALACE_H, 0xFF0000FF);
    fill_rect(PALACE_W-1, 0, 1, PALACE_H, 0xFF0000FF);

    /* Title bar (row 1-2): dark blue */
    fill_rect(0, 2, PALACE_W, 10, 0x000040FF);
    /* Status bar (row 250-253): dark green */
    fill_rect(0, 250, PALACE_W, 4, 0x002000FF);

    /* Hilbert curve spiral: encode index bytes as color gradients */
    for (int i = 0; i < 65536; i++) {
        int x, y;
        hilbert_xy(i, &x, &y);
        uint r = (i & 0xFF);
        uint g = ((i >> 4) & 0xFF);
        uint b = ((i >> 8) & 0xFF);
        uint a = 0xFF;
        /* Clip to title/status bar gap */
        if (y >= 14 && y < 250)
            set_pixel(x, y, (r << 24) | (g << 16) | (b << 8) | a);
    }
}

/* ── Simple number-to-hex for status display ───────────────────────── */
static void hex32(uint v, char *buf) {
    const char *hex = "0123456789ABCDEF";
    for (int i = 7; i >= 0; i--) {
        buf[i] = hex[v & 0xF];
        v >>= 4;
    }
    buf[8] = '\0';
}

/* ── Main ──────────────────────────────────────────────────────────── */
void _start(void) {
    int pid = getpid();
    print("\n[palace_daemon] Initializing Memory Palace...\n");

    /* Open devtmpfs-based /dev (kernel mounts it if DEVTMPFS_MOUNT=y) */
    if (palace_init() < 0) {
        print("[palace_daemon] FAILED: /dev/palace not available\n");
        print("[palace_daemon] Check: insmod palace.ko, devtmpfs mounted\n");

        /* Draw error pattern */
        fill_rect(0, 0, PALACE_W, PALACE_H, 0xFF0000FF);  /* red = error */
        for (int i = 0; i < PALACE_W; i += 4)
            for (int j = 0; j < PALACE_H; j += 4)
                set_pixel(i, j, 0xFFFFFF00);  /* white dots */
        _exit(1);
    }

    /* Draw diagnostic pattern to verify pixel buffer is live */
    draw_diagnostics();

    print("[palace_daemon] Memory Palace online: 256x256 RGBA (256 KB)\n");
    print("[palace_daemon] PID = ");
    {
        char pidbuf[12];
        int n = pid, i = 0;
        if (n == 0) { pidbuf[i++] = '0'; }
        while (n > 0) { pidbuf[i++] = '0' + (n % 10); n /= 10; }
        while (i > 0) print_char(pidbuf[--i]);
    }
    print_char('\n');

    /* Heartbeat loop */
    unsigned long tick = 0;
    while (1) {
        /* Update status bar with tick count and checksum */
        uint cksum = 0;
        for (int i = 0; i < 16; i++)
            cksum ^= palace[(tick + (unsigned)i * 100) & 0xFFFF];

        /* Write status into pixel row 251-252 as colored text */
        fill_rect(1, 251, PALACE_W - 2, 2, 0x002000FF);

        /* Animate a moving pixel on row 252 to show liveness */
        int cursor = tick % PALACE_W;
        if (cursor > 0) set_pixel(cursor - 1, 252, 0x002000FF);
        set_pixel(cursor, 252, 0x00FF00FF);  /* neon green marker */

        /* Slow down to ~10 Hz with busy delay */
        delay(5000000);
        tick++;
    }
}
