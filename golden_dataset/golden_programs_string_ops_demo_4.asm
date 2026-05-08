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
;   r14  = CMP result (clobbered by CMP), opcode return value
;   r3  = constant 1 (increment)
;   r7  = loop counter
;   r11  = saved value (length or count)
;   r15 = x coordinate
;   r6 = y coordinate
;   r9 = string address
;   r1, r12, r5 = temps

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
    LDI r7, 0x3000
    LDI r12, 71        ; G
    STORE r7, r12
    LDI r7, 0x3001
    LDI r12, 101       ; e
    STORE r7, r12
    LDI r7, 0x3002
    LDI r12, 111       ; o
    STORE r7, r12
    LDI r7, 0x3003
    LDI r12, 109       ; m
    STORE r7, r12
    LDI r7, 0x3004
    LDI r12, 101       ; e
    STORE r7, r12
    LDI r7, 0x3005
    LDI r12, 116       ; t
    STORE r7, r12
    LDI r7, 0x3006
    LDI r12, 114       ; r
    STORE r7, r12
    LDI r7, 0x3007
    LDI r12, 121       ; y
    STORE r7, r12
    LDI r7, 0x3008
    LDI r12, 0         ; null
    STORE r7, r12

; ── Build "Geometry" at 0x3010 (identical) ────────────────
    LDI r7, 0x3010
    LDI r12, 71
    STORE r7, r12
    LDI r7, 0x3011
    LDI r12, 101
    STORE r7, r12
    LDI r7, 0x3012
    LDI r12, 111
    STORE r7, r12
    LDI r7, 0x3013
    LDI r12, 109
    STORE r7, r12
    LDI r7, 0x3014
    LDI r12, 101
    STORE r7, r12
    LDI r7, 0x3015
    LDI r12, 116
    STORE r7, r12
    LDI r7, 0x3016
    LDI r12, 114
    STORE r7, r12
    LDI r7, 0x3017
    LDI r12, 121
    STORE r7, r12
    LDI r7, 0x3018
    LDI r12, 0
    STORE r7, r12

; ── Build "Hello" at 0x3020 ───────────────────────────────
    LDI r7, 0x3020
    LDI r12, 72        ; H
    STORE r7, r12
    LDI r7, 0x3021
    LDI r12, 101       ; e
    STORE r7, r12
    LDI r7, 0x3022
    LDI r12, 108       ; l
    STORE r7, r12
    LDI r7, 0x3023
    LDI r12, 108       ; l
    STORE r7, r12
    LDI r7, 0x3024
    LDI r12, 111       ; o
    STORE r7, r12
    LDI r7, 0x3025
    LDI r12, 0
    STORE r7, r12

; ── Build "MATCH" at 0x3040 ───────────────────────────────
    LDI r7, 0x3040
    LDI r12, 77        ; M
    STORE r7, r12
    LDI r7, 0x3041
    LDI r12, 65        ; A
    STORE r7, r12
    LDI r7, 0x3042
    LDI r12, 84        ; T
    STORE r7, r12
    LDI r7, 0x3043
    LDI r12, 67        ; C
    STORE r7, r12
    LDI r7, 0x3044
    LDI r12, 72        ; H
    STORE r7, r12
    LDI r7, 0x3045
    LDI r12, 0
    STORE r7, r12

; ── Build "DIFF" at 0x3048 ────────────────────────────────
    LDI r7, 0x3048
    LDI r12, 68        ; D
    STORE r7, r12
    LDI r7, 0x3049
    LDI r12, 73        ; I
    STORE r7, r12
    LDI r7, 0x304A
    LDI r12, 70        ; F
    STORE r7, r12
    LDI r7, 0x304B
    LDI r12, 70        ; F
    STORE r7, r12
    LDI r7, 0x304C
    LDI r12, 0
    STORE r7, r12

; ── Build "String Ops" at 0x3070 ──────────────────────────
    LDI r7, 0x3070
    LDI r12, 83        ; S
    STORE r7, r12
    LDI r7, 0x3071
    LDI r12, 116       ; t
    STORE r7, r12
    LDI r7, 0x3072
    LDI r12, 114       ; r
    STORE r7, r12
    LDI r7, 0x3073
    LDI r12, 105       ; i
    STORE r7, r12
    LDI r7, 0x3074
    LDI r12, 110       ; n
    STORE r7, r12
    LDI r7, 0x3075
    LDI r12, 103       ; g
    STORE r7, r12
    LDI r7, 0x3076
    LDI r12, 32        ; space
    STORE r7, r12
    LDI r7, 0x3077
    LDI r12, 79        ; O
    STORE r7, r12
    LDI r7, 0x3078
    LDI r12, 112       ; p
    STORE r7, r12
    LDI r7, 0x3079
    LDI r12, 115       ; s
    STORE r7, r12
    LDI r7, 0x307A
    LDI r12, 0
    STORE r7, r12

