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
    ADD r20, r6
    LDI r21, 82
    STORE r20, r21
    ADD r20, r6
    LDI r21, 79
    STORE r20, r21
    ADD r20, r6
    LDI r21, 70
    STORE r20, r21
    ADD r20, r6
    LDI r21, 73
    STORE r20, r21
    ADD r20, r6
    LDI r21, 76
    STORE r20, r21
    ADD r20, r6
    LDI r21, 69
    STORE r20, r21
    ADD r20, r6
    LDI r21, 32
    STORE r20, r21
    ADD r20, r6
    LDI r21, 68
    STORE r20, r21
    ADD r20, r6
    LDI r21, 69
    STORE r20, r21
    ADD r20, r6
    LDI r21, 77
    STORE r20, r21
    ADD r20, r6
    LDI r21, 79
    STORE r20, r21
    ADD r20, r6
    LDI r21, 0
    STORE r20, r21

    LDI r20, 0x2010
    LDI r21, 82
    STORE r20, r21
    ADD r20, r6
    LDI r21, 69
    STORE r20, r21
    ADD r20, r6
    LDI r21, 71
    STORE r20, r21
    ADD r20, r6
    LDI r21, 73
    STORE r20, r21
    ADD r20, r6
    LDI r21, 79
    STORE r20, r21
    ADD r20, r6
    LDI r21, 78
    STORE r20, r21
    ADD r20, r6
    LDI r21, 32
    STORE r20, r21
    ADD r20, r6
    LDI r21, 48
    STORE r20, r21
    ADD r20, r6
    LDI r21, 58
    STORE r20, r21
    ADD r20, r6
    LDI r21, 0
    STORE r20, r21

    LDI r20, 0x2020
    LDI r21, 82
    STORE r20, r21
    ADD r20, r6
    LDI r21, 69
    STORE r20, r21
    ADD r20, r6
    LDI r21, 71
    STORE r20, r21
    ADD r20, r6
    LDI r21, 73
    STORE r20, r21
    ADD r20, r6
    LDI r21, 79
    STORE r20, r21
    ADD r20, r6
    LDI r21, 78
    STORE r20, r21
    ADD r20, r6
    LDI r21, 32
    STORE r20, r21
    ADD r20, r6
    LDI r21, 49
    STORE r20, r21
    ADD r20, r6
    LDI r21, 58
    STORE r20, r21
    ADD r20, r6
    LDI r21, 0
    STORE r20, r21

    LDI r6, 1
    LDI r2, 100
    LDI r8, 0

    ; --- Region 0: Simple loop ---
    LDI r1, 0
    LDI r9, 0
    PROFILE r1, r9

    LDI r0, 0
loop0:
    ADD r0, r6
    CMP r0, r2
    BLT r12, loop0

    LDI r9, 0
    PROFILE r1, r9

    ; --- Region 1: Nested loop ---
    LDI r9, 1
    PROFILE r1, r9

    LDI r0, 0
loop1y:
    LDI r14, 0
loop1x:
        ADD r14, r6
        CMP r14, r2
        BLT r12, loop1x
    ADD r0, r6
    CMP r0, r2
    BLT r12, loop1y

    LDI r9, 1
    PROFILE r1, r9

    ; --- Display results ---
    FILL r8

    ; "PROFILE DEMO" header
    LDI r11, 10
    LDI r3, 10
    LDI r13, 0x2000
    TEXT r11, r3, r13

    ; Read region 0
    LDI r1, 1
    LDI r9, 0
    PROFILE r1, r9
    MOV r25, r12
    LDI r11, 10
    LDI r3, 30
    LDI r13, 0x2010
    TEXT r11, r3, r13

    ; Read region 1
    LDI r1, 1
    LDI r9, 1
    PROFILE r1, r9
    MOV r26, r12
    LDI r11, 10
    LDI r3, 50
    LDI r13, 0x2020
    TEXT r11, r3, r13

    ; DUMP profile data
    LDI r1, 3
    LDI r9, 0x3000
    PROFILE r1, r9

    HALT
