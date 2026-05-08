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
;   r13  = CMP result (clobbered by CMP), opcode return value
;   r15  = constant 1 (increment)
;   r6  = loop counter
;   r8  = saved value (length or count)
;   r5 = x coordinate
;   r1 = y coordinate
;   r11 = string address
;   r2, r9, r0 = temps

; ── RAM Layout ─────────────────────────────────────────────
;   0x3000 = "Geometry" (9 words: 8 chars + null)
;   0x3010 = "Geometry" (identical copy for equal test)
;   0x3020 = "Hello"    (6 words: 5 chars + null)
;   0x3030 = copy destination (STRCPY target)
;   0x3040 = "MATCH"    (6 words: 5 chars + null)
;   0x3048 = "DIFF"     (5 words: 4 chars + null)
;   0x3070 = "String Ops" (11 words: 10 chars + null)

; ── Constants ──────────────────────────────────────────────
    LDI r15, 1           ; increment constant

; ── Build "Geometry" at 0x3000 ────────────────────────────
    LDI r6, 0x3000
    LDI r9, 71        ; G
    STORE r6, r9
    LDI r6, 0x3001
    LDI r9, 101       ; e
    STORE r6, r9
    LDI r6, 0x3002
    LDI r9, 111       ; o
    STORE r6, r9
    LDI r6, 0x3003
    LDI r9, 109       ; m
    STORE r6, r9
    LDI r6, 0x3004
    LDI r9, 101       ; e
    STORE r6, r9
    LDI r6, 0x3005
    LDI r9, 116       ; t
    STORE r6, r9
    LDI r6, 0x3006
    LDI r9, 114       ; r
    STORE r6, r9
    LDI r6, 0x3007
    LDI r9, 121       ; y
    STORE r6, r9
    LDI r6, 0x3008
    LDI r9, 0         ; null
    STORE r6, r9

; ── Build "Geometry" at 0x3010 (identical) ────────────────
    LDI r6, 0x3010
    LDI r9, 71
    STORE r6, r9
    LDI r6, 0x3011
    LDI r9, 101
    STORE r6, r9
    LDI r6, 0x3012
    LDI r9, 111
    STORE r6, r9
    LDI r6, 0x3013
    LDI r9, 109
    STORE r6, r9
    LDI r6, 0x3014
    LDI r9, 101
    STORE r6, r9
    LDI r6, 0x3015
    LDI r9, 116
    STORE r6, r9
    LDI r6, 0x3016
    LDI r9, 114
    STORE r6, r9
    LDI r6, 0x3017
    LDI r9, 121
    STORE r6, r9
    LDI r6, 0x3018
    LDI r9, 0
    STORE r6, r9

; ── Build "Hello" at 0x3020 ───────────────────────────────
    LDI r6, 0x3020
    LDI r9, 72        ; H
    STORE r6, r9
    LDI r6, 0x3021
    LDI r9, 101       ; e
    STORE r6, r9
    LDI r6, 0x3022
    LDI r9, 108       ; l
    STORE r6, r9
    LDI r6, 0x3023
    LDI r9, 108       ; l
    STORE r6, r9
    LDI r6, 0x3024
    LDI r9, 111       ; o
    STORE r6, r9
    LDI r6, 0x3025
    LDI r9, 0
    STORE r6, r9

; ── Build "MATCH" at 0x3040 ───────────────────────────────
    LDI r6, 0x3040
    LDI r9, 77        ; M
    STORE r6, r9
    LDI r6, 0x3041
    LDI r9, 65        ; A
    STORE r6, r9
    LDI r6, 0x3042
    LDI r9, 84        ; T
    STORE r6, r9
    LDI r6, 0x3043
    LDI r9, 67        ; C
    STORE r6, r9
    LDI r6, 0x3044
    LDI r9, 72        ; H
    STORE r6, r9
    LDI r6, 0x3045
    LDI r9, 0
    STORE r6, r9

; ── Build "DIFF" at 0x3048 ────────────────────────────────
    LDI r6, 0x3048
    LDI r9, 68        ; D
    STORE r6, r9
    LDI r6, 0x3049
    LDI r9, 73        ; I
    STORE r6, r9
    LDI r6, 0x304A
    LDI r9, 70        ; F
    STORE r6, r9
    LDI r6, 0x304B
    LDI r9, 70        ; F
    STORE r6, r9
    LDI r6, 0x304C
    LDI r9, 0
    STORE r6, r9

; ── Build "String Ops" at 0x3070 ──────────────────────────
    LDI r6, 0x3070
    LDI r9, 83        ; S
    STORE r6, r9
    LDI r6, 0x3071
    LDI r9, 116       ; t
    STORE r6, r9
    LDI r6, 0x3072
    LDI r9, 114       ; r
    STORE r6, r9
    LDI r6, 0x3073
    LDI r9, 105       ; i
    STORE r6, r9
    LDI r6, 0x3074
    LDI r9, 110       ; n
    STORE r6, r9
    LDI r6, 0x3075
    LDI r9, 103       ; g
    STORE r6, r9
    LDI r6, 0x3076
    LDI r9, 32        ; space
    STORE r6, r9
    LDI r6, 0x3077
    LDI r9, 79        ; O
    STORE r6, r9
    LDI r6, 0x3078
    LDI r9, 112       ; p
    STORE r6, r9
    LDI r6, 0x3079
    LDI r9, 115       ; s
    STORE r6, r9
    LDI r6, 0x307A
    LDI r9, 0
    STORE r6, r9

