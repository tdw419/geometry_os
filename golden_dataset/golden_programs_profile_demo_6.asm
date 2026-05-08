; DESCRIPTION: Render a colored line at the screen.

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
    ADD r20, r2
    LDI r21, 82
    STORE r20, r21
    ADD r20, r2
    LDI r21, 79
    STORE r20, r21
    ADD r20, r2
    LDI r21, 70
    STORE r20, r21
    ADD r20, r2
    LDI r21, 73
    STORE r20, r21
    ADD r20, r2
    LDI r21, 76
    STORE r20, r21
    ADD r20, r2
    LDI r21, 69
    STORE r20, r21
    ADD r20, r2
    LDI r21, 32
    STORE r20, r21
    ADD r20, r2
    LDI r21, 68
    STORE r20, r21
    ADD r20, r2
    LDI r21, 69
    STORE r20, r21
    ADD r20, r2
    LDI r21, 77
    STORE r20, r21
    ADD r20, r2
    LDI r21, 79
    STORE r20, r21
    ADD r20, r2
    LDI r21, 0
    STORE r20, r21

    LDI r20, 0x2010
    LDI r21, 82
    STORE r20, r21
    ADD r20, r2
    LDI r21, 69
    STORE r20, r21
    ADD r20, r2
    LDI r21, 71
    STORE r20, r21
    ADD r20, r2
    LDI r21, 73
    STORE r20, r21
    ADD r20, r2
    LDI r21, 79
    STORE r20, r21
    ADD r20, r2
    LDI r21, 78
    STORE r20, r21
    ADD r20, r2
    LDI r21, 32
    STORE r20, r21
    ADD r20, r2
    LDI r21, 48
    STORE r20, r21
    ADD r20, r2
    LDI r21, 58
    STORE r20, r21
    ADD r20, r2
    LDI r21, 0
    STORE r20, r21

    LDI r20, 0x2020
    LDI r21, 82
    STORE r20, r21
    ADD r20, r2
    LDI r21, 69
    STORE r20, r21
    ADD r20, r2
    LDI r21, 71
    STORE r20, r21
    ADD r20, r2
    LDI r21, 73
    STORE r20, r21
    ADD r20, r2
    LDI r21, 79
    STORE r20, r21
    ADD r20, r2
    LDI r21, 78
    STORE r20, r21
    ADD r20, r2
    LDI r21, 32
    STORE r20, r21
    ADD r20, r2
    LDI r21, 49
    STORE r20, r21
    ADD r20, r2
    LDI r21, 58
    STORE r20, r21
    ADD r20, r2
    LDI r21, 0
    STORE r20, r21

    LDI r2, 1
    LDI r5, 100
    LDI r7, 0

    ; --- Region 0: Simple loop ---
    LDI r10, 0
    LDI r3, 0
    PROFILE r10, r3

    LDI r1, 0
loop0:
    ADD r1, r2
    CMP r1, r5
    BLT r6, loop0

    LDI r3, 0
    PROFILE r10, r3

    ; --- Region 1: Nested loop ---
    LDI r3, 1
    PROFILE r10, r3

    LDI r1, 0
loop1y:
    LDI r4, 0
loop1x:
        ADD r4, r2
        CMP r4, r5
        BLT r6, loop1x
    ADD r1, r2
    CMP r1, r5
    BLT r6, loop1y

    LDI r3, 1
    PROFILE r10, r3

    ; --- Display results ---
    FILL r7

    ; "PROFILE DEMO" header
    LDI r11, 10
    LDI r14, 10
    LDI r0, 0x2000
    TEXT r11, r14, r0

    ; Read region 0
    LDI r10, 1
    LDI r3, 0
    PROFILE r10, r3
    MOV r25, r6
    LDI r11, 10
    LDI r14, 30
    LDI r0, 0x2010
    TEXT r11, r14, r0

    ; Read region 1
    LDI r10, 1
    LDI r3, 1
    PROFILE r10, r3
    MOV r26, r6
    LDI r11, 10
    LDI r14, 50
    LDI r0, 0x2020
    TEXT r11, r14, r0

    ; DUMP profile data
    LDI r10, 3
    LDI r3, 0x3000
    PROFILE r10, r3

    HALT
