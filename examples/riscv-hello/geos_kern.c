/*
 * geos_kern.c -- Geometry OS Layer 2 supervisor (N-program kernel)
 *
 * Multi-program supervisor for Geometry OS. Manages up to MAX_PROCS programs
 * using a process array, round-robin scheduling, and centralized resource
 * arbitration.
 *
 * SBI extension 0x47454F00, function IDs in a6.
 */

#include "libgeos.h"
#include <stdint.h>
#include <stddef.h>

/* ---- Slot Addresses (must match build_kern.sh) ---- */
#define SLOT_A        0x80010000u
#define SLOT_B        0x80050000u
#define SLOT_C        0x80090000u   /* 128KB for proc 2 */
#define SLOT_D        0x800B0000u   /* 128KB for proc 3 */
#define SLOT_SIZE     0x00020000u   /* 128KB per slot */
#define STACK_A       0x80100000u
#define STACK_B       0x80110000u

/* ---- Shared Memory IPC (Phase 235) ---- */
#define SHM_POOL_BASE    0x80130000u
#define SHM_SLOT_SIZE    0x2000u   /* 8KB per slot */
#define SHM_MAX_SLOTS    8
#define SHM_POOL_END     (SHM_POOL_BASE + SHM_MAX_SLOTS * SHM_SLOT_SIZE)

#define SHM_HDR_WRITE_POS  0
#define SHM_HDR_READ_POS   1
#define SHM_HDR_CAPACITY   2
#define SHM_HDR_FLAGS      3
#define SHM_HDR_SIZE       4
#define SHM_FLAG_DONE      0x01u

struct shm_slot {
    uint32_t allocated;
    uint32_t owner;
    uint32_t base_addr;
    uint32_t capacity;
};
static struct shm_slot shm_slots[SHM_MAX_SLOTS];

#define GEO_SHM_ALLOC     6
#define GEO_SHM_MAP       7
#define GEO_SHM_RELEASE   8
#define GEO_SHM_UNMAP     8
#define GEO_SHM_SIZE      9
#define GEO_SHM_WRITE     10
#define GEO_SHM_READ      11

/* ---- Timer and Sleep Syscalls (Phase 257) ---- */
#define GEO_UPTIME        12
#define GEO_ALARM_SET     13
#define GEO_ALARM_CANCEL  14
#define GEO_MSLEEP        15
#define GEO_MAX_ALARMS    4
#define GEO_TICKS_PER_MS  52000u

struct alarm_entry {
    uint32_t active;
    uint32_t expire_lo;
    uint32_t expire_hi;
    uint32_t callback;
    uint32_t owner;
};
static struct alarm_entry alarms[GEO_MAX_ALARMS];

static uint32_t boot_mtime_lo = 0;
static uint32_t boot_mtime_hi = 0;

/* ---- Process Syscall IDs (a6) ---- */
#define GEO_FN_SPAWN    3
#define GEO_FN_KILL     4
#define GEO_FN_YIELD_TO 5
#define GEO_FN_IOCTL    26

/* ---- Phase W: Substrate Coprocessor MMIO ---- */
#define SUBSTRATE_BASE     0x40000000u
#define SUB_X              (SUBSTRATE_BASE + 0x00)
#define SUB_Y              (SUBSTRATE_BASE + 0x04)
#define SUB_CMD            (SUBSTRATE_BASE + 0x08)
#define SUB_ARG1           (SUBSTRATE_BASE + 0x0C)
#define SUB_ARG2           (SUBSTRATE_BASE + 0x10)
#define SUB_STATUS         (SUBSTRATE_BASE + 0x14)
#define SUB_RESULT         (SUBSTRATE_BASE + 0x18)
#define SUB_VERSION        (SUBSTRATE_BASE + 0x1C)

#define SUB_CMD_TICK       0x01
#define SUB_CMD_LOAD       0x02
#define SUB_CMD_CWRITE     0x03
#define SUB_CMD_CREAD      0x04
#define SUB_CMD_FIRE       0x05
#define SUB_CMD_LEARN      0x07
#define SUB_CMD_COPY       0x08
#define SUB_CMD_PATCH      0x09

#define FD_TYPE_FILE       0
#define FD_TYPE_SUBSTRATE  1

/* ---- Context layout (must match kern_trap.S) ---- */
#define CTX_SIZE      132
#define CTX_SP_OFF    8
#define CTX_GP_OFF    12
#define CTX_TP_OFF    16
#define CTX_A0_OFF    40
#define CTX_RA_OFF    4
#define CTX_MEPC_OFF  128
#define CTX_WORDS     (CTX_SIZE / 4)

/* ---- Process table ---- */
#define MAX_PROCS     4

/* Stack pool for dynamically spawned processes (slots 2+).
 * Placed after SHM pool. 64KB each. */
#define SPAWN_STACK_BASE  (SHM_POOL_END)    /* 0x80140000 */
#define SPAWN_STACK_SIZE  0x10000u

struct process {
    uint32_t ctx[CTX_WORDS];
    uint32_t active;
    uint32_t id;
    uint32_t clip_rect;
};

static struct process processes[MAX_PROCS];
uint32_t *current_ctx_ptr = NULL;
volatile uint32_t current_id = 0;
volatile uint32_t focused_id = 0;
volatile uint32_t kill_pending = 0;
#define KEY_TAB  9

/* ---- Phase 397: Kernel Block Device State ---- */
static uint8_t kern_blk_desc_buf[512] __attribute__((aligned(16)));
static uint8_t kern_blk_sector_buf[512];
static int kern_blk_ready = 0;

/* ---- Phase 397: Kernel File System (GSFS-mini) ---- */
#define GSFS_MAGIC        0x47534653u  /* "GSFS" */
#define MAX_OPEN_FILES    4

struct open_file {
    uint32_t active;
    uint32_t type;  /* 0=file, 1=substrate */
    uint32_t start_sector;
    uint32_t offset;
    uint32_t mode;  /* 0=read, 1=write, 2=rw */
};
static struct open_file open_files[MAX_PROCS][MAX_OPEN_FILES];

/* Forward declarations */
static void init_context(uint32_t *ctx, uint32_t entry, uint32_t sp);
static void kern_retile(void);

