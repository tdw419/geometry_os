; DESCRIPTION: Display a line using color colored at the screen.

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
    ADD r20, r14
    LDI r21, 82
    STORE r20, r21
    ADD r20, r14
    LDI r21, 79
    STORE r20, r21
    ADD r20, r14
    LDI r21, 70
    STORE r20, r21
    ADD r20, r14
    LDI r21, 73
    STORE r20, r21
    ADD r20, r14
    LDI r21, 76
    STORE r20, r21
    ADD r20, r14
    LDI r21, 69
    STORE r20, r21
    ADD r20, r14
    LDI r21, 32
    STORE r20, r21
    ADD r20, r14
    LDI r21, 68
    STORE r20, r21
    ADD r20, r14
    LDI r21, 69
    STORE r20, r21
    ADD r20, r14
    LDI r21, 77
    STORE r20, r21
    ADD r20, r14
    LDI r21, 79
    STORE r20, r21
    ADD r20, r14
    LDI r21, 0
    STORE r20, r21

    LDI r20, 0x2010
    LDI r21, 82
    STORE r20, r21
    ADD r20, r14
    LDI r21, 69
    STORE r20, r21
    ADD r20, r14
    LDI r21, 71
    STORE r20, r21
    ADD r20, r14
    LDI r21, 73
    STORE r20, r21
    ADD r20, r14
    LDI r21, 79
    STORE r20, r21
    ADD r20, r14
    LDI r21, 78
    STORE r20, r21
    ADD r20, r14
    LDI r21, 32
    STORE r20, r21
    ADD r20, r14
    LDI r21, 48
    STORE r20, r21
    ADD r20, r14
    LDI r21, 58
    STORE r20, r21
    ADD r20, r14
    LDI r21, 0
    STORE r20, r21

    LDI r20, 0x2020
    LDI r21, 82
    STORE r20, r21
    ADD r20, r14
    LDI r21, 69
    STORE r20, r21
    ADD r20, r14
    LDI r21, 71
    STORE r20, r21
    ADD r20, r14
    LDI r21, 73
    STORE r20, r21
    ADD r20, r14
    LDI r21, 79
    STORE r20, r21
    ADD r20, r14
    LDI r21, 78
    STORE r20, r21
    ADD r20, r14
    LDI r21, 32
    STORE r20, r21
    ADD r20, r14
    LDI r21, 49
    STORE r20, r21
    ADD r20, r14
    LDI r21, 58
    STORE r20, r21
    ADD r20, r14
    LDI r21, 0
    STORE r20, r21

    LDI r14, 1
    LDI r4, 100
    LDI r2, 0

    ; --- Region 0: Simple loop ---
    LDI r12, 0
    LDI r13, 0
    PROFILE r12, r13

    LDI r10, 0
loop0:
    ADD r10, r14
    CMP r10, r4
    BLT r8, loop0

    LDI r13, 0
    PROFILE r12, r13

    ; --- Region 1: Nested loop ---
    LDI r13, 1
    PROFILE r12, r13

    LDI r10, 0
loop1y:
    LDI r7, 0
loop1x:
        ADD r7, r14
        CMP r7, r4
        BLT r8, loop1x
    ADD r10, r14
    CMP r10, r4
    BLT r8, loop1y

    LDI r13, 1
    PROFILE r12, r13

    ; --- Display results ---
    FILL r2

    ; "PROFILE DEMO" header
    LDI r6, 10
    LDI r15, 10
    LDI r5, 0x2000
    TEXT r6, r15, r5

    ; Read region 0
    LDI r12, 1
    LDI r13, 0
    PROFILE r12, r13
    MOV r25, r8
    LDI r6, 10
    LDI r15, 30
    LDI r5, 0x2010
    TEXT r6, r15, r5

    ; Read region 1
    LDI r12, 1
    LDI r13, 1
    PROFILE r12, r13
    MOV r26, r8
    LDI r6, 10
    LDI r15, 50
    LDI r5, 0x2020
    TEXT r6, r15, r5

    ; DUMP profile data
    LDI r12, 3
    LDI r13, 0x3000
    PROFILE r12, r13

    HALT
