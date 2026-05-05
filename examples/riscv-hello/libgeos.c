/*
 * libgeos.c -- shared bare-metal primitives for Geometry OS guest programs
 *
 * SBI console I/O and utility functions. Linked as libgeos.a.
 * Framebuffer inline helpers are in libgeos.h (zero function-call overhead).
 *
 * Build: riscv64-linux-gnu-gcc -c -march=rv32imac_zicsr -mabi=ilp32 -O2 libgeos.c
 *        riscv64-linux-gnu-ar rcs libgeos.a libgeos.o
 */

#include "libgeos.h"

/* ---- SBI helpers ---- */

long sbi_console_putchar(int ch) {
    register long a0 __asm__("a0") = ch;
    register long a7 __asm__("a7") = 1;
    __asm__ volatile("ecall" : "+r"(a0) : "r"(a7) : "memory", "a1");
    return a0;
}

__attribute__((noreturn)) void sbi_shutdown(void) {
    register long a7 __asm__("a7") = 8;
    __asm__ volatile("ecall" : : "r"(a7) : "memory", "a0", "a1");
    __builtin_unreachable();
}

long sbi_console_getchar(void) {
    register long a0 __asm__("a0") = 0;
    register long a7 __asm__("a7") = 2;
    __asm__ volatile("ecall" : "+r"(a0) : "r"(a7) : "memory", "a1");
    return a0;
}

/* Read one character from SBI console, blocking until available. */
char geos_getchar(void) {
    long ch;
    while ((ch = sbi_console_getchar()) < 0) {
        /* spin until a character is available */
    }
    return (char)ch;
}

/* ---- Console output ---- */

void geos_puts(const char *s) {
    while (*s) sbi_console_putchar(*s++);
}

void geos_put_dec(uint32_t val) {
    if (val == 0) {
        sbi_console_putchar('0');
        return;
    }
    char buf[12];
    int i = 0;
    while (val > 0) {
        buf[i++] = '0' + (val % 10);
        val /= 10;
    }
    while (i > 0) sbi_console_putchar(buf[--i]);
}

void geos_put_hex(uint32_t val) {
    static const char hex[] = "0123456789ABCDEF";
    sbi_console_putchar('0');
    sbi_console_putchar('x');
    for (int i = 28; i >= 0; i -= 4) {
        sbi_console_putchar(hex[(val >> i) & 0xF]);
    }
}

/* ---- VFS Pixel Surface: Canvas Save/Load ---- */

int geos_save_canvas(void) {
    volatile uint32_t *fb = (volatile uint32_t *)GEOS_FB_BASE;
    volatile uint32_t *vfs = (volatile uint32_t *)GEOS_VFS_BASE;

    /* Copy framebuffer rows 0..254 to VFS rows 1..255.
       Each row is 256 pixels (1024 bytes). We do word-by-word copies. */
    for (int row = 0; row < GEOS_CANVAS_MAX_ROWS; row++) {
        for (int col = 0; col < GEOS_FB_WIDTH; col++) {
            vfs[(row + 1) * GEOS_FB_WIDTH + col] = fb[row * GEOS_FB_WIDTH + col];
        }
    }

    /* Set canvas marker at VFS (row 0, col 255) */
    vfs[GEOS_CANVAS_MARKER_COL] = GEOS_CANVAS_MARKER;

    return 0;
}

int geos_load_canvas(void) {
    volatile uint32_t *fb = (volatile uint32_t *)GEOS_FB_BASE;
    volatile uint32_t *vfs = (volatile uint32_t *)GEOS_VFS_BASE;

    /* Check for canvas marker */
    if (vfs[GEOS_CANVAS_MARKER_COL] != GEOS_CANVAS_MARKER) {
        return -1;
    }

    /* Copy VFS rows 1..255 into framebuffer rows 0..254 */
    for (int row = 0; row < GEOS_CANVAS_MAX_ROWS; row++) {
        for (int col = 0; col < GEOS_FB_WIDTH; col++) {
            fb[row * GEOS_FB_WIDTH + col] = vfs[(row + 1) * GEOS_FB_WIDTH + col];
        }
    }

    geos_fb_present();
    return 0;
}

