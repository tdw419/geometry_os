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

/* ---- Phase 235: Shared Memory IPC ---- */

/* Shared memory pool starts after both stacks.
 * 8 slots of 8KB each = 64KB total.
 * Both guests can read/write this region directly (bare-metal, no MMU). */
#define SHM_POOL_BASE    0x80130000u
#define SHM_SLOT_SIZE    0x2000u   /* 8KB per slot */
#define SHM_MAX_SLOTS    8
#define SHM_POOL_END     (SHM_POOL_BASE + SHM_MAX_SLOTS * SHM_SLOT_SIZE)

/* Ring buffer header at the start of each shared memory region.
 * Placed by the kernel after allocation. Guest programs use these
 * fields for synchronization (single-producer, single-consumer).
 *
 * Layout (16 bytes):
 *   [0] write_pos  -- next write index (producer advances)
 *   [1] read_pos   -- next read index (consumer advances)
 *   [2] capacity   -- max number of u32 data words after header
 *   [3] flags      -- 0x01 = producer done signal
 *
 * Data starts at offset 16 (4 u32 words) from the region base.
 */
#define SHM_HDR_WRITE_POS  0
#define SHM_HDR_READ_POS   1
#define SHM_HDR_CAPACITY   2
#define SHM_HDR_FLAGS      3
#define SHM_HDR_SIZE       4   /* header is 4 u32 words */
#define SHM_FLAG_DONE      0x01u

/* Slot metadata (in kernel BSS) */
struct shm_slot {
    uint32_t allocated;   /* 1 if in use, 0 if free */
    uint32_t owner;       /* program ID that allocated (0=A, 1=B) */
    uint32_t base_addr;   /* physical base address */
    uint32_t capacity;    /* max data words in the ring buffer */
};

/* Slot table (8 entries, in BSS) */
static struct shm_slot shm_slots[SHM_MAX_SLOTS];

/* GEOS SBI function IDs for shared memory (continuing from existing 0-5) */
#define GEO_SHM_ALLOC     6
#define GEO_SHM_MAP       7
#define GEO_SHM_RELEASE   8
#define GEO_SHM_UNMAP     8   /* alias for RELEASE */
#define GEO_SHM_SIZE      9
#define GEO_SHM_WRITE     10
#define GEO_SHM_READ      11

/* ---- Phase 257: Timer and Sleep Syscalls ---- */

/* GEOS SBI function IDs for timer (continuing from shared memory 6-8).
 * Must match sbi.rs GEO_FN_UPTIME/ALARM_SET/ALARM_CANCEL/MSLEEP. */
#define GEO_UPTIME        12
#define GEO_ALARM_SET     13
#define GEO_ALARM_CANCEL  14
#define GEO_MSLEEP        15

/* Maximum concurrent alarms per program */
#define GEO_MAX_ALARMS    4

/* Approximate ticks per millisecond at ~52 MIPS */
#define GEO_TICKS_PER_MS  52000u

/*
 * Alarm descriptor. Each program can register up to GEO_MAX_ALARMS alarms.
 * The kernel checks them on each timer tick and fires expired ones by
 * modifying the guest's saved context (setting PC to the callback).
 *
 * Layout (12 bytes = 3 u32 words):
 *   [0] active   -- 1 if armed, 0 if free/cancelled
 *   [1] expire   -- mtime value when alarm fires (absolute)
 *   [2] callback -- function pointer to call when alarm fires
 */
struct alarm_entry {
    uint32_t active;
    uint32_t expire_lo;
    uint32_t expire_hi;
    uint32_t callback;
    uint32_t owner;       /* program ID that registered this alarm */
};

/* Alarm table (4 entries, in BSS) */
static struct alarm_entry alarms[GEO_MAX_ALARMS];

/* Boot timestamp: mtime value at kernel boot, used by geos_uptime */
static uint32_t boot_mtime_lo = 0;
static uint32_t boot_mtime_hi = 0;

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
 * kern_fire_alarms -- called from kern_trap.S on each timer tick.
 * Checks all alarm entries for the CURRENT program (before context switch).
 * If an alarm has expired, modifies the saved context to redirect PC to
 * the callback function. The callback sees a0 = alarm_id.
 *
 * IMPORTANT: Called BEFORE the context switch (current_id still points to
 * the preempted program). tp still points to that program's context.
 */
