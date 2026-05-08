; DESCRIPTION: Draw object: pos=the screen, color=red, size=fixed size.

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
;   r12  = constant 1 (increment)
;   r4  = loop counter
;   r10  = saved value (length or count)
;   r15 = x coordinate
;   r11 = y coordinate
;   r8 = string address
;   r3, r13, r0 = temps

; ── RAM Layout ─────────────────────────────────────────────
;   0x3000 = "Geometry" (9 words: 8 chars + null)
;   0x3010 = "Geometry" (identical copy for equal test)
;   0x3020 = "Hello"    (6 words: 5 chars + null)
;   0x3030 = copy destination (STRCPY target)
;   0x3040 = "MATCH"    (6 words: 5 chars + null)
;   0x3048 = "DIFF"     (5 words: 4 chars + null)
;   0x3070 = "String Ops" (11 words: 10 chars + null)

; ── Constants ──────────────────────────────────────────────
    LDI r12, 1           ; increment constant

; ── Build "Geometry" at 0x3000 ────────────────────────────
    LDI r4, 0x3000
    LDI r13, 71        ; G
    STORE r4, r13
    LDI r4, 0x3001
    LDI r13, 101       ; e
    STORE r4, r13
    LDI r4, 0x3002
    LDI r13, 111       ; o
    STORE r4, r13
    LDI r4, 0x3003
    LDI r13, 109       ; m
    STORE r4, r13
    LDI r4, 0x3004
    LDI r13, 101       ; e
    STORE r4, r13
    LDI r4, 0x3005
    LDI r13, 116       ; t
    STORE r4, r13
    LDI r4, 0x3006
    LDI r13, 114       ; r
    STORE r4, r13
    LDI r4, 0x3007
    LDI r13, 121       ; y
    STORE r4, r13
    LDI r4, 0x3008
    LDI r13, 0         ; null
    STORE r4, r13

; ── Build "Geometry" at 0x3010 (identical) ────────────────
    LDI r4, 0x3010
    LDI r13, 71
    STORE r4, r13
    LDI r4, 0x3011
    LDI r13, 101
    STORE r4, r13
    LDI r4, 0x3012
    LDI r13, 111
    STORE r4, r13
    LDI r4, 0x3013
    LDI r13, 109
    STORE r4, r13
    LDI r4, 0x3014
    LDI r13, 101
    STORE r4, r13
    LDI r4, 0x3015
    LDI r13, 116
    STORE r4, r13
    LDI r4, 0x3016
    LDI r13, 114
    STORE r4, r13
    LDI r4, 0x3017
    LDI r13, 121
    STORE r4, r13
    LDI r4, 0x3018
    LDI r13, 0
    STORE r4, r13

; ── Build "Hello" at 0x3020 ───────────────────────────────
    LDI r4, 0x3020
    LDI r13, 72        ; H
    STORE r4, r13
    LDI r4, 0x3021
    LDI r13, 101       ; e
    STORE r4, r13
    LDI r4, 0x3022
    LDI r13, 108       ; l
    STORE r4, r13
    LDI r4, 0x3023
    LDI r13, 108       ; l
    STORE r4, r13
    LDI r4, 0x3024
    LDI r13, 111       ; o
    STORE r4, r13
    LDI r4, 0x3025
    LDI r13, 0
    STORE r4, r13

; ── Build "MATCH" at 0x3040 ───────────────────────────────
    LDI r4, 0x3040
    LDI r13, 77        ; M
    STORE r4, r13
    LDI r4, 0x3041
    LDI r13, 65        ; A
    STORE r4, r13
    LDI r4, 0x3042
    LDI r13, 84        ; T
    STORE r4, r13
    LDI r4, 0x3043
    LDI r13, 67        ; C
    STORE r4, r13
    LDI r4, 0x3044
    LDI r13, 72        ; H
    STORE r4, r13
    LDI r4, 0x3045
    LDI r13, 0
    STORE r4, r13

; ── Build "DIFF" at 0x3048 ────────────────────────────────
    LDI r4, 0x3048
    LDI r13, 68        ; D
    STORE r4, r13
    LDI r4, 0x3049
    LDI r13, 73        ; I
    STORE r4, r13
    LDI r4, 0x304A
    LDI r13, 70        ; F
    STORE r4, r13
    LDI r4, 0x304B
    LDI r13, 70        ; F
    STORE r4, r13
    LDI r4, 0x304C
    LDI r13, 0
    STORE r4, r13

; ── Build "String Ops" at 0x3070 ──────────────────────────
    LDI r4, 0x3070
    LDI r13, 83        ; S
    STORE r4, r13
    LDI r4, 0x3071
    LDI r13, 116       ; t
    STORE r4, r13
    LDI r4, 0x3072
    LDI r13, 114       ; r
    STORE r4, r13
    LDI r4, 0x3073
    LDI r13, 105       ; i
    STORE r4, r13
    LDI r4, 0x3074
    LDI r13, 110       ; n
    STORE r4, r13
    LDI r4, 0x3075
    LDI r13, 103       ; g
    STORE r4, r13
    LDI r4, 0x3076
    LDI r13, 32        ; space
    STORE r4, r13
    LDI r4, 0x3077
    LDI r13, 79        ; O
    STORE r4, r13
    LDI r4, 0x3078
    LDI r13, 112       ; p
    STORE r4, r13
    LDI r4, 0x3079
    LDI r13, 115       ; s
    STORE r4, r13
    LDI r4, 0x307A
    LDI r13, 0
    STORE r4, r13

