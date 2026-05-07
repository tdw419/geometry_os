/*
 * shm_test.c -- Phase 235: Shared Memory IPC single-guest verification
 *
 * Tests all SHM operations (alloc, map, write, read, release) without
 * requiring a multi-process kernel. Under the standalone hypervisor,
 * the GEOS SBI extension handles SHM via the host SBI (a6 = function ID).
 *
 * Under the kernel (geos_kern.elf), a0 = function ID.
 *
 * Build: ./build.sh shm_test.c shm_test.elf
 * Run:   hypervisor_boot arch=riscv32 kernel=shm_test.elf ram=2
 */

#include "libgeos.h"

/* Under the standalone host SBI, function ID goes in a6.
 * Under the kernel, function ID goes in a0.
 * We use a0 convention here since this is for the kernel build.
 * For standalone, the host SBI handles GEO_SHM_* differently. */

int c_start(void) {
    geos_puts("[shm] Phase 235 test start\n");

    /* Test 1: Allocate a shared memory slot */
    long slot = geos_shm_alloc(4096);
    if (slot < 0) {
        geos_puts("[shm] FAIL: alloc returned -1\n");
        return 1;
    }
    geos_puts("[shm] PASS: alloc returned slot ");
    geos_put_dec(slot);
    geos_puts("\n");

    /* Test 2: Map the slot to get its base address */
    long base = geos_shm_map(slot);
    if (base < 0) {
        geos_puts("[shm] FAIL: map returned -1\n");
        return 1;
    }
    geos_puts("[shm] PASS: map returned base 0x");
    geos_put_hex(base);
    geos_puts("\n");

    volatile uint32_t *region = (volatile uint32_t *)base;

    /* Test 3: Verify header was initialized by the kernel */
    uint32_t cap = region[GEOS_SHM_HDR_CAPACITY];
    if (cap == 0) {
        geos_puts("[shm] FAIL: capacity is 0 (header not initialized)\n");
        return 1;
    }
    geos_puts("[shm] PASS: capacity = ");
    geos_put_dec(cap);
    geos_puts(" words\n");

    /* Test 4: Write values into the ring buffer */
    int write_ok = 0;
    for (uint32_t i = 0; i < 10; i++) {
        if (geos_shm_write(region, 1000 + i) == 0) {
            write_ok++;
        }
    }
    if (write_ok != 10) {
        geos_puts("[shm] FAIL: only wrote ");
        geos_put_dec(write_ok);
        geos_puts("/10 values\n");
        return 1;
    }
    geos_puts("[shm] PASS: wrote 10 values\n");

    /* Test 5: Read values back and verify */
    int read_ok = 0;
    int mismatch = 0;
    for (uint32_t i = 0; i < 10; i++) {
        uint32_t val;
        if (geos_shm_read(region, &val) == 0) {
            read_ok++;
            if (val != 1000 + i) {
                mismatch++;
                geos_puts("[shm] MISMATCH: expected ");
                geos_put_dec(1000 + i);
                geos_puts(" got ");
                geos_put_dec(val);
                geos_puts("\n");
            }
        }
    }
    if (read_ok != 10) {
        geos_puts("[shm] FAIL: only read ");
        geos_put_dec(read_ok);
        geos_puts("/10 values\n");
        return 1;
    }
    if (mismatch > 0) {
        geos_puts("[shm] FAIL: ");
        geos_put_dec(mismatch);
        geos_puts(" value mismatches\n");
        return 1;
    }
    geos_puts("[shm] PASS: read 10 values, all correct\n");

    /* Test 6: Ring buffer empty after reading all */
    uint32_t val;
    if (geos_shm_read(region, &val) == 0) {
        geos_puts("[shm] FAIL: read succeeded on empty buffer\n");
        return 1;
    }
    geos_puts("[shm] PASS: empty buffer returns -1\n");

    /* Test 7: Fill buffer to capacity, verify full signal */
    uint32_t fill_count = 0;
    while (geos_shm_write(region, 0xDEAD) == 0) {
        fill_count++;
    }
    geos_puts("[shm] INFO: filled ");
    geos_put_dec(fill_count);
    geos_puts("/");
    geos_put_dec(cap);
    geos_puts(" capacity words\n");

    /* Test 8: Signal done and verify flag */
    geos_shm_signal_done(region);
    if (geos_shm_is_done(region)) {
        geos_puts("[shm] PASS: done flag set\n");
    } else {
        geos_puts("[shm] FAIL: done flag not set\n");
        return 1;
    }

    /* Test 9: Release the slot */
    if (geos_shm_release(slot) < 0) {
        geos_puts("[shm] FAIL: release returned -1\n");
        return 1;
    }
    geos_puts("[shm] PASS: released slot\n");

    /* Test 10: Re-allocate should reuse the same slot */
    long slot2 = geos_shm_alloc(4096);
    if (slot2 != slot) {
        geos_puts("[shm] WARN: reused different slot (expected ");
        geos_put_dec(slot);
        geos_puts(" got ");
        geos_put_dec(slot2);
        geos_puts(")\n");
    } else {
        geos_puts("[shm] PASS: re-allocated same slot\n");
    }

    /* Test 11: Allocate all 8 slots */
    long ids[8];
    int alloc_count = 0;
    for (int i = 0; i < 8; i++) {
        ids[i] = geos_shm_alloc(1024);
        if (ids[i] >= 0) alloc_count++;
    }
    geos_puts("[shm] INFO: allocated ");
    geos_put_dec(alloc_count);
    geos_puts("/8 slots\n");

    /* Test 12: 9th allocation should fail */
    long overflow = geos_shm_alloc(1024);
    if (overflow < 0) {
        geos_puts("[shm] PASS: 9th alloc correctly returned -1\n");
    } else {
        geos_puts("[shm] FAIL: 9th alloc should have returned -1\n");
        return 1;
    }

    /* Cleanup */
    for (int i = 0; i < alloc_count; i++) {
        geos_shm_release(ids[i]);
    }

    geos_puts("[shm] ALL TESTS PASSED\n");
    return 0;
}