/* ---- Virtio Block Device Driver ---- */

/* Virtio MMIO register offsets. */
#define VIO_MAGIC       0x00
#define VIO_VERSION     0x04
#define VIO_DEVID       0x08
#define VIO_STATUS      0x28
#define VIO_QSEL        0x30
#define VIO_QNUMMAX     0x34
#define VIO_QNUM        0x38
#define VIO_QREADY      0x44
#define VIO_DESCLO      0x48
#define VIO_DESCHI       0x4C
#define VIO_AVAILLO     0x50
#define VIO_AVAILHI     0x54
#define VIO_USEDLO      0x58
#define VIO_USEDHI      0x5C
#define VIO_NOTIFY      0x60
#define VIO_INTACK      0x64
#define VIO_INTSTATUS   0x70
#define VIO_CONFIG      0x100

/* Virtio status bits. */
#define VIO_S_ACK       1
#define VIO_S_DRIVER    2
#define VIO_S_DRVOK     4

/* Virtio descriptor flags. */
#define VDESC_F_NEXT    0x0001
#define VDESC_F_WRITE   0x0002

/* Virtio block request types. */
#define VBLK_T_IN       0   /* Read */
#define VBLK_T_OUT      1   /* Write */

/* Virtio block status. */
#define VBLK_S_OK       0

/* Queue size we use (must be <= QUEUE_SIZE in host, which is 16). */
#define VIO_QUEUE_SIZE  4

/* Descriptor table: 4 descriptors × 16 bytes = 64 bytes.
 * Available ring: 2(flags) + 2(idx) + 4×2(ring) = 12 bytes.  Offset at 64.
 * Used ring:      2(flags) + 2(idx) + 4×8(entries) = 36 bytes. Offset at 76.
 * Total: 112 bytes minimum. We place them at known offsets within desc_buf.
 */
#define DESC_OFF    0       /* Descriptor table at offset 0 (16 descs × 16B = 256 bytes) */
#define AVAIL_OFF   288     /* Available ring: after desc table (256) + header (16) + status (1) + pad (15) */
#define USED_OFF    304     /* Used ring: after avail ring (288 + 16 = 304) */

/* Track the physical address of the descriptor buffer for queue setup. */
static void *blk_desc_buf = (void *)0;
static uint32_t blk_avail_idx = 0;
static uint32_t blk_used_idx = 0;

/* Read a 32-bit MMIO register. */
static inline uint32_t vio_read(uint32_t off) {
    return *(volatile uint32_t *)(GEOS_VIRTIO_BASE + off);
}

/* Write a 32-bit MMIO register. */
static inline void vio_write(uint32_t off, uint32_t val) {
    *(volatile uint32_t *)(GEOS_VIRTIO_BASE + off) = val;
}

