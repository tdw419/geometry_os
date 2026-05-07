/*
 * libgeos.h -- shared bare-metal primitives for Geometry OS guest programs
 *
 * SBI console I/O, framebuffer helpers, and utility functions shared across
 * life, life64, painter2, hello, sh, cat, etc.
 *
 * Usage:
 *   #include "libgeos.h"
 *   // then link with -lgeos (libgeos.a)
 *
 * Build: libgeos.a is built by build.sh or Makefile alongside your program.
 */

#ifndef LIBGEOS_H
#define LIBGEOS_H

#include <stdint.h>

/* ---- SBI helpers ---- */

/* Write a character to the SBI console. Returns the SBI result (0 on success). */
long sbi_console_putchar(int ch);

/* Shut down the machine via SBI. Does not return. */
__attribute__((noreturn)) void sbi_shutdown(void);

/* Blocking read of one character from SBI console. Returns -1 on failure. */
long sbi_console_getchar(void);

/* Blocking read of one character (spins until available). */
char geos_getchar(void);

/* ---- Console output ---- */

/* Print a null-terminated string to the SBI console. */
void geos_puts(const char *s);

/* Print an unsigned decimal number to the SBI console. */
void geos_put_dec(uint32_t val);

/* Print an unsigned hex number (0x-prefixed) to the SBI console. */
void geos_put_hex(uint32_t val);

/* ---- Framebuffer helpers ---- */

/* MMIO framebuffer base address (256x256 RGBA). */
#define GEOS_FB_BASE        0x60000000u
#define GEOS_FB_WIDTH       256
#define GEOS_FB_HEIGHT      256
#define GEOS_FB_CONTROL     (GEOS_FB_BASE + (GEOS_FB_WIDTH * GEOS_FB_HEIGHT) * 4)
#define GEOS_FB_CLIP        (GEOS_FB_CONTROL + 4)  /* clip rect register */

/* Pack RGB channels into framebuffer pixel format (0xRRGGBBAA, alpha=0xFF). */
static inline uint32_t geos_rgb(uint8_t r, uint8_t g, uint8_t b) {
    return ((uint32_t)r << 24) | ((uint32_t)g << 16) | ((uint32_t)b << 8) | 0xFF;
}

/* Signal the host to display the current framebuffer contents. */
static inline void geos_fb_present(void) {
    *(volatile uint32_t *)GEOS_FB_CONTROL = 1;
}

/* Write a pixel to the framebuffer at (x, y). */
static inline void geos_fb_pixel(uint32_t x, uint32_t y, uint32_t color) {
    if (x < GEOS_FB_WIDTH && y < GEOS_FB_HEIGHT) {
        *(volatile uint32_t *)(GEOS_FB_BASE + (y * GEOS_FB_WIDTH + x) * 4) = color;
    }
}

/* Read a pixel from the framebuffer at (x, y). */
static inline uint32_t geos_fb_read(uint32_t x, uint32_t y) {
    if (x < GEOS_FB_WIDTH && y < GEOS_FB_HEIGHT) {
        return *(volatile uint32_t *)(GEOS_FB_BASE + (y * GEOS_FB_WIDTH + x) * 4);
    }
    return 0;
}

/* ---- Region clipping (Layer 2 multi-program) ---- */

/*
 * Set the framebuffer clip rectangle. After calling this, pixel writes
 * outside (x, y, w, h) are silently dropped. This lets two programs
 * share the framebuffer without clobbering each other's pixels.
 *
 * Format written to MMIO: (y << 24) | (x << 16) | (h << 8) | w
 * Each field is 8 bits. A value of 0 for w or h means 256 (full extent),
 * since the 8-bit field can't encode 256 directly.
 * Pass 0xFFFFFFFF to disable clipping (full-screen access).
 *
 * Returns 0 on success.
 */
static inline int geos_request_region(uint32_t x, uint32_t y,
                                       uint32_t w, uint32_t h) {
    if (x >= GEOS_FB_WIDTH || y >= GEOS_FB_HEIGHT) return -1;
    if (w == 0 || h == 0) return -1;
    /* Clamp to framebuffer bounds */
    if (x + w > GEOS_FB_WIDTH) w = GEOS_FB_WIDTH - x;
    if (y + h > GEOS_FB_HEIGHT) h = GEOS_FB_HEIGHT - y;
    /*
     * Encode: 0 in w/h field means 256 (full extent) since 256
     * doesn't fit in 8 bits. So w=256 -> w_field=0, h=256 -> h_field=0.
     */
    uint8_t wf = (w >= 256) ? 0 : (uint8_t)w;
    uint8_t hf = (h >= 256) ? 0 : (uint8_t)h;
    uint32_t packed = ((uint32_t)(y & 0xFF) << 24) | ((uint32_t)(x & 0xFF) << 16) |
                      ((uint32_t)hf << 8)        | (uint32_t)wf;
    *(volatile uint32_t *)GEOS_FB_CLIP = packed;
    return 0;
}

