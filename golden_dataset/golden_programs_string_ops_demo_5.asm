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
;   r15  = CMP result (clobbered by CMP), opcode return value
;   r3  = constant 1 (increment)
;   r2  = loop counter
;   r8  = saved value (length or count)
;   r6 = x coordinate
;   r1 = y coordinate
;   r5 = string address
;   r0, r12, r7 = temps

; ── RAM Layout ─────────────────────────────────────────────
;   0x3000 = "Geometry" (9 words: 8 chars + null)
;   0x3010 = "Geometry" (identical copy for equal test)
;   0x3020 = "Hello"    (6 words: 5 chars + null)
;   0x3030 = copy destination (STRCPY target)
;   0x3040 = "MATCH"    (6 words: 5 chars + null)
;   0x3048 = "DIFF"     (5 words: 4 chars + null)
;   0x3070 = "String Ops" (11 words: 10 chars + null)

; ── Constants ──────────────────────────────────────────────
    LDI r3, 1           ; increment constant

; ── Build "Geometry" at 0x3000 ────────────────────────────
    LDI r2, 0x3000
    LDI r12, 71        ; G
    STORE r2, r12
    LDI r2, 0x3001
    LDI r12, 101       ; e
    STORE r2, r12
    LDI r2, 0x3002
    LDI r12, 111       ; o
    STORE r2, r12
    LDI r2, 0x3003
    LDI r12, 109       ; m
    STORE r2, r12
    LDI r2, 0x3004
    LDI r12, 101       ; e
    STORE r2, r12
    LDI r2, 0x3005
    LDI r12, 116       ; t
    STORE r2, r12
    LDI r2, 0x3006
    LDI r12, 114       ; r
    STORE r2, r12
    LDI r2, 0x3007
    LDI r12, 121       ; y
    STORE r2, r12
    LDI r2, 0x3008
    LDI r12, 0         ; null
    STORE r2, r12

; ── Build "Geometry" at 0x3010 (identical) ────────────────
    LDI r2, 0x3010
    LDI r12, 71
    STORE r2, r12
    LDI r2, 0x3011
    LDI r12, 101
    STORE r2, r12
    LDI r2, 0x3012
    LDI r12, 111
    STORE r2, r12
    LDI r2, 0x3013
    LDI r12, 109
    STORE r2, r12
    LDI r2, 0x3014
    LDI r12, 101
    STORE r2, r12
    LDI r2, 0x3015
    LDI r12, 116
    STORE r2, r12
    LDI r2, 0x3016
    LDI r12, 114
    STORE r2, r12
    LDI r2, 0x3017
    LDI r12, 121
    STORE r2, r12
    LDI r2, 0x3018
    LDI r12, 0
    STORE r2, r12

; ── Build "Hello" at 0x3020 ───────────────────────────────
    LDI r2, 0x3020
    LDI r12, 72        ; H
    STORE r2, r12
    LDI r2, 0x3021
    LDI r12, 101       ; e
    STORE r2, r12
    LDI r2, 0x3022
    LDI r12, 108       ; l
    STORE r2, r12
    LDI r2, 0x3023
    LDI r12, 108       ; l
    STORE r2, r12
    LDI r2, 0x3024
    LDI r12, 111       ; o
    STORE r2, r12
    LDI r2, 0x3025
    LDI r12, 0
    STORE r2, r12

; ── Build "MATCH" at 0x3040 ───────────────────────────────
    LDI r2, 0x3040
    LDI r12, 77        ; M
    STORE r2, r12
    LDI r2, 0x3041
    LDI r12, 65        ; A
    STORE r2, r12
    LDI r2, 0x3042
    LDI r12, 84        ; T
    STORE r2, r12
    LDI r2, 0x3043
    LDI r12, 67        ; C
    STORE r2, r12
    LDI r2, 0x3044
    LDI r12, 72        ; H
    STORE r2, r12
    LDI r2, 0x3045
    LDI r12, 0
    STORE r2, r12

; ── Build "DIFF" at 0x3048 ────────────────────────────────
    LDI r2, 0x3048
    LDI r12, 68        ; D
    STORE r2, r12
    LDI r2, 0x3049
    LDI r12, 73        ; I
    STORE r2, r12
    LDI r2, 0x304A
    LDI r12, 70        ; F
    STORE r2, r12
    LDI r2, 0x304B
    LDI r12, 70        ; F
    STORE r2, r12
    LDI r2, 0x304C
    LDI r12, 0
    STORE r2, r12

; ── Build "String Ops" at 0x3070 ──────────────────────────
    LDI r2, 0x3070
    LDI r12, 83        ; S
    STORE r2, r12
    LDI r2, 0x3071
    LDI r12, 116       ; t
    STORE r2, r12
    LDI r2, 0x3072
    LDI r12, 114       ; r
    STORE r2, r12
    LDI r2, 0x3073
    LDI r12, 105       ; i
    STORE r2, r12
    LDI r2, 0x3074
    LDI r12, 110       ; n
    STORE r2, r12
    LDI r2, 0x3075
    LDI r12, 103       ; g
    STORE r2, r12
    LDI r2, 0x3076
    LDI r12, 32        ; space
    STORE r2, r12
    LDI r2, 0x3077
    LDI r12, 79        ; O
    STORE r2, r12
    LDI r2, 0x3078
    LDI r12, 112       ; p
    STORE r2, r12
    LDI r2, 0x3079
    LDI r12, 115       ; s
    STORE r2, r12
    LDI r2, 0x307A
    LDI r12, 0
    STORE r2, r12

