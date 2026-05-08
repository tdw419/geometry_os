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
;   r0  = CMP result (clobbered by CMP), opcode return value
;   r8  = constant 1 (increment)
;   r10  = loop counter
;   r5  = saved value (length or count)
;   r14 = x coordinate
;   r6 = y coordinate
;   r3 = string address
;   r7, r9, r15 = temps

; ── RAM Layout ─────────────────────────────────────────────
;   0x3000 = "Geometry" (9 words: 8 chars + null)
;   0x3010 = "Geometry" (identical copy for equal test)
;   0x3020 = "Hello"    (6 words: 5 chars + null)
;   0x3030 = copy destination (STRCPY target)
;   0x3040 = "MATCH"    (6 words: 5 chars + null)
;   0x3048 = "DIFF"     (5 words: 4 chars + null)
;   0x3070 = "String Ops" (11 words: 10 chars + null)

; ── Constants ──────────────────────────────────────────────
    LDI r8, 1           ; increment constant

; ── Build "Geometry" at 0x3000 ────────────────────────────
    LDI r10, 0x3000
    LDI r9, 71        ; G
    STORE r10, r9
    LDI r10, 0x3001
    LDI r9, 101       ; e
    STORE r10, r9
    LDI r10, 0x3002
    LDI r9, 111       ; o
    STORE r10, r9
    LDI r10, 0x3003
    LDI r9, 109       ; m
    STORE r10, r9
    LDI r10, 0x3004
    LDI r9, 101       ; e
    STORE r10, r9
    LDI r10, 0x3005
    LDI r9, 116       ; t
    STORE r10, r9
    LDI r10, 0x3006
    LDI r9, 114       ; r
    STORE r10, r9
    LDI r10, 0x3007
    LDI r9, 121       ; y
    STORE r10, r9
    LDI r10, 0x3008
    LDI r9, 0         ; null
    STORE r10, r9

; ── Build "Geometry" at 0x3010 (identical) ────────────────
    LDI r10, 0x3010
    LDI r9, 71
    STORE r10, r9
    LDI r10, 0x3011
    LDI r9, 101
    STORE r10, r9
    LDI r10, 0x3012
    LDI r9, 111
    STORE r10, r9
    LDI r10, 0x3013
    LDI r9, 109
    STORE r10, r9
    LDI r10, 0x3014
    LDI r9, 101
    STORE r10, r9
    LDI r10, 0x3015
    LDI r9, 116
    STORE r10, r9
    LDI r10, 0x3016
    LDI r9, 114
    STORE r10, r9
    LDI r10, 0x3017
    LDI r9, 121
    STORE r10, r9
    LDI r10, 0x3018
    LDI r9, 0
    STORE r10, r9

; ── Build "Hello" at 0x3020 ───────────────────────────────
    LDI r10, 0x3020
    LDI r9, 72        ; H
    STORE r10, r9
    LDI r10, 0x3021
    LDI r9, 101       ; e
    STORE r10, r9
    LDI r10, 0x3022
    LDI r9, 108       ; l
    STORE r10, r9
    LDI r10, 0x3023
    LDI r9, 108       ; l
    STORE r10, r9
    LDI r10, 0x3024
    LDI r9, 111       ; o
    STORE r10, r9
    LDI r10, 0x3025
    LDI r9, 0
    STORE r10, r9

; ── Build "MATCH" at 0x3040 ───────────────────────────────
    LDI r10, 0x3040
    LDI r9, 77        ; M
    STORE r10, r9
    LDI r10, 0x3041
    LDI r9, 65        ; A
    STORE r10, r9
    LDI r10, 0x3042
    LDI r9, 84        ; T
    STORE r10, r9
    LDI r10, 0x3043
    LDI r9, 67        ; C
    STORE r10, r9
    LDI r10, 0x3044
    LDI r9, 72        ; H
    STORE r10, r9
    LDI r10, 0x3045
    LDI r9, 0
    STORE r10, r9

; ── Build "DIFF" at 0x3048 ────────────────────────────────
    LDI r10, 0x3048
    LDI r9, 68        ; D
    STORE r10, r9
    LDI r10, 0x3049
    LDI r9, 73        ; I
    STORE r10, r9
    LDI r10, 0x304A
    LDI r9, 70        ; F
    STORE r10, r9
    LDI r10, 0x304B
    LDI r9, 70        ; F
    STORE r10, r9
    LDI r10, 0x304C
    LDI r9, 0
    STORE r10, r9

; ── Build "String Ops" at 0x3070 ──────────────────────────
    LDI r10, 0x3070
    LDI r9, 83        ; S
    STORE r10, r9
    LDI r10, 0x3071
    LDI r9, 116       ; t
    STORE r10, r9
    LDI r10, 0x3072
    LDI r9, 114       ; r
    STORE r10, r9
    LDI r10, 0x3073
    LDI r9, 105       ; i
    STORE r10, r9
    LDI r10, 0x3074
    LDI r9, 110       ; n
    STORE r10, r9
    LDI r10, 0x3075
    LDI r9, 103       ; g
    STORE r10, r9
    LDI r10, 0x3076
    LDI r9, 32        ; space
    STORE r10, r9
    LDI r10, 0x3077
    LDI r9, 79        ; O
    STORE r10, r9
    LDI r10, 0x3078
    LDI r9, 112       ; p
    STORE r10, r9
    LDI r10, 0x3079
    LDI r9, 115       ; s
    STORE r10, r9
    LDI r10, 0x307A
    LDI r9, 0
    STORE r10, r9

