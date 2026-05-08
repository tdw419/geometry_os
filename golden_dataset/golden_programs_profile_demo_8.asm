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
    ADD r20, r4
    LDI r21, 82
    STORE r20, r21
    ADD r20, r4
    LDI r21, 79
    STORE r20, r21
    ADD r20, r4
    LDI r21, 70
    STORE r20, r21
    ADD r20, r4
    LDI r21, 73
    STORE r20, r21
    ADD r20, r4
    LDI r21, 76
    STORE r20, r21
    ADD r20, r4
    LDI r21, 69
    STORE r20, r21
    ADD r20, r4
    LDI r21, 32
    STORE r20, r21
    ADD r20, r4
    LDI r21, 68
    STORE r20, r21
    ADD r20, r4
    LDI r21, 69
    STORE r20, r21
    ADD r20, r4
    LDI r21, 77
    STORE r20, r21
    ADD r20, r4
    LDI r21, 79
    STORE r20, r21
    ADD r20, r4
    LDI r21, 0
    STORE r20, r21

    LDI r20, 0x2010
    LDI r21, 82
    STORE r20, r21
    ADD r20, r4
    LDI r21, 69
    STORE r20, r21
    ADD r20, r4
    LDI r21, 71
    STORE r20, r21
    ADD r20, r4
    LDI r21, 73
    STORE r20, r21
    ADD r20, r4
    LDI r21, 79
    STORE r20, r21
    ADD r20, r4
    LDI r21, 78
    STORE r20, r21
    ADD r20, r4
    LDI r21, 32
    STORE r20, r21
    ADD r20, r4
    LDI r21, 48
    STORE r20, r21
    ADD r20, r4
    LDI r21, 58
    STORE r20, r21
    ADD r20, r4
    LDI r21, 0
    STORE r20, r21

    LDI r20, 0x2020
    LDI r21, 82
    STORE r20, r21
    ADD r20, r4
    LDI r21, 69
    STORE r20, r21
    ADD r20, r4
    LDI r21, 71
    STORE r20, r21
    ADD r20, r4
    LDI r21, 73
    STORE r20, r21
    ADD r20, r4
    LDI r21, 79
    STORE r20, r21
    ADD r20, r4
    LDI r21, 78
    STORE r20, r21
    ADD r20, r4
    LDI r21, 32
    STORE r20, r21
    ADD r20, r4
    LDI r21, 49
    STORE r20, r21
    ADD r20, r4
    LDI r21, 58
    STORE r20, r21
    ADD r20, r4
    LDI r21, 0
    STORE r20, r21

    LDI r4, 1
    LDI r0, 100
    LDI r10, 0

    ; --- Region 0: Simple loop ---
    LDI r14, 0
    LDI r6, 0
    PROFILE r14, r6

    LDI r7, 0
loop0:
    ADD r7, r4
    CMP r7, r0
    BLT r11, loop0

    LDI r6, 0
    PROFILE r14, r6

    ; --- Region 1: Nested loop ---
    LDI r6, 1
    PROFILE r14, r6

    LDI r7, 0
loop1y:
    LDI r9, 0
loop1x:
        ADD r9, r4
        CMP r9, r0
        BLT r11, loop1x
    ADD r7, r4
    CMP r7, r0
    BLT r11, loop1y

    LDI r6, 1
    PROFILE r14, r6

    ; --- Display results ---
    FILL r10

    ; "PROFILE DEMO" header
    LDI r5, 10
    LDI r1, 10
    LDI r15, 0x2000
    TEXT r5, r1, r15

    ; Read region 0
    LDI r14, 1
    LDI r6, 0
    PROFILE r14, r6
    MOV r25, r11
    LDI r5, 10
    LDI r1, 30
    LDI r15, 0x2010
    TEXT r5, r1, r15

    ; Read region 1
    LDI r14, 1
    LDI r6, 1
    PROFILE r14, r6
    MOV r26, r11
    LDI r5, 10
    LDI r1, 50
    LDI r15, 0x2020
    TEXT r5, r1, r15

    ; DUMP profile data
    LDI r14, 3
    LDI r6, 0x3000
    PROFILE r14, r6

    HALT
