; DESCRIPTION: Draws a red object at the screen with fixed size.

; STRING_OPS_DEMO: Demonstrates STRLEN, STRCMP, STRCPY opcodes
;
; Visual demo showing three string operations with colored indicator bars:
;   Row 1: STRLEN  - "Geometry" with green bar (8 pixels = 8 chars)
;   Row 2: STRCMP  - equal strings show "MATCH" (green bar)
;   Row 3: STRCMP  - different strings show "DIFF" (red bar)
;   Row 4: STRCPY  - copies "Hello" and displays it (blue bar)
;
; Register convention:
;   r1  = CMP result (clobbered by CMP), opcode return value
;   r9  = constant 1 (increment)
;   r6  = loop counter
;   r15  = saved value (length or count)
;   r12 = x coordinate
;   r14 = y coordinate
;   r10 = string address
;   r2, r8, r7 = temps

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
    LDI r6, 0x3000
    LDI r8, 71        ; G
    STORE r6, r8
    LDI r6, 0x3001
    LDI r8, 101       ; e
    STORE r6, r8
    LDI r6, 0x3002
    LDI r8, 111       ; o
    STORE r6, r8
    LDI r6, 0x3003
    LDI r8, 109       ; m
    STORE r6, r8
    LDI r6, 0x3004
    LDI r8, 101       ; e
    STORE r6, r8
    LDI r6, 0x3005
    LDI r8, 116       ; t
    STORE r6, r8
    LDI r6, 0x3006
    LDI r8, 114       ; r
    STORE r6, r8
    LDI r6, 0x3007
    LDI r8, 121       ; y
    STORE r6, r8
    LDI r6, 0x3008
    LDI r8, 0         ; null
    STORE r6, r8

; ── Build "Geometry" at 0x3010 (identical) ────────────────
    LDI r6, 0x3010
    LDI r8, 71
    STORE r6, r8
    LDI r6, 0x3011
    LDI r8, 101
    STORE r6, r8
    LDI r6, 0x3012
    LDI r8, 111
    STORE r6, r8
    LDI r6, 0x3013
    LDI r8, 109
    STORE r6, r8
    LDI r6, 0x3014
    LDI r8, 101
    STORE r6, r8
    LDI r6, 0x3015
    LDI r8, 116
    STORE r6, r8
    LDI r6, 0x3016
    LDI r8, 114
    STORE r6, r8
    LDI r6, 0x3017
    LDI r8, 121
    STORE r6, r8
    LDI r6, 0x3018
    LDI r8, 0
    STORE r6, r8

; ── Build "Hello" at 0x3020 ───────────────────────────────
    LDI r6, 0x3020
    LDI r8, 72        ; H
    STORE r6, r8
    LDI r6, 0x3021
    LDI r8, 101       ; e
    STORE r6, r8
    LDI r6, 0x3022
    LDI r8, 108       ; l
    STORE r6, r8
    LDI r6, 0x3023
    LDI r8, 108       ; l
    STORE r6, r8
    LDI r6, 0x3024
    LDI r8, 111       ; o
    STORE r6, r8
    LDI r6, 0x3025
    LDI r8, 0
    STORE r6, r8

; ── Build "MATCH" at 0x3040 ───────────────────────────────
    LDI r6, 0x3040
    LDI r8, 77        ; M
    STORE r6, r8
    LDI r6, 0x3041
    LDI r8, 65        ; A
    STORE r6, r8
    LDI r6, 0x3042
    LDI r8, 84        ; T
    STORE r6, r8
    LDI r6, 0x3043
    LDI r8, 67        ; C
    STORE r6, r8
    LDI r6, 0x3044
    LDI r8, 72        ; H
    STORE r6, r8
    LDI r6, 0x3045
    LDI r8, 0
    STORE r6, r8

; ── Build "DIFF" at 0x3048 ────────────────────────────────
    LDI r6, 0x3048
    LDI r8, 68        ; D
    STORE r6, r8
    LDI r6, 0x3049
    LDI r8, 73        ; I
    STORE r6, r8
    LDI r6, 0x304A
    LDI r8, 70        ; F
    STORE r6, r8
    LDI r6, 0x304B
    LDI r8, 70        ; F
    STORE r6, r8
    LDI r6, 0x304C
    LDI r8, 0
    STORE r6, r8

; ── Build "String Ops" at 0x3070 ──────────────────────────
    LDI r6, 0x3070
    LDI r8, 83        ; S
    STORE r6, r8
    LDI r6, 0x3071
    LDI r8, 116       ; t
    STORE r6, r8
    LDI r6, 0x3072
    LDI r8, 114       ; r
    STORE r6, r8
    LDI r6, 0x3073
    LDI r8, 105       ; i
    STORE r6, r8
    LDI r6, 0x3074
    LDI r8, 110       ; n
    STORE r6, r8
    LDI r6, 0x3075
    LDI r8, 103       ; g
    STORE r6, r8
    LDI r6, 0x3076
    LDI r8, 32        ; space
    STORE r6, r8
    LDI r6, 0x3077
    LDI r8, 79        ; O
    STORE r6, r8
    LDI r6, 0x3078
    LDI r8, 112       ; p
    STORE r6, r8
    LDI r6, 0x3079
    LDI r8, 115       ; s
    STORE r6, r8
    LDI r6, 0x307A
    LDI r8, 0
    STORE r6, r8