/* Disable clipping -- full framebuffer access restored. */
static inline void geos_release_region(void) {
    *(volatile uint32_t *)GEOS_FB_CLIP = 0xFFFFFFFFu;
}

/*
 * Check if this program has input focus.
 * SBI ecall into the GEOMETRY extension (function 1).
 * Returns 1 if this program has focus, 0 if not.
 */
static inline long geos_has_focus(void) {
    register long a7 __asm__("a7") = 0x47454F00u; /* SBI_EXT_GEOMETRY */
    register long a0 __asm__("a0") = 2;           /* GEO_FN_GET_FOCUS */
    __asm__ volatile("ecall" : "+r"(a0) : "r"(a7) : "memory", "a1");
    return a0;
}

/* ---- Phase 209: Multi-Process SBI Extensions ---- */

/*
 * Cooperative yield (round-robin). Switches to the next alive context.
 * SBI ecall: a7=SBI_EXT_GEOMETRY, a6=1 (GEO_FN_YIELD).
 * Returns 0 on success.
 */
static inline long geos_yield(void) {
    register long a7 __asm__("a7") = 0x47454F00u; /* SBI_EXT_GEOMETRY */
    register long a6 __asm__("a6") = 1;           /* GEO_FN_YIELD */
    __asm__ volatile("ecall" : "+r"(a7) : "r"(a6) : "memory", "a0", "a1");
    return a7;
}

/*
 * Yield to a specific context by ID.
 * SBI ecall: a7=SBI_EXT_GEOMETRY, a6=2 (GEO_FN_YIELD_TO), a0=target_id.
 * Returns 0 on success.
 */
static inline long geos_yield_to(long target_id) {
    register long a7 __asm__("a7") = 0x47454F00u; /* SBI_EXT_GEOMETRY */
    register long a6 __asm__("a6") = 2;           /* GEO_FN_YIELD_TO */
    register long a0 __asm__("a0") = target_id;
    __asm__ volatile("ecall" : "+r"(a7) : "r"(a6), "r"(a0) : "memory", "a1");
    return a7;
}

/*
 * Spawn a new context at the given entry point.
 * SBI ecall: a7=SBI_EXT_GEOMETRY, a6=3 (GEO_FN_SPAWN), a0=entry_point.
 * Returns the new context ID on success.
 */
static inline long geos_spawn(long entry_point) {
    register long a7 __asm__("a7") = 0x47454F00u; /* SBI_EXT_GEOMETRY */
    register long a6 __asm__("a6") = 3;           /* GEO_FN_SPAWN */
    register long a0 __asm__("a0") = entry_point;
    __asm__ volatile("ecall" : "+r"(a0) : "r"(a7), "r"(a6) : "memory", "a1");
    return a0;
}

/*
 * Kill a context by ID.
 * SBI ecall: a7=SBI_EXT_GEOMETRY, a6=4 (GEO_FN_KILL), a0=context_id.
 * Returns 0 on success.
 */
static inline long geos_kill(long context_id) {
    register long a7 __asm__("a7") = 0x47454F00u; /* SBI_EXT_GEOMETRY */
    register long a6 __asm__("a6") = 4;           /* GEO_FN_KILL */
    register long a0 __asm__("a0") = context_id;
    __asm__ volatile("ecall" : "+r"(a7) : "r"(a6), "r"(a0) : "memory", "a1");
    return a7;
}

/* ---- Timing helpers ---- */

/* CLINT mtime register (64-bit free-running counter).
 *
 * IMPORTANT: mtime increments once per interpreted instruction, NOT per
 * wall-clock millisecond. At ~52 MIPS, 1ms ≈ 52000 ticks, but this is an
 * approximation. On a faster host the interpreter runs faster, so
 * geos_wait_ms(16) completes in less than 16ms wall-clock time. On a slower
 * host it takes longer.
 *
 * This means:
 *   - geos_wait_ms() is fine for "give programs a sense of relative time
 *     so they don't spin-paint maximally"
 *   - geos_wait_ms() is NOT suitable for "60fps wall-clock-locked animation"
 *   - Real wall-clock sync requires a future phase (e.g. host-side VSync
 *     signal or real-time clock MMIO)
 *
 * Read as two 32-bit halves (RISC-V is little-endian). */
