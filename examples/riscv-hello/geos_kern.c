/*
 * geos_kern.c -- Geometry OS Layer 2 supervisor (Phase I multi-program kernel)
 *
 * Cooperatively schedules two guest programs (guest_a at SLOT_A, guest_b at
 * SLOT_B). Uses the hand-written trap handler in kern_trap.S which saves/
 * restores full register context and toggles between programs on each timer
 * tick.
 *
 * Layout:
 *   SLOT_A = 0x80010000  (guest_a code+data, 256KB)
 *   SLOT_B = 0x80050000  (guest_b code+data, 256KB)
 *   STACK_A = 0x80100000 (guest_a stack, grows down)
 *   STACK_B = 0x80110000 (guest_b stack, grows down)
 *
 * The kernel itself lives at 0x80000000. Guest images are embedded via
 * guest_images.S (.incbin of guest_a.bin / guest_b.bin) and copied to
 * their slots at boot.
 *
 * Clip rects are applied by kern_apply_clip() on each timer tick, so the
 * framebuffer hardware enforces per-program pixel ownership.
 */

#include "libgeos.h"
#include <stdint.h>

/* Slot addresses from build_kern.sh */
#define SLOT_A        0x80010000u
#define SLOT_B        0x80050000u
#define STACK_A       0x80100000u
#define STACK_B       0x80110000u

/* Context struct layout must match kern_trap.S offsets:
 *   [0]  = padding (unused, tp was swapped at entry)
 *   [4]  = x1  (ra)
 *   [8]  = sp
 *   [12] = x3  (gp)
 *   [16] = x4  (tp, saved from mscratch)
 *   [20..124] = x5..x31 (saved registers)
 *   [128] = mepc
 *   Total: 132 bytes = 33 u32 words
 */
#define CTX_SIZE      132
#define CTX_SP_OFF    8
#define CTX_GP_OFF    12
#define CTX_TP_OFF    16
#define CTX_A0_OFF    40   /* x10 */
#define CTX_RA_OFF    4    /* x1 */
#define CTX_MEPC_OFF  128

/* Program slot metadata */
struct program_slot {
    uint32_t entry;       /* PC to start at */
    uint32_t clip_rect;   /* Packed clip: (y<<24)|(x<<16)|(h<<8)|w */
};

/* Two program contexts (allocated in BSS) -- 132 bytes each */
uint32_t ctx_a[CTX_SIZE / 4];
uint32_t ctx_b[CTX_SIZE / 4];

/* Which program is currently running (0=A, 1=B) */
volatile uint32_t current_id = 0;

/* Which program has input focus (0=A, 1=B). Default: program A. */
volatile uint32_t focused_id = 0;

/* Tab key ASCII code -- cycles input focus */
#define KEY_TAB  9

/* Program metadata */
static const struct program_slot slots[2] = {
    { SLOT_A, (0u << 24) | (0u << 16) | (0u << 8) | 128u },   /* left half */
    { SLOT_B, (0u << 24) | (128u << 16) | (0u << 8) | 128u },  /* right half */
};

/* Extern symbols from guest_images.S */
extern const char _guest_a_start[];
extern const char _guest_a_end[];
extern const char _guest_b_start[];
extern const char _guest_b_end[];

/*
 * kern_apply_clip -- called from kern_trap.S on each timer tick.
 * Writes the clip rect for the new program to the framebuffer MMIO.
 * Also draws a focus border around the focused region.
 */