/* pack_rect -- encode (x,y,h,w) into the clip_rect format.
 * 0 in w/h means 256 (full dimension). */
static inline uint32_t pack_rect(uint32_t x, uint32_t y, uint32_t h, uint32_t w) {
    return (y << 24) | (x << 16) | ((h & 0xFF) << 8) | (w & 0xFF);
}

/*
 * kern_retile -- recalculate clip rects for all active processes.
 * Called after spawn/kill so display regions always cover the full FB.
 */
static void kern_retile(void) {
    int ids[MAX_PROCS];
    int n = 0;
    for (int i = 0; i < MAX_PROCS; i++) {
        if (processes[i].active) ids[n++] = i;
    }
    if (n == 0) return;

    if (n == 1) {
        processes[ids[0]].clip_rect = pack_rect(0, 0, 0, 0);  /* full 256x256 */
    } else if (n == 2) {
        processes[ids[0]].clip_rect = pack_rect(0,   0, 0,   128); /* left half */
        processes[ids[1]].clip_rect = pack_rect(128, 0, 0,   128); /* right half */
    } else if (n == 3) {
        processes[ids[0]].clip_rect = pack_rect(0,   0,   128, 128); /* TL */
        processes[ids[1]].clip_rect = pack_rect(128, 0,   128, 128); /* TR */
        processes[ids[2]].clip_rect = pack_rect(0,   128, 128, 0);   /* bottom full */
    } else {
        processes[ids[0]].clip_rect = pack_rect(0,   0,   128, 128); /* TL */
        processes[ids[1]].clip_rect = pack_rect(128, 0,   128, 128); /* TR */
        processes[ids[2]].clip_rect = pack_rect(0,   128, 128, 128); /* BL */
        processes[ids[3]].clip_rect = pack_rect(128, 128, 128, 128); /* BR */
    }

    /* Clear each process's new region so stale pixels don't linger.
     * Uses black (0xFF000000 with alpha) to give a clean slate. */
    for (int i = 0; i < n; i++) {
        uint32_t c = processes[ids[i]].clip_rect;
        uint32_t cx = (c >> 16) & 0xFF;
        uint32_t cy = (c >> 24) & 0xFF;
        uint32_t cw = c & 0xFF;       if (cw == 0) cw = 256;
        uint32_t ch = (c >> 8) & 0xFF; if (ch == 0) ch = 256;
        for (uint32_t py = cy; py < cy + ch && py < GEOS_FB_HEIGHT; py++)
            for (uint32_t px = cx; px < cx + cw && px < GEOS_FB_WIDTH; px++)
                *(volatile uint32_t *)(GEOS_FB_BASE + (py * GEOS_FB_WIDTH + px) * 4) = 0xFF000000u;
    }
    *(volatile uint32_t *)GEOS_FB_CONTROL = 1;
}

/*
 * kern_schedule -- round-robin scheduler.
 * Called from kern_trap.S on each timer tick. Picks the next active process.
 */
void kern_schedule(void) {
    /* If current process killed itself, clear the flag so we skip it */
    if (kill_pending) {
        kill_pending = 0;
    }

    uint32_t next_id = (current_id + 1) % MAX_PROCS;
    int found = 0;
    for (int i = 0; i < MAX_PROCS; i++) {
        if (processes[next_id].active) {
            found = 1;
            break;
        }
        next_id = (next_id + 1) % MAX_PROCS;
    }
    if (found) {
        current_id = next_id;
        current_ctx_ptr = processes[current_id].ctx;
    }
}

/*
 * kern_fire_alarms -- check and fire expired alarms for the current program.
 * Called BEFORE context switch so tp still points to the preempted program.
 */
void kern_fire_alarms(void) {
    uint32_t now_lo = *(volatile uint32_t *)(GEOS_CLINT_MTIME);
    uint32_t now_hi = *(volatile uint32_t *)(GEOS_CLINT_MTIME + 4);

    for (int i = 0; i < GEO_MAX_ALARMS; i++) {
        if (!alarms[i].active) continue;
        if (alarms[i].owner != current_id) continue;
        if (alarms[i].expire_hi < now_hi ||
            (alarms[i].expire_hi == now_hi && alarms[i].expire_lo <= now_lo)) {
            alarms[i].active = 0;
            uint32_t *ctx = processes[current_id].ctx;
            ctx[CTX_A0_OFF / 4] = (uint32_t)i;
            ctx[CTX_MEPC_OFF / 4] = alarms[i].callback;
        }
    }
}

/*
 * kern_apply_clip -- set framebuffer clip rect for the given program,
 * draw focus border around the focused program's region.
 */
void kern_apply_clip(uint32_t prog_id) {
    uint32_t fclip = processes[focused_id].clip_rect;
    uint32_t fx = (fclip >> 16) & 0xFF;
    uint32_t fy = (fclip >> 24) & 0xFF;
    uint32_t fw = fclip & 0xFF;
    uint32_t fh = (fclip >> 8) & 0xFF;
    if (fw == 0) fw = 256;
    if (fh == 0) fh = 256;

    *(volatile uint32_t *)GEOS_FB_CLIP = 0xFFFFFFFFu;
    uint32_t border_color = 0xFFFFFFFFu;
    uint32_t x, y;
    for (x = fx; x < fx + fw && x < GEOS_FB_WIDTH; x++)
        *(volatile uint32_t *)(GEOS_FB_BASE + fy * GEOS_FB_WIDTH * 4 + x * 4) = border_color;
    uint32_t by = fy + fh - 1;
    if (by >= GEOS_FB_HEIGHT) by = GEOS_FB_HEIGHT - 1;
    for (x = fx; x < fx + fw && x < GEOS_FB_WIDTH; x++)
        *(volatile uint32_t *)(GEOS_FB_BASE + by * GEOS_FB_WIDTH * 4 + x * 4) = border_color;
    for (y = fy; y < fy + fh && y < GEOS_FB_HEIGHT; y++)
        *(volatile uint32_t *)(GEOS_FB_BASE + y * GEOS_FB_WIDTH * 4 + fx * 4) = border_color;
    uint32_t rx = fx + fw - 1;
    if (rx >= GEOS_FB_WIDTH) rx = GEOS_FB_WIDTH - 1;
    for (y = fy; y < fy + fh && y < GEOS_FB_HEIGHT; y++)
        *(volatile uint32_t *)(GEOS_FB_BASE + y * GEOS_FB_WIDTH * 4 + rx * 4) = border_color;

    *(volatile uint32_t *)GEOS_FB_CONTROL = 1;
    uint32_t clip = processes[prog_id].clip_rect;
    *(volatile uint32_t *)GEOS_FB_CLIP = clip;
}

