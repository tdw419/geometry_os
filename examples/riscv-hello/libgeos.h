/*
 * libgeos.h -- shared bare-metal primitives for Geometry OS guest programs
 */

#ifndef LIBGEOS_H
#define LIBGEOS_H

#include <stdint.h>

/* ---- RISC-V MMIO (QEMU virt) ---- */

#define GEOS_CLINT_BASE     0x02000000u
#define GEOS_CLINT_MTIMECMP 0x02004000u
#define GEOS_CLINT_MTIME    0x0200BFF8u

#define GEOS_FB_BASE        0x60000000u
#define GEOS_FB_WIDTH       256
#define GEOS_FB_HEIGHT      256
#define GEOS_FB_SIZE        (GEOS_FB_WIDTH * GEOS_FB_HEIGHT * 4)
#define GEOS_FB_CONTROL     (GEOS_FB_BASE + GEOS_FB_SIZE)
#define GEOS_FB_CLIP        (GEOS_FB_CONTROL + 4)

#define COLOR_RED           0xFF0000FFu
#define COLOR_GREEN         0x00FF00FFu
#define COLOR_BLUE          0x0000FFFFu
#define COLOR_WHITE         0xFFFFFFFFu
#define COLOR_BLACK         0x000000FFu
#define COLOR_YELLOW        0xFFFF00FFu
#define COLOR_CYAN          0x00FFFFFFu

/* ---- SBI Primitives (implemented in libgeos.c) ---- */

long sbi_console_putchar(int ch);
long sbi_console_getchar(void);
__attribute__((noreturn)) void sbi_shutdown(void);

/* ---- Core I/O helpers ---- */

void geos_puts(const char *s);
void geos_put_hex(uint32_t val);
void geos_put_dec(uint32_t val);
char geos_getchar(void);

/* ---- Framebuffer helpers (inline for speed) ---- */

static inline void geos_fb_pixel(int x, int y, uint32_t color) {
    if (x < 0 || x >= GEOS_FB_WIDTH || y < 0 || y >= GEOS_FB_HEIGHT) return;
    *(volatile uint32_t *)(GEOS_FB_BASE + (y * GEOS_FB_WIDTH + x) * 4) = color;
}

#ifndef LIBFB_H
#ifndef fb_present
static inline void fb_present(void) {
    *(volatile uint32_t *)GEOS_FB_CONTROL = 1;
}
#define fb_present fb_present
#endif
#endif
static inline void geos_fb_present(void) {
    *(volatile uint32_t *)GEOS_FB_CONTROL = 1;
}

static inline int geos_request_region(uint32_t x, uint32_t y,
                                       uint32_t w, uint32_t h) {
    uint8_t xf = (uint8_t)x;
    uint8_t yf = (uint8_t)y;
    uint8_t wf = (w >= 256) ? 0 : (uint8_t)w;
    uint8_t hf = (h >= 256) ? 0 : (uint8_t)h;
    uint32_t packed = (uint32_t)yf << 24 | (uint32_t)xf << 16 |
                      (uint32_t)hf << 8  | (uint32_t)wf;
    *(volatile uint32_t *)GEOS_FB_CLIP = packed;
    return 0;
}

static inline uint32_t geos_rgba(uint8_t r, uint8_t g, uint8_t b, uint8_t a) {
    return (uint32_t)r << 24 | (uint32_t)g << 16 | (uint32_t)b << 8 | (uint32_t)a;
}
static inline uint32_t geos_rgb(uint8_t r, uint8_t g, uint8_t b) {
    return geos_rgba(r, g, b, 0xFF);
}

/* ---- Multi-processing (Phase 209) ---- */

static inline void geos_yield(void) {
    register long a7 __asm__("a7") = 0x47454F00u;
    register long a6 __asm__("a6") = 0;
    __asm__ volatile("ecall" : : "r"(a7), "r"(a6) : "memory", "a0", "a1");
}

static inline long geos_get_id(void) {
    register long a7 __asm__("a7") = 0x47454F00u;
    register long a6 __asm__("a6") = 1;
    register long a0 __asm__("a0") = 0;
    __asm__ volatile("ecall" : "+r"(a0) : "r"(a7), "r"(a6) : "memory", "a1");
    return a0;
}

static inline int geos_has_focus(void) {
    register long a7 __asm__("a7") = 0x47454F00u;
    register long a6 __asm__("a6") = 2;
    register long a0 __asm__("a0") = 0;
    __asm__ volatile("ecall" : "+r"(a0) : "r"(a7), "r"(a6) : "memory", "a1");
    return (int)a0;
}