int geos_blk_init(void *desc_buf) {
    blk_desc_buf = desc_buf;
    blk_avail_idx = 0;
    blk_used_idx = 0;

    /* Check magic value */
    if (vio_read(VIO_MAGIC) != 0x74726976u) {
        return -1;
    }

    /* Check device ID (2 = block) */
    if (vio_read(VIO_DEVID) != 2) {
        return -1;
    }

    /* Reset device */
    vio_write(VIO_STATUS, 0);

    /* Set status: ACKNOWLEDGE | DRIVER | DRIVER_OK */
    vio_write(VIO_STATUS, VIO_S_ACK | VIO_S_DRIVER | VIO_S_DRVOK);

    /* Select queue 0 */
    vio_write(VIO_QSEL, 0);

    /* Set queue size */
    uint32_t max_qnum = vio_read(VIO_QNUMMAX);
    if (max_qnum < VIO_QUEUE_SIZE) {
        return -1;
    }
    vio_write(VIO_QNUM, VIO_QUEUE_SIZE);

    /* Mark queue ready */
    vio_write(VIO_QREADY, 1);

    /* Set descriptor table address */
    uint32_t desc_addr = (uint32_t)(uintptr_t)desc_buf + DESC_OFF;
    vio_write(VIO_DESCLO, desc_addr);
    vio_write(VIO_DESCHI, 0);

    /* Set available ring address */
    uint32_t avail_addr = (uint32_t)(uintptr_t)desc_buf + AVAIL_OFF;
    vio_write(VIO_AVAILLO, avail_addr);
    vio_write(VIO_AVAILHI, 0);

    /* Set used ring address */
    uint32_t used_addr = (uint32_t)(uintptr_t)desc_buf + USED_OFF;
    vio_write(VIO_USEDLO, used_addr);
    vio_write(VIO_USEDHI, 0);

    return 0;
}

/*
 * Submit a single-sector read or write request via the virtqueue.
 * Returns 0 on success (status byte == VBLK_S_OK), -1 on error.
 */
static int blk_submit(uint32_t req_type, uint32_t sector,
                      void *data_buf, uint32_t data_len) {
    uint8_t *base = (uint8_t *)blk_desc_buf;
    uint32_t desc_addr = (uint32_t)(uintptr_t)base + DESC_OFF;
    uint32_t avail_addr = (uint32_t)(uintptr_t)base + AVAIL_OFF;
    uint32_t used_addr = (uint32_t)(uintptr_t)base + USED_OFF;

    /* We use 3 descriptors per request:
     * desc[0]: request header (16 bytes, read-only, chain to 1)
     * desc[1]: data buffer (512 bytes, writable for read / read-only for write, chain to 2)
     * desc[2]: status byte (1 byte, writable)
     *
     * We cycle through descriptors: (avail_idx % VIO_QUEUE_SIZE) * 3
     */
    uint32_t di = (blk_avail_idx % VIO_QUEUE_SIZE) * 3;

    /* -- Set up descriptor[di]: request header -- */
    /* The header is embedded at the start of desc_buf + 256 (after used ring).
     * Actually, we can just use a static buffer or put it in the data area.
     * Let's use a fixed area: offset 256 from base. */
    uint32_t hdr_addr = (uint32_t)(uintptr_t)base + 256;

    /* Write header: type(u32) + reserved(u32) + sector(u64) = 16 bytes */
    volatile uint32_t *hdr = (volatile uint32_t *)hdr_addr;
    hdr[0] = req_type;         /* type */
    hdr[1] = 0;                /* reserved */
    hdr[2] = sector;           /* sector lo */
    hdr[3] = 0;                /* sector hi */

    /* Write descriptor[di]: addr=hdr_addr, len=16, flags=NEXT, next=di+1 */
    volatile uint32_t *d0 = (volatile uint32_t *)(desc_addr + di * 16);
    d0[0] = hdr_addr;          /* addr lo */
    d0[1] = 0;                 /* addr hi */
    d0[2] = 16;                /* len */
    d0[3] = VDESC_F_NEXT | ((di + 1) << 16);  /* flags | next */

    /* Write descriptor[di+1]: data buffer */
    uint32_t data_addr = (uint32_t)(uintptr_t)data_buf;
    uint16_t data_flags = (req_type == VBLK_T_IN) ? VDESC_F_WRITE : 0;
    volatile uint32_t *d1 = (volatile uint32_t *)(desc_addr + (di + 1) * 16);
    d1[0] = data_addr;         /* addr lo */
    d1[1] = 0;                 /* addr hi */
    d1[2] = data_len;          /* len */
    d1[3] = data_flags | VDESC_F_NEXT | ((di + 2) << 16);

    /* Write descriptor[di+2]: status byte */
    uint32_t status_addr = (uint32_t)(uintptr_t)base + 272;  /* after header */
    volatile uint32_t *d2 = (volatile uint32_t *)(desc_addr + (di + 2) * 16);
    d2[0] = status_addr;       /* addr lo */
    d2[1] = 0;                 /* addr hi */
    d2[2] = 1;                 /* len = 1 byte */
    d2[3] = VDESC_F_WRITE;     /* writable, no next */

    /* Clear status byte before submission */
    *(volatile uint8_t *)status_addr = 0xFF;

    /* Write available ring entry: ring[avail_idx % VIO_QUEUE_SIZE] = di */
    volatile uint16_t *avail_ring = (volatile uint16_t *)(avail_addr + 4);
    avail_ring[blk_avail_idx % VIO_QUEUE_SIZE] = (uint16_t)di;

    /* Increment available index */
    blk_avail_idx++;

    /* Write avail index to memory (u16 at avail_addr + 2) */
    volatile uint16_t *avail_idx_ptr = (volatile uint16_t *)(avail_addr + 2);
    *avail_idx_ptr = (uint16_t)blk_avail_idx;

    /* Memory barrier (compiler barrier) */
    __asm__ volatile("" ::: "memory");

    /* Notify the device */
    vio_write(VIO_NOTIFY, 0);

    /* Wait for completion: poll used ring index */
    /* The host writes the used index at used_addr + 2 */
    volatile uint16_t *used_idx_ptr = (volatile uint16_t *)(used_addr + 2);
    uint32_t timeout = 100000;
    while ((uint16_t)*used_idx_ptr == (uint16_t)blk_used_idx) {
        if (--timeout == 0) {
            return -1;  /* timeout */
        }
    }

    /* Read status byte */
    uint8_t status = *(volatile uint8_t *)status_addr;
    blk_used_idx++;

    /* Acknowledge interrupt */
    vio_write(VIO_INTACK, 1);

    return (status == VBLK_S_OK) ? 0 : -1;
}

