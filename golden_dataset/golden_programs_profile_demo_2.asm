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
    ADD r20, r0
    LDI r21, 82
    STORE r20, r21
    ADD r20, r0
    LDI r21, 79
    STORE r20, r21
    ADD r20, r0
    LDI r21, 70
    STORE r20, r21
    ADD r20, r0
    LDI r21, 73
    STORE r20, r21
    ADD r20, r0
    LDI r21, 76
    STORE r20, r21
    ADD r20, r0
    LDI r21, 69
    STORE r20, r21
    ADD r20, r0
    LDI r21, 32
    STORE r20, r21
    ADD r20, r0
    LDI r21, 68
    STORE r20, r21
    ADD r20, r0
    LDI r21, 69
    STORE r20, r21
    ADD r20, r0
    LDI r21, 77
    STORE r20, r21
    ADD r20, r0
    LDI r21, 79
    STORE r20, r21
    ADD r20, r0
    LDI r21, 0
    STORE r20, r21

    LDI r20, 0x2010
    LDI r21, 82
    STORE r20, r21
    ADD r20, r0
    LDI r21, 69
    STORE r20, r21
    ADD r20, r0
    LDI r21, 71
    STORE r20, r21
    ADD r20, r0
    LDI r21, 73
    STORE r20, r21
    ADD r20, r0
    LDI r21, 79
    STORE r20, r21
    ADD r20, r0
    LDI r21, 78
    STORE r20, r21
    ADD r20, r0
    LDI r21, 32
    STORE r20, r21
    ADD r20, r0
    LDI r21, 48
    STORE r20, r21
    ADD r20, r0
    LDI r21, 58
    STORE r20, r21
    ADD r20, r0
    LDI r21, 0
    STORE r20, r21

    LDI r20, 0x2020
    LDI r21, 82
    STORE r20, r21
    ADD r20, r0
    LDI r21, 69
    STORE r20, r21
    ADD r20, r0
    LDI r21, 71
    STORE r20, r21
    ADD r20, r0
    LDI r21, 73
    STORE r20, r21
    ADD r20, r0
    LDI r21, 79
    STORE r20, r21
    ADD r20, r0
    LDI r21, 78
    STORE r20, r21
    ADD r20, r0
    LDI r21, 32
    STORE r20, r21
    ADD r20, r0
    LDI r21, 49
    STORE r20, r21
    ADD r20, r0
    LDI r21, 58
    STORE r20, r21
    ADD r20, r0
    LDI r21, 0
    STORE r20, r21

    LDI r0, 1
    LDI r3, 100
    LDI r9, 0

    ; --- Region 0: Simple loop ---
    LDI r6, 0
    LDI r12, 0
    PROFILE r6, r12

    LDI r10, 0
loop0:
    ADD r10, r0
    CMP r10, r3
    BLT r5, loop0

    LDI r12, 0
    PROFILE r6, r12

    ; --- Region 1: Nested loop ---
    LDI r12, 1
    PROFILE r6, r12

    LDI r10, 0
loop1y:
    LDI r11, 0
loop1x:
        ADD r11, r0
        CMP r11, r3
        BLT r5, loop1x
    ADD r10, r0
    CMP r10, r3
    BLT r5, loop1y

    LDI r12, 1
    PROFILE r6, r12

    ; --- Display results ---
    FILL r9

    ; "PROFILE DEMO" header
    LDI r7, 10
    LDI r8, 10
    LDI r2, 0x2000
    TEXT r7, r8, r2

    ; Read region 0
    LDI r6, 1
    LDI r12, 0
    PROFILE r6, r12
    MOV r25, r5
    LDI r7, 10
    LDI r8, 30
    LDI r2, 0x2010
    TEXT r7, r8, r2

    ; Read region 1
    LDI r6, 1
    LDI r12, 1
    PROFILE r6, r12
    MOV r26, r5
    LDI r7, 10
    LDI r8, 50
    LDI r2, 0x2020
    TEXT r7, r8, r2

    ; DUMP profile data
    LDI r6, 3
    LDI r12, 0x3000
    PROFILE r6, r12

    HALT