static inline long geos_yield_to(long target_id) {
    register long a7 __asm__("a7") = 0x47454F00u;
    register long a6 __asm__("a6") = 5;
    register long a0 __asm__("a0") = target_id;
    __asm__ volatile("ecall" : "+r"(a0) : "r"(a7), "r"(a6) : "memory", "a1");
    return a0;
}

static inline long geos_spawn(long entry_point) {
    register long a7 __asm__("a7") = 0x47454F00u;
    register long a6 __asm__("a6") = 3;
    register long a0 __asm__("a0") = entry_point;
    __asm__ volatile("ecall" : "+r"(a0) : "r"(a7), "r"(a6) : "memory", "a1");
    return a0;
}

static inline long geos_kill(long context_id) {
    register long a7 __asm__("a7") = 0x47454F00u;
    register long a6 __asm__("a6") = 4;
    register long a0 __asm__("a0") = context_id;
    __asm__ volatile("ecall" : "+r"(a0) : "r"(a7), "r"(a6) : "memory", "a1");
    return a0;
}

/* ---- Spatial query helpers ---- */

static inline long geos_get_rect(void) {
    register long a7 __asm__("a7") = 0x47454F00u;
    register long a6 __asm__("a6") = 16;
    register long a0 __asm__("a0") = 0;
    __asm__ volatile("ecall" : "+r"(a0) : "r"(a7), "r"(a6) : "memory", "a1");
    return a0;
}

static inline long geos_proc_count(void) {
    register long a7 __asm__("a7") = 0x47454F00u;
    register long a6 __asm__("a6") = 17;
    register long a0 __asm__("a0") = 0;
    __asm__ volatile("ecall" : "+r"(a0) : "r"(a7), "r"(a6) : "memory", "a1");
    return a0;
}

/* Copy raw binary from src into a process slot for spawning. */
static inline long geos_load(long slot_id, long src_addr, long len) {
    register long a7 __asm__("a7") = 0x47454F00u;
    register long a6 __asm__("a6") = 18;
    register long a0 __asm__("a0") = 0;
    register long a1 __asm__("a1") = slot_id;
    register long a2 __asm__("a2") = src_addr;
    register long a3 __asm__("a3") = len;
    __asm__ volatile("ecall" : "+r"(a0) : "r"(a7), "r"(a6), "r"(a1), "r"(a2), "r"(a3) : "memory");
    return a0;
}

/* ---- Timing helpers ---- */

#define GEOS_TICKS_PER_MS 52000

static inline uint64_t geos_mtime(void) {
    uint32_t lo, hi;
    do {
        hi = *(volatile uint32_t *)(GEOS_CLINT_MTIME + 4);
        lo = *(volatile uint32_t *)(GEOS_CLINT_MTIME);
    } while (hi != *(volatile uint32_t *)(GEOS_CLINT_MTIME + 4));
    return ((uint64_t)hi << 32) | lo;
}

static inline void geos_wait_ms(uint32_t ms) {
    uint64_t target = geos_mtime() + (uint64_t)ms * GEOS_TICKS_PER_MS;
    while (geos_mtime() < target);
}

/* ---- Timer and Sleep Syscalls ---- */

#define GEO_UPTIME        12
#define GEO_ALARM_SET     13
#define GEO_ALARM_CANCEL  14
#define GEO_MSLEEP        15

static inline long geos_uptime(void) {
    register long a7 __asm__("a7") = 0x47454F00u;
    register long a6 __asm__("a6") = GEO_UPTIME;
    register long a0 __asm__("a0") = 0;
    register long a1 __asm__("a1") = 0;
    __asm__ volatile("ecall" : "+r"(a0), "+r"(a1) : "r"(a7), "r"(a6) : "memory");
    return a1;
}

static inline long geos_alarm_set(long delay_ticks, void (*callback)(long)) {
    register long a7 __asm__("a7") = 0x47454F00u;
    register long a6 __asm__("a6") = GEO_ALARM_SET;
    register long a0 __asm__("a0") = delay_ticks;
    register long a1 __asm__("a1") = (long)callback;
    __asm__ volatile("ecall" : "+r"(a0), "+r"(a1) : "r"(a7), "r"(a6) : "memory");
    return a0 == 0 ? a1 : -1;
}

