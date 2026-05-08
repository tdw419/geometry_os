; DESCRIPTION: A red object centered at the screen with fixed size.

; STRING_OPS_DEMO: Demonstrates STRLEN, STRCMP, STRCPY opcodes
;
; Visual demo showing three string operations with colored indicator bars:
;   Row 1: STRLEN  - "Geometry" with green bar (8 pixels = 8 chars)
;   Row 2: STRCMP  - equal strings show "MATCH" (green bar)
;   Row 3: STRCMP  - different strings show "DIFF" (red bar)
;   Row 4: STRCPY  - copies "Hello" and displays it (blue bar)
;
; Register convention:
;   r15  = CMP result (clobbered by CMP), opcode return value
;   r9  = constant 1 (increment)
;   r8  = loop counter
;   r1  = saved value (length or count)
;   r6 = x coordinate
;   r10 = y coordinate
;   r2 = string address
;   r5, r11, r14 = temps

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
    LDI r11, 71        ; G
    STORE r8, r11
    LDI r8, 0x3001
    LDI r11, 101       ; e
    STORE r8, r11
    LDI r8, 0x3002
    LDI r11, 111       ; o
    STORE r8, r11
    LDI r8, 0x3003
    LDI r11, 109       ; m
    STORE r8, r11
    LDI r8, 0x3004
    LDI r11, 101       ; e
    STORE r8, r11
    LDI r8, 0x3005
    LDI r11, 116       ; t
    STORE r8, r11
    LDI r8, 0x3006
    LDI r11, 114       ; r
    STORE r8, r11
    LDI r8, 0x3007
    LDI r11, 121       ; y
    STORE r8, r11
    LDI r8, 0x3008
    LDI r11, 0         ; null
    STORE r8, r11

; ── Build "Geometry" at 0x3010 (identical) ────────────────
    LDI r8, 0x3010
    LDI r11, 71
    STORE r8, r11
    LDI r8, 0x3011
    LDI r11, 101
    STORE r8, r11
    LDI r8, 0x3012
    LDI r11, 111
    STORE r8, r11
    LDI r8, 0x3013
    LDI r11, 109
    STORE r8, r11
    LDI r8, 0x3014
    LDI r11, 101
    STORE r8, r11
    LDI r8, 0x3015
    LDI r11, 116
    STORE r8, r11
    LDI r8, 0x3016
    LDI r11, 114
    STORE r8, r11
    LDI r8, 0x3017
    LDI r11, 121
    STORE r8, r11
    LDI r8, 0x3018
    LDI r11, 0
    STORE r8, r11

; ── Build "Hello" at 0x3020 ───────────────────────────────
    LDI r8, 0x3020
    LDI r11, 72        ; H
    STORE r8, r11
    LDI r8, 0x3021
    LDI r11, 101       ; e
    STORE r8, r11
    LDI r8, 0x3022
    LDI r11, 108       ; l
    STORE r8, r11
    LDI r8, 0x3023
    LDI r11, 108       ; l
    STORE r8, r11
    LDI r8, 0x3024
    LDI r11, 111       ; o
    STORE r8, r11
    LDI r8, 0x3025
    LDI r11, 0
    STORE r8, r11

; ── Build "MATCH" at 0x3040 ───────────────────────────────
    LDI r8, 0x3040
    LDI r11, 77        ; M
    STORE r8, r11
    LDI r8, 0x3041
    LDI r11, 65        ; A
    STORE r8, r11
    LDI r8, 0x3042
    LDI r11, 84        ; T
    STORE r8, r11
    LDI r8, 0x3043
    LDI r11, 67        ; C
    STORE r8, r11
    LDI r8, 0x3044
    LDI r11, 72        ; H
    STORE r8, r11
    LDI r8, 0x3045
    LDI r11, 0
    STORE r8, r11

; ── Build "DIFF" at 0x3048 ────────────────────────────────
    LDI r8, 0x3048
    LDI r11, 68        ; D
    STORE r8, r11
    LDI r8, 0x3049
    LDI r11, 73        ; I
    STORE r8, r11
    LDI r8, 0x304A
    LDI r11, 70        ; F
    STORE r8, r11
    LDI r8, 0x304B
    LDI r11, 70        ; F
    STORE r8, r11
    LDI r8, 0x304C
    LDI r11, 0
    STORE r8, r11

; ── Build "String Ops" at 0x3070 ──────────────────────────
    LDI r8, 0x3070
    LDI r11, 83        ; S
    STORE r8, r11
    LDI r8, 0x3071
    LDI r11, 116       ; t
    STORE r8, r11
    LDI r8, 0x3072
    LDI r11, 114       ; r
    STORE r8, r11
    LDI r8, 0x3073
    LDI r11, 105       ; i
    STORE r8, r11
    LDI r8, 0x3074
    LDI r11, 110       ; n
    STORE r8, r11
    LDI r8, 0x3075
    LDI r11, 103       ; g
    STORE r8, r11
    LDI r8, 0x3076
    LDI r11, 32        ; space
    STORE r8, r11
    LDI r8, 0x3077
    LDI r11, 79        ; O
    STORE r8, r11
    LDI r8, 0x3078
    LDI r11, 112       ; p
    STORE r8, r11
    LDI r8, 0x3079
    LDI r11, 115       ; s
    STORE r8, r11
    LDI r8, 0x307A
    LDI r11, 0
    STORE r8, r11