#define GEOS_CLINT_MTIME  0x0200BFF8u

/* Read the full 64-bit mtime counter. */
static inline uint64_t geos_mtime(void) {
    uint32_t lo, hi;
    /* Read high word twice to handle wrap-around */
    do {
        hi = *(volatile uint32_t *)(GEOS_CLINT_MTIME + 4);
        lo = *(volatile uint32_t *)(GEOS_CLINT_MTIME);
    } while (hi != *(volatile uint32_t *)(GEOS_CLINT_MTIME + 4));
    return ((uint64_t)hi << 32) | lo;
}

/* Spin-wait until mtime >= target. */
static inline void geos_wait_until(uint64_t target) {
    while (geos_mtime() < target) {
        /* busy loop */
    }
}

/* Spin-wait for N ticks from now. */
static inline void geos_wait_ticks(uint64_t ticks) {
    uint64_t target = geos_mtime() + ticks;
    geos_wait_until(target);
}

/* Approximate ticks per millisecond at 52 MIPS. */
#define GEOS_TICKS_PER_MS 52000

/* Spin-wait for N milliseconds (approximate). */
static inline void geos_wait_ms(uint32_t ms) {
    geos_wait_ticks((uint64_t)ms * GEOS_TICKS_PER_MS);
}

/* ---- Phase 240: Timer and Sleep Syscalls ---- */

/* GEOS SBI function IDs for timer (must match geos_kern.c) */
#define GEO_UPTIME        9
#define GEO_ALARM_SET     10
#define GEO_ALARM_CANCEL  11
#define GEO_MSLEEP        12

/*
 * Get elapsed ticks since kernel boot.
 * `out` points to a uint64_t that receives the 64-bit tick count.
 * Returns 0 on success, -1 on error.
 *
 * Tick rate: ~52 MIPS (each RISC-V instruction = 1 tick).
 * Divide by 52000 for approximate milliseconds.
 */
static inline long geos_uptime(uint64_t *out) {
    register long a7 __asm__("a7") = 0x47454F00u; /* SBI_EXT_GEOMETRY */
    register long a0 __asm__("a0") = GEO_UPTIME;
    register long a1 __asm__("a1") = (long)out;
    __asm__ volatile("ecall" : "+r"(a0) : "r"(a7), "r"(a1) : "memory", "a2");
    return a0;
}

/*
 * Register a one-shot alarm that fires after `delay_ms` milliseconds.
 * `callback` is the function to call when the alarm fires.
 * The callback receives alarm_id as its first argument (a0).
 *
 * Returns alarm_id (>= 0) on success, -1 if no free alarm slots.
 * Maximum 4 concurrent alarms per program.
 */
static inline long geos_alarm_set(long delay_ms, void (*callback)(long)) {
    register long a7 __asm__("a7") = 0x47454F00u; /* SBI_EXT_GEOMETRY */
    register long a0 __asm__("a0") = GEO_ALARM_SET;
    register long a1 __asm__("a1") = delay_ms;
    register long a2 __asm__("a2") = (long)callback;
    __asm__ volatile("ecall" : "+r"(a0) : "r"(a7), "r"(a1), "r"(a2) : "memory");
    return a0;
}

/*
 * Cancel a previously registered alarm.
 * `alarm_id` is the value returned by geos_alarm_set().
 * Returns 0 on success, -1 if invalid or not owned by caller.
 */
static inline long geos_alarm_cancel(long alarm_id) {
    register long a7 __asm__("a7") = 0x47454F00u; /* SBI_EXT_GEOMETRY */
    register long a0 __asm__("a0") = GEO_ALARM_CANCEL;
    register long a1 __asm__("a1") = alarm_id;
    __asm__ volatile("ecall" : "+r"(a0) : "r"(a7), "r"(a1) : "memory");
    return a0;
}

/*
 * Sleep for `ms` milliseconds (cooperative).
 * Yields the CPU and resumes after the delay.
 * Returns 0 on success, -1 if no alarm slots available.
 */
long geos_msleep(long ms);

/* ---- VFS Pixel Surface ---- */

/* MMIO base for the VFS Pixel Surface (256x256 RGBA, same format as framebuffer). */
#define GEOS_VFS_BASE       0x70000000u
#define GEOS_VFS_SIZE       (256 * 256 * 4)
#define GEOS_VFS_CONTROL    (GEOS_VFS_BASE + GEOS_VFS_SIZE)