static inline long geos_alarm_cancel(long alarm_id) {
    register long a7 __asm__("a7") = 0x47454F00u;
    register long a6 __asm__("a6") = GEO_ALARM_CANCEL;
    register long a0 __asm__("a0") = alarm_id;
    __asm__ volatile("ecall" : "+r"(a0) : "r"(a7), "r"(a6) : "memory", "a1");
    return a0;
}

static inline long geos_msleep(long ticks) {
    register long a7 __asm__("a7") = 0x47454F00u;
    register long a6 __asm__("a6") = GEO_MSLEEP;
    register long a0 __asm__("a0") = ticks;
    __asm__ volatile("ecall" : "+r"(a0) : "r"(a7), "r"(a6) : "memory", "a1");
    return a0;
}

/* ---- VFS Pixel Surface ---- */

#define GEOS_VFS_BASE       0x70000000u
#define GEOS_VFS_SIZE       (256 * 256 * 4)
#define GEOS_VFS_CONTROL    (GEOS_VFS_BASE + GEOS_VFS_SIZE)

#define GEOS_CANVAS_MARKER  0x43414E56u
#define GEOS_CANVAS_MARKER_COL 255
#define GEOS_CANVAS_MAX_ROWS 255

int geos_save_canvas(void);
int geos_load_canvas(void);

/* ---- Virtio Block Device ---- */

#define GEOS_VIRTIO_BASE    0x10001000u
#define GEOS_BLK_SECTOR     512u

int geos_blk_init(void *desc_buf);
int geos_blk_read(uint32_t sector, void *buf, uint32_t n);
int geos_blk_write(uint32_t sector, const void *buf, uint32_t n);

/* ---- Bitmap font rendering ---- */

int geos_draw_char(int x, int y, char ch, uint32_t fg, uint32_t bg);
int geos_draw_string(int x, int y, const char *str, uint32_t fg, uint32_t bg);

/* ---- Shared Memory IPC ---- */

#define GEO_SHM_ALLOC     6
#define GEO_SHM_MAP       7
#define GEO_SHM_RELEASE   8
#define GEO_SHM_SIZE      9
#define GEO_SHM_WRITE     10
#define GEO_SHM_READ      11

static inline long geos_shm_alloc(long size_bytes) {
    register long a7 __asm__("a7") = 0x47454F00u;
    register long a6 __asm__("a6") = GEO_SHM_ALLOC;
    register long a0 __asm__("a0") = size_bytes;
    __asm__ volatile("ecall" : "+r"(a0) : "r"(a7), "r"(a6) : "memory", "a1");
    return a0;
}

static inline long geos_shm_map(long slot_id) {
    register long a7 __asm__("a7") = 0x47454F00u;
    register long a6 __asm__("a6") = GEO_SHM_MAP;
    register long a0 __asm__("a0") = slot_id;
    __asm__ volatile("ecall" : "+r"(a0) : "r"(a7), "r"(a6) : "memory", "a1");
    return a0;
}

static inline long geos_shm_release(long slot_id) {
    register long a7 __asm__("a7") = 0x47454F00u;
    register long a6 __asm__("a6") = GEO_SHM_RELEASE;
    register long a0 __asm__("a0") = slot_id;
    __asm__ volatile("ecall" : "+r"(a0) : "r"(a7), "r"(a6) : "memory", "a1");
    return a0;
}

/* ---- Phase 397: Dynamic Program Execution ---- */

#define GEO_EXEC          19

static inline long geos_exec(long slot_id) {
    register long a7 __asm__("a7") = 0x47454F00u;
    register long a6 __asm__("a6") = GEO_EXEC;
    register long a0 __asm__("a0") = slot_id;
    __asm__ volatile("ecall" : "+r"(a0) : "r"(a7), "r"(a6) : "memory", "a1");
    return a0;
}

/* ---- Phase 397: Runtime ELF Loading from Disk ---- */

#define GEO_LOAD_DISK     20

static inline long geos_load_disk(long slot_id, uint32_t start_sector) {
    register long a7 __asm__("a7") = 0x47454F00u;
    register long a6 __asm__("a6") = GEO_LOAD_DISK;
    register long a0 __asm__("a0") = slot_id;
    register long a1 __asm__("a1") = start_sector;
    __asm__ volatile("ecall" : "+r"(a0) : "r"(a7), "r"(a6), "r"(a1) : "memory");
    return a0;
}