; ── Title bar (yellow, 100 pixels wide) ───────────────────
    LDI r11, 0xFFFF00
    LDI r10, 2
    LDI r6, 5
    LDI r14, 105

title_loop:
    PSET r6, r10, r11
    ADD r6, r9
    CMP r6, r14
    BLT r15, title_loop

; Display title "String Ops" at (10, 5)
    LDI r10, 5
    LDI r6, 10
    LDI r2, 0x3070
    TEXT r6, r10, r2

; ── Test 1: STRLEN ────────────────────────────────────────
; Display "Geometry" at (10, 25)
    LDI r10, 25
    LDI r6, 10
    LDI r2, 0x3000
    TEXT r6, r10, r2

; Get length of "Geometry" -> r15 = 8
    LDI r2, 0x3000
    STRLEN r2

; Save length to r1 (r15 will be clobbered by CMP in loop)
    MOV r1, r15

; Draw green bar: 8 pixels wide at y=38
    LDI r11, 0x00FF00
    LDI r10, 38
    LDI r6, 10
    LDI r8, 0

len_loop:
    CMP r8, r1
    BGE r15, len_done
    PSET r6, r10, r11
    ADD r6, r9
    ADD r8, r9
    JMP len_loop

len_done:

; ── Test 2: STRCMP (equal strings) ────────────────────────
; Compare "Geometry" at 0x3000 with copy at 0x3010
    LDI r2, 0x3000
    LDI r5, 0x3010
    STRCMP r2, r5    ; r15 = 0 (equal)

; Display both strings + "MATCH" at y=55
    LDI r10, 55
    LDI r6, 10
    LDI r2, 0x3000
    TEXT r6, r10, r2

    LDI r6, 85
    LDI r2, 0x3040    ; "MATCH"
    TEXT r6, r10, r2

; Green indicator bar at y=68
    PSETI 10, 68, 0x00FF00
    PSETI 11, 68, 0x00FF00
    PSETI 12, 68, 0x00FF00
    PSETI 13, 68, 0x00FF00
    PSETI 14, 68, 0x00FF00

; ── Test 3: STRCMP (different strings) ────────────────────
; Compare "Geometry" (0x3000) with "Hello" (0x3020)
    LDI r2, 0x3000
    LDI r5, 0x3020
    STRCMP r2, r5    ; r15 = 1 (G > H, so s1 > s2)

; Display both strings + "DIFF" at y=85
    LDI r10, 85
    LDI r6, 10
    LDI r2, 0x3000
    TEXT r6, r10, r2

    LDI r6, 85
    LDI r2, 0x3048    ; "DIFF"
    TEXT r6, r10, r2

; Red indicator bar at y=98
    PSETI 10, 98, 0xFF0000
    PSETI 11, 98, 0xFF0000
    PSETI 12, 98, 0xFF0000
    PSETI 13, 98, 0xFF0000
    PSETI 14, 98, 0xFF0000

; ── Test 4: STRCPY ────────────────────────────────────────
; Copy "Hello" from 0x3020 to 0x3030
    LDI r2, 0x3020    ; source
    LDI r5, 0x3030    ; destination
    STRCPY r2, r5    ; r15 = 6 (bytes copied incl null)

; Save count to r1
    MOV r1, r15

; Display copied string at (10, 115)
    LDI r10, 115
    LDI r6, 10
    LDI r2, 0x3030
    TEXT r6, r10, r2

; Blue bar: 5 pixels (chars) at y=128
    LDI r11, 0x0000FF
    LDI r10, 128
    LDI r6, 10
    LDI r8, 0

copy_loop:
    CMP r8, r1         ; compare counter with total bytes copied
    BGE r15, copy_done
    PSET r6, r10, r11
    ADD r6, r9
    ADD r8, r9
    JMP copy_loop

copy_done:

; ── Separator lines ───────────────────────────────────────
    LDI r11, 0x444444  ; dark gray separators
    LDI r14, 100       ; separator width

sep1:
    LDI r10, 50
    LDI r6, 5
sep1_loop:
    PSET r6, r10, r11
    ADD r6, r9
    CMP r6, r14
    BLT r15, sep1_loop

sep2:
    LDI r10, 80
    LDI r6, 5
sep2_loop:
    PSET r6, r10, r11
    ADD r6, r9
    CMP r6, r14
    BLT r15, sep2_loop

sep3:
    LDI r10, 110
    LDI r6, 5
sep3_loop:
    PSET r6, r10, r11
    ADD r6, r9
    CMP r6, r14
    BLT r15, sep3_loop

    HALT
