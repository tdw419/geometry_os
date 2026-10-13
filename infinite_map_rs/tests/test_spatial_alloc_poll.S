# RISC-V Guest Test: Spatial Allocation with Response Polling
#
# This test allocates a 10x20 spatial region and polls for the response_ready flag
# before reading the allocation response from the hypervisor.
#
# Memory Layout:
#   0x2000: SpatialAllocReq (16 bytes) - width=10, height=20
#   0x2010: SpatialAllocResp (20 bytes) - response from hypervisor
#   0x2024: ready_flag (4 bytes) - polled until equals 2

.section .text
.globl _start

_start:
    # === Step 1: Initialize Ready Flag to 0 ===
    li t0, 0x2024
    sw zero, 0(t0)

    # === Step 2: Prepare Request at 0x2000 ===
    li t0, 0x2000

    # Write req_id = 0 (8 bytes at offset 0)
    sw zero, 0(t0)
    sw zero, 4(t0)

    # Write width = 10 (4 bytes at offset 8)
    li t1, 10
    sw t1, 8(t0)

    # Write height = 20 (4 bytes at offset 12)
    li t1, 20
    sw t1, 12(t0)

    # === Step 3: Execute ECALL ===
    # Load syscall number into a7
    li a7, 291  # 0x123

    # Load request pointer into a0
    li a0, 0x2000

    # Load response pointer into a1
    li a1, 0x2010

    # Load ready_flag pointer into a2
    li a2, 0x2024

    # Execute ECALL
    ecall

    # === Step 4: Poll for Response Ready ===
poll_loop:
    li t0, 0x2024
    lw t1, 0(t0)

    # Check if ready_flag == 2
    li t2, 2
    beq t1, t2, read_response
    j poll_loop

    # === Step 5: Read Response ===
read_response:
    li t0, 0x2010

    # Read result (offset 8) into a0 for verification
    lw a0, 8(t0)

    # === Step 6: Halt ===
halt:
    j halt