int geos_blk_read(uint32_t sector, void *buf, uint32_t n) {
    uint8_t *dst = (uint8_t *)buf;
    for (uint32_t i = 0; i < n; i++) {
        if (blk_submit(VBLK_T_IN, sector + i, dst + i * GEOS_BLK_SECTOR,
                       GEOS_BLK_SECTOR) != 0) {
            return -1;
        }
    }
    return 0;
}

int geos_blk_write(uint32_t sector, const void *buf, uint32_t n) {
    const uint8_t *src = (const uint8_t *)buf;
    for (uint32_t i = 0; i < n; i++) {
        if (blk_submit(VBLK_T_OUT, sector + i,
                       (void *)(src + i * GEOS_BLK_SECTOR),
                       GEOS_BLK_SECTOR) != 0) {
            return -1;
        }
    }
    return 0;
}

/* ---- Minimal string functions (no libc) ---- */

int geos_strlen(const char *s) {
    int len = 0;
    while (s[len]) len++;
    return len;
}

void *geos_memset(void *dst, int val, unsigned int n) {
    unsigned char *d = (unsigned char *)dst;
    while (n--) *d++ = (unsigned char)val;
    return dst;
}

/* ---- 8x8 Bitmap Font (Phase 218) ---- */

/*
 * 8x8 VGA/CP437-style bitmap font.
 * 128 glyphs (ASCII 0x00-0x7F). Each glyph is 8 rows of 8-bit wide bitmaps.
 * Bit test: glyph[row] & (1 << (7 - col)) to check if pixel is on.
 *
 * Source: Same CP437/VGA glyphs as GeOS font.rs for visual consistency.
 * Characters 0x00-0x1F and 0x7F are blank (all zeros).
 * Total size: 128 * 8 = 1024 bytes.
 */