void kern_apply_clip(uint32_t prog_id) {
    /* Decode clip rect for focused program */
    uint32_t fclip = slots[focused_id].clip_rect;
    uint32_t fx = (fclip >> 16) & 0xFF;
    uint32_t fy = (fclip >> 24) & 0xFF;
    uint32_t fw = fclip & 0xFF;
    uint32_t fh = (fclip >> 8) & 0xFF;
    if (fw == 0) fw = 256;
    if (fh == 0) fh = 256;

    /*
     * Draw focus border. Temporarily disable clipping so we can
     * draw on the framebuffer boundary between regions.
     * Border color: bright white (0xFFFFFFFF).
     */
    *(volatile uint32_t *)GEOS_FB_CLIP = 0xFFFFFFFFu;  /* disable clip */
    uint32_t border_color = 0xFFFFFFFFu;
    uint32_t x, y;
    /* Top edge */
    for (x = fx; x < fx + fw && x < GEOS_FB_WIDTH; x++)
        *(volatile uint32_t *)(GEOS_FB_BASE + fy * GEOS_FB_WIDTH * 4 + x * 4) = border_color;
    /* Bottom edge (fy + fh - 1, clamped to 255) */
    uint32_t by = fy + fh - 1;
    if (by >= GEOS_FB_HEIGHT) by = GEOS_FB_HEIGHT - 1;
    for (x = fx; x < fx + fw && x < GEOS_FB_WIDTH; x++)
        *(volatile uint32_t *)(GEOS_FB_BASE + by * GEOS_FB_WIDTH * 4 + x * 4) = border_color;
    /* Left edge */
    for (y = fy; y < fy + fh && y < GEOS_FB_HEIGHT; y++)
        *(volatile uint32_t *)(GEOS_FB_BASE + y * GEOS_FB_WIDTH * 4 + fx * 4) = border_color;
    /* Right edge (fx + fw - 1, clamped to 255) */
    uint32_t rx = fx + fw - 1;
    if (rx >= GEOS_FB_WIDTH) rx = GEOS_FB_WIDTH - 1;
    for (y = fy; y < fy + fh && y < GEOS_FB_HEIGHT; y++)
        *(volatile uint32_t *)(GEOS_FB_BASE + y * GEOS_FB_WIDTH * 4 + rx * 4) = border_color;

    /* Present the border, then set clip for the current program */
    *(volatile uint32_t *)GEOS_FB_CONTROL = 1;
    uint32_t clip = slots[prog_id].clip_rect;
    *(volatile uint32_t *)GEOS_FB_CLIP = clip;
}

/*
 * kern_handle_geos_sbi -- called from kern_trap.S for GEOS extension (a7=0x47454F00).
 * a0 = function ID, a1-a5 = args.
 * Returns result in a0.
 */
long kern_handle_geos_sbi(long fid, long a1, long a2, long a3, long a4, long a5) {
    (void)a3; (void)a4; (void)a5;
    switch (fid) {
    case 0: /* GEOS_SBI_YIELD -- cooperative yield, do nothing (timer preempts) */
        return 0;
    case 1: /* GEOS_SBI_GET_ID -- return current program ID */
        return current_id;
    case 2: /* GEOS_SBI_GET_FOCUS -- returns 1 if caller has input focus */
        return (current_id == focused_id) ? 1 : 0;
    default:
        return -1;
    }
}

/*
 * kern_handle_getchar -- input focus routing for SBI console getchar.
 *
 * Called from kern_trap.S when a guest does ecall with a7=2 (console getchar).
 * a0 = caller_id (current program making the call).
 *
 * If the caller is NOT the focused program, returns -1 immediately (no input).
 * If the caller IS focused, proxies the getchar to the host SBI.
 * If the character is Tab (0x09), cycles focus to the other program and
 * consumes the Tab (returns -1).
 */
long kern_handle_getchar(long caller_id) {
    /* Unfocused program gets no input */
    if ((uint32_t)caller_id != focused_id) return -1;

    /* Focused: proxy the actual getchar to host SBI */
    register long a0 __asm__("a0") = 0;
    register long a7 __asm__("a7") = 2;
    __asm__ volatile("ecall" : "+r"(a0) : "r"(a7) : "memory", "a1");

    /* Tab cycles focus */
    if (a0 == KEY_TAB) {
        focused_id = 1 - focused_id;
        return -1;  /* consume the Tab */
    }

    return a0;
}

