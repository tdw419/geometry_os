# LAYER2_KERNEL: The Geometry OS Supervisor

The Layer 2 Supervisor (`geos_kern.elf`) is a minimal M-mode environment designed to multiplex multiple Layer 3 programs on a single Layer 1 substrate. It is NOT a general-purpose OS; it is a **Spatial Program Coordinator**.

## Memory Layout (Phase I)

The kernel assumes a single contiguous RAM block starting at `0x80000000`.

| Range | Size | Usage |
|-------|------|-------|
| `0x80000000 - 0x8000FFFF` | 64 KB | Kernel Code & Data |
| `0x80010000 - 0x8004FFFF` | 256 KB | Program 0 (Slot A) |
| `0x80050000 - 0x8008FFFF` | 256 KB | Program 1 (Slot B) |
| `0x80090000 - ...`        | ...    | Shared Stack/Heap Region |

## Core Responsibilities

1.  **Cooperative Time-Slicing**:
    - Programs must call `geos_yield()` to surrender control.
    - A hardware timer interrupt (`mtimecmp`) provides a safety fallback to prevent total system hangs.
2.  **Region Arbitration**:
    - Kernel tracks `(x, y, w, h)` rects for each program.
    - Input focus determines which program receives UART/Keyboard bytes.
3.  **Visual Consistency**:
    - Kernel draws a focus border around the active region.
    - Kernel clips `fb_present` calls to the owning program's rect.

## Non-Goals (Strictly Forbidden)

-   Memory Protection (PMP/MMU): Programs are trusted to stay in their slots.
-   File Descriptors: I/O is raw and direct.
-   Virtual Memory: Everything is identity-mapped.