; ── Title bar (yellow, 100 pixels wide) ───────────────────
    LDI r12, 0xFFFF00
    LDI r6, 2
    LDI r15, 5
    LDI r5, 105

title_loop:
    PSET r15, r6, r12
    ADD r15, r3
    CMP r15, r5
    BLT r14, title_loop

; Display title "String Ops" at (10, 5)
    LDI r6, 5
    LDI r15, 10
    LDI r9, 0x3070
    TEXT r15, r6, r9

; ── Test 1: STRLEN ────────────────────────────────────────
; Display "Geometry" at (10, 25)
    LDI r6, 25
    LDI r15, 10
    LDI r9, 0x3000
    TEXT r15, r6, r9

; Get length of "Geometry" -> r14 = 8
    LDI r9, 0x3000
    STRLEN r9

; Save length to r11 (r14 will be clobbered by CMP in loop)
    MOV r11, r14

; Draw green bar: 8 pixels wide at y=38
    LDI r12, 0x00FF00
    LDI r6, 38
    LDI r15, 10
    LDI r7, 0

len_loop:
    CMP r7, r11
    BGE r14, len_done
    PSET r15, r6, r12
    ADD r15, r3
    ADD r7, r3
    JMP len_loop

len_done:

; ── Test 2: STRCMP (equal strings) ────────────────────────
; Compare "Geometry" at 0x3000 with copy at 0x3010
    LDI r9, 0x3000
    LDI r1, 0x3010
    STRCMP r9, r1    ; r14 = 0 (equal)

; Display both strings + "MATCH" at y=55
    LDI r6, 55
    LDI r15, 10
    LDI r9, 0x3000
    TEXT r15, r6, r9

    LDI r15, 85
    LDI r9, 0x3040    ; "MATCH"
    TEXT r15, r6, r9

; Green indicator bar at y=68
    PSETI 10, 68, 0x00FF00
    PSETI 11, 68, 0x00FF00
    PSETI 12, 68, 0x00FF00
    PSETI 13, 68, 0x00FF00
    PSETI 14, 68, 0x00FF00

; ── Test 3: STRCMP (different strings) ────────────────────
; Compare "Geometry" (0x3000) with "Hello" (0x3020)
    LDI r9, 0x3000
    LDI r1, 0x3020
    STRCMP r9, r1    ; r14 = 1 (G > H, so s1 > s2)

; Display both strings + "DIFF" at y=85
    LDI r6, 85
    LDI r15, 10
    LDI r9, 0x3000
    TEXT r15, r6, r9

    LDI r15, 85
    LDI r9, 0x3048    ; "DIFF"
    TEXT r15, r6, r9

; Red indicator bar at y=98
    PSETI 10, 98, 0xFF0000
    PSETI 11, 98, 0xFF0000
    PSETI 12, 98, 0xFF0000
    PSETI 13, 98, 0xFF0000
    PSETI 14, 98, 0xFF0000

; ── Test 4: STRCPY ────────────────────────────────────────
; Copy "Hello" from 0x3020 to 0x3030
    LDI r9, 0x3020    ; source
    LDI r1, 0x3030    ; destination
    STRCPY r9, r1    ; r14 = 6 (bytes copied incl null)

; Save count to r11
    MOV r11, r14

; Display copied string at (10, 115)
    LDI r6, 115
    LDI r15, 10
    LDI r9, 0x3030
    TEXT r15, r6, r9

; Blue bar: 5 pixels (chars) at y=128
    LDI r12, 0x0000FF
    LDI r6, 128
    LDI r15, 10
    LDI r7, 0

copy_loop:
    CMP r7, r11         ; compare counter with total bytes copied
    BGE r14, copy_done
    PSET r15, r6, r12
    ADD r15, r3
    ADD r7, r3
    JMP copy_loop

copy_done:

; ── Separator lines ───────────────────────────────────────
    LDI r12, 0x444444  ; dark gray separators
    LDI r5, 100       ; separator width

sep1:
    LDI r6, 50
    LDI r15, 5
sep1_loop:
    PSET r15, r6, r12
    ADD r15, r3
    CMP r15, r5
    BLT r14, sep1_loop

sep2:
    LDI r6, 80
    LDI r15, 5
sep2_loop:
    PSET r15, r6, r12
    ADD r15, r3
    CMP r15, r5
    BLT r14, sep2_loop

sep3:
    LDI r6, 110
    LDI r15, 5
sep3_loop:
    PSET r15, r6, r12
    ADD r15, r3
    CMP r15, r5
    BLT r14, sep3_loop

    HALT
