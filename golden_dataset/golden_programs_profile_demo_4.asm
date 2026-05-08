; DESCRIPTION: Geometry OS program to draw a colored line.

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
    ADD r20, r10
    LDI r21, 82
    STORE r20, r21
    ADD r20, r10
    LDI r21, 79
    STORE r20, r21
    ADD r20, r10
    LDI r21, 70
    STORE r20, r21
    ADD r20, r10
    LDI r21, 73
    STORE r20, r21
    ADD r20, r10
    LDI r21, 76
    STORE r20, r21
    ADD r20, r10
    LDI r21, 69
    STORE r20, r21
    ADD r20, r10
    LDI r21, 32
    STORE r20, r21
    ADD r20, r10
    LDI r21, 68
    STORE r20, r21
    ADD r20, r10
    LDI r21, 69
    STORE r20, r21
    ADD r20, r10
    LDI r21, 77
    STORE r20, r21
    ADD r20, r10
    LDI r21, 79
    STORE r20, r21
    ADD r20, r10
    LDI r21, 0
    STORE r20, r21

    LDI r20, 0x2010
    LDI r21, 82
    STORE r20, r21
    ADD r20, r10
    LDI r21, 69
    STORE r20, r21
    ADD r20, r10
    LDI r21, 71
    STORE r20, r21
    ADD r20, r10
    LDI r21, 73
    STORE r20, r21
    ADD r20, r10
    LDI r21, 79
    STORE r20, r21
    ADD r20, r10
    LDI r21, 78
    STORE r20, r21
    ADD r20, r10
    LDI r21, 32
    STORE r20, r21
    ADD r20, r10
    LDI r21, 48
    STORE r20, r21
    ADD r20, r10
    LDI r21, 58
    STORE r20, r21
    ADD r20, r10
    LDI r21, 0
    STORE r20, r21

    LDI r20, 0x2020
    LDI r21, 82
    STORE r20, r21
    ADD r20, r10
    LDI r21, 69
    STORE r20, r21
    ADD r20, r10
    LDI r21, 71
    STORE r20, r21
    ADD r20, r10
    LDI r21, 73
    STORE r20, r21
    ADD r20, r10
    LDI r21, 79
    STORE r20, r21
    ADD r20, r10
    LDI r21, 78
    STORE r20, r21
    ADD r20, r10
    LDI r21, 32
    STORE r20, r21
    ADD r20, r10
    LDI r21, 49
    STORE r20, r21
    ADD r20, r10
    LDI r21, 58
    STORE r20, r21
    ADD r20, r10
    LDI r21, 0
    STORE r20, r21

    LDI r10, 1
    LDI r14, 100
    LDI r0, 0

    ; --- Region 0: Simple loop ---
    LDI r11, 0
    LDI r4, 0
    PROFILE r11, r4

    LDI r9, 0
loop0:
    ADD r9, r10
    CMP r9, r14
    BLT r6, loop0

    LDI r4, 0
    PROFILE r11, r4

    ; --- Region 1: Nested loop ---
    LDI r4, 1
    PROFILE r11, r4

    LDI r9, 0
loop1y:
    LDI r7, 0
loop1x:
        ADD r7, r10
        CMP r7, r14
        BLT r6, loop1x
    ADD r9, r10
    CMP r9, r14
    BLT r6, loop1y

    LDI r4, 1
    PROFILE r11, r4

    ; --- Display results ---
    FILL r0

    ; "PROFILE DEMO" header
    LDI r2, 10
    LDI r13, 10
    LDI r1, 0x2000
    TEXT r2, r13, r1

    ; Read region 0
    LDI r11, 1
    LDI r4, 0
    PROFILE r11, r4
    MOV r25, r6
    LDI r2, 10
    LDI r13, 30
    LDI r1, 0x2010
    TEXT r2, r13, r1

    ; Read region 1
    LDI r11, 1
    LDI r4, 1
    PROFILE r11, r4
    MOV r26, r6
    LDI r2, 10
    LDI r13, 50
    LDI r1, 0x2020
    TEXT r2, r13, r1

    ; DUMP profile data
    LDI r11, 3
    LDI r4, 0x3000
    PROFILE r11, r4

    HALT
