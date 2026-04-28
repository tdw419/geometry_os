/*
 * geos_kern.c -- Geometry OS Layer 2 supervisor (Phase I bootstrap)
 *
 * This is the minimum viable kernel: install an M-mode trap vector, configure
 * the CLINT timer, take five timer interrupts, and SBI-shutdown. It proves the
 * trap + timer infrastructure end-to-end before Phase I adds program slots,
 * context switch, and pixel-region arbitration on top.
 *
 * Acceptance for this slice:
 *   - Links against crt0.S + libgeos.a like every other guest program.
 *   - Boots, prints `[geos] kernel boot`.
 *   - Five timer interrupts each print `[geos] tick N`.
 *   - SBI shutdown after the fifth tick.
 *
 * The ISR uses the GCC `interrupt("machine")` attribute, which emits the full
 * caller-save register prologue/epilogue and ends with `mret`. That keeps Phase
 * I.1.2 free of hand-written context-switch asm until we actually need to
 * switch between two programs (Phase I.1.3).
 */

#include "libgeos.h"
#include <stdint.h>

#define CLINT_MTIMECMP    0x02004000u
#define MTIE              (1u << 7)   /* mie.MTIE: machine timer interrupt enable */
#define MSTATUS_MIE       (1u << 3)   /* mstatus.MIE: global M-mode interrupts */
#define MCAUSE_INT        0x80000000u
#define MCAUSE_M_TIMER    7u

/* ~20ms at the documented 52 MIPS interpreter rate; mtime ticks per
   instruction in this VM, so this is "plenty long" rather than wall-clock. */
#define TICK_INTERVAL     1000000u
#define MAX_TICKS         5

static volatile uint32_t tick_count = 0;

static inline void set_mtimecmp(uint64_t value) {
    /* Write hi=MAX first to prevent a transient lo<old_lo from firing early. */
    *(volatile uint32_t *)(CLINT_MTIMECMP + 4) = 0xFFFFFFFFu;
    *(volatile uint32_t *)(CLINT_MTIMECMP)     = (uint32_t)value;
    *(volatile uint32_t *)(CLINT_MTIMECMP + 4) = (uint32_t)(value >> 32);
}

__attribute__((interrupt("machine"), aligned(4)))
void kern_trap_entry(void) {
    uintptr_t cause;
    __asm__ volatile("csrr %0, mcause" : "=r"(cause));

    if ((cause & MCAUSE_INT) && ((cause & 0x7Fu) == MCAUSE_M_TIMER)) {
        tick_count++;
        geos_puts("[geos] tick ");
        geos_put_dec(tick_count);
        geos_puts("\n");

        if (tick_count >= MAX_TICKS) {
            sbi_shutdown();
        }
        set_mtimecmp(geos_mtime() + TICK_INTERVAL);
        return;
    }

    geos_puts("[geos] unhandled trap mcause=");
    geos_put_hex((uint32_t)cause);
    geos_puts("\n");
    sbi_shutdown();
}

void c_start(void) {
    geos_puts("[geos] kernel boot\n");

    __asm__ volatile("csrw mtvec, %0" : : "r"(&kern_trap_entry));

    set_mtimecmp(geos_mtime() + TICK_INTERVAL);

    __asm__ volatile("csrs mie, %0"     : : "r"(MTIE));
    __asm__ volatile("csrs mstatus, %0" : : "r"(MSTATUS_MIE));

    geos_puts("[geos] interrupts enabled\n");

    while (tick_count < MAX_TICKS) {
        __asm__ volatile("wfi");
    }

    /* Unreachable: the ISR shuts down on the MAX_TICKS-th tick. */
    sbi_shutdown();
}
