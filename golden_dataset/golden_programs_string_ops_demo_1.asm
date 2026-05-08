; DESCRIPTION: Geometry OS program to draw a red object.

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
;   r9  = constant 1 (increment)
;   r10  = loop counter
;   r11  = saved value (length or count)
;   r0 = x coordinate
;   r12 = y coordinate
;   r1 = string address
;   r14, r4, r2 = temps

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
    LDI r10, 0x3000
    LDI r4, 71        ; G
    STORE r10, r4
    LDI r10, 0x3001
    LDI r4, 101       ; e
    STORE r10, r4
    LDI r10, 0x3002
    LDI r4, 111       ; o
    STORE r10, r4
    LDI r10, 0x3003
    LDI r4, 109       ; m
    STORE r10, r4
    LDI r10, 0x3004
    LDI r4, 101       ; e
    STORE r10, r4
    LDI r10, 0x3005
    LDI r4, 116       ; t
    STORE r10, r4
    LDI r10, 0x3006
    LDI r4, 114       ; r
    STORE r10, r4
    LDI r10, 0x3007
    LDI r4, 121       ; y
    STORE r10, r4
    LDI r10, 0x3008
    LDI r4, 0         ; null
    STORE r10, r4

; ── Build "Geometry" at 0x3010 (identical) ────────────────
    LDI r10, 0x3010
    LDI r4, 71
    STORE r10, r4
    LDI r10, 0x3011
    LDI r4, 101
    STORE r10, r4
    LDI r10, 0x3012
    LDI r4, 111
    STORE r10, r4
    LDI r10, 0x3013
    LDI r4, 109
    STORE r10, r4
    LDI r10, 0x3014
    LDI r4, 101
    STORE r10, r4
    LDI r10, 0x3015
    LDI r4, 116
    STORE r10, r4
    LDI r10, 0x3016
    LDI r4, 114
    STORE r10, r4
    LDI r10, 0x3017
    LDI r4, 121
    STORE r10, r4
    LDI r10, 0x3018
    LDI r4, 0
    STORE r10, r4

; ── Build "Hello" at 0x3020 ───────────────────────────────
    LDI r10, 0x3020
    LDI r4, 72        ; H
    STORE r10, r4
    LDI r10, 0x3021
    LDI r4, 101       ; e
    STORE r10, r4
    LDI r10, 0x3022
    LDI r4, 108       ; l
    STORE r10, r4
    LDI r10, 0x3023
    LDI r4, 108       ; l
    STORE r10, r4
    LDI r10, 0x3024
    LDI r4, 111       ; o
    STORE r10, r4
    LDI r10, 0x3025
    LDI r4, 0
    STORE r10, r4

; ── Build "MATCH" at 0x3040 ───────────────────────────────
    LDI r10, 0x3040
    LDI r4, 77        ; M
    STORE r10, r4
    LDI r10, 0x3041
    LDI r4, 65        ; A
    STORE r10, r4
    LDI r10, 0x3042
    LDI r4, 84        ; T
    STORE r10, r4
    LDI r10, 0x3043
    LDI r4, 67        ; C
    STORE r10, r4
    LDI r10, 0x3044
    LDI r4, 72        ; H
    STORE r10, r4
    LDI r10, 0x3045
    LDI r4, 0
    STORE r10, r4

; ── Build "DIFF" at 0x3048 ────────────────────────────────
    LDI r10, 0x3048
    LDI r4, 68        ; D
    STORE r10, r4
    LDI r10, 0x3049
    LDI r4, 73        ; I
    STORE r10, r4
    LDI r10, 0x304A
    LDI r4, 70        ; F
    STORE r10, r4
    LDI r10, 0x304B
    LDI r4, 70        ; F
    STORE r10, r4
    LDI r10, 0x304C
    LDI r4, 0
    STORE r10, r4

; ── Build "String Ops" at 0x3070 ──────────────────────────
    LDI r10, 0x3070
    LDI r4, 83        ; S
    STORE r10, r4
    LDI r10, 0x3071
    LDI r4, 116       ; t
    STORE r10, r4
    LDI r10, 0x3072
    LDI r4, 114       ; r
    STORE r10, r4
    LDI r10, 0x3073
    LDI r4, 105       ; i
    STORE r10, r4
    LDI r10, 0x3074
    LDI r4, 110       ; n
    STORE r10, r4
    LDI r10, 0x3075
    LDI r4, 103       ; g
    STORE r10, r4
    LDI r10, 0x3076
    LDI r4, 32        ; space
    STORE r10, r4
    LDI r10, 0x3077
    LDI r4, 79        ; O
    STORE r10, r4
    LDI r10, 0x3078
    LDI r4, 112       ; p
    STORE r10, r4
    LDI r10, 0x3079
    LDI r4, 115       ; s
    STORE r10, r4
    LDI r10, 0x307A
    LDI r4, 0
    STORE r10, r4