; ── Title bar (yellow, 100 pixels wide) ───────────────────
    LDI r9, 0xFFFF00
    LDI r6, 2
    LDI r14, 5
    LDI r15, 105

title_loop:
    PSET r14, r6, r9
    ADD r14, r8
    CMP r14, r15
    BLT r0, title_loop

; Display title "String Ops" at (10, 5)
    LDI r6, 5
    LDI r14, 10
    LDI r3, 0x3070
    TEXT r14, r6, r3

; ── Test 1: STRLEN ────────────────────────────────────────
; Display "Geometry" at (10, 25)
    LDI r6, 25
    LDI r14, 10
    LDI r3, 0x3000
    TEXT r14, r6, r3

; Get length of "Geometry" -> r0 = 8
    LDI r3, 0x3000
    STRLEN r3

; Save length to r5 (r0 will be clobbered by CMP in loop)
    MOV r5, r0

; Draw green bar: 8 pixels wide at y=38
    LDI r9, 0x00FF00
    LDI r6, 38
    LDI r14, 10
    LDI r10, 0

len_loop:
    CMP r10, r5
    BGE r0, len_done
    PSET r14, r6, r9
    ADD r14, r8
    ADD r10, r8
    JMP len_loop

len_done:

; ── Test 2: STRCMP (equal strings) ────────────────────────
; Compare "Geometry" at 0x3000 with copy at 0x3010
    LDI r3, 0x3000
    LDI r7, 0x3010
    STRCMP r3, r7    ; r0 = 0 (equal)

; Display both strings + "MATCH" at y=55
    LDI r6, 55
    LDI r14, 10
    LDI r3, 0x3000
    TEXT r14, r6, r3

    LDI r14, 85
    LDI r3, 0x3040    ; "MATCH"
    TEXT r14, r6, r3

; Green indicator bar at y=68
    PSETI 10, 68, 0x00FF00
    PSETI 11, 68, 0x00FF00
    PSETI 12, 68, 0x00FF00
    PSETI 13, 68, 0x00FF00
    PSETI 14, 68, 0x00FF00

; ── Test 3: STRCMP (different strings) ────────────────────
; Compare "Geometry" (0x3000) with "Hello" (0x3020)
    LDI r3, 0x3000
    LDI r7, 0x3020
    STRCMP r3, r7    ; r0 = 1 (G > H, so s1 > s2)

; Display both strings + "DIFF" at y=85
    LDI r6, 85
    LDI r14, 10
    LDI r3, 0x3000
    TEXT r14, r6, r3

    LDI r14, 85
    LDI r3, 0x3048    ; "DIFF"
    TEXT r14, r6, r3

; Red indicator bar at y=98
    PSETI 10, 98, 0xFF0000
    PSETI 11, 98, 0xFF0000
    PSETI 12, 98, 0xFF0000
    PSETI 13, 98, 0xFF0000
    PSETI 14, 98, 0xFF0000

; ── Test 4: STRCPY ────────────────────────────────────────
; Copy "Hello" from 0x3020 to 0x3030
    LDI r3, 0x3020    ; source
    LDI r7, 0x3030    ; destination
    STRCPY r3, r7    ; r0 = 6 (bytes copied incl null)

; Save count to r5
    MOV r5, r0

; Display copied string at (10, 115)
    LDI r6, 115
    LDI r14, 10
    LDI r3, 0x3030
    TEXT r14, r6, r3

; Blue bar: 5 pixels (chars) at y=128
    LDI r9, 0x0000FF
    LDI r6, 128
    LDI r14, 10
    LDI r10, 0

copy_loop:
    CMP r10, r5         ; compare counter with total bytes copied
    BGE r0, copy_done
    PSET r14, r6, r9
    ADD r14, r8
    ADD r10, r8
    JMP copy_loop

copy_done:

; ── Separator lines ───────────────────────────────────────
    LDI r9, 0x444444  ; dark gray separators
    LDI r15, 100       ; separator width

sep1:
    LDI r6, 50
    LDI r14, 5
sep1_loop:
    PSET r14, r6, r9
    ADD r14, r8
    CMP r14, r15
    BLT r0, sep1_loop

sep2:
    LDI r6, 80
    LDI r14, 5
sep2_loop:
    PSET r14, r6, r9
    ADD r14, r8
    CMP r14, r15
    BLT r0, sep2_loop

sep3:
    LDI r6, 110
    LDI r14, 5
sep3_loop:
    PSET r14, r6, r9
    ADD r14, r8
    CMP r14, r15
    BLT r0, sep3_loop

    HALT