/*
 * kern_handle_geos_sbi -- SBI extension handler for GeOS syscalls.
 * fid via a6, args in a0-a5.
 */
long kern_handle_geos_sbi(long fid, long a1, long a2, long a3, long a4, long a5) {
    (void)a3; (void)a4; (void)a5;
    switch (fid) {
    case 0: {           /* geos_yield */
        kern_schedule();
        return 0;
    }
    case 1: return current_id;
    case 2: return (current_id == focused_id) ? 1 : 0;

    /* geos_spawn(entry_point): find free slot, init context, mark active. */
    case GEO_FN_SPAWN: {
        uint32_t entry = (uint32_t)a1;
        int slot = -1;
        for (int i = 0; i < MAX_PROCS; i++) {
            if (!processes[i].active) { slot = i; break; }
        }
        if (slot < 0) return -1;

        uint32_t sp;
        if (slot == 0)      sp = STACK_A;
        else if (slot == 1) sp = STACK_B;
        else                sp = SPAWN_STACK_BASE + (uint32_t)(slot - 2) * SPAWN_STACK_SIZE;

        processes[slot].active = 1;
        processes[slot].id = (uint32_t)slot;
        init_context(processes[slot].ctx, entry, sp);
        kern_retile();
        return slot;
    }

    /* geos_kill(context_id): deactivate a process, release its resources. */
    case GEO_FN_KILL: {
        uint32_t target = (uint32_t)a1;
        if (target >= MAX_PROCS || !processes[target].active) return -1;
        processes[target].active = 0;
        for (int i = 0; i < GEO_MAX_ALARMS; i++) {
            if (alarms[i].active && alarms[i].owner == target)
                alarms[i].active = 0;
        }
        for (int i = 0; i < SHM_MAX_SLOTS; i++) {
            if (shm_slots[i].allocated && shm_slots[i].owner == target)
                shm_slots[i].allocated = 0;
        }
        if (focused_id == target) {
            uint32_t next_f = (focused_id + 1) % MAX_PROCS;
            for (int i = 0; i < MAX_PROCS; i++) {
                if (processes[next_f].active) { focused_id = next_f; break; }
                next_f = (next_f + 1) % MAX_PROCS;
            }
        }
        if (target == current_id) {
            kill_pending = 1;
            kern_schedule();
        }
        kern_retile();
        return 0;
    }

    /* geos_yield_to(target_id): cooperative yield to specific process. */
    case GEO_FN_YIELD_TO: {
        uint32_t target = (uint32_t)a1;
        if (target >= MAX_PROCS || !processes[target].active) return -1;
        current_id = target;
        current_ctx_ptr = processes[target].ctx;
        return 0;
    }

    /* ---- Shared Memory IPC ---- */
    case GEO_SHM_ALLOC: {
        int i;
        for (i = 0; i < SHM_MAX_SLOTS; i++) {
            if (!shm_slots[i].allocated) {
                shm_slots[i].allocated = 1;
                shm_slots[i].owner = current_id;
                shm_slots[i].base_addr = SHM_POOL_BASE + (uint32_t)(i * SHM_SLOT_SIZE);
                shm_slots[i].capacity = (SHM_SLOT_SIZE / 4) - SHM_HDR_SIZE;
                volatile uint32_t *p = (volatile uint32_t *)shm_slots[i].base_addr;
                for (uint32_t j = 0; j < SHM_SLOT_SIZE / 4; j++) p[j] = 0;
                p[SHM_HDR_WRITE_POS] = 0;
                p[SHM_HDR_READ_POS] = 0;
                p[SHM_HDR_CAPACITY] = shm_slots[i].capacity;
                p[SHM_HDR_FLAGS] = 0;
                return i;
            }
        }
        return -1;
    }
    case GEO_SHM_MAP: {
        int sid = (int)a1;
        if (sid < 0 || sid >= SHM_MAX_SLOTS || !shm_slots[sid].allocated) return -1;
        return (long)shm_slots[sid].base_addr;
    }
    case GEO_SHM_RELEASE: {
        int sid = (int)a1;
        if (sid < 0 || sid >= SHM_MAX_SLOTS || !shm_slots[sid].allocated) return -1;
        shm_slots[sid].allocated = 0;
        return 0;
    }
    case GEO_SHM_SIZE: {
        int sid = (int)a1;
        if (sid < 0 || sid >= SHM_MAX_SLOTS || !shm_slots[sid].allocated) return -1;
        return SHM_SLOT_SIZE;
    }
    case GEO_SHM_WRITE: {
        int sid = (int)a1;
        if (sid < 0 || sid >= SHM_MAX_SLOTS || !shm_slots[sid].allocated) return -1;
        uint32_t offset = (uint32_t)a2;
        uint32_t src = (uint32_t)a3;
        uint32_t len = (uint32_t)a4;
        if (offset + len > SHM_SLOT_SIZE || len == 0) return -1;
        volatile uint8_t *dst = (volatile uint8_t *)(shm_slots[sid].base_addr + offset);
        volatile uint8_t *s = (volatile uint8_t *)src;
        for (uint32_t j = 0; j < len; j++) dst[j] = s[j];
        return (long)len;
    }
    case GEO_SHM_READ: {
        int sid = (int)a1;
        if (sid < 0 || sid >= SHM_MAX_SLOTS || !shm_slots[sid].allocated) return -1;
        uint32_t offset = (uint32_t)a2;
        uint32_t dst = (uint32_t)a3;
        uint32_t len = (uint32_t)a4;
        if (offset + len > SHM_SLOT_SIZE || len == 0) return -1;
        volatile uint8_t *src = (volatile uint8_t *)(shm_slots[sid].base_addr + offset);
        volatile uint8_t *d = (volatile uint8_t *)dst;
        for (uint32_t j = 0; j < len; j++) d[j] = src[j];
        return (long)len;
    }

    /* ---- Timer and Sleep Syscalls ---- */
    case GEO_UPTIME: {
        uint32_t now_lo = *(volatile uint32_t *)(GEOS_CLINT_MTIME);
        uint32_t now_hi = *(volatile uint32_t *)(GEOS_CLINT_MTIME + 4);
        uint32_t elapsed_lo = now_lo - boot_mtime_lo;
        uint32_t elapsed_hi = now_hi - boot_mtime_hi;
        if (now_lo < boot_mtime_lo) elapsed_hi--;
        if (a1 != 0) {
            volatile uint32_t *p = (volatile uint32_t *)(uintptr_t)a1;
            p[0] = elapsed_lo;
            p[1] = elapsed_hi;
        }
        return 0;
    }
    case GEO_ALARM_SET: {
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
        return -1;
    }
    case GEO_ALARM_CANCEL: {
        int aid = (int)a1;
        if (aid < 0 || aid >= GEO_MAX_ALARMS || !alarms[aid].active || alarms[aid].owner != current_id) return -1;
        alarms[aid].active = 0;
        return 0;
    }
    case GEO_MSLEEP: {
        if (a1 == 0) return 0;
        int i;
        for (i = 0; i < GEO_MAX_ALARMS; i++) {
            if (!alarms[i].active) {
                uint64_t now = geos_mtime();
                uint64_t expire = now + (uint64_t)a1 * GEO_TICKS_PER_MS;
                alarms[i].active    = 1;
                alarms[i].expire_lo = (uint32_t)(expire & 0xFFFFFFFF);
                alarms[i].expire_hi = (uint32_t)(expire >> 32);
                alarms[i].callback  = 0;
                alarms[i].owner     = current_id;
                return 0;
            }
        }
        return -1;
    }

    /* geos_get_rect(): returns caller's clip_rect (packed x,y,h,w). */
    case 16: {
        return (long)processes[current_id].clip_rect;
    }

    /* geos_proc_count(): returns number of active processes. */
    case 17: {
        int count = 0;
        for (int i = 0; i < MAX_PROCS; i++)
            if (processes[i].active) count++;
        return count;
    }

    /* geos_load(slot_id, src_addr, len): copy raw binary into a process slot.
     * Caller loads code into SHM first, then copies to the target slot.
     * Enables one program to load another without kernel embedding. */
    case 18: {
        uint32_t slot = (uint32_t)a1;
        uint32_t src  = (uint32_t)a2;
        uint32_t len  = (uint32_t)a3;
        uint32_t dest;
        if (slot == 0)      dest = SLOT_A;
        else if (slot == 1) dest = SLOT_B;
        else if (slot == 2) dest = SLOT_C;
        else if (slot == 3) dest = SLOT_D;
        else return -1;
        if (len == 0 || len > SLOT_SIZE) return -1;
        volatile uint8_t *d = (volatile uint8_t *)dest;
        volatile uint8_t *s = (volatile uint8_t *)src;
        for (uint32_t i = 0; i < len; i++) d[i] = s[i];
        return (long)len;
    }

    /* ---- Phase 397: Dynamic exec, disk loading, file abstraction ---- */

    /* geos_exec(src_addr, len): atomically load+spawn in one call.
     * Finds a free slot, copies code from src_addr, initializes context,
     * marks active, retiles display. Returns slot_id or -1. */
    case 19: {
        uint32_t src = (uint32_t)a1;
        uint32_t len = (uint32_t)a2;
        if (len == 0 || len > SLOT_SIZE) return -1;

        /* Find free slot */
        int slot = -1;
        for (int i = 0; i < MAX_PROCS; i++) {
            if (!processes[i].active) { slot = i; break; }
        }
        if (slot < 0) return -1;

        /* Determine slot base and stack */
        uint32_t dest;
        if (slot == 0)      dest = SLOT_A;
        else if (slot == 1) dest = SLOT_B;
        else if (slot == 2) dest = SLOT_C;
        else                dest = SLOT_D;

        uint32_t sp;
        if (slot == 0)      sp = STACK_A;
        else if (slot == 1) sp = STACK_B;
        else                sp = SPAWN_STACK_BASE + (uint32_t)(slot - 2) * SPAWN_STACK_SIZE;

        /* Copy code */
        volatile uint8_t *d = (volatile uint8_t *)dest;
        volatile uint8_t *s = (volatile uint8_t *)src;
        for (uint32_t i = 0; i < len; i++) d[i] = s[i];

        /* Activate */
        processes[slot].active = 1;
        processes[slot].id = (uint32_t)slot;
        init_context(processes[slot].ctx, dest, sp);
        kern_retile();
        return slot;
    }

    /* geos_load_disk(slot_id, start_sector, n_sectors): load binary from
     * virtio-blk into a process slot. Parses ELF32 header if present,
     * otherwise treats as flat binary. Returns entry point or -1. */
    case 20: {
        uint32_t slot = (uint32_t)a1;
        uint32_t start_sector = (uint32_t)a2;
        uint32_t n_sectors = (uint32_t)a3;
        if (slot >= MAX_PROCS || n_sectors == 0) return -1;

        /* Determine slot base */
        uint32_t dest;
        if (slot == 0)      dest = SLOT_A;
        else if (slot == 1) dest = SLOT_B;
        else if (slot == 2) dest = SLOT_C;
        else                dest = SLOT_D;

        /* Initialize block device if not already done */
        if (!kern_blk_ready) {
            if (geos_blk_init(kern_blk_desc_buf) != 0) return -1;
            kern_blk_ready = 1;
        }

        /* Read first sector into header buffer for ELF check */
        if (geos_blk_read(start_sector, kern_blk_sector_buf, 1) != 0)
            return -1;

        uint32_t entry = dest; /* default: flat binary entry = slot base */

        /* Check for ELF32 magic: 0x7F 'E' 'L' 'F' */
        if (kern_blk_sector_buf[0] == 0x7F &&
            kern_blk_sector_buf[1] == 'E' &&
            kern_blk_sector_buf[2] == 'L' &&
            kern_blk_sector_buf[3] == 'F') {

            /* ELF32 header fields (little-endian RV32):
             * offset 0: e_ident[16]
             * offset 16: e_type (u16)
             * offset 18: e_machine (u16) -- expect 243 (EM_RISCV)
             * offset 24: e_entry (u32)
             * offset 28: e_phoff (u32)
             * offset 42: e_phentsize (u16)
             * offset 44: e_phnum (u16) */
            uint16_t e_machine = (uint16_t)kern_blk_sector_buf[18] |
                                 ((uint16_t)kern_blk_sector_buf[19] << 8);
            if (e_machine != 243) return -1; /* not RISC-V */

            uint32_t e_entry = (uint32_t)kern_blk_sector_buf[24] |
                               ((uint32_t)kern_blk_sector_buf[25] << 8) |
                               ((uint32_t)kern_blk_sector_buf[26] << 16) |
                               ((uint32_t)kern_blk_sector_buf[27] << 24);
            uint32_t e_phoff = (uint32_t)kern_blk_sector_buf[28] |
                               ((uint32_t)kern_blk_sector_buf[29] << 8) |
                               ((uint32_t)kern_blk_sector_buf[30] << 16) |
                               ((uint32_t)kern_blk_sector_buf[31] << 24);
            uint16_t e_phentsize = (uint16_t)kern_blk_sector_buf[42] |
                                   ((uint16_t)kern_blk_sector_buf[43] << 8);
            uint16_t e_phnum = (uint16_t)kern_blk_sector_buf[44] |
                               ((uint16_t)kern_blk_sector_buf[45] << 8);

            /* Adjust entry point relative to slot base.
             * ELF entry is a virtual address; for bare-metal guests it
             * matches the load address, so we offset by -dest. */
            entry = e_entry; /* keep as-is, init_context will use slot base */

            /* Copy first sector data to slot (may contain first LOAD segment) */
            volatile uint8_t *sd = (volatile uint8_t *)dest;
            for (int i = 0; i < 512; i++) sd[i] = kern_blk_sector_buf[i];

            /* Read remaining sectors */
            if (n_sectors > 1) {
                if (geos_blk_read(start_sector + 1,
                                  (void *)(dest + 512), n_sectors - 1) != 0)
                    return -1;
            }

            /* Process LOAD segments: zero-fill BSS gap and adjust.
             * For each PT_LOAD program header, the data is already at the
             * right offset in the slot. We just verify it's within bounds. */
            for (uint16_t ph = 0; ph < e_phnum && ph < 8; ph++) {
                uint32_t ph_off = e_phoff + (uint32_t)ph * e_phentsize;
                /* Read program header from slot (already loaded) */
                volatile uint8_t *ph_buf = (volatile uint8_t *)(dest + ph_off);
                if (ph_off + e_phentsize > n_sectors * 512) break;

                uint32_t p_type = (uint32_t)ph_buf[0] |
                                  ((uint32_t)ph_buf[1] << 8) |
                                  ((uint32_t)ph_buf[2] << 16) |
                                  ((uint32_t)ph_buf[3] << 24);
                if (p_type != 1) continue; /* not PT_LOAD */

                /* p_offset at +4, p_vaddr at +8, p_filesz at +16, p_memsz at +20 */
                uint32_t p_memsz = (uint32_t)ph_buf[20] |
                                   ((uint32_t)ph_buf[21] << 8) |
                                   ((uint32_t)ph_buf[22] << 16) |
                                   ((uint32_t)ph_buf[23] << 24);
                uint32_t p_filesz = (uint32_t)ph_buf[16] |
                                    ((uint32_t)ph_buf[17] << 8) |
                                    ((uint32_t)ph_buf[18] << 16) |
                                    ((uint32_t)ph_buf[19] << 24);
                uint32_t p_vaddr = (uint32_t)ph_buf[8] |
                                   ((uint32_t)ph_buf[9] << 8) |
                                   ((uint32_t)ph_buf[10] << 16) |
                                   ((uint32_t)ph_buf[11] << 24);

                /* Zero-fill BSS: [file_end .. memsz) within slot */
                uint32_t slot_offset = p_vaddr - dest;
                if (slot_offset + p_memsz <= SLOT_SIZE && p_memsz > p_filesz) {
                    volatile uint8_t *bss = (volatile uint8_t *)(dest + slot_offset + p_filesz);
                    for (uint32_t z = p_filesz; z < p_memsz; z++) bss[z - p_filesz] = 0;
                }
            }

            /* Entry point: if ELF entry equals the first LOAD vaddr, use slot base.
             * Otherwise offset from slot base. For bare-metal, entry == slot base. */
            if (e_entry >= dest && e_entry < dest + SLOT_SIZE) {
                entry = e_entry; /* within slot, use as-is */
            } else {
                entry = dest; /* fallback to slot base */
            }
        } else {
            /* Flat binary: load all sectors sequentially into slot */
            volatile uint8_t *sd = (volatile uint8_t *)dest;
            for (int i = 0; i < 512; i++) sd[i] = kern_blk_sector_buf[i];

            if (n_sectors > 1) {
                if (geos_blk_read(start_sector + 1,
                                  (void *)(dest + 512), n_sectors - 1) != 0)
                    return -1;
            }
        }

        return (long)entry;
    }

    /* geos_file_open(name_ptr, mode): open file from on-disk directory.
     * mode: 0=read, 1=write, 2=read+write. Returns per-process fd or -1. */
    case 21: {
        const char *name = (const char *)(uintptr_t)a1;
        uint32_t mode = (uint32_t)a2;
        if (!name) return -1;

        /* Find free fd for this process */
        int fd = -1;
        for (int i = 0; i < MAX_OPEN_FILES; i++) {
            if (!open_files[current_id][i].active) { fd = i; break; }
        }
        if (fd < 0) return -1;

        /* Check for device files */
        if (name[0] == '/' && name[1] == 'd' && name[2] == 'e' && name[3] == 'v' && name[4] == '/') {
            if (name[5] == 's' && name[6] == 'u' && name[7] == 'b') {
                /* /dev/substrate */
                open_files[current_id][fd].active = 1;
                open_files[current_id][fd].type = FD_TYPE_SUBSTRATE;
                open_files[current_id][fd].mode = mode;
                return fd;
            }
        }

        /* Regular file: Init block device if needed */
        if (!kern_blk_ready) {
            if (geos_blk_init(kern_blk_desc_buf) != 0) return -1;
            kern_blk_ready = 1;
        }

        /* Read superblock to verify FS */
        if (geos_blk_read(0, kern_blk_sector_buf, 1) != 0) return -1;
        uint32_t sb_magic = (uint32_t)kern_blk_sector_buf[0] |
                            ((uint32_t)kern_blk_sector_buf[1] << 8) |
                            ((uint32_t)kern_blk_sector_buf[2] << 16) |
                            ((uint32_t)kern_blk_sector_buf[3] << 24);
        if (sb_magic != GSFS_MAGIC) return -1; /* no filesystem */

        /* Scan directory entries (sectors 1-8) looking for name */
        int found = -1;
        for (uint32_t sec = 1; sec <= 8 && found < 0; sec++) {
            if (geos_blk_read(sec, kern_blk_sector_buf, 1) != 0) return -1;
            for (int e = 0; e < 16; e++) { /* 16 entries per 512-byte sector */
                int off = e * 32;
                /* Check if entry is used (first byte non-zero) */
                if (kern_blk_sector_buf[off] == 0) continue;
                /* Compare name */
                int match = 1;
                for (int c = 0; c < 28; c++) {
                    char a = (char)kern_blk_sector_buf[off + c];
                    char b = name[c];
                    if (a != b) { match = 0; break; }
                    if (a == 0 && b == 0) break;
                }
                if (match) {
                    /* Found: read start sector and size */
                    uint32_t start_sec = (uint32_t)kern_blk_sector_buf[off + 28] |
                                         ((uint32_t)kern_blk_sector_buf[off + 29] << 8) |
                                         ((uint32_t)kern_blk_sector_buf[off + 30] << 16) |
                                         ((uint32_t)kern_blk_sector_buf[off + 31] << 24);
                    open_files[current_id][fd].active = 1;
                    open_files[current_id][fd].start_sector = start_sec;
                    open_files[current_id][fd].offset = 0;
                    open_files[current_id][fd].mode = mode;
                    return fd;
                }
            }
        }

        /* File not found: create if write mode */
        if (mode & 1) {
            /* Find free directory entry */
            for (uint32_t sec = 1; sec <= 8; sec++) {
                if (geos_blk_read(sec, kern_blk_sector_buf, 1) != 0) return -1;
                for (int e = 0; e < 16; e++) {
                    int off = e * 32;
                    if (kern_blk_sector_buf[off] == 0) {
                        /* Write name */
                        for (int c = 0; c < 28; c++) {
                            kern_blk_sector_buf[off + c] = (uint8_t)name[c];
                            if (name[c] == 0) break;
                        }
                        /* Allocate data sector from superblock */
                        uint32_t free_sec = 9; /* data starts at sector 9 */
                        /* Read superblock free_sector field (offset 8) */
                        uint8_t sb_buf[512];
                        if (geos_blk_read(0, sb_buf, 1) != 0) return -1;
                        free_sec = (uint32_t)sb_buf[8] |
                                   ((uint32_t)sb_buf[9] << 8) |
                                   ((uint32_t)sb_buf[10] << 16) |
                                   ((uint32_t)sb_buf[11] << 24);
                        if (free_sec == 0) free_sec = 9;

                        /* Write start_sector into dir entry */
                        kern_blk_sector_buf[off + 28] = (uint8_t)(free_sec & 0xFF);
                        kern_blk_sector_buf[off + 29] = (uint8_t)((free_sec >> 8) & 0xFF);
                        kern_blk_sector_buf[off + 30] = (uint8_t)((free_sec >> 16) & 0xFF);
                        kern_blk_sector_buf[off + 31] = (uint8_t)((free_sec >> 24) & 0xFF);

                        /* Write back directory sector */
                        if (geos_blk_write(sec, kern_blk_sector_buf, 1) != 0) return -1;

                        /* Update superblock free_sector */
                        sb_buf[8]  = (uint8_t)((free_sec + 1) & 0xFF);
                        sb_buf[9]  = (uint8_t)(((free_sec + 1) >> 8) & 0xFF);
                        sb_buf[10] = (uint8_t)(((free_sec + 1) >> 16) & 0xFF);
                        sb_buf[11] = (uint8_t)(((free_sec + 1) >> 24) & 0xFF);
                        geos_blk_write(0, sb_buf, 1);

                        open_files[current_id][fd].active = 1;
                        open_files[current_id][fd].start_sector = free_sec;
                        open_files[current_id][fd].offset = 0;
                        open_files[current_id][fd].mode = mode;
                        return fd;
                    }
                }
            }
        }

        return -1; /* not found and not created */
    }

    /* geos_file_read(fd, buf_ptr, count): read from file into guest buffer.
     * Returns bytes read (0 = EOF) or -1 on error. */
    case 22: {
        int fd = (int)a1;
        uint8_t *buf = (uint8_t *)(uintptr_t)a2;
        uint32_t count = (uint32_t)a3;
        if (fd < 0 || fd >= MAX_OPEN_FILES) return -1;
        if (!open_files[current_id][fd].active) return -1;
        if (!(open_files[current_id][fd].mode & 2) &&
            !(open_files[current_id][fd].mode == 0)) return -1; /* not readable */
        if (!buf || count == 0) return -1;

        uint32_t sec = open_files[current_id][fd].start_sector +
                       (open_files[current_id][fd].offset / 512);
        uint32_t off_in_sec = open_files[current_id][fd].offset % 512;
        uint32_t total = 0;

        while (total < count) {
            if (geos_blk_read(sec, kern_blk_sector_buf, 1) != 0) break;
            uint32_t avail = 512 - off_in_sec;
            uint32_t to_copy = count - total;
            if (to_copy > avail) to_copy = avail;
            for (uint32_t i = 0; i < to_copy; i++) {
                buf[total + i] = kern_blk_sector_buf[off_in_sec + i];
            }
            total += to_copy;
            off_in_sec = 0;
            sec++;
            if (to_copy < avail) break; /* partial read = sector boundary */
        }

        open_files[current_id][fd].offset += total;
        return (long)total;
    }

    /* geos_file_write(fd, buf_ptr, count): write guest buffer to file.
     * Returns bytes written or -1 on error. */
    case 23: {
        int fd = (int)a1;
        const uint8_t *buf = (const uint8_t *)(uintptr_t)a2;
        uint32_t count = (uint32_t)a3;
        if (fd < 0 || fd >= MAX_OPEN_FILES) return -1;
        if (!open_files[current_id][fd].active) return -1;
        if (!(open_files[current_id][fd].mode & 1)) return -1; /* not writable */
        if (!buf || count == 0) return -1;

        uint32_t sec = open_files[current_id][fd].start_sector +
                       (open_files[current_id][fd].offset / 512);
        uint32_t off_in_sec = open_files[current_id][fd].offset % 512;
        uint32_t total = 0;

        while (total < count) {
            /* Read-modify-write for partial sectors */
            if (off_in_sec != 0 || (count - total) < 512) {
                if (geos_blk_read(sec, kern_blk_sector_buf, 1) != 0) break;
            }
            uint32_t avail = 512 - off_in_sec;
            uint32_t to_copy = count - total;
            if (to_copy > avail) to_copy = avail;
            for (uint32_t i = 0; i < to_copy; i++) {
                kern_blk_sector_buf[off_in_sec + i] = buf[total + i];
            }
            if (geos_blk_write(sec, kern_blk_sector_buf, 1) != 0) break;
            total += to_copy;
            off_in_sec = 0;
            sec++;
        }

        open_files[current_id][fd].offset += total;
        return (long)total;
    }

    /* geos_file_close(fd): close an open file. Returns 0 or -1. */
    case 24: {
        int fd = (int)a1;
        if (fd < 0 || fd >= MAX_OPEN_FILES) return -1;
        if (!open_files[current_id][fd].active) return -1;
        open_files[current_id][fd].active = 0;
        return 0;
    }

    /* geos_file_ls(buf_ptr, max_entries): list file names.
     * Writes null-terminated names into buf, max max_entries.
     * Returns number of entries found. */
    case 25: {
        uint8_t *buf = (uint8_t *)(uintptr_t)a1;
        uint32_t max_ent = (uint32_t)a2;
        if (!buf || max_ent == 0) return -1;

        if (!kern_blk_ready) {
            if (geos_blk_init(kern_blk_desc_buf) != 0) return -1;
            kern_blk_ready = 1;
        }

        /* Verify FS */
        if (geos_blk_read(0, kern_blk_sector_buf, 1) != 0) return -1;
        uint32_t sb_magic = (uint32_t)kern_blk_sector_buf[0] |
                            ((uint32_t)kern_blk_sector_buf[1] << 8) |
                            ((uint32_t)kern_blk_sector_buf[2] << 16) |
                            ((uint32_t)kern_blk_sector_buf[3] << 24);
        if (sb_magic != GSFS_MAGIC) return 0; /* no FS = empty listing */

        uint32_t found = 0;
        uint32_t buf_off = 0;
        for (uint32_t sec = 1; sec <= 8 && found < max_ent; sec++) {
            if (geos_blk_read(sec, kern_blk_sector_buf, 1) != 0) break;
            for (int e = 0; e < 16 && found < max_ent; e++) {
                int off = e * 32;
                if (kern_blk_sector_buf[off] == 0) continue;
                /* Copy name to buffer */
                for (int c = 0; c < 28; c++) {
                    buf[buf_off++] = kern_blk_sector_buf[off + c];
                    if (kern_blk_sector_buf[off + c] == 0) break;
                }
                /* Ensure null termination */
                if (buf[buf_off - 1] != 0) buf[buf_off++] = 0;
                found++;
            }
        }
        return (long)found;
    }

    /* geos_file_ioctl(fd, cmd, arg): device-specific control.
     * Substrate IOCTLs: 1=TICK, 2=SET_X, 3=SET_Y, 4=QUERY, 5=COPY, 6=PATCH */
    case GEO_FN_IOCTL: {
        int fd = (int)a1;
        uint32_t cmd = (uint32_t)a2;
        uint32_t arg = (uint32_t)a3;
        if (fd < 0 || fd >= MAX_OPEN_FILES) return -1;
        if (!open_files[current_id][fd].active) return -1;

        if (open_files[current_id][fd].type == FD_TYPE_SUBSTRATE) {
            switch (cmd) {
            case 1: /* TICK(n) */
                *(volatile uint32_t *)SUB_ARG1 = arg;
                *(volatile uint32_t *)SUB_CMD = SUB_CMD_TICK;
                while (*(volatile uint32_t *)SUB_STATUS == 1); /* wait if busy */
                return 0;
            case 2: /* SET_X */
                *(volatile uint32_t *)SUB_X = arg;
                return 0;
            case 3: /* SET_Y */
                *(volatile uint32_t *)SUB_Y = arg;
                return 0;
            case 4: /* QUERY(reg) -- 0=STATUS, 1=RESULT, 2=VERSION, 3=TICKS */
                if (arg == 0) return *(volatile uint32_t *)SUB_STATUS;
                if (arg == 1) return *(volatile uint32_t *)SUB_RESULT;
                if (arg == 2) return *(volatile uint32_t *)SUB_VERSION;
                if (arg == 3) return *(volatile uint32_t *)(SUBSTRATE_BASE + 0x20);
                return -1;
            case 5: /* COPY -- arg points to [sx, sy, dx, dy, w, h] in RAM */
                {
                    uint32_t *p = (uint32_t *)(uintptr_t)arg;
                    /* Pack Arg 1: (sx<<24 | sy<<16 | dx<<8 | dy) */
                    uint32_t a1_packed = (p[0] << 24) | (p[1] << 16) | (p[2] << 8) | p[3];
                    /* Pack Arg 2: (w<<16 | h) */
                    uint32_t a2_packed = (p[4] << 16) | (p[5] & 0xFFFF);
                    *(volatile uint32_t *)SUB_ARG1 = a1_packed;
                    *(volatile uint32_t *)SUB_ARG2 = a2_packed;
                    *(volatile uint32_t *)SUB_CMD = SUB_CMD_COPY;
                    while (*(volatile uint32_t *)SUB_STATUS == 1);
                    return 0;
                }
            case 6: /* PATCH(color) -- uses current SUB_X/SUB_Y */
                *(volatile uint32_t *)SUB_ARG1 = arg;
                *(volatile uint32_t *)SUB_CMD = SUB_CMD_PATCH;
                while (*(volatile uint32_t *)SUB_STATUS == 1);
                return 0;
            case 7: /* LOAD_CIRCUIT(id) -- load pre-built circuit template */
                *(volatile uint32_t *)SUB_ARG1 = arg;
                *(volatile uint32_t *)SUB_CMD = SUB_CMD_LOAD;
                while (*(volatile uint32_t *)SUB_STATUS == 1);
                return 0;
            case 8: /* WRITE_PORT(port, val) -- arg = (port << 16) | value */
                *(volatile uint32_t *)SUB_ARG1 = (arg >> 16) & 0xFFFF;
                *(volatile uint32_t *)SUB_ARG2 = arg & 0xFFFF;
                *(volatile uint32_t *)SUB_CMD = SUB_CMD_CWRITE;
                while (*(volatile uint32_t *)SUB_STATUS == 1);
                return 0;
            case 9: /* READ_PORT(port) -- arg = port, returns value */
                *(volatile uint32_t *)SUB_ARG1 = arg;
                *(volatile uint32_t *)SUB_CMD = SUB_CMD_CREAD;
                while (*(volatile uint32_t *)SUB_STATUS == 1);
                return *(volatile uint32_t *)SUB_RESULT;
            case 10: /* FIRE -- inject PC pulse into command track */
                *(volatile uint32_t *)SUB_CMD = SUB_CMD_FIRE;
                while (*(volatile uint32_t *)SUB_STATUS == 1);
                return 0;
            case 11: /* LEARN(decay, bump) -- arg = (decay_x256 << 16) | bump */
                *(volatile uint32_t *)SUB_ARG1 = (arg >> 16) & 0xFFFF;
                *(volatile uint32_t *)SUB_ARG2 = arg & 0xFF;
                *(volatile uint32_t *)SUB_CMD = SUB_CMD_LEARN;
                while (*(volatile uint32_t *)SUB_STATUS == 1);
                return 0;
            default: return -1;
            }
        }
        return -1;
    }

    default: return -1;
    }
}

