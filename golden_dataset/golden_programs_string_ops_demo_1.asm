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
;   r9  = constant 1 (increment)
;   r8  = loop counter
;   r6  = saved value (length or count)
;   r1 = x coordinate
;   r11 = y coordinate
;   r13 = string address
;   r14, r5, r12 = temps

; ── RAM Layout ─────────────────────────────────────────────
;   0x3000 = "Geometry" (9 words: 8 chars + null)
;   0x3010 = "Geometry" (identical copy for equal test)
;   0x3020 = "Hello"    (6 words: 5 chars + null)
;   0x3030 = copy destination (STRCPY target)
;   0x3040 = "MATCH"    (6 words: 5 chars + null)
;   0x3048 = "DIFF"     (5 words: 4 chars + null)
;   0x3070 = "String Ops" (11 words: 10 chars + null)

; ── Constants ──────────────────────────────────────────────
    LDI r9, 1           ; increment constant

; ── Build "Geometry" at 0x3000 ────────────────────────────
    LDI r8, 0x3000
    LDI r5, 71        ; G
    STORE r8, r5
    LDI r8, 0x3001
    LDI r5, 101       ; e
    STORE r8, r5
    LDI r8, 0x3002
    LDI r5, 111       ; o
    STORE r8, r5
    LDI r8, 0x3003
    LDI r5, 109       ; m
    STORE r8, r5
    LDI r8, 0x3004
    LDI r5, 101       ; e
    STORE r8, r5
    LDI r8, 0x3005
    LDI r5, 116       ; t
    STORE r8, r5
    LDI r8, 0x3006
    LDI r5, 114       ; r
    STORE r8, r5
    LDI r8, 0x3007
    LDI r5, 121       ; y
    STORE r8, r5
    LDI r8, 0x3008
    LDI r5, 0         ; null
    STORE r8, r5

; ── Build "Geometry" at 0x3010 (identical) ────────────────
    LDI r8, 0x3010
    LDI r5, 71
    STORE r8, r5
    LDI r8, 0x3011
    LDI r5, 101
    STORE r8, r5
    LDI r8, 0x3012
    LDI r5, 111
    STORE r8, r5
    LDI r8, 0x3013
    LDI r5, 109
    STORE r8, r5
    LDI r8, 0x3014
    LDI r5, 101
    STORE r8, r5
    LDI r8, 0x3015
    LDI r5, 116
    STORE r8, r5
    LDI r8, 0x3016
    LDI r5, 114
    STORE r8, r5
    LDI r8, 0x3017
    LDI r5, 121
    STORE r8, r5
    LDI r8, 0x3018
    LDI r5, 0
    STORE r8, r5

; ── Build "Hello" at 0x3020 ───────────────────────────────
    LDI r8, 0x3020
    LDI r5, 72        ; H
    STORE r8, r5
    LDI r8, 0x3021
    LDI r5, 101       ; e
    STORE r8, r5
    LDI r8, 0x3022
    LDI r5, 108       ; l
    STORE r8, r5
    LDI r8, 0x3023
    LDI r5, 108       ; l
    STORE r8, r5
    LDI r8, 0x3024
    LDI r5, 111       ; o
    STORE r8, r5
    LDI r8, 0x3025
    LDI r5, 0
    STORE r8, r5

; ── Build "MATCH" at 0x3040 ───────────────────────────────
    LDI r8, 0x3040
    LDI r5, 77        ; M
    STORE r8, r5
    LDI r8, 0x3041
    LDI r5, 65        ; A
    STORE r8, r5
    LDI r8, 0x3042
    LDI r5, 84        ; T
    STORE r8, r5
    LDI r8, 0x3043
    LDI r5, 67        ; C
    STORE r8, r5
    LDI r8, 0x3044
    LDI r5, 72        ; H
    STORE r8, r5
    LDI r8, 0x3045
    LDI r5, 0
    STORE r8, r5

; ── Build "DIFF" at 0x3048 ────────────────────────────────
    LDI r8, 0x3048
    LDI r5, 68        ; D
    STORE r8, r5
    LDI r8, 0x3049
    LDI r5, 73        ; I
    STORE r8, r5
    LDI r8, 0x304A
    LDI r5, 70        ; F
    STORE r8, r5
    LDI r8, 0x304B
    LDI r5, 70        ; F
    STORE r8, r5
    LDI r8, 0x304C
    LDI r5, 0
    STORE r8, r5

; ── Build "String Ops" at 0x3070 ──────────────────────────
    LDI r8, 0x3070
    LDI r5, 83        ; S
    STORE r8, r5
    LDI r8, 0x3071
    LDI r5, 116       ; t
    STORE r8, r5
    LDI r8, 0x3072
    LDI r5, 114       ; r
    STORE r8, r5
    LDI r8, 0x3073
    LDI r5, 105       ; i
    STORE r8, r5
    LDI r8, 0x3074
    LDI r5, 110       ; n
    STORE r8, r5
    LDI r8, 0x3075
    LDI r5, 103       ; g
    STORE r8, r5
    LDI r8, 0x3076
    LDI r5, 32        ; space
    STORE r8, r5
    LDI r8, 0x3077
    LDI r5, 79        ; O
    STORE r8, r5
    LDI r8, 0x3078
    LDI r5, 112       ; p
    STORE r8, r5
    LDI r8, 0x3079
    LDI r5, 115       ; s
    STORE r8, r5
    LDI r8, 0x307A
    LDI r5, 0
    STORE r8, r5