; ── Title bar (yellow, 100 pixels wide) ───────────────────
    LDI r12, 0xFFFF00
    LDI r1, 2
    LDI r6, 5
    LDI r7, 105

title_loop:
    PSET r6, r1, r12
    ADD r6, r3
    CMP r6, r7
    BLT r15, title_loop

; Display title "String Ops" at (10, 5)
    LDI r1, 5
    LDI r6, 10
    LDI r5, 0x3070
    TEXT r6, r1, r5

; ── Test 1: STRLEN ────────────────────────────────────────
; Display "Geometry" at (10, 25)
    LDI r1, 25
    LDI r6, 10
    LDI r5, 0x3000
    TEXT r6, r1, r5

; Get length of "Geometry" -> r15 = 8
    LDI r5, 0x3000
    STRLEN r5

; Save length to r8 (r15 will be clobbered by CMP in loop)
    MOV r8, r15

; Draw green bar: 8 pixels wide at y=38
    LDI r12, 0x00FF00
    LDI r1, 38
    LDI r6, 10
    LDI r2, 0

len_loop:
    CMP r2, r8
    BGE r15, len_done
    PSET r6, r1, r12
    ADD r6, r3
    ADD r2, r3
    JMP len_loop

len_done:

; ── Test 2: STRCMP (equal strings) ────────────────────────
; Compare "Geometry" at 0x3000 with copy at 0x3010
    LDI r5, 0x3000
    LDI r0, 0x3010
    STRCMP r5, r0    ; r15 = 0 (equal)

; Display both strings + "MATCH" at y=55
    LDI r1, 55
    LDI r6, 10
    LDI r5, 0x3000
    TEXT r6, r1, r5

    LDI r6, 85
    LDI r5, 0x3040    ; "MATCH"
    TEXT r6, r1, r5

; Green indicator bar at y=68
    PSETI 10, 68, 0x00FF00
    PSETI 11, 68, 0x00FF00
    PSETI 12, 68, 0x00FF00
    PSETI 13, 68, 0x00FF00
    PSETI 14, 68, 0x00FF00

; ── Test 3: STRCMP (different strings) ────────────────────
; Compare "Geometry" (0x3000) with "Hello" (0x3020)
    LDI r5, 0x3000
    LDI r0, 0x3020
    STRCMP r5, r0    ; r15 = 1 (G > H, so s1 > s2)

; Display both strings + "DIFF" at y=85
    LDI r1, 85
    LDI r6, 10
    LDI r5, 0x3000
    TEXT r6, r1, r5

    LDI r6, 85
    LDI r5, 0x3048    ; "DIFF"
    TEXT r6, r1, r5

; Red indicator bar at y=98
    PSETI 10, 98, 0xFF0000
    PSETI 11, 98, 0xFF0000
    PSETI 12, 98, 0xFF0000
    PSETI 13, 98, 0xFF0000
    PSETI 14, 98, 0xFF0000

; ── Test 4: STRCPY ────────────────────────────────────────
; Copy "Hello" from 0x3020 to 0x3030
    LDI r5, 0x3020    ; source
    LDI r0, 0x3030    ; destination
    STRCPY r5, r0    ; r15 = 6 (bytes copied incl null)

; Save count to r8
    MOV r8, r15

; Display copied string at (10, 115)
    LDI r1, 115
    LDI r6, 10
    LDI r5, 0x3030
    TEXT r6, r1, r5

; Blue bar: 5 pixels (chars) at y=128
    LDI r12, 0x0000FF
    LDI r1, 128
    LDI r6, 10
    LDI r2, 0

copy_loop:
    CMP r2, r8         ; compare counter with total bytes copied
    BGE r15, copy_done
    PSET r6, r1, r12
    ADD r6, r3
    ADD r2, r3
    JMP copy_loop

copy_done:

; ── Separator lines ───────────────────────────────────────
    LDI r12, 0x444444  ; dark gray separators
    LDI r7, 100       ; separator width

sep1:
    LDI r1, 50
    LDI r6, 5
sep1_loop:
    PSET r6, r1, r12
    ADD r6, r3
    CMP r6, r7
    BLT r15, sep1_loop

sep2:
    LDI r1, 80
    LDI r6, 5
sep2_loop:
    PSET r6, r1, r12
    ADD r6, r3
    CMP r6, r7
    BLT r15, sep2_loop

sep3:
    LDI r1, 110
    LDI r6, 5
sep3_loop:
    PSET r6, r1, r12
    ADD r6, r3
    CMP r6, r7
    BLT r15, sep3_loop

    HALT
