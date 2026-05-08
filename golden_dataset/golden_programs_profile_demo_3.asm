; DESCRIPTION: This GeOS assembly code initializes two strings in RAM and profiles the execution time of two different code regions: a simple linear loop and a nested loop. It then displays the profiling results on screen.

; profile_demo.asm -- Demonstrates PROFILE opcode (0xC6)
; Profiles two code regions and displays results on screen
;
; Region 0: Simple linear loop (fast)
; Region 1: Nested loop (slower)
;
; Memory layout:
;   0x2000 - "PROFILE DEMO\0" string (13 chars)
;   0x2010 - "REGION 0:\0" string (10 chars)
;   0x2020 - "REGION 1:\0" string (10 chars)
;   0x3000 - DUMP output buffer

    ; --- Initialize strings in RAM ---
    LDI r20, 0x2000
    LDI r21, 80
    STORE r20, r21
    ADD r20, r8
    LDI r21, 82
    STORE r20, r21
    ADD r20, r8
    LDI r21, 79
    STORE r20, r21
    ADD r20, r8
    LDI r21, 70
    STORE r20, r21
    ADD r20, r8
    LDI r21, 73
    STORE r20, r21
    ADD r20, r8
    LDI r21, 76
    STORE r20, r21
    ADD r20, r8
    LDI r21, 69
    STORE r20, r21
    ADD r20, r8
    LDI r21, 32
    STORE r20, r21
    ADD r20, r8
    LDI r21, 68
    STORE r20, r21
    ADD r20, r8
    LDI r21, 69
    STORE r20, r21
    ADD r20, r8
    LDI r21, 77
    STORE r20, r21
    ADD r20, r8
    LDI r21, 79
    STORE r20, r21
    ADD r20, r8
    LDI r21, 0
    STORE r20, r21

    LDI r20, 0x2010
    LDI r21, 82
    STORE r20, r21
    ADD r20, r8
    LDI r21, 69
    STORE r20, r21
    ADD r20, r8
    LDI r21, 71
    STORE r20, r21
    ADD r20, r8
    LDI r21, 73
    STORE r20, r21
    ADD r20, r8
    LDI r21, 79
    STORE r20, r21
    ADD r20, r8
    LDI r21, 78
    STORE r20, r21
    ADD r20, r8
    LDI r21, 32
    STORE r20, r21
    ADD r20, r8
    LDI r21, 48
    STORE r20, r21
    ADD r20, r8
    LDI r21, 58
    STORE r20, r21
    ADD r20, r8
    LDI r21, 0
    STORE r20, r21

    LDI r20, 0x2020
    LDI r21, 82
    STORE r20, r21
    ADD r20, r8
    LDI r21, 69
    STORE r20, r21
    ADD r20, r8
    LDI r21, 71
    STORE r20, r21
    ADD r20, r8
    LDI r21, 73
    STORE r20, r21
    ADD r20, r8
    LDI r21, 79
    STORE r20, r21
    ADD r20, r8
    LDI r21, 78
    STORE r20, r21
    ADD r20, r8
    LDI r21, 32
    STORE r20, r21
    ADD r20, r8
    LDI r21, 49
    STORE r20, r21
    ADD r20, r8
    LDI r21, 58
    STORE r20, r21
    ADD r20, r8
    LDI r21, 0
    STORE r20, r21

    LDI r8, 1
    LDI r2, 100
    LDI r9, 0

    ; --- Region 0: Simple loop ---
    LDI r6, 0
    LDI r13, 0
    PROFILE r6, r13

    LDI r12, 0
loop0:
    ADD r12, r8
    CMP r12, r2
    BLT r14, loop0

    LDI r13, 0
    PROFILE r6, r13

    ; --- Region 1: Nested loop ---
    LDI r13, 1
    PROFILE r6, r13

    LDI r12, 0
loop1y:
    LDI r1, 0
loop1x:
        ADD r1, r8
        CMP r1, r2
        BLT r14, loop1x
    ADD r12, r8
    CMP r12, r2
    BLT r14, loop1y

    LDI r13, 1
    PROFILE r6, r13

    ; --- Display results ---
    FILL r9

    ; "PROFILE DEMO" header
    LDI r5, 10
    LDI r10, 10
    LDI r15, 0x2000
    TEXT r5, r10, r15

    ; Read region 0
    LDI r6, 1
    LDI r13, 0
    PROFILE r6, r13
    MOV r25, r14
    LDI r5, 10
    LDI r10, 30
    LDI r15, 0x2010
    TEXT r5, r10, r15

    ; Read region 1
    LDI r6, 1
    LDI r13, 1
    PROFILE r6, r13
    MOV r26, r14
    LDI r5, 10
    LDI r10, 50
    LDI r15, 0x2020
    TEXT r5, r10, r15

    ; DUMP profile data
    LDI r6, 3
    LDI r13, 0x3000
    PROFILE r6, r13

    HALT