/* Canvas save marker: written to VFS row 0, column 255 when canvas is saved.
   Row 0 is the VFS directory index. Column 255 is unused by the directory
   (directory uses pixels 0..1+file_count, max ~256 for 254 files).
   Value 0x43414E56 = "CANV" in ASCII. */
#define GEOS_CANVAS_MARKER  0x43414E56u
#define GEOS_CANVAS_MARKER_COL 255

/* Maximum number of framebuffer rows that can be saved (rows 1-255 of VFS). */
#define GEOS_CANVAS_MAX_ROWS 255

/* Save the framebuffer canvas to the VFS Pixel Surface.
   Saves rows 0..254 of the framebuffer to VFS rows 1..255.
   Row 255 of the framebuffer (typically UI chrome) is not saved.
   Sets a marker pixel at VFS (0, 255) to signal valid data.
   Returns 0 on success, -1 on error. */
int geos_save_canvas(void);

/* Load a previously saved canvas from the VFS Pixel Surface.
   Checks for the canvas marker at VFS (0, 255). If present,
   copies VFS rows 1..255 into framebuffer rows 0..254 and presents.
   Returns 0 on success, -1 if no saved canvas found. */
int geos_load_canvas(void);

/* ---- Virtio Block Device ---- */

/* Virtio MMIO base address (block device at 0x1000_1000, matching QEMU virt). */
#define GEOS_VIRTIO_BASE    0x10001000u

/* Sector size (512 bytes). */
#define GEOS_BLK_SECTOR     512u

/*
 * Initialize the virtio-blk device.
 *
 * Performs the full virtio MMIO handshake:
 *   1. Check magic value ("virt")
 *   2. Read device ID (must be 2 = block)
 *   3. Set status to ACKNOWLEDGE | DRIVER | DRIVER_OK
 *   4. Select queue 0, set size, mark ready
 *   5. Set descriptor/available/used ring addresses
 *
 * `desc_buf` must be a pointer to a buffer with space for:
 *   - 16 descriptors × 16 bytes = 256 bytes (descriptor table)
 *   - Available ring: 6 + 16×2 = 38 bytes
 *   - Used ring: 6 + 16×8 = 134 bytes
 *   Total: ~428 bytes, caller should provide at least 512 bytes.
 *
 * Returns 0 on success, -1 on failure.
 */
int geos_blk_init(void *desc_buf);

/*
 * Read one or more 512-byte sectors from the virtio-blk device.
 *
 * `sector`: starting sector number (0-based).
 * `buf`:    destination buffer (must be at least n * 512 bytes).
 * `n`:      number of sectors to read.
 *
 * Returns 0 on success, -1 on I/O error.
 */
int geos_blk_read(uint32_t sector, void *buf, uint32_t n);

/*
 * Write one or more 512-byte sectors to the virtio-blk device.
 *
 * `sector`: starting sector number (0-based).
 * `buf`:    source buffer (must be at least n * 512 bytes).
 * `n`:      number of sectors to write.
 *
 * Returns 0 on success, -1 on I/O error.
 */
int geos_blk_write(uint32_t sector, const void *buf, uint32_t n);

/* ---- Minimal string functions (no libc) ---- */

int geos_strlen(const char *s);
void *geos_memset(void *dst, int val, unsigned int n);

/* ---- Bitmap font rendering (Phase 218) ---- */

/* Draw a single 8x8 character onto the framebuffer.
   (x, y): top-left corner. fg/bg: colors (0xRRGGBBAA).
   Pass bg=0 for transparent background (only set bits drawn).
   Returns 8 (character width in pixels). */
int geos_draw_char(int x, int y, char ch, uint32_t fg, uint32_t bg);

/* Draw a null-terminated string using the 8x8 font.
   Returns the total pixel width consumed. */
int geos_draw_string(int x, int y, const char *str, uint32_t fg, uint32_t bg);

/* Measure the pixel width of a string without drawing.
   Returns the width in pixels (len * 8). */
int geos_measure_string(const char *str);

/* ---- Phase 235: Shared Memory IPC ---- */

/* Ring buffer header layout at the start of each shared memory region.
 * All fields are u32 at word offsets from the region base. */
#define GEOS_SHM_HDR_WRITE_POS  0
#define GEOS_SHM_HDR_READ_POS   1
#define GEOS_SHM_HDR_CAPACITY   2
#define GEOS_SHM_HDR_FLAGS      3
#define GEOS_SHM_HDR_SIZE       4   /* 16 bytes = 4 words */
#define GEOS_SHM_FLAG_DONE      0x01u