/*
 * Copy a guest image from the embedded .rodata section to its slot address.
 */
static void copy_guest(const char *start, const char *end, uint32_t dest) {
    uint32_t len = (uint32_t)(end - start);
    volatile uint32_t *dst = (volatile uint32_t *)dest;
    const uint32_t *src = (const uint32_t *)start;
    for (uint32_t i = 0; i < len; i += 4) {
        dst[i / 4] = src[i / 4];
    }
}

/*
 * Zero-initialize a context struct and set entry point + stack.
 */
static void init_context(uint32_t *ctx, uint32_t entry, uint32_t sp) {
    for (int i = 0; i < CTX_SIZE / 4; i++) {
        ctx[i] = 0;
    }
    ctx[CTX_MEPC_OFF / 4] = entry;
    ctx[CTX_SP_OFF / 4]   = sp;
    /* Set ra to shutdown so if the guest returns, we shut down */
    ctx[CTX_RA_OFF / 4]   = 0; /* will be filled by guest_crt0's _start */
}

/*
 * c_start -- kernel entry point (called from guest_crt0.S).
 */
void c_start(void) {
    geos_puts("[geos] kernel boot (multi-program)\n");

    /* 1. Copy guest images to their slot addresses */
    geos_puts("[geos] loading guest A (painter)...\n");
    copy_guest(_guest_a_start, _guest_a_end, SLOT_A);

    geos_puts("[geos] loading guest B (life32)...\n");
    copy_guest(_guest_b_start, _guest_b_end, SLOT_B);

    /* 2. Initialize contexts */
    init_context(ctx_a, SLOT_A, STACK_A);
    init_context(ctx_b, SLOT_B, STACK_B);

    /* 3. Set mscratch to context A (kern_trap.S reads this on trap entry) */
    __asm__ volatile("csrw mscratch, %0" : : "r"(ctx_a));

    /* 4. Set mtvec to the ASM trap handler (not this C function) */
    extern void kern_trap_entry(void);
    __asm__ volatile("csrw mtvec, %0" : : "r"(&kern_trap_entry));

    /* 5. Set initial clip rect for program A */
    *(volatile uint32_t *)GEOS_FB_CLIP = slots[0].clip_rect;

    /* 6. Start timer (CLINT MTIMECMP) */
    uint64_t now = geos_mtime();
    uint64_t next = now + 1000000u; /* ~20ms at 52 MIPS */
    *(volatile uint32_t *)(0x02004000u + 4) = 0xFFFFFFFFu;
    *(volatile uint32_t *)(0x02004000u)     = (uint32_t)next;
    *(volatile uint32_t *)(0x02004000u + 4) = (uint32_t)(next >> 32);

    /* 7. Enable timer interrupts */
    __asm__ volatile("csrs mie, %0" : : "r"(1u << 7));   /* MTIE */
    __asm__ volatile("csrs mstatus, %0" : : "r"(1u << 3)); /* MIE */

    geos_puts("[geos] interrupts enabled, jumping to guest A\n");

    /*
     * 8. Jump to guest A.
     *    We set mepc to SLOT_A and do mret, which:
     *    - Sets pc = mepc = SLOT_A (guest A's _start)
     *    - Returns to M-mode (stays in M-mode since MPP=M)
     *
     *    The first instruction of guest A's crt0 sets sp and calls c_start.
     *    Timer interrupts will fire and kern_trap.S will context-switch.
     */
    __asm__ volatile(
        "csrw mepc, %0\n"
        "li t0, 0x1880\n"     /* MPP = 11 (M-mode) in bits [12:11] + MPIE (bit 7) */
        "csrs mstatus, t0\n" /* OR MPP+MPIE into mstatus */
        "mret\n"             /* MRET: MIE = MPIE = 1, MPIE = 1, priv = M-mode */
        :
        : "r"((uint32_t)SLOT_A)
        : "t0", "memory"
    );

    /* Unreachable */
    sbi_shutdown();
}
