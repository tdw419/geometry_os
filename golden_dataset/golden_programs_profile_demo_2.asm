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
    ADD r20, r3
    LDI r21, 82
    STORE r20, r21
    ADD r20, r3
    LDI r21, 79
    STORE r20, r21
    ADD r20, r3
    LDI r21, 70
    STORE r20, r21
    ADD r20, r3
    LDI r21, 73
    STORE r20, r21
    ADD r20, r3
    LDI r21, 76
    STORE r20, r21
    ADD r20, r3
    LDI r21, 69
    STORE r20, r21
    ADD r20, r3
    LDI r21, 32
    STORE r20, r21
    ADD r20, r3
    LDI r21, 68
    STORE r20, r21
    ADD r20, r3
    LDI r21, 69
    STORE r20, r21
    ADD r20, r3
    LDI r21, 77
    STORE r20, r21
    ADD r20, r3
    LDI r21, 79
    STORE r20, r21
    ADD r20, r3
    LDI r21, 0
    STORE r20, r21

    LDI r20, 0x2010
    LDI r21, 82
    STORE r20, r21
    ADD r20, r3
    LDI r21, 69
    STORE r20, r21
    ADD r20, r3
    LDI r21, 71
    STORE r20, r21
    ADD r20, r3
    LDI r21, 73
    STORE r20, r21
    ADD r20, r3
    LDI r21, 79
    STORE r20, r21
    ADD r20, r3
    LDI r21, 78
    STORE r20, r21
    ADD r20, r3
    LDI r21, 32
    STORE r20, r21
    ADD r20, r3
    LDI r21, 48
    STORE r20, r21
    ADD r20, r3
    LDI r21, 58
    STORE r20, r21
    ADD r20, r3
    LDI r21, 0
    STORE r20, r21

    LDI r20, 0x2020
    LDI r21, 82
    STORE r20, r21
    ADD r20, r3
    LDI r21, 69
    STORE r20, r21
    ADD r20, r3
    LDI r21, 71
    STORE r20, r21
    ADD r20, r3
    LDI r21, 73
    STORE r20, r21
    ADD r20, r3
    LDI r21, 79
    STORE r20, r21
    ADD r20, r3
    LDI r21, 78
    STORE r20, r21
    ADD r20, r3
    LDI r21, 32
    STORE r20, r21
    ADD r20, r3
    LDI r21, 49
    STORE r20, r21
    ADD r20, r3
    LDI r21, 58
    STORE r20, r21
    ADD r20, r3
    LDI r21, 0
    STORE r20, r21

    LDI r3, 1
    LDI r1, 100
    LDI r14, 0

    ; --- Region 0: Simple loop ---
    LDI r11, 0
    LDI r15, 0
    PROFILE r11, r15

    LDI r7, 0
loop0:
    ADD r7, r3
    CMP r7, r1
    BLT r10, loop0

    LDI r15, 0
    PROFILE r11, r15

    ; --- Region 1: Nested loop ---
    LDI r15, 1
    PROFILE r11, r15

    LDI r7, 0
loop1y:
    LDI r5, 0
loop1x:
        ADD r5, r3
        CMP r5, r1
        BLT r10, loop1x
    ADD r7, r3
    CMP r7, r1
    BLT r10, loop1y

    LDI r15, 1
    PROFILE r11, r15

    ; --- Display results ---
    FILL r14

    ; "PROFILE DEMO" header
    LDI r8, 10
    LDI r12, 10
    LDI r9, 0x2000
    TEXT r8, r12, r9

    ; Read region 0
    LDI r11, 1
    LDI r15, 0
    PROFILE r11, r15
    MOV r25, r10
    LDI r8, 10
    LDI r12, 30
    LDI r9, 0x2010
    TEXT r8, r12, r9

    ; Read region 1
    LDI r11, 1
    LDI r15, 1
    PROFILE r11, r15
    MOV r26, r10
    LDI r8, 10
    LDI r12, 50
    LDI r9, 0x2020
    TEXT r8, r12, r9

    ; DUMP profile data
    LDI r11, 3
    LDI r15, 0x3000
    PROFILE r11, r15

    HALT