/* ---- Phase 397: Kernel-Mediated File Syscalls ---- */

#define GEO_OPEN          21
#define GEO_READ          22
#define GEO_WRITE         23
#define GEO_CLOSE         24
#define GEO_SEEK          25
#define GEO_IOCTL         26

/* File modes for geos_open */
#define GEO_O_RDONLY      0
#define GEO_O_WRONLY      1
#define GEO_O_RDWR        2

/* Substrate IOCTL commands */
#define SUB_IOCTL_TICK          1
#define SUB_IOCTL_SET_X         2
#define SUB_IOCTL_SET_Y         3
#define SUB_IOCTL_QUERY         4
#define SUB_IOCTL_COPY          5
#define SUB_IOCTL_PATCH         6
#define SUB_IOCTL_LOAD_CIRCUIT  7   /* arg = circuit_id (1=fibonacci, 2=xor) */
#define SUB_IOCTL_WRITE_PORT    8   /* arg = (port << 16) | (value & 0xFFFF) */
#define SUB_IOCTL_READ_PORT     9   /* arg = port, returns value */
#define SUB_IOCTL_FIRE          10  /* inject PC pulse into command track */
#define SUB_IOCTL_LEARN         11  /* arg = (decay_x256 << 16) | (bump & 0xFF) */

/* Substrate Query registers */
#define SUB_QUERY_STATUS  0
#define SUB_QUERY_RESULT  1
#define SUB_QUERY_VERSION 2
#define SUB_QUERY_TICKS   3

/* Circuit IDs for SUB_IOCTL_LOAD_CIRCUIT */
#define SUB_CIRCUIT_FIBONACCI  1
#define SUB_CIRCUIT_XOR        2

static inline long geos_open(const char *filename, long mode) {
    register long a7 __asm__("a7") = 0x47454F00u;
    register long a6 __asm__("a6") = GEO_OPEN;
    register long a0 __asm__("a0") = (long)filename;
    register long a1 __asm__("a1") = mode;
    __asm__ volatile("ecall" : "+r"(a0) : "r"(a7), "r"(a6), "r"(a1) : "memory");
    return a0;
}

static inline long geos_read(long fd, void *buf, long count) {
    register long a7 __asm__("a7") = 0x47454F00u;
    register long a6 __asm__("a6") = GEO_READ;
    register long a0 __asm__("a0") = fd;
    register long a1 __asm__("a1") = (long)buf;
    register long a2 __asm__("a2") = count;
    __asm__ volatile("ecall" : "+r"(a0) : "r"(a7), "r"(a6), "r"(a1), "r"(a2) : "memory");
    return a0;
}

static inline long geos_write(long fd, const void *buf, long count) {
    register long a7 __asm__("a7") = 0x47454F00u;
    register long a6 __asm__("a6") = GEO_WRITE;
    register long a0 __asm__("a0") = fd;
    register long a1 __asm__("a1") = (long)buf;
    register long a2 __asm__("a2") = count;
    __asm__ volatile("ecall" : "+r"(a0) : "r"(a7), "r"(a6), "r"(a1), "r"(a2) : "memory");
    return a0;
}

static inline long geos_close(long fd) {
    register long a7 __asm__("a7") = 0x47454F00u;
    register long a6 __asm__("a6") = GEO_CLOSE;
    register long a0 __asm__("a0") = fd;
    __asm__ volatile("ecall" : "+r"(a0) : "r"(a7), "r"(a6) : "memory", "a1");
    return a0;
}

static inline long geos_seek(long fd, long offset) {
    register long a7 __asm__("a7") = 0x47454F00u;
    register long a6 __asm__("a6") = GEO_SEEK;
    register long a0 __asm__("a0") = fd;
    register long a1 __asm__("a1") = offset;
    __asm__ volatile("ecall" : "+r"(a0) : "r"(a7), "r"(a6), "r"(a1) : "memory");
    return a0;
}

static inline long geos_ioctl(long fd, long cmd, long arg) {
    register long a7 __asm__("a7") = 0x47454F00u;
    register long a6 __asm__("a6") = GEO_IOCTL;
    register long a0 __asm__("a0") = fd;
    register long a1 __asm__("a1") = cmd;
    register long a2 __asm__("a2") = arg;
    __asm__ volatile("ecall" : "+r"(a0) : "r"(a7), "r"(a6), "r"(a1), "r"(a2) : "memory");
    return a0;
}

#endif /* LIBGEOS_H */
