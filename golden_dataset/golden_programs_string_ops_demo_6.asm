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
;   r8  = CMP result (clobbered by CMP), opcode return value
;   r5  = constant 1 (increment)
;   r14  = loop counter
;   r10  = saved value (length or count)
;   r4 = x coordinate
;   r7 = y coordinate
;   r12 = string address
;   r2, r13, r0 = temps

; ── RAM Layout ─────────────────────────────────────────────
;   0x3000 = "Geometry" (9 words: 8 chars + null)
;   0x3010 = "Geometry" (identical copy for equal test)
;   0x3020 = "Hello"    (6 words: 5 chars + null)
;   0x3030 = copy destination (STRCPY target)
;   0x3040 = "MATCH"    (6 words: 5 chars + null)
;   0x3048 = "DIFF"     (5 words: 4 chars + null)
;   0x3070 = "String Ops" (11 words: 10 chars + null)

; ── Constants ──────────────────────────────────────────────
    LDI r5, 1           ; increment constant

; ── Build "Geometry" at 0x3000 ────────────────────────────
    LDI r14, 0x3000
    LDI r13, 71        ; G
    STORE r14, r13
    LDI r14, 0x3001
    LDI r13, 101       ; e
    STORE r14, r13
    LDI r14, 0x3002
    LDI r13, 111       ; o
    STORE r14, r13
    LDI r14, 0x3003
    LDI r13, 109       ; m
    STORE r14, r13
    LDI r14, 0x3004
    LDI r13, 101       ; e
    STORE r14, r13
    LDI r14, 0x3005
    LDI r13, 116       ; t
    STORE r14, r13
    LDI r14, 0x3006
    LDI r13, 114       ; r
    STORE r14, r13
    LDI r14, 0x3007
    LDI r13, 121       ; y
    STORE r14, r13
    LDI r14, 0x3008
    LDI r13, 0         ; null
    STORE r14, r13

; ── Build "Geometry" at 0x3010 (identical) ────────────────
    LDI r14, 0x3010
    LDI r13, 71
    STORE r14, r13
    LDI r14, 0x3011
    LDI r13, 101
    STORE r14, r13
    LDI r14, 0x3012
    LDI r13, 111
    STORE r14, r13
    LDI r14, 0x3013
    LDI r13, 109
    STORE r14, r13
    LDI r14, 0x3014
    LDI r13, 101
    STORE r14, r13
    LDI r14, 0x3015
    LDI r13, 116
    STORE r14, r13
    LDI r14, 0x3016
    LDI r13, 114
    STORE r14, r13
    LDI r14, 0x3017
    LDI r13, 121
    STORE r14, r13
    LDI r14, 0x3018
    LDI r13, 0
    STORE r14, r13

; ── Build "Hello" at 0x3020 ───────────────────────────────
    LDI r14, 0x3020
    LDI r13, 72        ; H
    STORE r14, r13
    LDI r14, 0x3021
    LDI r13, 101       ; e
    STORE r14, r13
    LDI r14, 0x3022
    LDI r13, 108       ; l
    STORE r14, r13
    LDI r14, 0x3023
    LDI r13, 108       ; l
    STORE r14, r13
    LDI r14, 0x3024
    LDI r13, 111       ; o
    STORE r14, r13
    LDI r14, 0x3025
    LDI r13, 0
    STORE r14, r13

; ── Build "MATCH" at 0x3040 ───────────────────────────────
    LDI r14, 0x3040
    LDI r13, 77        ; M
    STORE r14, r13
    LDI r14, 0x3041
    LDI r13, 65        ; A
    STORE r14, r13
    LDI r14, 0x3042
    LDI r13, 84        ; T
    STORE r14, r13
    LDI r14, 0x3043
    LDI r13, 67        ; C
    STORE r14, r13
    LDI r14, 0x3044
    LDI r13, 72        ; H
    STORE r14, r13
    LDI r14, 0x3045
    LDI r13, 0
    STORE r14, r13

; ── Build "DIFF" at 0x3048 ────────────────────────────────
    LDI r14, 0x3048
    LDI r13, 68        ; D
    STORE r14, r13
    LDI r14, 0x3049
    LDI r13, 73        ; I
    STORE r14, r13
    LDI r14, 0x304A
    LDI r13, 70        ; F
    STORE r14, r13
    LDI r14, 0x304B
    LDI r13, 70        ; F
    STORE r14, r13
    LDI r14, 0x304C
    LDI r13, 0
    STORE r14, r13

; ── Build "String Ops" at 0x3070 ──────────────────────────
    LDI r14, 0x3070
    LDI r13, 83        ; S
    STORE r14, r13
    LDI r14, 0x3071
    LDI r13, 116       ; t
    STORE r14, r13
    LDI r14, 0x3072
    LDI r13, 114       ; r
    STORE r14, r13
    LDI r14, 0x3073
    LDI r13, 105       ; i
    STORE r14, r13
    LDI r14, 0x3074
    LDI r13, 110       ; n
    STORE r14, r13
    LDI r14, 0x3075
    LDI r13, 103       ; g
    STORE r14, r13
    LDI r14, 0x3076
    LDI r13, 32        ; space
    STORE r14, r13
    LDI r14, 0x3077
    LDI r13, 79        ; O
    STORE r14, r13
    LDI r14, 0x3078
    LDI r13, 112       ; p
    STORE r14, r13
    LDI r14, 0x3079
    LDI r13, 115       ; s
    STORE r14, r13
    LDI r14, 0x307A
    LDI r13, 0
    STORE r14, r13