; ── Title bar (yellow, 100 pixels wide) ───────────────────
    LDI r9, 0xFFFF00
    LDI r1, 2
    LDI r5, 5
    LDI r0, 105

title_loop:
    PSET r5, r1, r9
    ADD r5, r15
    CMP r5, r0
    BLT r13, title_loop

; Display title "String Ops" at (10, 5)
    LDI r1, 5
    LDI r5, 10
    LDI r11, 0x3070
    TEXT r5, r1, r11

; ── Test 1: STRLEN ────────────────────────────────────────
; Display "Geometry" at (10, 25)
    LDI r1, 25
    LDI r5, 10
    LDI r11, 0x3000
    TEXT r5, r1, r11

; Get length of "Geometry" -> r13 = 8
    LDI r11, 0x3000
    STRLEN r11

; Save length to r8 (r13 will be clobbered by CMP in loop)
    MOV r8, r13

; Draw green bar: 8 pixels wide at y=38
    LDI r9, 0x00FF00
    LDI r1, 38
    LDI r5, 10
    LDI r6, 0

len_loop:
    CMP r6, r8
    BGE r13, len_done
    PSET r5, r1, r9
    ADD r5, r15
    ADD r6, r15
    JMP len_loop

len_done:

; ── Test 2: STRCMP (equal strings) ────────────────────────
; Compare "Geometry" at 0x3000 with copy at 0x3010
    LDI r11, 0x3000
    LDI r2, 0x3010
    STRCMP r11, r2    ; r13 = 0 (equal)

; Display both strings + "MATCH" at y=55
    LDI r1, 55
    LDI r5, 10
    LDI r11, 0x3000
    TEXT r5, r1, r11

    LDI r5, 85
    LDI r11, 0x3040    ; "MATCH"
    TEXT r5, r1, r11

; Green indicator bar at y=68
    PSETI 10, 68, 0x00FF00
    PSETI 11, 68, 0x00FF00
    PSETI 12, 68, 0x00FF00
    PSETI 13, 68, 0x00FF00
    PSETI 14, 68, 0x00FF00

; ── Test 3: STRCMP (different strings) ────────────────────
; Compare "Geometry" (0x3000) with "Hello" (0x3020)
    LDI r11, 0x3000
    LDI r2, 0x3020
    STRCMP r11, r2    ; r13 = 1 (G > H, so s1 > s2)

; Display both strings + "DIFF" at y=85
    LDI r1, 85
    LDI r5, 10
    LDI r11, 0x3000
    TEXT r5, r1, r11

    LDI r5, 85
    LDI r11, 0x3048    ; "DIFF"
    TEXT r5, r1, r11

; Red indicator bar at y=98
    PSETI 10, 98, 0xFF0000
    PSETI 11, 98, 0xFF0000
    PSETI 12, 98, 0xFF0000
    PSETI 13, 98, 0xFF0000
    PSETI 14, 98, 0xFF0000

; ── Test 4: STRCPY ────────────────────────────────────────
; Copy "Hello" from 0x3020 to 0x3030
    LDI r11, 0x3020    ; source
    LDI r2, 0x3030    ; destination
    STRCPY r11, r2    ; r13 = 6 (bytes copied incl null)

; Save count to r8
    MOV r8, r13

; Display copied string at (10, 115)
    LDI r1, 115
    LDI r5, 10
    LDI r11, 0x3030
    TEXT r5, r1, r11

; Blue bar: 5 pixels (chars) at y=128
    LDI r9, 0x0000FF
    LDI r1, 128
    LDI r5, 10
    LDI r6, 0

copy_loop:
    CMP r6, r8         ; compare counter with total bytes copied
    BGE r13, copy_done
    PSET r5, r1, r9
    ADD r5, r15
    ADD r6, r15
    JMP copy_loop

copy_done:

; ── Separator lines ───────────────────────────────────────
    LDI r9, 0x444444  ; dark gray separators
    LDI r0, 100       ; separator width

sep1:
    LDI r1, 50
    LDI r5, 5
sep1_loop:
    PSET r5, r1, r9
    ADD r5, r15
    CMP r5, r0
    BLT r13, sep1_loop

sep2:
    LDI r1, 80
    LDI r5, 5
sep2_loop:
    PSET r5, r1, r9
    ADD r5, r15
    CMP r5, r0
    BLT r13, sep2_loop

sep3:
    LDI r1, 110
    LDI r5, 5
sep3_loop:
    PSET r5, r1, r9
    ADD r5, r15
    CMP r5, r0
    BLT r13, sep3_loop

    HALT