; ── Title bar (yellow, 100 pixels wide) ───────────────────
    LDI r8, 0xFFFF00
    LDI r14, 2
    LDI r12, 5
    LDI r7, 105

title_loop:
    PSET r12, r14, r8
    ADD r12, r9
    CMP r12, r7
    BLT r1, title_loop

; Display title "String Ops" at (10, 5)
    LDI r14, 5
    LDI r12, 10
    LDI r10, 0x3070
    TEXT r12, r14, r10

; ── Test 1: STRLEN ────────────────────────────────────────
; Display "Geometry" at (10, 25)
    LDI r14, 25
    LDI r12, 10
    LDI r10, 0x3000
    TEXT r12, r14, r10

; Get length of "Geometry" -> r1 = 8
    LDI r10, 0x3000
    STRLEN r10

; Save length to r15 (r1 will be clobbered by CMP in loop)
    MOV r15, r1

; Draw green bar: 8 pixels wide at y=38
    LDI r8, 0x00FF00
    LDI r14, 38
    LDI r12, 10
    LDI r6, 0

len_loop:
    CMP r6, r15
    BGE r1, len_done
    PSET r12, r14, r8
    ADD r12, r9
    ADD r6, r9
    JMP len_loop

len_done:

; ── Test 2: STRCMP (equal strings) ────────────────────────
; Compare "Geometry" at 0x3000 with copy at 0x3010
    LDI r10, 0x3000
    LDI r2, 0x3010
    STRCMP r10, r2    ; r1 = 0 (equal)

; Display both strings + "MATCH" at y=55
    LDI r14, 55
    LDI r12, 10
    LDI r10, 0x3000
    TEXT r12, r14, r10

    LDI r12, 85
    LDI r10, 0x3040    ; "MATCH"
    TEXT r12, r14, r10

; Green indicator bar at y=68
    PSETI 10, 68, 0x00FF00
    PSETI 11, 68, 0x00FF00
    PSETI 12, 68, 0x00FF00
    PSETI 13, 68, 0x00FF00
    PSETI 14, 68, 0x00FF00

; ── Test 3: STRCMP (different strings) ────────────────────
; Compare "Geometry" (0x3000) with "Hello" (0x3020)
    LDI r10, 0x3000
    LDI r2, 0x3020
    STRCMP r10, r2    ; r1 = 1 (G > H, so s1 > s2)

; Display both strings + "DIFF" at y=85
    LDI r14, 85
    LDI r12, 10
    LDI r10, 0x3000
    TEXT r12, r14, r10

    LDI r12, 85
    LDI r10, 0x3048    ; "DIFF"
    TEXT r12, r14, r10

; Red indicator bar at y=98
    PSETI 10, 98, 0xFF0000
    PSETI 11, 98, 0xFF0000
    PSETI 12, 98, 0xFF0000
    PSETI 13, 98, 0xFF0000
    PSETI 14, 98, 0xFF0000

; ── Test 4: STRCPY ────────────────────────────────────────
; Copy "Hello" from 0x3020 to 0x3030
    LDI r10, 0x3020    ; source
    LDI r2, 0x3030    ; destination
    STRCPY r10, r2    ; r1 = 6 (bytes copied incl null)

; Save count to r15
    MOV r15, r1

; Display copied string at (10, 115)
    LDI r14, 115
    LDI r12, 10
    LDI r10, 0x3030
    TEXT r12, r14, r10

; Blue bar: 5 pixels (chars) at y=128
    LDI r8, 0x0000FF
    LDI r14, 128
    LDI r12, 10
    LDI r6, 0

copy_loop:
    CMP r6, r15         ; compare counter with total bytes copied
    BGE r1, copy_done
    PSET r12, r14, r8
    ADD r12, r9
    ADD r6, r9
    JMP copy_loop

copy_done:

; ── Separator lines ───────────────────────────────────────
    LDI r8, 0x444444  ; dark gray separators
    LDI r7, 100       ; separator width

sep1:
    LDI r14, 50
    LDI r12, 5
sep1_loop:
    PSET r12, r14, r8
    ADD r12, r9
    CMP r12, r7
    BLT r1, sep1_loop

sep2:
    LDI r14, 80
    LDI r12, 5
sep2_loop:
    PSET r12, r14, r8
    ADD r12, r9
    CMP r12, r7
    BLT r1, sep2_loop

sep3:
    LDI r14, 110
    LDI r12, 5
sep3_loop:
    PSET r12, r14, r8
    ADD r12, r9
    CMP r12, r7
    BLT r1, sep3_loop

    HALT