; ── Title bar (yellow, 100 pixels wide) ───────────────────
    LDI r13, 0xFFFF00
    LDI r7, 2
    LDI r4, 5
    LDI r0, 105

title_loop:
    PSET r4, r7, r13
    ADD r4, r5
    CMP r4, r0
    BLT r8, title_loop

; Display title "String Ops" at (10, 5)
    LDI r7, 5
    LDI r4, 10
    LDI r12, 0x3070
    TEXT r4, r7, r12

; ── Test 1: STRLEN ────────────────────────────────────────
; Display "Geometry" at (10, 25)
    LDI r7, 25
    LDI r4, 10
    LDI r12, 0x3000
    TEXT r4, r7, r12

; Get length of "Geometry" -> r8 = 8
    LDI r12, 0x3000
    STRLEN r12

; Save length to r10 (r8 will be clobbered by CMP in loop)
    MOV r10, r8

; Draw green bar: 8 pixels wide at y=38
    LDI r13, 0x00FF00
    LDI r7, 38
    LDI r4, 10
    LDI r14, 0

len_loop:
    CMP r14, r10
    BGE r8, len_done
    PSET r4, r7, r13
    ADD r4, r5
    ADD r14, r5
    JMP len_loop

len_done:

; ── Test 2: STRCMP (equal strings) ────────────────────────
; Compare "Geometry" at 0x3000 with copy at 0x3010
    LDI r12, 0x3000
    LDI r2, 0x3010
    STRCMP r12, r2    ; r8 = 0 (equal)

; Display both strings + "MATCH" at y=55
    LDI r7, 55
    LDI r4, 10
    LDI r12, 0x3000
    TEXT r4, r7, r12

    LDI r4, 85
    LDI r12, 0x3040    ; "MATCH"
    TEXT r4, r7, r12

; Green indicator bar at y=68
    PSETI 10, 68, 0x00FF00
    PSETI 11, 68, 0x00FF00
    PSETI 12, 68, 0x00FF00
    PSETI 13, 68, 0x00FF00
    PSETI 14, 68, 0x00FF00

; ── Test 3: STRCMP (different strings) ────────────────────
; Compare "Geometry" (0x3000) with "Hello" (0x3020)
    LDI r12, 0x3000
    LDI r2, 0x3020
    STRCMP r12, r2    ; r8 = 1 (G > H, so s1 > s2)

; Display both strings + "DIFF" at y=85
    LDI r7, 85
    LDI r4, 10
    LDI r12, 0x3000
    TEXT r4, r7, r12

    LDI r4, 85
    LDI r12, 0x3048    ; "DIFF"
    TEXT r4, r7, r12

; Red indicator bar at y=98
    PSETI 10, 98, 0xFF0000
    PSETI 11, 98, 0xFF0000
    PSETI 12, 98, 0xFF0000
    PSETI 13, 98, 0xFF0000
    PSETI 14, 98, 0xFF0000

; ── Test 4: STRCPY ────────────────────────────────────────
; Copy "Hello" from 0x3020 to 0x3030
    LDI r12, 0x3020    ; source
    LDI r2, 0x3030    ; destination
    STRCPY r12, r2    ; r8 = 6 (bytes copied incl null)

; Save count to r10
    MOV r10, r8

; Display copied string at (10, 115)
    LDI r7, 115
    LDI r4, 10
    LDI r12, 0x3030
    TEXT r4, r7, r12

; Blue bar: 5 pixels (chars) at y=128
    LDI r13, 0x0000FF
    LDI r7, 128
    LDI r4, 10
    LDI r14, 0

copy_loop:
    CMP r14, r10         ; compare counter with total bytes copied
    BGE r8, copy_done
    PSET r4, r7, r13
    ADD r4, r5
    ADD r14, r5
    JMP copy_loop

copy_done:

; ── Separator lines ───────────────────────────────────────
    LDI r13, 0x444444  ; dark gray separators
    LDI r0, 100       ; separator width

sep1:
    LDI r7, 50
    LDI r4, 5
sep1_loop:
    PSET r4, r7, r13
    ADD r4, r5
    CMP r4, r0
    BLT r8, sep1_loop

sep2:
    LDI r7, 80
    LDI r4, 5
sep2_loop:
    PSET r4, r7, r13
    ADD r4, r5
    CMP r4, r0
    BLT r8, sep2_loop

sep3:
    LDI r7, 110
    LDI r4, 5
sep3_loop:
    PSET r4, r7, r13
    ADD r4, r5
    CMP r4, r0
    BLT r8, sep3_loop

    HALT