/*
 * kern_handle_getchar -- input focus routing for SBI console getchar.
 * Tab cycles focus through active processes.
 */
long kern_handle_getchar(long caller_id) {
    if ((uint32_t)caller_id != focused_id) return -1;

    register long a0 __asm__("a0") = 0;
    register long a7 __asm__("a7") = 2;
    __asm__ volatile("ecall" : "+r"(a0) : "r"(a7) : "memory", "a1");

    if (a0 == KEY_TAB) {
        uint32_t next_f = (focused_id + 1) % MAX_PROCS;
        for (int i = 0; i < MAX_PROCS; i++) {
            if (processes[next_f].active) {
                focused_id = next_f;
                break;
            }
            next_f = (next_f + 1) % MAX_PROCS;
        }
        return -1;
    }
    return a0;
}

static void copy_guest(const char *start, const char *end, uint32_t dest) {
    uint32_t len = (uint32_t)(end - start);
    volatile uint32_t *dst = (volatile uint32_t *)dest;
    const uint32_t *src = (const uint32_t *)start;
    for (uint32_t i = 0; i < len; i += 4) dst[i / 4] = src[i / 4];
}

static void init_context(uint32_t *ctx, uint32_t entry, uint32_t sp) {
    for (int i = 0; i < CTX_WORDS; i++) ctx[i] = 0;
    ctx[CTX_MEPC_OFF / 4] = entry;
    ctx[CTX_SP_OFF / 4]   = sp;
    ctx[CTX_RA_OFF / 4]   = 0;
}

