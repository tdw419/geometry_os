# LAYER2_KERNEL: The Geometry OS Supervisor

The Layer 2 Supervisor (`geos_kern.elf`) is a minimal M-mode environment designed to multiplex multiple Layer 3 programs on a single Layer 1 substrate. It is NOT a general-purpose OS; it is a **Spatial Program Coordinator**.

## Memory Layout

The kernel assumes a single contiguous RAM block starting at `0x80000000`.

| Range | Size | Usage |
|-------|------|-------|
| `0x80000000 - 0x8000FFFF` | 64 KB | Kernel Code & Data |
| `0x80010000 - 0x8004FFFF` | 256 KB | Program 0 (Slot A) |
| `0x80050000 - 0x8008FFFF` | 256 KB | Program 1 (Slot B) |
| `0x80090000 - 0x800AFFFF` | 128 KB | Program 2 (Slot C) |
| `0x800B0000 - 0x800CFFFF` | 128 KB | Program 3 (Slot D) |
| `0x800D0000 - 0x800FFFFF` | 192 KB | Free / expansion |
| `0x80100000 - 0x8010FFFF` | 64 KB | Stack 0 |
| `0x80110000 - 0x8011FFFF` | 64 KB | Stack 1 |
| `0x80120000 - 0x8012FFFF` | 64 KB | Kernel Stack |
| `0x80130000 - 0x8013FFFF` | 64 KB | SHM Pool (8 x 8KB) |
| `0x80140000 - 0x8015FFFF` | 128 KB | Spawn Stacks (procs 2-3, 64KB each) |

## Core Responsibilities

1.  **Preemptive Time-Slicing**:
    - Hardware timer interrupt (`mtimecmp`) drives round-robin across all active processes.
    - Up to `MAX_PROCS=4` concurrent programs.
    - `geos_yield_to(target)` allows cooperative direct handoff.
2.  **Dynamic Process Lifecycle**:
    - `geos_spawn(entry_point)` creates a new context at an arbitrary entry point.
    - `geos_kill(context_id)` tears down a process, releases its SHM and alarms.
    - A process can kill itself (triggers immediate reschedule).
3.  **Region Arbitration**:
    - Kernel tracks `(x, y, w, h)` rects for each program.
    - Input focus determines which program receives UART/Keyboard bytes.
    - Tab cycles focus through active processes.
4.  **Auto-Tiling**:
    - On every `spawn` or `kill`, the kernel recalculates clip rects for all active processes to cover the full 256x256 framebuffer without overlap.
    - Layouts: 1=full, 2=left/right halves, 3=top-row 2 + bottom 1, 4=2x2 grid.
    - Programs query their assigned rect via `geos_get_rect()` and sibling count via `geos_proc_count()`.
5.  **Visual Consistency**:
    - Kernel draws a focus border around the active region.
    - Kernel clips `fb_present` calls to the owning program's rect.

## Process Syscalls (SBI extension 0x47454F00, fid via a6)

| fid | Name | Args | Returns |
|-----|------|------|---------|
| 0 | geos_yield | -- | 0 |
| 1 | geos_get_id | -- | current_id |
| 2 | geos_has_focus | -- | 1 if focused |
| 3 | geos_spawn | a1=entry_point | new slot ID, or -1 |
| 4 | geos_kill | a1=context_id | 0 or -1 |
| 5 | geos_yield_to | a1=target_id | 0 or -1 |
| 6 | geos_shm_alloc | a1=size | slot ID or -1 |
| 7 | geos_shm_map | a1=slot_id | base addr or -1 |
| 8 | geos_shm_release | a1=slot_id | 0 or -1 |
| 9 | geos_shm_size | a1=slot_id | size in bytes |
| 10 | geos_shm_write | a1=slot, a2=off, a3=src, a4=len | bytes written |
| 11 | geos_shm_read | a1=slot, a2=off, a3=dst, a4=len | bytes read |
| 12 | geos_uptime | a1=buf_ptr | 0 |
| 13 | geos_alarm_set | a1=ms, a2=callback | alarm ID or -1 |
| 14 | geos_alarm_cancel | a1=alarm_id | 0 or -1 |
| 15 | geos_msleep | a1=ms | 0 or -1 |
| 16 | geos_get_rect | -- | packed clip_rect (caller) |
| 17 | geos_proc_count | -- | number of active processes |
| 18 | geos_load | a1=slot, a2=src, a3=len | bytes copied or -1 |

## Context Structure (132 bytes, matches kern_trap.S)

| Offset | Register | Notes |
|--------|----------|-------|
| 0 | (pad) | Was tp, swapped via mscratch |
| 4 | x1 (ra) | Return address |
| 8 | sp | Stack pointer |
| 12 | x3 (gp) | Global pointer |
| 16 | x4 (tp) | Thread pointer (saved from mscratch) |
| 20-124 | x5-x31 | Callee/caller-saved registers |
| 128 | mepc | Program counter |

## Non-Goals (Strictly Forbidden)

-   Memory Protection (PMP/MMU): Programs are trusted to stay in their slots.
-   File Descriptors: I/O is raw and direct.
-   Virtual Memory: Everything is identity-mapped.