static const uint8_t geos_font8x8[128][8] = {
    /* 0x00-0x1F: control characters (blank) */
    [0x00 ... 0x1F] = {{0}},
    /* 0x20: space */
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
    /* 0x21: ! */
    {0x18, 0x18, 0x18, 0x18, 0x18, 0x00, 0x18, 0x00},
    /* 0x22: " */
    {0x6C, 0x6C, 0x6C, 0x00, 0x00, 0x00, 0x00, 0x00},
    /* 0x23: # */
    {0x6C, 0x6C, 0xFE, 0x6C, 0xFE, 0x6C, 0x6C, 0x00},
    /* 0x24: $ */
    {0x18, 0x3E, 0x60, 0x3C, 0x06, 0x7C, 0x18, 0x00},
    /* 0x25: % */
    {0x00, 0xC6, 0xCC, 0x18, 0x30, 0x66, 0xC6, 0x00},
    /* 0x26: & */
    {0x38, 0x6C, 0x38, 0x76, 0xDC, 0xCC, 0x76, 0x00},
    /* 0x27: ' */
    {0x18, 0x18, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00},
    /* 0x28: ( */
    {0x0C, 0x18, 0x30, 0x30, 0x30, 0x18, 0x0C, 0x00},
    /* 0x29: ) */
    {0x30, 0x18, 0x0C, 0x0C, 0x0C, 0x18, 0x30, 0x00},
    /* 0x2A: * */
    {0x00, 0x66, 0x3C, 0xFF, 0x3C, 0x66, 0x00, 0x00},
    /* 0x2B: + */
    {0x00, 0x18, 0x18, 0x7E, 0x18, 0x18, 0x00, 0x00},
    /* 0x2C: , */
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x18, 0x30},
    /* 0x2D: - */
    {0x00, 0x00, 0x00, 0x7E, 0x00, 0x00, 0x00, 0x00},
    /* 0x2E: . */
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x18, 0x00},
    /* 0x2F: / */
    {0x06, 0x0C, 0x18, 0x30, 0x60, 0xC0, 0x80, 0x00},
    /* 0x30: 0 */
    {0x7C, 0xC6, 0xCE, 0xDE, 0xF6, 0xE6, 0x7C, 0x00},
    /* 0x31: 1 */
    {0x18, 0x38, 0x18, 0x18, 0x18, 0x18, 0x7E, 0x00},
    /* 0x32: 2 */
    {0x7C, 0xC6, 0x06, 0x1C, 0x30, 0x66, 0xFE, 0x00},
    /* 0x33: 3 */
    {0x7C, 0xC6, 0x06, 0x3C, 0x06, 0xC6, 0x7C, 0x00},
    /* 0x34: 4 */
    {0x1C, 0x3C, 0x6C, 0xCC, 0xFE, 0x0C, 0x1E, 0x00},
    /* 0x35: 5 */
    {0xFE, 0xC0, 0xFC, 0x06, 0x06, 0xC6, 0x7C, 0x00},
    /* 0x36: 6 */
    {0x38, 0x60, 0xC0, 0xFC, 0xC6, 0xC6, 0x7C, 0x00},
    /* 0x37: 7 */
    {0xFE, 0xC6, 0x0C, 0x18, 0x30, 0x30, 0x30, 0x00},
    /* 0x38: 8 */
    {0x7C, 0xC6, 0xC6, 0x7C, 0xC6, 0xC6, 0x7C, 0x00},
    /* 0x39: 9 */
    {0x7C, 0xC6, 0xC6, 0x7E, 0x06, 0x0C, 0x78, 0x00},
    /* 0x3A: : */
    {0x00, 0x18, 0x18, 0x00, 0x00, 0x18, 0x18, 0x00},
    /* 0x3B: ; */
    {0x00, 0x18, 0x18, 0x00, 0x00, 0x18, 0x18, 0x30},
    /* 0x3C: < */
    {0x06, 0x0C, 0x18, 0x30, 0x18, 0x0C, 0x06, 0x00},
    /* 0x3D: = */
    {0x00, 0x00, 0x7E, 0x00, 0x7E, 0x00, 0x00, 0x00},
    /* 0x3E: > */
    {0x60, 0x30, 0x18, 0x0C, 0x18, 0x30, 0x60, 0x00},
    /* 0x3F: ? */
    {0x7C, 0xC6, 0x0C, 0x18, 0x18, 0x00, 0x18, 0x00},
    /* 0x40: @ */
    {0x7C, 0xC6, 0xDE, 0xDE, 0xDE, 0xC0, 0x78, 0x00},
    /* 0x41: A */
    {0x38, 0x6C, 0xC6, 0xC6, 0xFE, 0xC6, 0xC6, 0x00},
    /* 0x42: B */
    {0xFC, 0x66, 0x66, 0x7C, 0x66, 0x66, 0xFC, 0x00},
    /* 0x43: C */
    {0x3C, 0x66, 0xC0, 0xC0, 0xC0, 0x66, 0x3C, 0x00},
    /* 0x44: D */
    {0xF8, 0x6C, 0x66, 0x66, 0x66, 0x6C, 0xF8, 0x00},
    /* 0x45: E */
    {0xFE, 0x62, 0x68, 0x78, 0x68, 0x62, 0xFE, 0x00},
    /* 0x46: F */
    {0xFE, 0x62, 0x68, 0x78, 0x68, 0x60, 0xF0, 0x00},
    /* 0x47: G */
    {0x3C, 0x66, 0xC0, 0xC0, 0xCE, 0x66, 0x3E, 0x00},
    /* 0x48: H */
    {0xC6, 0xC6, 0xC6, 0xFE, 0xC6, 0xC6, 0xC6, 0x00},
    /* 0x49: I */
    {0x3C, 0x18, 0x18, 0x18, 0x18, 0x18, 0x3C, 0x00},
    /* 0x4A: J */
    {0x1E, 0x0C, 0x0C, 0x0C, 0xCC, 0xCC, 0x78, 0x00},
    /* 0x4B: K */
    {0xE6, 0x66, 0x6C, 0x78, 0x6C, 0x66, 0xE6, 0x00},
    /* 0x4C: L */
    {0xF0, 0x60, 0x60, 0x60, 0x62, 0x66, 0xFE, 0x00},
    /* 0x4D: M */
    {0xC6, 0xEE, 0xFE, 0xFE, 0xD6, 0xC6, 0xC6, 0x00},
    /* 0x4E: N */
    {0xC6, 0xE6, 0xF6, 0xDE, 0xCE, 0xC6, 0xC6, 0x00},
    /* 0x4F: O */
    {0x7C, 0xC6, 0xC6, 0xC6, 0xC6, 0xC6, 0x7C, 0x00},
    /* 0x50: P */
    {0xFC, 0x66, 0x66, 0x7C, 0x60, 0x60, 0xF0, 0x00},
    /* 0x51: Q */
    {0x7C, 0xC6, 0xC6, 0xC6, 0xD6, 0xDE, 0x7C, 0x06},
    /* 0x52: R */
    {0xFC, 0x66, 0x66, 0x7C, 0x6C, 0x66, 0xE6, 0x00},
    /* 0x53: S */
    {0x3C, 0x66, 0x30, 0x18, 0x0C, 0x66, 0x3C, 0x00},
    /* 0x54: T */
    {0x7E, 0x5A, 0x18, 0x18, 0x18, 0x18, 0x3C, 0x00},
    /* 0x55: U */
    {0xC6, 0xC6, 0xC6, 0xC6, 0xC6, 0xC6, 0x7C, 0x00},
    /* 0x56: V */
    {0xC6, 0xC6, 0xC6, 0xC6, 0x6C, 0x38, 0x10, 0x00},
    /* 0x57: W */
    {0xC6, 0xC6, 0xC6, 0xD6, 0xFE, 0xEE, 0xC6, 0x00},
    /* 0x58: X */
    {0xC6, 0x6C, 0x38, 0x38, 0x6C, 0xC6, 0xC6, 0x00},
    /* 0x59: Y */
    {0x66, 0x66, 0x66, 0x3C, 0x18, 0x18, 0x3C, 0x00},
    /* 0x5A: Z */
    {0xFE, 0xC6, 0x8C, 0x18, 0x32, 0x66, 0xFE, 0x00},
    /* 0x5B: [ */
    {0x3C, 0x30, 0x30, 0x30, 0x30, 0x30, 0x3C, 0x00},
    /* 0x5C: backslash */
    {0xC0, 0x60, 0x30, 0x18, 0x0C, 0x06, 0x02, 0x00},
    /* 0x5D: ] */
    {0x3C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x3C, 0x00},
    /* 0x5E: ^ */
    {0x10, 0x38, 0x6C, 0xC6, 0x00, 0x00, 0x00, 0x00},
    /* 0x5F: _ */
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFE},
    /* 0x60: ` */
    {0x18, 0x18, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00},
    /* 0x61: a */
    {0x00, 0x00, 0x78, 0x0C, 0x7C, 0xCC, 0x76, 0x00},
    /* 0x62: b */
    {0xE0, 0x60, 0x7C, 0x66, 0x66, 0x66, 0xDC, 0x00},
    /* 0x63: c */
    {0x00, 0x00, 0x7C, 0xC6, 0xC0, 0xC6, 0x7C, 0x00},
    /* 0x64: d */
    {0x1C, 0x0C, 0x7C, 0xCC, 0xCC, 0xCC, 0x76, 0x00},
    /* 0x65: e */
    {0x00, 0x00, 0x7C, 0xC6, 0xFE, 0xC0, 0x7C, 0x00},
    /* 0x66: f */
    {0x1C, 0x36, 0x30, 0x78, 0x30, 0x30, 0x78, 0x00},
    /* 0x67: g */
    {0x00, 0x00, 0x76, 0xCC, 0xCC, 0x7C, 0x0C, 0xF8},
    /* 0x68: h */
    {0xE0, 0x60, 0x6C, 0x76, 0x66, 0x66, 0xE6, 0x00},
    /* 0x69: i */
    {0x18, 0x00, 0x38, 0x18, 0x18, 0x18, 0x3C, 0x00},
    /* 0x6A: j */
    {0x06, 0x00, 0x06, 0x06, 0x06, 0x66, 0x66, 0x3C},
    /* 0x6B: k */
    {0xE0, 0x60, 0x66, 0x6C, 0x78, 0x6C, 0xE6, 0x00},
    /* 0x6C: l */
    {0x38, 0x18, 0x18, 0x18, 0x18, 0x18, 0x3C, 0x00},
    /* 0x6D: m */
    {0x00, 0x00, 0xCC, 0xFE, 0xFE, 0xD6, 0xC6, 0x00},
    /* 0x6E: n */
    {0x00, 0x00, 0xDC, 0x66, 0x66, 0x66, 0x66, 0x00},
    /* 0x6F: o */
    {0x00, 0x00, 0x3C, 0x66, 0x66, 0x66, 0x3C, 0x00},
    /* 0x70: p */
    {0x00, 0x00, 0xDC, 0x66, 0x66, 0x7C, 0x60, 0xF0},
    /* 0x71: q */
    {0x00, 0x00, 0x76, 0xCC, 0xCC, 0x7C, 0x0C, 0x1E},
    /* 0x72: r */
    {0x00, 0x00, 0xDC, 0x76, 0x60, 0x60, 0xF0, 0x00},
    /* 0x73: s */
    {0x00, 0x00, 0x7E, 0xC0, 0x7C, 0x06, 0xFC, 0x00},
    /* 0x74: t */
    {0x30, 0x30, 0x7C, 0x30, 0x30, 0x36, 0x1C, 0x00},
    /* 0x75: u */
    {0x00, 0x00, 0xCC, 0xCC, 0xCC, 0xCC, 0x76, 0x00},
    /* 0x76: v */
    {0x00, 0x00, 0xC6, 0xC6, 0xC6, 0x6C, 0x38, 0x00},
    /* 0x77: w */
    {0x00, 0x00, 0xC6, 0xC6, 0xD6, 0xFE, 0x6C, 0x00},
    /* 0x78: x */
    {0x00, 0x00, 0xC6, 0x6C, 0x38, 0x6C, 0xC6, 0x00},
    /* 0x79: y */
    {0x00, 0x00, 0xC6, 0xC6, 0xCE, 0x76, 0x06, 0x7C},
    /* 0x7A: z */
    {0x00, 0x00, 0xFC, 0x98, 0x30, 0x64, 0xFC, 0x00},
    /* 0x7B: { */
    {0x0E, 0x18, 0x18, 0x70, 0x18, 0x18, 0x0E, 0x00},
    /* 0x7C: | */
    {0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x00},
    /* 0x7D: } */
    {0x70, 0x18, 0x18, 0x0E, 0x18, 0x18, 0x70, 0x00},
    /* 0x7E: ~ */
    {0x76, 0xDC, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
    /* 0x7F: DEL (blank) */
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
};