/*
 * c_start -- kernel entry point.
 */
void c_start(void) {
    geos_puts("[geos] kernel boot (N-proc, MAX=4)\n");
    boot_mtime_lo = *(volatile uint32_t *)(GEOS_CLINT_MTIME);
    boot_mtime_hi = *(volatile uint32_t *)(GEOS_CLINT_MTIME + 4);

    /* Initialize process table */
    for (int i = 0; i < MAX_PROCS; i++) {
        processes[i].active = 0;
        processes[i].id = (uint32_t)i;
        processes[i].clip_rect = 0u;
    }

    /* Load embedded guest images */
    extern const char _guest_a_start[];
    extern const char _guest_a_end[];
    geos_puts("[geos] loading guest A...\n");
    copy_guest(_guest_a_start, _guest_a_end, SLOT_A);
    processes[0].active = 1;
    init_context(processes[0].ctx, SLOT_A, STACK_A);

    extern const char _guest_b_start[];
    extern const char _guest_b_end[];
    geos_puts("[geos] loading guest B to RAM...\n");
    copy_guest(_guest_b_start, _guest_b_end, SLOT_B);

    kern_retile();

    current_id = 0;
    focused_id = 0;
    current_ctx_ptr = processes[0].ctx;

    /* Set mscratch to process 0's context */
    __asm__ volatile("csrw mscratch, %0" : : "r"(current_ctx_ptr));

    /* Set trap handler */
    extern void kern_trap_entry(void);
    __asm__ volatile("csrw mtvec, %0" : : "r"(&kern_trap_entry));

    /* Set initial clip rect */
    *(volatile uint32_t *)GEOS_FB_CLIP = processes[0].clip_rect;

    /* Start timer */
    uint64_t now = geos_mtime();
    uint64_t next = now + 1000000u;
    *(volatile uint32_t *)(0x02004000u + 4) = 0xFFFFFFFFu;
    *(volatile uint32_t *)(0x02004000u)     = (uint32_t)next;
    *(volatile uint32_t *)(0x02004000u + 4) = (uint32_t)(next >> 32);

    /* Enable interrupts */
    __asm__ volatile("csrs mie, %0" : : "r"(1u << 7));
    __asm__ volatile("csrs mstatus, %0" : : "r"(1u << 3));

    geos_puts("[geos] interrupts enabled, jumping to guest A\n");
    __asm__ volatile(
        "csrw mepc, %0\n"
        "li t0, 0x1880\n"
        "csrs mstatus, t0\n"
        "mret\n"
        :
        : "r"((uint32_t)SLOT_A)
        : "t0", "memory"
    );

    sbi_shutdown();
}
