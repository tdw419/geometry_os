/*
 * test_spatial_alloc_with_poll.S - RISC-V Spatial Allocation with Polling
 *
 * This version polls for completion after ecall instead of immediately reading.
 * Memory layout:
 *   req_ptr = 0x2000 (SpatialAllocReq structure)
 *   resp_ptr = 0x2010 (SpatialAllocResp structure)
 *   result_flag = 0x3000 (0 = fail, 1 = success)
 */

.section .text
.globl _start

_start:
    /* --- Step 1: Set up SpatialAllocReq at 0x2000 --- */
    lui t0, 0x20000                    /* t0 = 0x2000 (base for request struct) */

    li t1, 1                          /* req_id = 1 */
    sw t1, 0(t0)                      /* Store req_id (lower 32 bits of u64) */
    sw zero, 4(t0)                    /* req_id upper 32 bits = 0 */

    li t1, 10                         /* width = 10 cells */
    sw t1, 8(t0)                      /* Store width at offset 8 */

    li t1, 20                         /* height = 20 cells */
    sw t1, 12(t0)                     /* Store height at offset 12 */

    /* --- Step 2: Prepare response buffer pointer at 0x2010 --- */
    lui t1, 0x20010                   /* t1 = 0x2010 (base for response struct) */

    /* Zero out response buffer */
    sw zero, 0(t1)
    sw zero, 4(t1)
    sw zero, 8(t1)
    sw zero, 12(t1)

    /* --- Step 3: Make hypercall ecall with ID 0x123 (291 decimal) --- */
    mv a0, t0                         /* a0 = req_ptr = 0x2000 */
    mv a1, t1                         /* a1 = resp_ptr = 0x2010 */
    li a7, 291                        /* Hypercall ID: 0x123 = 291 decimal */
    ecall                             /* Trap to hypervisor! */

    /* --- Step 4: Poll for response (wait for region_id to be set) --- */
poll_loop:
    lw t2, 0(t1)                      /* Load region_id (lower 32 bits) */
    lw t3, 4(t1)                      /* Load region_id (upper 32 bits) */

    /* Check if region_id is set (non-zero) */
    or t2, t2, t3                     /* t2 = t2 | t3 */
    beqz t2, poll_loop                /* If zero, keep polling */

    /* --- Step 5: Check result field (offset 8 from resp_ptr) --- */
    lw t2, 8(t1)                      /* Load result from resp->result */
    bnez t2, fail                     /* If result != 0, jump to fail */

    /* --- Step 6: Write SUCCESS flag to RAM --- */
    lui t0, 0x30000                    /* t0 = 0x3000 */
    li t1, 1                          /* success = 1 */
    sw t1, 0(t0)                      /* Store success flag */

    j halt

fail:
    /* Write FAIL flag to RAM */
    lui t0, 0x30000                    /* t0 = 0x3000 */
    sw zero, 0(t0)                    /* Store fail = 0 */

halt:
    /* Infinite loop to halt execution */
    j halt