/* ---- Bitmap font rendering (Phase 218) ---- */

/*
 * Draw a single character from the 8x8 font onto the framebuffer.
 *
 * (x, y): top-left corner of the character cell.
 * ch:     character to draw (ASCII 0x00-0x7F; others are treated as blank).
 * fg:     foreground color (0xRRGGBBAA).
 * bg:     background color (0xRRGGBBAA). Pass 0 to skip background fill
 *         (transparent background, only set bits are drawn).
 *
 * Returns 8 (the character width in pixels).
 */
int geos_draw_char(int x, int y, char ch, uint32_t fg, uint32_t bg) {
    unsigned int idx = (unsigned char)ch;
    if (idx >= 128) idx = 0; /* out of range: treat as space */

    const uint8_t *glyph = geos_font8x8[idx];

    for (int row = 0; row < 8; row++) {
        uint8_t bits = glyph[row];
        for (int col = 0; col < 8; col++) {
            int px = x + col;
            int py = y + row;
            if (px < 0 || px >= GEOS_FB_WIDTH || py < 0 || py >= GEOS_FB_HEIGHT)
                continue;
            if (bits & (1 << (7 - col))) {
                geos_fb_pixel((uint32_t)px, (uint32_t)py, fg);
            } else if (bg) {
                geos_fb_pixel((uint32_t)px, (uint32_t)py, bg);
            }
        }
    }
    return 8;
}

/*
 * Draw a null-terminated string using the 8x8 font onto the framebuffer.
 *
 * (x, y): top-left corner of the first character cell.
 * str:    null-terminated string to render.
 * fg:     foreground color (0xRRGGBBAA).
 * bg:     background color (0xRRGGBBAA). Pass 0 for transparent background.
 *
 * Returns the total pixel width consumed (len * 8).
 */
int geos_draw_string(int x, int y, const char *str, uint32_t fg, uint32_t bg) {
    int cx = x;
    while (*str) {
        if (cx + 8 > GEOS_FB_WIDTH) break; /* clip at right edge */
        geos_draw_char(cx, y, *str, fg, bg);
        cx += 8;
        str++;
    }
    return cx - x;
}

/*
 * Measure the pixel width of a string rendered with the 8x8 font.
 * Does not draw anything.
 *
 * Returns the width in pixels (number_of_chars * 8).
 */
int geos_measure_string(const char *str) {
    int len = 0;
    while (str[len]) len++;
    return len * 8;
}