void kern_fire_alarms(void) {
    uint32_t now_lo = *(volatile uint32_t *)(GEOS_CLINT_MTIME);
    uint32_t now_hi = *(volatile uint32_t *)(GEOS_CLINT_MTIME + 4);

    for (int i = 0; i < GEO_MAX_ALARMS; i++) {
        if (!alarms[i].active) continue;
        if (alarms[i].owner != current_id) continue;

        /* Check if alarm has expired: expire <= now */
        if (alarms[i].expire_hi < now_hi ||
            (alarms[i].expire_hi == now_hi && alarms[i].expire_lo <= now_lo)) {
            /* Fire: set a0 = alarm_id in saved context, redirect PC */
            alarms[i].active = 0;  /* one-shot: disarm after firing */
            uint32_t *ctx = (current_id == 0) ? ctx_a : ctx_b;
            ctx[CTX_A0_OFF / 4] = (uint32_t)i;
            ctx[CTX_MEPC_OFF / 4] = alarms[i].callback;
        }
    }
}

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
 * a6 = function ID, a0-a5 = args.
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

    /* Phase 235: Shared Memory IPC */
    case GEO_SHM_ALLOC: {
        /* Allocate a shared memory slot.
         * a1 = requested size in bytes (rounded up to slot size).
         * Returns slot ID (>= 0) on success, -1 if no free slots. */
        (void)a2;
        int i;
        for (i = 0; i < SHM_MAX_SLOTS; i++) {
            if (!shm_slots[i].allocated) {
                shm_slots[i].allocated = 1;
                shm_slots[i].owner = current_id;
                shm_slots[i].base_addr = SHM_POOL_BASE + (uint32_t)(i * SHM_SLOT_SIZE);
                /* Capacity = (slot_size - header_size) in u32 words */
                shm_slots[i].capacity = (SHM_SLOT_SIZE / 4) - SHM_HDR_SIZE;
                /* Zero-initialize the region */
                volatile uint32_t *p = (volatile uint32_t *)shm_slots[i].base_addr;
                for (uint32_t j = 0; j < SHM_SLOT_SIZE / 4; j++) {
                    p[j] = 0;
                }
                /* Set up ring buffer header */
                p[SHM_HDR_WRITE_POS] = 0;
                p[SHM_HDR_READ_POS] = 0;
                p[SHM_HDR_CAPACITY] = shm_slots[i].capacity;
                p[SHM_HDR_FLAGS] = 0;
                return i;
            }
        }
        return -1; /* no free slots */
    }
    case GEO_SHM_MAP: {
        /* Map (get base address of) a shared memory slot by ID.
         * a1 = slot ID returned by GEO_SHM_ALLOC.
         * Returns physical base address on success, -1 if invalid ID. */
        int sid = (int)a1;
        if (sid < 0 || sid >= SHM_MAX_SLOTS || !shm_slots[sid].allocated) {
            return -1;
        }
        return (long)shm_slots[sid].base_addr;
    }
    case GEO_SHM_RELEASE:
    case GEO_SHM_UNMAP: {
        /* Release/unmap a shared memory slot.
         * a1 = slot ID. Any program can release any slot.
         * Returns 0 on success, -1 if invalid ID. */
        int sid = (int)a1;
        if (sid < 0 || sid >= SHM_MAX_SLOTS || !shm_slots[sid].allocated) {
            return -1;
        }
        shm_slots[sid].allocated = 0;
        shm_slots[sid].owner = 0;
        return 0;
    }
    case GEO_SHM_SIZE: {
        /* Get the size of a shared memory slot.
         * a1 = slot ID.
         * Returns slot size in bytes on success, -1 if invalid. */
        int sid = (int)a1;
        if (sid < 0 || sid >= SHM_MAX_SLOTS || !shm_slots[sid].allocated) {
            return -1;
        }
        return SHM_SLOT_SIZE;
    }
    case GEO_SHM_WRITE: {
        /* Write data into a shared memory slot.
         * a1 = slot ID, a2 = offset, a3 = src_phys_addr, a4 = len.
         * Returns number of bytes written, or -1 on error. */
        int sid = (int)a1;
        if (sid < 0 || sid >= SHM_MAX_SLOTS || !shm_slots[sid].allocated)
            return -1;
        uint32_t offset = (uint32_t)a2;
        uint32_t src = (uint32_t)a3;
        uint32_t len = (uint32_t)a4;
        if (offset + len > SHM_SLOT_SIZE || len == 0)
            return -1;
        volatile uint8_t *dst = (volatile uint8_t *)(shm_slots[sid].base_addr + offset);
        volatile uint8_t *s = (volatile uint8_t *)src;
        for (uint32_t j = 0; j < len; j++)
            dst[j] = s[j];
        return (long)len;
    }
    case GEO_SHM_READ: {
        /* Read data from a shared memory slot.
         * a1 = slot ID, a2 = offset, a3 = dst_phys_addr, a4 = len.
         * Returns number of bytes read, or -1 on error. */
        int sid = (int)a1;
        if (sid < 0 || sid >= SHM_MAX_SLOTS || !shm_slots[sid].allocated)
            return -1;
        uint32_t offset = (uint32_t)a2;
        uint32_t dst = (uint32_t)a3;
        uint32_t len = (uint32_t)a4;
        if (offset + len > SHM_SLOT_SIZE || len == 0)
            return -1;
        volatile uint8_t *src = (volatile uint8_t *)(shm_slots[sid].base_addr + offset);
        volatile uint8_t *d = (volatile uint8_t *)dst;
        for (uint32_t j = 0; j < len; j++)
            d[j] = src[j];
        return (long)len;
    }

    /* Phase 257: Timer and Sleep Syscalls */
    case GEO_UPTIME: {
        /* Return elapsed ticks since kernel boot.
         * a1 (hi) and a2 (lo) receive the 64-bit mtime delta.
         * Returns 0 on success. */
        uint32_t now_lo = *(volatile uint32_t *)(GEOS_CLINT_MTIME);
        uint32_t now_hi = *(volatile uint32_t *)(GEOS_CLINT_MTIME + 4);
        /* Sub boot mtime (handles borrow from hi word) */
        uint32_t elapsed_lo = now_lo - boot_mtime_lo;
        uint32_t elapsed_hi = now_hi - boot_mtime_hi;
        if (now_lo < boot_mtime_lo) elapsed_hi--;  /* borrow */
        /* Write result to caller's memory via a1 (ptr to uint64_t) */
        if (a1 != 0) {
            volatile uint32_t *p = (volatile uint32_t *)(uintptr_t)a1;
            p[0] = elapsed_lo;
            p[1] = elapsed_hi;
        }
        return 0;
    }
    case GEO_ALARM_SET: {
        /* Register a one-shot alarm.
         * a1 = delay_ms (milliseconds from now).
         * a2 = callback function pointer.
         * Returns alarm_id (>= 0) on success, -1 if no free slots.
         *
         * When the alarm fires, the kernel modifies the guest's saved
         * context: sets a0 = alarm_id and redirects PC to callback.
         * The callback should end with a return to resume normal flow.
         */
        int i;
        for (i = 0; i < GEO_MAX_ALARMS; i++) {
            if (!alarms[i].active) {
                uint64_t now = geos_mtime();
                uint64_t expire = now + (uint64_t)a1 * GEO_TICKS_PER_MS;
                alarms[i].active    = 1;
                alarms[i].expire_lo = (uint32_t)(expire & 0xFFFFFFFF);
                alarms[i].expire_hi = (uint32_t)(expire >> 32);
                alarms[i].callback  = (uint32_t)a2;
                alarms[i].owner     = current_id;
                return i;
            }
        }
        return -1;  /* no free alarm slots */
    }
    case GEO_ALARM_CANCEL: {
        /* Cancel a previously registered alarm.
         * a1 = alarm_id (returned by GEO_ALARM_SET).
         * Returns 0 on success, -1 if invalid ID or not owned by caller. */
        int aid = (int)a1;
        if (aid < 0 || aid >= GEO_MAX_ALARMS) return -1;
        if (!alarms[aid].active) return -1;
        if (alarms[aid].owner != current_id) return -1;
        alarms[aid].active = 0;
        return 0;
    }
    case GEO_MSLEEP: {
        /* Yield and sleep for a1 milliseconds.
         * Implementation: register a self-alarm that re-schedules the
         * caller, then yield. The alarm fires after the delay and
         * resumes the caller by restoring its context.
         *
         * Returns 0 on success, -1 if no alarm slots available. */
        if (a1 == 0) return 0;  /* msleep(0) is a no-op */
        /* Find a free alarm slot */
        int i;
        for (i = 0; i < GEO_MAX_ALARMS; i++) {
            if (!alarms[i].active) {
                uint64_t now = geos_mtime();
                uint64_t expire = now + (uint64_t)a1 * GEO_TICKS_PER_MS;
                alarms[i].active    = 1;
                alarms[i].expire_lo = (uint32_t)(expire & 0xFFFFFFFF);
                alarms[i].expire_hi = (uint32_t)(expire >> 32);
                alarms[i].callback  = 0;  /* no callback -- just resume */
                alarms[i].owner     = current_id;
                return 0;  /* timer tick will re-enable this context */
            }
        }
        return -1;  /* no free alarm slots */
    }

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

    /* 0. Record boot timestamp for geos_uptime */
    boot_mtime_lo = *(volatile uint32_t *)(GEOS_CLINT_MTIME);
    boot_mtime_hi = *(volatile uint32_t *)(GEOS_CLINT_MTIME + 4);

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