; ── Title bar (yellow, 100 pixels wide) ───────────────────
    LDI r4, 0xFFFF00
    LDI r12, 2
    LDI r0, 5
    LDI r2, 105

title_loop:
    PSET r0, r12, r4
    ADD r0, r9
    CMP r0, r2
    BLT r13, title_loop

; Display title "String Ops" at (10, 5)
    LDI r12, 5
    LDI r0, 10
    LDI r1, 0x3070
    TEXT r0, r12, r1

; ── Test 1: STRLEN ────────────────────────────────────────
; Display "Geometry" at (10, 25)
    LDI r12, 25
    LDI r0, 10
    LDI r1, 0x3000
    TEXT r0, r12, r1

; Get length of "Geometry" -> r13 = 8
    LDI r1, 0x3000
    STRLEN r1

; Save length to r11 (r13 will be clobbered by CMP in loop)
    MOV r11, r13

; Draw green bar: 8 pixels wide at y=38
    LDI r4, 0x00FF00
    LDI r12, 38
    LDI r0, 10
    LDI r10, 0

len_loop:
    CMP r10, r11
    BGE r13, len_done
    PSET r0, r12, r4
    ADD r0, r9
    ADD r10, r9
    JMP len_loop

len_done:

; ── Test 2: STRCMP (equal strings) ────────────────────────
; Compare "Geometry" at 0x3000 with copy at 0x3010
    LDI r1, 0x3000
    LDI r14, 0x3010
    STRCMP r1, r14    ; r13 = 0 (equal)

; Display both strings + "MATCH" at y=55
    LDI r12, 55
    LDI r0, 10
    LDI r1, 0x3000
    TEXT r0, r12, r1

    LDI r0, 85
    LDI r1, 0x3040    ; "MATCH"
    TEXT r0, r12, r1

; Green indicator bar at y=68
    PSETI 10, 68, 0x00FF00
    PSETI 11, 68, 0x00FF00
    PSETI 12, 68, 0x00FF00
    PSETI 13, 68, 0x00FF00
    PSETI 14, 68, 0x00FF00

; ── Test 3: STRCMP (different strings) ────────────────────
; Compare "Geometry" (0x3000) with "Hello" (0x3020)
    LDI r1, 0x3000
    LDI r14, 0x3020
    STRCMP r1, r14    ; r13 = 1 (G > H, so s1 > s2)

; Display both strings + "DIFF" at y=85
    LDI r12, 85
    LDI r0, 10
    LDI r1, 0x3000
    TEXT r0, r12, r1

    LDI r0, 85
    LDI r1, 0x3048    ; "DIFF"
    TEXT r0, r12, r1

; Red indicator bar at y=98
    PSETI 10, 98, 0xFF0000
    PSETI 11, 98, 0xFF0000
    PSETI 12, 98, 0xFF0000
    PSETI 13, 98, 0xFF0000
    PSETI 14, 98, 0xFF0000

; ── Test 4: STRCPY ────────────────────────────────────────
; Copy "Hello" from 0x3020 to 0x3030
    LDI r1, 0x3020    ; source
    LDI r14, 0x3030    ; destination
    STRCPY r1, r14    ; r13 = 6 (bytes copied incl null)

; Save count to r11
    MOV r11, r13

; Display copied string at (10, 115)
    LDI r12, 115
    LDI r0, 10
    LDI r1, 0x3030
    TEXT r0, r12, r1

; Blue bar: 5 pixels (chars) at y=128
    LDI r4, 0x0000FF
    LDI r12, 128
    LDI r0, 10
    LDI r10, 0

copy_loop:
    CMP r10, r11         ; compare counter with total bytes copied
    BGE r13, copy_done
    PSET r0, r12, r4
    ADD r0, r9
    ADD r10, r9
    JMP copy_loop

copy_done:

; ── Separator lines ───────────────────────────────────────
    LDI r4, 0x444444  ; dark gray separators
    LDI r2, 100       ; separator width

sep1:
    LDI r12, 50
    LDI r0, 5
sep1_loop:
    PSET r0, r12, r4
    ADD r0, r9
    CMP r0, r2
    BLT r13, sep1_loop

sep2:
    LDI r12, 80
    LDI r0, 5
sep2_loop:
    PSET r0, r12, r4
    ADD r0, r9
    CMP r0, r2
    BLT r13, sep2_loop

sep3:
    LDI r12, 110
    LDI r0, 5
sep3_loop:
    PSET r0, r12, r4
    ADD r0, r9
    CMP r0, r2
    BLT r13, sep3_loop

    HALT
