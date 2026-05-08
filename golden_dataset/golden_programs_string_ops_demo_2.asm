; DESCRIPTION: This GeOS assembly code demonstrates the use of string operations `STRLEN`, `STRCMP`, and `STRCPY` by displaying results with colored indicator bars. It initializes several strings in RAM, performs the operations, and visually shows the outcomes through pixel-based graphics on a display.

; STRING_OPS_DEMO: Demonstrates STRLEN, STRCMP, STRCPY opcodes
;
; Visual demo showing three string operations with colored indicator bars:
;   Row 1: STRLEN  - "Geometry" with green bar (8 pixels = 8 chars)
;   Row 2: STRCMP  - equal strings show "MATCH" (green bar)
;   Row 3: STRCMP  - different strings show "DIFF" (red bar)
;   Row 4: STRCPY  - copies "Hello" and displays it (blue bar)
;
; Register convention:
;   r10  = CMP result (clobbered by CMP), opcode return value
;   r13  = constant 1 (increment)
;   r9  = loop counter
;   r11  = saved value (length or count)
;   r3 = x coordinate
;   r8 = y coordinate
;   r15 = string address
;   r1, r4, r14 = temps

; ── RAM Layout ─────────────────────────────────────────────
;   0x3000 = "Geometry" (9 words: 8 chars + null)
;   0x3010 = "Geometry" (identical copy for equal test)
;   0x3020 = "Hello"    (6 words: 5 chars + null)
;   0x3030 = copy destination (STRCPY target)
;   0x3040 = "MATCH"    (6 words: 5 chars + null)
;   0x3048 = "DIFF"     (5 words: 4 chars + null)
;   0x3070 = "String Ops" (11 words: 10 chars + null)

; ── Constants ──────────────────────────────────────────────
    LDI r13, 1           ; increment constant

; ── Build "Geometry" at 0x3000 ────────────────────────────
    LDI r9, 0x3000
    LDI r4, 71        ; G
    STORE r9, r4
    LDI r9, 0x3001
    LDI r4, 101       ; e
    STORE r9, r4
    LDI r9, 0x3002
    LDI r4, 111       ; o
    STORE r9, r4
    LDI r9, 0x3003
    LDI r4, 109       ; m
    STORE r9, r4
    LDI r9, 0x3004
    LDI r4, 101       ; e
    STORE r9, r4
    LDI r9, 0x3005
    LDI r4, 116       ; t
    STORE r9, r4
    LDI r9, 0x3006
    LDI r4, 114       ; r
    STORE r9, r4
    LDI r9, 0x3007
    LDI r4, 121       ; y
    STORE r9, r4
    LDI r9, 0x3008
    LDI r4, 0         ; null
    STORE r9, r4

; ── Build "Geometry" at 0x3010 (identical) ────────────────
    LDI r9, 0x3010
    LDI r4, 71
    STORE r9, r4
    LDI r9, 0x3011
    LDI r4, 101
    STORE r9, r4
    LDI r9, 0x3012
    LDI r4, 111
    STORE r9, r4
    LDI r9, 0x3013
    LDI r4, 109
    STORE r9, r4
    LDI r9, 0x3014
    LDI r4, 101
    STORE r9, r4
    LDI r9, 0x3015
    LDI r4, 116
    STORE r9, r4
    LDI r9, 0x3016
    LDI r4, 114
    STORE r9, r4
    LDI r9, 0x3017
    LDI r4, 121
    STORE r9, r4
    LDI r9, 0x3018
    LDI r4, 0
    STORE r9, r4

; ── Build "Hello" at 0x3020 ───────────────────────────────
    LDI r9, 0x3020
    LDI r4, 72        ; H
    STORE r9, r4
    LDI r9, 0x3021
    LDI r4, 101       ; e
    STORE r9, r4
    LDI r9, 0x3022
    LDI r4, 108       ; l
    STORE r9, r4
    LDI r9, 0x3023
    LDI r4, 108       ; l
    STORE r9, r4
    LDI r9, 0x3024
    LDI r4, 111       ; o
    STORE r9, r4
    LDI r9, 0x3025
    LDI r4, 0
    STORE r9, r4

; ── Build "MATCH" at 0x3040 ───────────────────────────────
    LDI r9, 0x3040
    LDI r4, 77        ; M
    STORE r9, r4
    LDI r9, 0x3041
    LDI r4, 65        ; A
    STORE r9, r4
    LDI r9, 0x3042
    LDI r4, 84        ; T
    STORE r9, r4
    LDI r9, 0x3043
    LDI r4, 67        ; C
    STORE r9, r4
    LDI r9, 0x3044
    LDI r4, 72        ; H
    STORE r9, r4
    LDI r9, 0x3045
    LDI r4, 0
    STORE r9, r4

; ── Build "DIFF" at 0x3048 ────────────────────────────────
    LDI r9, 0x3048
    LDI r4, 68        ; D
    STORE r9, r4
    LDI r9, 0x3049
    LDI r4, 73        ; I
    STORE r9, r4
    LDI r9, 0x304A
    LDI r4, 70        ; F
    STORE r9, r4
    LDI r9, 0x304B
    LDI r4, 70        ; F
    STORE r9, r4
    LDI r9, 0x304C
    LDI r4, 0
    STORE r9, r4

