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
    ADD r20, r5
    LDI r21, 82
    STORE r20, r21
    ADD r20, r5
    LDI r21, 79
    STORE r20, r21
    ADD r20, r5
    LDI r21, 70
    STORE r20, r21
    ADD r20, r5
    LDI r21, 73
    STORE r20, r21
    ADD r20, r5
    LDI r21, 76
    STORE r20, r21
    ADD r20, r5
    LDI r21, 69
    STORE r20, r21
    ADD r20, r5
    LDI r21, 32
    STORE r20, r21
    ADD r20, r5
    LDI r21, 68
    STORE r20, r21
    ADD r20, r5
    LDI r21, 69
    STORE r20, r21
    ADD r20, r5
    LDI r21, 77
    STORE r20, r21
    ADD r20, r5
    LDI r21, 79
    STORE r20, r21
    ADD r20, r5
    LDI r21, 0
    STORE r20, r21

    LDI r20, 0x2010
    LDI r21, 82
    STORE r20, r21
    ADD r20, r5
    LDI r21, 69
    STORE r20, r21
    ADD r20, r5
    LDI r21, 71
    STORE r20, r21
    ADD r20, r5
    LDI r21, 73
    STORE r20, r21
    ADD r20, r5
    LDI r21, 79
    STORE r20, r21
    ADD r20, r5
    LDI r21, 78
    STORE r20, r21
    ADD r20, r5
    LDI r21, 32
    STORE r20, r21
    ADD r20, r5
    LDI r21, 48
    STORE r20, r21
    ADD r20, r5
    LDI r21, 58
    STORE r20, r21
    ADD r20, r5
    LDI r21, 0
    STORE r20, r21

    LDI r20, 0x2020
    LDI r21, 82
    STORE r20, r21
    ADD r20, r5
    LDI r21, 69
    STORE r20, r21
    ADD r20, r5
    LDI r21, 71
    STORE r20, r21
    ADD r20, r5
    LDI r21, 73
    STORE r20, r21
    ADD r20, r5
    LDI r21, 79
    STORE r20, r21
    ADD r20, r5
    LDI r21, 78
    STORE r20, r21
    ADD r20, r5
    LDI r21, 32
    STORE r20, r21
    ADD r20, r5
    LDI r21, 49
    STORE r20, r21
    ADD r20, r5
    LDI r21, 58
    STORE r20, r21
    ADD r20, r5
    LDI r21, 0
    STORE r20, r21

    LDI r5, 1
    LDI r6, 100
    LDI r15, 0

    ; --- Region 0: Simple loop ---
    LDI r10, 0
    LDI r8, 0
    PROFILE r10, r8

    LDI r0, 0
loop0:
    ADD r0, r5
    CMP r0, r6
    BLT r1, loop0

    LDI r8, 0
    PROFILE r10, r8

    ; --- Region 1: Nested loop ---
    LDI r8, 1
    PROFILE r10, r8

    LDI r0, 0
loop1y:
    LDI r3, 0
loop1x:
        ADD r3, r5
        CMP r3, r6
        BLT r1, loop1x
    ADD r0, r5
    CMP r0, r6
    BLT r1, loop1y

    LDI r8, 1
    PROFILE r10, r8

    ; --- Display results ---
    FILL r15

    ; "PROFILE DEMO" header
    LDI r7, 10
    LDI r9, 10
    LDI r13, 0x2000
    TEXT r7, r9, r13

    ; Read region 0
    LDI r10, 1
    LDI r8, 0
    PROFILE r10, r8
    MOV r25, r1
    LDI r7, 10
    LDI r9, 30
    LDI r13, 0x2010
    TEXT r7, r9, r13

    ; Read region 1
    LDI r10, 1
    LDI r8, 1
    PROFILE r10, r8
    MOV r26, r1
    LDI r7, 10
    LDI r9, 50
    LDI r13, 0x2020
    TEXT r7, r9, r13

    ; DUMP profile data
    LDI r10, 3
    LDI r8, 0x3000
    PROFILE r10, r8

    HALT
