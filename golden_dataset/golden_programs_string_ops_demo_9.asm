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
;   r7  = CMP result (clobbered by CMP), opcode return value
;   r2  = constant 1 (increment)
;   r12  = loop counter
;   r4  = saved value (length or count)
;   r10 = x coordinate
;   r6 = y coordinate
;   r13 = string address
;   r5, r15, r3 = temps

; ── RAM Layout ─────────────────────────────────────────────
;   0x3000 = "Geometry" (9 words: 8 chars + null)
;   0x3010 = "Geometry" (identical copy for equal test)
;   0x3020 = "Hello"    (6 words: 5 chars + null)
;   0x3030 = copy destination (STRCPY target)
;   0x3040 = "MATCH"    (6 words: 5 chars + null)
;   0x3048 = "DIFF"     (5 words: 4 chars + null)
;   0x3070 = "String Ops" (11 words: 10 chars + null)

; ── Constants ──────────────────────────────────────────────
    LDI r2, 1           ; increment constant

; ── Build "Geometry" at 0x3000 ────────────────────────────
    LDI r12, 0x3000
    LDI r15, 71        ; G
    STORE r12, r15
    LDI r12, 0x3001
    LDI r15, 101       ; e
    STORE r12, r15
    LDI r12, 0x3002
    LDI r15, 111       ; o
    STORE r12, r15
    LDI r12, 0x3003
    LDI r15, 109       ; m
    STORE r12, r15
    LDI r12, 0x3004
    LDI r15, 101       ; e
    STORE r12, r15
    LDI r12, 0x3005
    LDI r15, 116       ; t
    STORE r12, r15
    LDI r12, 0x3006
    LDI r15, 114       ; r
    STORE r12, r15
    LDI r12, 0x3007
    LDI r15, 121       ; y
    STORE r12, r15
    LDI r12, 0x3008
    LDI r15, 0         ; null
    STORE r12, r15

; ── Build "Geometry" at 0x3010 (identical) ────────────────
    LDI r12, 0x3010
    LDI r15, 71
    STORE r12, r15
    LDI r12, 0x3011
    LDI r15, 101
    STORE r12, r15
    LDI r12, 0x3012
    LDI r15, 111
    STORE r12, r15
    LDI r12, 0x3013
    LDI r15, 109
    STORE r12, r15
    LDI r12, 0x3014
    LDI r15, 101
    STORE r12, r15
    LDI r12, 0x3015
    LDI r15, 116
    STORE r12, r15
    LDI r12, 0x3016
    LDI r15, 114
    STORE r12, r15
    LDI r12, 0x3017
    LDI r15, 121
    STORE r12, r15
    LDI r12, 0x3018
    LDI r15, 0
    STORE r12, r15

; ── Build "Hello" at 0x3020 ───────────────────────────────
    LDI r12, 0x3020
    LDI r15, 72        ; H
    STORE r12, r15
    LDI r12, 0x3021
    LDI r15, 101       ; e
    STORE r12, r15
    LDI r12, 0x3022
    LDI r15, 108       ; l
    STORE r12, r15
    LDI r12, 0x3023
    LDI r15, 108       ; l
    STORE r12, r15
    LDI r12, 0x3024
    LDI r15, 111       ; o
    STORE r12, r15
    LDI r12, 0x3025
    LDI r15, 0
    STORE r12, r15

; ── Build "MATCH" at 0x3040 ───────────────────────────────
    LDI r12, 0x3040
    LDI r15, 77        ; M
    STORE r12, r15
    LDI r12, 0x3041
    LDI r15, 65        ; A
    STORE r12, r15
    LDI r12, 0x3042
    LDI r15, 84        ; T
    STORE r12, r15
    LDI r12, 0x3043
    LDI r15, 67        ; C
    STORE r12, r15
    LDI r12, 0x3044
    LDI r15, 72        ; H
    STORE r12, r15
    LDI r12, 0x3045
    LDI r15, 0
    STORE r12, r15

; ── Build "DIFF" at 0x3048 ────────────────────────────────
    LDI r12, 0x3048
    LDI r15, 68        ; D
    STORE r12, r15
    LDI r12, 0x3049
    LDI r15, 73        ; I
    STORE r12, r15
    LDI r12, 0x304A
    LDI r15, 70        ; F
    STORE r12, r15
    LDI r12, 0x304B
    LDI r15, 70        ; F
    STORE r12, r15
    LDI r12, 0x304C
    LDI r15, 0
    STORE r12, r15

; ── Build "String Ops" at 0x3070 ──────────────────────────
    LDI r12, 0x3070
    LDI r15, 83        ; S
    STORE r12, r15
    LDI r12, 0x3071
    LDI r15, 116       ; t
    STORE r12, r15
    LDI r12, 0x3072
    LDI r15, 114       ; r
    STORE r12, r15
    LDI r12, 0x3073
    LDI r15, 105       ; i
    STORE r12, r15
    LDI r12, 0x3074
    LDI r15, 110       ; n
    STORE r12, r15
    LDI r12, 0x3075
    LDI r15, 103       ; g
    STORE r12, r15
    LDI r12, 0x3076
    LDI r15, 32        ; space
    STORE r12, r15
    LDI r12, 0x3077
    LDI r15, 79        ; O
    STORE r12, r15
    LDI r12, 0x3078
    LDI r15, 112       ; p
    STORE r12, r15
    LDI r12, 0x3079
    LDI r15, 115       ; s
    STORE r12, r15
    LDI r12, 0x307A
    LDI r15, 0
    STORE r12, r15

