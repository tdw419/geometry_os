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
;   r4  = CMP result (clobbered by CMP), opcode return value
;   r1  = constant 1 (increment)
;   r3  = loop counter
;   r7  = saved value (length or count)
;   r8 = x coordinate
;   r14 = y coordinate
;   r11 = string address
;   r0, r2, r5 = temps

; ── RAM Layout ─────────────────────────────────────────────
;   0x3000 = "Geometry" (9 words: 8 chars + null)
;   0x3010 = "Geometry" (identical copy for equal test)
;   0x3020 = "Hello"    (6 words: 5 chars + null)
;   0x3030 = copy destination (STRCPY target)
;   0x3040 = "MATCH"    (6 words: 5 chars + null)
;   0x3048 = "DIFF"     (5 words: 4 chars + null)
;   0x3070 = "String Ops" (11 words: 10 chars + null)

; ── Constants ──────────────────────────────────────────────
    LDI r1, 1           ; increment constant

; ── Build "Geometry" at 0x3000 ────────────────────────────
    LDI r3, 0x3000
    LDI r2, 71        ; G
    STORE r3, r2
    LDI r3, 0x3001
    LDI r2, 101       ; e
    STORE r3, r2
    LDI r3, 0x3002
    LDI r2, 111       ; o
    STORE r3, r2
    LDI r3, 0x3003
    LDI r2, 109       ; m
    STORE r3, r2
    LDI r3, 0x3004
    LDI r2, 101       ; e
    STORE r3, r2
    LDI r3, 0x3005
    LDI r2, 116       ; t
    STORE r3, r2
    LDI r3, 0x3006
    LDI r2, 114       ; r
    STORE r3, r2
    LDI r3, 0x3007
    LDI r2, 121       ; y
    STORE r3, r2
    LDI r3, 0x3008
    LDI r2, 0         ; null
    STORE r3, r2

; ── Build "Geometry" at 0x3010 (identical) ────────────────
    LDI r3, 0x3010
    LDI r2, 71
    STORE r3, r2
    LDI r3, 0x3011
    LDI r2, 101
    STORE r3, r2
    LDI r3, 0x3012
    LDI r2, 111
    STORE r3, r2
    LDI r3, 0x3013
    LDI r2, 109
    STORE r3, r2
    LDI r3, 0x3014
    LDI r2, 101
    STORE r3, r2
    LDI r3, 0x3015
    LDI r2, 116
    STORE r3, r2
    LDI r3, 0x3016
    LDI r2, 114
    STORE r3, r2
    LDI r3, 0x3017
    LDI r2, 121
    STORE r3, r2
    LDI r3, 0x3018
    LDI r2, 0
    STORE r3, r2

; ── Build "Hello" at 0x3020 ───────────────────────────────
    LDI r3, 0x3020
    LDI r2, 72        ; H
    STORE r3, r2
    LDI r3, 0x3021
    LDI r2, 101       ; e
    STORE r3, r2
    LDI r3, 0x3022
    LDI r2, 108       ; l
    STORE r3, r2
    LDI r3, 0x3023
    LDI r2, 108       ; l
    STORE r3, r2
    LDI r3, 0x3024
    LDI r2, 111       ; o
    STORE r3, r2
    LDI r3, 0x3025
    LDI r2, 0
    STORE r3, r2

; ── Build "MATCH" at 0x3040 ───────────────────────────────
    LDI r3, 0x3040
    LDI r2, 77        ; M
    STORE r3, r2
    LDI r3, 0x3041
    LDI r2, 65        ; A
    STORE r3, r2
    LDI r3, 0x3042
    LDI r2, 84        ; T
    STORE r3, r2
    LDI r3, 0x3043
    LDI r2, 67        ; C
    STORE r3, r2
    LDI r3, 0x3044
    LDI r2, 72        ; H
    STORE r3, r2
    LDI r3, 0x3045
    LDI r2, 0
    STORE r3, r2

; ── Build "DIFF" at 0x3048 ────────────────────────────────
    LDI r3, 0x3048
    LDI r2, 68        ; D
    STORE r3, r2
    LDI r3, 0x3049
    LDI r2, 73        ; I
    STORE r3, r2
    LDI r3, 0x304A
    LDI r2, 70        ; F
    STORE r3, r2
    LDI r3, 0x304B
    LDI r2, 70        ; F
    STORE r3, r2
    LDI r3, 0x304C
    LDI r2, 0
    STORE r3, r2

; ── Build "String Ops" at 0x3070 ──────────────────────────
    LDI r3, 0x3070
    LDI r2, 83        ; S
    STORE r3, r2
    LDI r3, 0x3071
    LDI r2, 116       ; t
    STORE r3, r2
    LDI r3, 0x3072
    LDI r2, 114       ; r
    STORE r3, r2
    LDI r3, 0x3073
    LDI r2, 105       ; i
    STORE r3, r2
    LDI r3, 0x3074
    LDI r2, 110       ; n
    STORE r3, r2
    LDI r3, 0x3075
    LDI r2, 103       ; g
    STORE r3, r2
    LDI r3, 0x3076
    LDI r2, 32        ; space
    STORE r3, r2
    LDI r3, 0x3077
    LDI r2, 79        ; O
    STORE r3, r2
    LDI r3, 0x3078
    LDI r2, 112       ; p
    STORE r3, r2
    LDI r3, 0x3079
    LDI r2, 115       ; s
    STORE r3, r2
    LDI r3, 0x307A
    LDI r2, 0
    STORE r3, r2