; ── Title bar (yellow, 100 pixels wide) ───────────────────
    LDI r5, 0xFFFF00
    LDI r11, 2
    LDI r1, 5
    LDI r12, 105

title_loop:
    PSET r1, r11, r5
    ADD r1, r9
    CMP r1, r12
    BLT r10, title_loop

; Display title "String Ops" at (10, 5)
    LDI r11, 5
    LDI r1, 10
    LDI r13, 0x3070
    TEXT r1, r11, r13

; ── Test 1: STRLEN ────────────────────────────────────────
; Display "Geometry" at (10, 25)
    LDI r11, 25
    LDI r1, 10
    LDI r13, 0x3000
    TEXT r1, r11, r13

; Get length of "Geometry" -> r10 = 8
    LDI r13, 0x3000
    STRLEN r13

; Save length to r6 (r10 will be clobbered by CMP in loop)
    MOV r6, r10

; Draw green bar: 8 pixels wide at y=38
    LDI r5, 0x00FF00
    LDI r11, 38
    LDI r1, 10
    LDI r8, 0

len_loop:
    CMP r8, r6
    BGE r10, len_done
    PSET r1, r11, r5
    ADD r1, r9
    ADD r8, r9
    JMP len_loop

len_done:

; ── Test 2: STRCMP (equal strings) ────────────────────────
; Compare "Geometry" at 0x3000 with copy at 0x3010
    LDI r13, 0x3000
    LDI r14, 0x3010
    STRCMP r13, r14    ; r10 = 0 (equal)

; Display both strings + "MATCH" at y=55
    LDI r11, 55
    LDI r1, 10
    LDI r13, 0x3000
    TEXT r1, r11, r13

    LDI r1, 85
    LDI r13, 0x3040    ; "MATCH"
    TEXT r1, r11, r13

; Green indicator bar at y=68
    PSETI 10, 68, 0x00FF00
    PSETI 11, 68, 0x00FF00
    PSETI 12, 68, 0x00FF00
    PSETI 13, 68, 0x00FF00
    PSETI 14, 68, 0x00FF00

; ── Test 3: STRCMP (different strings) ────────────────────
; Compare "Geometry" (0x3000) with "Hello" (0x3020)
    LDI r13, 0x3000
    LDI r14, 0x3020
    STRCMP r13, r14    ; r10 = 1 (G > H, so s1 > s2)

; Display both strings + "DIFF" at y=85
    LDI r11, 85
    LDI r1, 10
    LDI r13, 0x3000
    TEXT r1, r11, r13

    LDI r1, 85
    LDI r13, 0x3048    ; "DIFF"
    TEXT r1, r11, r13

; Red indicator bar at y=98
    PSETI 10, 98, 0xFF0000
    PSETI 11, 98, 0xFF0000
    PSETI 12, 98, 0xFF0000
    PSETI 13, 98, 0xFF0000
    PSETI 14, 98, 0xFF0000

; ── Test 4: STRCPY ────────────────────────────────────────
; Copy "Hello" from 0x3020 to 0x3030
    LDI r13, 0x3020    ; source
    LDI r14, 0x3030    ; destination
    STRCPY r13, r14    ; r10 = 6 (bytes copied incl null)

; Save count to r6
    MOV r6, r10

; Display copied string at (10, 115)
    LDI r11, 115
    LDI r1, 10
    LDI r13, 0x3030
    TEXT r1, r11, r13

; Blue bar: 5 pixels (chars) at y=128
    LDI r5, 0x0000FF
    LDI r11, 128
    LDI r1, 10
    LDI r8, 0

copy_loop:
    CMP r8, r6         ; compare counter with total bytes copied
    BGE r10, copy_done
    PSET r1, r11, r5
    ADD r1, r9
    ADD r8, r9
    JMP copy_loop

copy_done:

; ── Separator lines ───────────────────────────────────────
    LDI r5, 0x444444  ; dark gray separators
    LDI r12, 100       ; separator width

sep1:
    LDI r11, 50
    LDI r1, 5
sep1_loop:
    PSET r1, r11, r5
    ADD r1, r9
    CMP r1, r12
    BLT r10, sep1_loop

sep2:
    LDI r11, 80
    LDI r1, 5
sep2_loop:
    PSET r1, r11, r5
    ADD r1, r9
    CMP r1, r12
    BLT r10, sep2_loop

sep3:
    LDI r11, 110
    LDI r1, 5
sep3_loop:
    PSET r1, r11, r5
    ADD r1, r9
    CMP r1, r12
    BLT r10, sep3_loop

    HALT