; ── Title bar (yellow, 100 pixels wide) ───────────────────
    LDI r13, 0xFFFF00
    LDI r11, 2
    LDI r15, 5
    LDI r0, 105

title_loop:
    PSET r15, r11, r13
    ADD r15, r12
    CMP r15, r0
    BLT r1, title_loop

; Display title "String Ops" at (10, 5)
    LDI r11, 5
    LDI r15, 10
    LDI r8, 0x3070
    TEXT r15, r11, r8

; ── Test 1: STRLEN ────────────────────────────────────────
; Display "Geometry" at (10, 25)
    LDI r11, 25
    LDI r15, 10
    LDI r8, 0x3000
    TEXT r15, r11, r8

; Get length of "Geometry" -> r1 = 8
    LDI r8, 0x3000
    STRLEN r8

; Save length to r10 (r1 will be clobbered by CMP in loop)
    MOV r10, r1

; Draw green bar: 8 pixels wide at y=38
    LDI r13, 0x00FF00
    LDI r11, 38
    LDI r15, 10
    LDI r4, 0

len_loop:
    CMP r4, r10
    BGE r1, len_done
    PSET r15, r11, r13
    ADD r15, r12
    ADD r4, r12
    JMP len_loop

len_done:

; ── Test 2: STRCMP (equal strings) ────────────────────────
; Compare "Geometry" at 0x3000 with copy at 0x3010
    LDI r8, 0x3000
    LDI r3, 0x3010
    STRCMP r8, r3    ; r1 = 0 (equal)

; Display both strings + "MATCH" at y=55
    LDI r11, 55
    LDI r15, 10
    LDI r8, 0x3000
    TEXT r15, r11, r8

    LDI r15, 85
    LDI r8, 0x3040    ; "MATCH"
    TEXT r15, r11, r8

; Green indicator bar at y=68
    PSETI 10, 68, 0x00FF00
    PSETI 11, 68, 0x00FF00
    PSETI 12, 68, 0x00FF00
    PSETI 13, 68, 0x00FF00
    PSETI 14, 68, 0x00FF00

; ── Test 3: STRCMP (different strings) ────────────────────
; Compare "Geometry" (0x3000) with "Hello" (0x3020)
    LDI r8, 0x3000
    LDI r3, 0x3020
    STRCMP r8, r3    ; r1 = 1 (G > H, so s1 > s2)

; Display both strings + "DIFF" at y=85
    LDI r11, 85
    LDI r15, 10
    LDI r8, 0x3000
    TEXT r15, r11, r8

    LDI r15, 85
    LDI r8, 0x3048    ; "DIFF"
    TEXT r15, r11, r8

; Red indicator bar at y=98
    PSETI 10, 98, 0xFF0000
    PSETI 11, 98, 0xFF0000
    PSETI 12, 98, 0xFF0000
    PSETI 13, 98, 0xFF0000
    PSETI 14, 98, 0xFF0000

; ── Test 4: STRCPY ────────────────────────────────────────
; Copy "Hello" from 0x3020 to 0x3030
    LDI r8, 0x3020    ; source
    LDI r3, 0x3030    ; destination
    STRCPY r8, r3    ; r1 = 6 (bytes copied incl null)

; Save count to r10
    MOV r10, r1

; Display copied string at (10, 115)
    LDI r11, 115
    LDI r15, 10
    LDI r8, 0x3030
    TEXT r15, r11, r8

; Blue bar: 5 pixels (chars) at y=128
    LDI r13, 0x0000FF
    LDI r11, 128
    LDI r15, 10
    LDI r4, 0

copy_loop:
    CMP r4, r10         ; compare counter with total bytes copied
    BGE r1, copy_done
    PSET r15, r11, r13
    ADD r15, r12
    ADD r4, r12
    JMP copy_loop

copy_done:

; ── Separator lines ───────────────────────────────────────
    LDI r13, 0x444444  ; dark gray separators
    LDI r0, 100       ; separator width

sep1:
    LDI r11, 50
    LDI r15, 5
sep1_loop:
    PSET r15, r11, r13
    ADD r15, r12
    CMP r15, r0
    BLT r1, sep1_loop

sep2:
    LDI r11, 80
    LDI r15, 5
sep2_loop:
    PSET r15, r11, r13
    ADD r15, r12
    CMP r15, r0
    BLT r1, sep2_loop

sep3:
    LDI r11, 110
    LDI r15, 5
sep3_loop:
    PSET r15, r11, r13
    ADD r15, r12
    CMP r15, r0
    BLT r1, sep3_loop

    HALT