/*
 * Allocate a shared memory slot.
 * SBI ecall: a7=SBI_EXT_GEOMETRY, a0=GEO_SHM_ALLOC (6), a1=size.
 * Returns slot ID (>= 0) on success, -1 if no free slots.
 */
static inline long geos_shm_alloc(long size_bytes) {
    register long a7 __asm__("a7") = 0x47454F00u;
    register long a0 __asm__("a0") = 6;              /* GEO_SHM_ALLOC */
    register long a1 __asm__("a1") = size_bytes;
    __asm__ volatile("ecall" : "+r"(a0) : "r"(a7), "r"(a1) : "memory");
    return a0;
}

/*
 * Map (get base address of) a shared memory slot by ID.
 * SBI ecall: a7=SBI_EXT_GEOMETRY, a0=GEO_SHM_MAP (7), a1=slot_id.
 * Returns physical base address on success, -1 if invalid ID.
 */
static inline long geos_shm_map(long slot_id) {
    register long a7 __asm__("a7") = 0x47454F00u;
    register long a0 __asm__("a0") = 7;              /* GEO_SHM_MAP */
    register long a1 __asm__("a1") = slot_id;
    __asm__ volatile("ecall" : "+r"(a0) : "r"(a7), "r"(a1) : "memory");
    return a0;
}

/*
 * Release a shared memory slot.
 * SBI ecall: a7=SBI_EXT_GEOMETRY, a0=GEO_SHM_RELEASE (8), a1=slot_id.
 * Returns 0 on success, -1 if invalid ID.
 */
static inline long geos_shm_release(long slot_id) {
    register long a7 __asm__("a7") = 0x47454F00u;
    register long a0 __asm__("a0") = 8;              /* GEO_SHM_RELEASE */
    register long a1 __asm__("a1") = slot_id;
    __asm__ volatile("ecall" : "+r"(a0) : "r"(a7), "r"(a1) : "memory");
    return a0;
}

/*
 * Write a u32 word into a shared memory ring buffer.
 * `base` = physical base address of the shared memory region (from geos_shm_map).
 * `val`  = the value to write.
 * Returns 0 on success, -1 if the ring buffer is full.
 *
 * The producer advances write_pos; the consumer reads read_pos.
 * If write_pos catches up to read_pos (mod capacity), the buffer is full.
 */
static inline int geos_shm_write(volatile uint32_t *base, uint32_t val) {
    uint32_t wp = base[GEOS_SHM_HDR_WRITE_POS];
    uint32_t rp = base[GEOS_SHM_HDR_READ_POS];
    uint32_t cap = base[GEOS_SHM_HDR_CAPACITY];
    uint32_t next = (wp + 1) % cap;
    if (next == rp) return -1; /* full */
    base[GEOS_SHM_HDR_SIZE + wp] = val;
    base[GEOS_SHM_HDR_WRITE_POS] = next;
    return 0;
}

/*
 * Read a u32 word from a shared memory ring buffer.
 * `base` = physical base address of the shared memory region.
 * `out`  = pointer to receive the value.
 * Returns 0 on success, -1 if the ring buffer is empty.
 */
static inline int geos_shm_read(volatile uint32_t *base, uint32_t *out) {
    uint32_t wp = base[GEOS_SHM_HDR_WRITE_POS];
    uint32_t rp = base[GEOS_SHM_HDR_READ_POS];
    if (wp == rp) return -1; /* empty */
    *out = base[GEOS_SHM_HDR_SIZE + rp];
    base[GEOS_SHM_HDR_READ_POS] = (rp + 1) % base[GEOS_SHM_HDR_CAPACITY];
    return 0;
}

/*
 * Signal that the producer is done writing.
 * Sets the DONE flag in the shared memory header.
 * The consumer can check this flag to know when to stop reading.
 */
static inline void geos_shm_signal_done(volatile uint32_t *base) {
    base[GEOS_SHM_HDR_FLAGS] |= GEOS_SHM_FLAG_DONE;
}

/*
 * Check if the producer has signaled done.
 * Returns 1 if done, 0 otherwise.
 */
static inline int geos_shm_is_done(volatile uint32_t *base) {
    return (base[GEOS_SHM_HDR_FLAGS] & GEOS_SHM_FLAG_DONE) != 0;
}

#endif /* LIBGEOS_H */