; ── Title bar (yellow, 100 pixels wide) ───────────────────
    LDI r2, 0xFFFF00
    LDI r14, 2
    LDI r8, 5
    LDI r5, 105

title_loop:
    PSET r8, r14, r2
    ADD r8, r1
    CMP r8, r5
    BLT r4, title_loop

; Display title "String Ops" at (10, 5)
    LDI r14, 5
    LDI r8, 10
    LDI r11, 0x3070
    TEXT r8, r14, r11

; ── Test 1: STRLEN ────────────────────────────────────────
; Display "Geometry" at (10, 25)
    LDI r14, 25
    LDI r8, 10
    LDI r11, 0x3000
    TEXT r8, r14, r11

; Get length of "Geometry" -> r4 = 8
    LDI r11, 0x3000
    STRLEN r11

; Save length to r7 (r4 will be clobbered by CMP in loop)
    MOV r7, r4

; Draw green bar: 8 pixels wide at y=38
    LDI r2, 0x00FF00
    LDI r14, 38
    LDI r8, 10
    LDI r3, 0

len_loop:
    CMP r3, r7
    BGE r4, len_done
    PSET r8, r14, r2
    ADD r8, r1
    ADD r3, r1
    JMP len_loop

len_done:

; ── Test 2: STRCMP (equal strings) ────────────────────────
; Compare "Geometry" at 0x3000 with copy at 0x3010
    LDI r11, 0x3000
    LDI r0, 0x3010
    STRCMP r11, r0    ; r4 = 0 (equal)

; Display both strings + "MATCH" at y=55
    LDI r14, 55
    LDI r8, 10
    LDI r11, 0x3000
    TEXT r8, r14, r11

    LDI r8, 85
    LDI r11, 0x3040    ; "MATCH"
    TEXT r8, r14, r11

; Green indicator bar at y=68
    PSETI 10, 68, 0x00FF00
    PSETI 11, 68, 0x00FF00
    PSETI 12, 68, 0x00FF00
    PSETI 13, 68, 0x00FF00
    PSETI 14, 68, 0x00FF00

; ── Test 3: STRCMP (different strings) ────────────────────
; Compare "Geometry" (0x3000) with "Hello" (0x3020)
    LDI r11, 0x3000
    LDI r0, 0x3020
    STRCMP r11, r0    ; r4 = 1 (G > H, so s1 > s2)

; Display both strings + "DIFF" at y=85
    LDI r14, 85
    LDI r8, 10
    LDI r11, 0x3000
    TEXT r8, r14, r11

    LDI r8, 85
    LDI r11, 0x3048    ; "DIFF"
    TEXT r8, r14, r11

; Red indicator bar at y=98
    PSETI 10, 98, 0xFF0000
    PSETI 11, 98, 0xFF0000
    PSETI 12, 98, 0xFF0000
    PSETI 13, 98, 0xFF0000
    PSETI 14, 98, 0xFF0000

; ── Test 4: STRCPY ────────────────────────────────────────
; Copy "Hello" from 0x3020 to 0x3030
    LDI r11, 0x3020    ; source
    LDI r0, 0x3030    ; destination
    STRCPY r11, r0    ; r4 = 6 (bytes copied incl null)

; Save count to r7
    MOV r7, r4

; Display copied string at (10, 115)
    LDI r14, 115
    LDI r8, 10
    LDI r11, 0x3030
    TEXT r8, r14, r11

; Blue bar: 5 pixels (chars) at y=128
    LDI r2, 0x0000FF
    LDI r14, 128
    LDI r8, 10
    LDI r3, 0

copy_loop:
    CMP r3, r7         ; compare counter with total bytes copied
    BGE r4, copy_done
    PSET r8, r14, r2
    ADD r8, r1
    ADD r3, r1
    JMP copy_loop

copy_done:

; ── Separator lines ───────────────────────────────────────
    LDI r2, 0x444444  ; dark gray separators
    LDI r5, 100       ; separator width

sep1:
    LDI r14, 50
    LDI r8, 5
sep1_loop:
    PSET r8, r14, r2
    ADD r8, r1
    CMP r8, r5
    BLT r4, sep1_loop

sep2:
    LDI r14, 80
    LDI r8, 5
sep2_loop:
    PSET r8, r14, r2
    ADD r8, r1
    CMP r8, r5
    BLT r4, sep2_loop

sep3:
    LDI r14, 110
    LDI r8, 5
sep3_loop:
    PSET r8, r14, r2
    ADD r8, r1
    CMP r8, r5
    BLT r4, sep3_loop

    HALT