; ── Build "String Ops" at 0x3070 ──────────────────────────
    LDI r9, 0x3070
    LDI r4, 83        ; S
    STORE r9, r4
    LDI r9, 0x3071
    LDI r4, 116       ; t
    STORE r9, r4
    LDI r9, 0x3072
    LDI r4, 114       ; r
    STORE r9, r4
    LDI r9, 0x3073
    LDI r4, 105       ; i
    STORE r9, r4
    LDI r9, 0x3074
    LDI r4, 110       ; n
    STORE r9, r4
    LDI r9, 0x3075
    LDI r4, 103       ; g
    STORE r9, r4
    LDI r9, 0x3076
    LDI r4, 32        ; space
    STORE r9, r4
    LDI r9, 0x3077
    LDI r4, 79        ; O
    STORE r9, r4
    LDI r9, 0x3078
    LDI r4, 112       ; p
    STORE r9, r4
    LDI r9, 0x3079
    LDI r4, 115       ; s
    STORE r9, r4
    LDI r9, 0x307A
    LDI r4, 0
    STORE r9, r4

; ── Title bar (yellow, 100 pixels wide) ───────────────────
    LDI r4, 0xFFFF00
    LDI r8, 2
    LDI r3, 5
    LDI r14, 105

title_loop:
    PSET r3, r8, r4
    ADD r3, r13
    CMP r3, r14
    BLT r10, title_loop

; Display title "String Ops" at (10, 5)
    LDI r8, 5
    LDI r3, 10
    LDI r15, 0x3070
    TEXT r3, r8, r15

; ── Test 1: STRLEN ────────────────────────────────────────
; Display "Geometry" at (10, 25)
    LDI r8, 25
    LDI r3, 10
    LDI r15, 0x3000
    TEXT r3, r8, r15

; Get length of "Geometry" -> r10 = 8
    LDI r15, 0x3000
    STRLEN r15

; Save length to r11 (r10 will be clobbered by CMP in loop)
    MOV r11, r10

; Draw green bar: 8 pixels wide at y=38
    LDI r4, 0x00FF00
    LDI r8, 38
    LDI r3, 10
    LDI r9, 0

len_loop:
    CMP r9, r11
    BGE r10, len_done
    PSET r3, r8, r4
    ADD r3, r13
    ADD r9, r13
    JMP len_loop

len_done:

; ── Test 2: STRCMP (equal strings) ────────────────────────
; Compare "Geometry" at 0x3000 with copy at 0x3010
    LDI r15, 0x3000
    LDI r1, 0x3010
    STRCMP r15, r1    ; r10 = 0 (equal)

; Display both strings + "MATCH" at y=55
    LDI r8, 55
    LDI r3, 10
    LDI r15, 0x3000
    TEXT r3, r8, r15

    LDI r3, 85
    LDI r15, 0x3040    ; "MATCH"
    TEXT r3, r8, r15

; Green indicator bar at y=68
    PSETI 10, 68, 0x00FF00
    PSETI 11, 68, 0x00FF00
    PSETI 12, 68, 0x00FF00
    PSETI 13, 68, 0x00FF00
    PSETI 14, 68, 0x00FF00

; ── Test 3: STRCMP (different strings) ────────────────────
; Compare "Geometry" (0x3000) with "Hello" (0x3020)
    LDI r15, 0x3000
    LDI r1, 0x3020
    STRCMP r15, r1    ; r10 = 1 (G > H, so s1 > s2)

; Display both strings + "DIFF" at y=85
    LDI r8, 85
    LDI r3, 10
    LDI r15, 0x3000
    TEXT r3, r8, r15

    LDI r3, 85
    LDI r15, 0x3048    ; "DIFF"
    TEXT r3, r8, r15

; Red indicator bar at y=98
    PSETI 10, 98, 0xFF0000
    PSETI 11, 98, 0xFF0000
    PSETI 12, 98, 0xFF0000
    PSETI 13, 98, 0xFF0000
    PSETI 14, 98, 0xFF0000

; ── Test 4: STRCPY ────────────────────────────────────────
; Copy "Hello" from 0x3020 to 0x3030
    LDI r15, 0x3020    ; source
    LDI r1, 0x3030    ; destination
    STRCPY r15, r1    ; r10 = 6 (bytes copied incl null)

; Save count to r11
    MOV r11, r10

; Display copied string at (10, 115)
    LDI r8, 115
    LDI r3, 10
    LDI r15, 0x3030
    TEXT r3, r8, r15

; Blue bar: 5 pixels (chars) at y=128
    LDI r4, 0x0000FF
    LDI r8, 128
    LDI r3, 10
    LDI r9, 0

copy_loop:
    CMP r9, r11         ; compare counter with total bytes copied
    BGE r10, copy_done
    PSET r3, r8, r4
    ADD r3, r13
    ADD r9, r13
    JMP copy_loop

copy_done:

; ── Separator lines ───────────────────────────────────────
    LDI r4, 0x444444  ; dark gray separators
    LDI r14, 100       ; separator width

sep1:
    LDI r8, 50
    LDI r3, 5
sep1_loop:
    PSET r3, r8, r4
    ADD r3, r13
    CMP r3, r14
    BLT r10, sep1_loop

sep2:
    LDI r8, 80
    LDI r3, 5
sep2_loop:
    PSET r3, r8, r4
    ADD r3, r13
    CMP r3, r14
    BLT r10, sep2_loop

sep3:
    LDI r8, 110
    LDI r3, 5
sep3_loop:
    PSET r3, r8, r4
    ADD r3, r13
    CMP r3, r14
    BLT r10, sep3_loop

    HALT
