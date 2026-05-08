; DESCRIPTION: Draws a colored line at the screen with fixed size.

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
    LDI r4, 100
    LDI r8, 0

    ; --- Region 0: Simple loop ---
    LDI r7, 0
    LDI r11, 0
    PROFILE r7, r11

    LDI r15, 0
loop0:
    ADD r15, r5
    CMP r15, r4
    BLT r1, loop0

    LDI r11, 0
    PROFILE r7, r11

    ; --- Region 1: Nested loop ---
    LDI r11, 1
    PROFILE r7, r11

    LDI r15, 0
loop1y:
    LDI r14, 0
loop1x:
        ADD r14, r5
        CMP r14, r4
        BLT r1, loop1x
    ADD r15, r5
    CMP r15, r4
    BLT r1, loop1y

    LDI r11, 1
    PROFILE r7, r11

    ; --- Display results ---
    FILL r8

    ; "PROFILE DEMO" header
    LDI r0, 10
    LDI r10, 10
    LDI r3, 0x2000
    TEXT r0, r10, r3

    ; Read region 0
    LDI r7, 1
    LDI r11, 0
    PROFILE r7, r11
    MOV r25, r1
    LDI r0, 10
    LDI r10, 30
    LDI r3, 0x2010
    TEXT r0, r10, r3

    ; Read region 1
    LDI r7, 1
    LDI r11, 1
    PROFILE r7, r11
    MOV r26, r1
    LDI r0, 10
    LDI r10, 50
    LDI r3, 0x2020
    TEXT r0, r10, r3

    ; DUMP profile data
    LDI r7, 3
    LDI r11, 0x3000
    PROFILE r7, r11

    HALT