; ── Title bar (yellow, 100 pixels wide) ───────────────────
    LDI r15, 0xFFFF00
    LDI r6, 2
    LDI r10, 5
    LDI r3, 105

title_loop:
    PSET r10, r6, r15
    ADD r10, r2
    CMP r10, r3
    BLT r7, title_loop

; Display title "String Ops" at (10, 5)
    LDI r6, 5
    LDI r10, 10
    LDI r13, 0x3070
    TEXT r10, r6, r13

; ── Test 1: STRLEN ────────────────────────────────────────
; Display "Geometry" at (10, 25)
    LDI r6, 25
    LDI r10, 10
    LDI r13, 0x3000
    TEXT r10, r6, r13

; Get length of "Geometry" -> r7 = 8
    LDI r13, 0x3000
    STRLEN r13

; Save length to r4 (r7 will be clobbered by CMP in loop)
    MOV r4, r7

; Draw green bar: 8 pixels wide at y=38
    LDI r15, 0x00FF00
    LDI r6, 38
    LDI r10, 10
    LDI r12, 0

len_loop:
    CMP r12, r4
    BGE r7, len_done
    PSET r10, r6, r15
    ADD r10, r2
    ADD r12, r2
    JMP len_loop

len_done:

; ── Test 2: STRCMP (equal strings) ────────────────────────
; Compare "Geometry" at 0x3000 with copy at 0x3010
    LDI r13, 0x3000
    LDI r5, 0x3010
    STRCMP r13, r5    ; r7 = 0 (equal)

; Display both strings + "MATCH" at y=55
    LDI r6, 55
    LDI r10, 10
    LDI r13, 0x3000
    TEXT r10, r6, r13

    LDI r10, 85
    LDI r13, 0x3040    ; "MATCH"
    TEXT r10, r6, r13

; Green indicator bar at y=68
    PSETI 10, 68, 0x00FF00
    PSETI 11, 68, 0x00FF00
    PSETI 12, 68, 0x00FF00
    PSETI 13, 68, 0x00FF00
    PSETI 14, 68, 0x00FF00

; ── Test 3: STRCMP (different strings) ────────────────────
; Compare "Geometry" (0x3000) with "Hello" (0x3020)
    LDI r13, 0x3000
    LDI r5, 0x3020
    STRCMP r13, r5    ; r7 = 1 (G > H, so s1 > s2)

; Display both strings + "DIFF" at y=85
    LDI r6, 85
    LDI r10, 10
    LDI r13, 0x3000
    TEXT r10, r6, r13

    LDI r10, 85
    LDI r13, 0x3048    ; "DIFF"
    TEXT r10, r6, r13

; Red indicator bar at y=98
    PSETI 10, 98, 0xFF0000
    PSETI 11, 98, 0xFF0000
    PSETI 12, 98, 0xFF0000
    PSETI 13, 98, 0xFF0000
    PSETI 14, 98, 0xFF0000

; ── Test 4: STRCPY ────────────────────────────────────────
; Copy "Hello" from 0x3020 to 0x3030
    LDI r13, 0x3020    ; source
    LDI r5, 0x3030    ; destination
    STRCPY r13, r5    ; r7 = 6 (bytes copied incl null)

; Save count to r4
    MOV r4, r7

; Display copied string at (10, 115)
    LDI r6, 115
    LDI r10, 10
    LDI r13, 0x3030
    TEXT r10, r6, r13

; Blue bar: 5 pixels (chars) at y=128
    LDI r15, 0x0000FF
    LDI r6, 128
    LDI r10, 10
    LDI r12, 0

copy_loop:
    CMP r12, r4         ; compare counter with total bytes copied
    BGE r7, copy_done
    PSET r10, r6, r15
    ADD r10, r2
    ADD r12, r2
    JMP copy_loop

copy_done:

; ── Separator lines ───────────────────────────────────────
    LDI r15, 0x444444  ; dark gray separators
    LDI r3, 100       ; separator width

sep1:
    LDI r6, 50
    LDI r10, 5
sep1_loop:
    PSET r10, r6, r15
    ADD r10, r2
    CMP r10, r3
    BLT r7, sep1_loop

sep2:
    LDI r6, 80
    LDI r10, 5
sep2_loop:
    PSET r10, r6, r15
    ADD r10, r2
    CMP r10, r3
    BLT r7, sep2_loop

sep3:
    LDI r6, 110
    LDI r10, 5
sep3_loop:
    PSET r10, r6, r15
    ADD r10, r2
    CMP r10, r3
    BLT r7, sep3_loop

    HALT
