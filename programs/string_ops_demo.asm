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
;   r1  = constant 1 (increment)
;   r2  = loop counter
;   r3  = saved value (length or count)
;   r10 = x coordinate
;   r11 = y coordinate
;   r12 = string address
;   r13, r14, r15 = temps

; ── RAM Layout ─────────────────────────────────────────────
;   0x3000 = "Geometry" (9 words: 8 chars + null)
;   0x3010 = "Geometry" (identical copy for equal test)
;   0x3020 = "Hello"    (6 words: 5 chars + null)
;   0x3030 = copy destination (STRCPY target)
;   0x3040 = "MATCH"    (6 words: 5 chars + null)
;   0x3048 = "DIFF"     (5 words: 4 chars + null)
;   0x3070 = "String Ops" (11 words: 10 chars + null)

; ── Constants ──────────────────────────────────────────────
    LDI r1, 1           ; increment constant

; ── Build "Geometry" at 0x3000 ────────────────────────────
    LDI r2, 0x3000
    LDI r14, 71        ; G
    STORE r2, r14
    LDI r2, 0x3001
    LDI r14, 101       ; e
    STORE r2, r14
    LDI r2, 0x3002
    LDI r14, 111       ; o
    STORE r2, r14
    LDI r2, 0x3003
    LDI r14, 109       ; m
    STORE r2, r14
    LDI r2, 0x3004
    LDI r14, 101       ; e
    STORE r2, r14
    LDI r2, 0x3005
    LDI r14, 116       ; t
    STORE r2, r14
    LDI r2, 0x3006
    LDI r14, 114       ; r
    STORE r2, r14
    LDI r2, 0x3007
    LDI r14, 121       ; y
    STORE r2, r14
    LDI r2, 0x3008
    LDI r14, 0         ; null
    STORE r2, r14

; ── Build "Geometry" at 0x3010 (identical) ────────────────
    LDI r2, 0x3010
    LDI r14, 71
    STORE r2, r14
    LDI r2, 0x3011
    LDI r14, 101
    STORE r2, r14
    LDI r2, 0x3012
    LDI r14, 111
    STORE r2, r14
    LDI r2, 0x3013
    LDI r14, 109
    STORE r2, r14
    LDI r2, 0x3014
    LDI r14, 101
    STORE r2, r14
    LDI r2, 0x3015
    LDI r14, 116
    STORE r2, r14
    LDI r2, 0x3016
    LDI r14, 114
    STORE r2, r14
    LDI r2, 0x3017
    LDI r14, 121
    STORE r2, r14
    LDI r2, 0x3018
    LDI r14, 0
    STORE r2, r14

; ── Build "Hello" at 0x3020 ───────────────────────────────
    LDI r2, 0x3020
    LDI r14, 72        ; H
    STORE r2, r14
    LDI r2, 0x3021
    LDI r14, 101       ; e
    STORE r2, r14
    LDI r2, 0x3022
    LDI r14, 108       ; l
    STORE r2, r14
    LDI r2, 0x3023
    LDI r14, 108       ; l
    STORE r2, r14
    LDI r2, 0x3024
    LDI r14, 111       ; o
    STORE r2, r14
    LDI r2, 0x3025
    LDI r14, 0
    STORE r2, r14

; ── Build "MATCH" at 0x3040 ───────────────────────────────
    LDI r2, 0x3040
    LDI r14, 77        ; M
    STORE r2, r14
    LDI r2, 0x3041
    LDI r14, 65        ; A
    STORE r2, r14
    LDI r2, 0x3042
    LDI r14, 84        ; T
    STORE r2, r14
    LDI r2, 0x3043
    LDI r14, 67        ; C
    STORE r2, r14
    LDI r2, 0x3044
    LDI r14, 72        ; H
    STORE r2, r14
    LDI r2, 0x3045
    LDI r14, 0
    STORE r2, r14

; ── Build "DIFF" at 0x3048 ────────────────────────────────
    LDI r2, 0x3048
    LDI r14, 68        ; D
    STORE r2, r14
    LDI r2, 0x3049
    LDI r14, 73        ; I
    STORE r2, r14
    LDI r2, 0x304A
    LDI r14, 70        ; F
    STORE r2, r14
    LDI r2, 0x304B
    LDI r14, 70        ; F
    STORE r2, r14
    LDI r2, 0x304C
    LDI r14, 0
    STORE r2, r14

; ── Build "String Ops" at 0x3070 ──────────────────────────
    LDI r2, 0x3070
    LDI r14, 83        ; S
    STORE r2, r14
    LDI r2, 0x3071
    LDI r14, 116       ; t
    STORE r2, r14
    LDI r2, 0x3072
    LDI r14, 114       ; r
    STORE r2, r14
    LDI r2, 0x3073
    LDI r14, 105       ; i
    STORE r2, r14
    LDI r2, 0x3074
    LDI r14, 110       ; n
    STORE r2, r14
    LDI r2, 0x3075
    LDI r14, 103       ; g
    STORE r2, r14
    LDI r2, 0x3076
    LDI r14, 32        ; space
    STORE r2, r14
    LDI r2, 0x3077
    LDI r14, 79        ; O
    STORE r2, r14
    LDI r2, 0x3078
    LDI r14, 112       ; p
    STORE r2, r14
    LDI r2, 0x3079
    LDI r14, 115       ; s
    STORE r2, r14
    LDI r2, 0x307A
    LDI r14, 0
    STORE r2, r14

; ── Title bar (yellow, 100 pixels wide) ───────────────────
    LDI r14, 0xFFFF00
    LDI r11, 2
    LDI r10, 5
    LDI r15, 105

title_loop:
    PSET r10, r11, r14
    ADD r10, r1
    CMP r10, r15
    BLT r0, title_loop

; Display title "String Ops" at (10, 5)
    LDI r11, 5
    LDI r10, 10
    LDI r12, 0x3070
    TEXT r10, r11, r12

; ── Test 1: STRLEN ────────────────────────────────────────
; Display "Geometry" at (10, 25)
    LDI r11, 25
    LDI r10, 10
    LDI r12, 0x3000
    TEXT r10, r11, r12

; Get length of "Geometry" -> r0 = 8
    LDI r12, 0x3000
    STRLEN r12

; Save length to r3 (r0 will be clobbered by CMP in loop)
    MOV r3, r0

; Draw green bar: 8 pixels wide at y=38
    LDI r14, 0x00FF00
    LDI r11, 38
    LDI r10, 10
    LDI r2, 0

len_loop:
    CMP r2, r3
    BGE r0, len_done
    PSET r10, r11, r14
    ADD r10, r1
    ADD r2, r1
    JMP len_loop

len_done:

; ── Test 2: STRCMP (equal strings) ────────────────────────
; Compare "Geometry" at 0x3000 with copy at 0x3010
    LDI r12, 0x3000
    LDI r13, 0x3010
    STRCMP r12, r13    ; r0 = 0 (equal)

; Display both strings + "MATCH" at y=55
    LDI r11, 55
    LDI r10, 10
    LDI r12, 0x3000
    TEXT r10, r11, r12

    LDI r10, 85
    LDI r12, 0x3040    ; "MATCH"
    TEXT r10, r11, r12

; Green indicator bar at y=68
    PSETI 10, 68, 0x00FF00
    PSETI 11, 68, 0x00FF00
    PSETI 12, 68, 0x00FF00
    PSETI 13, 68, 0x00FF00
    PSETI 14, 68, 0x00FF00

; ── Test 3: STRCMP (different strings) ────────────────────
; Compare "Geometry" (0x3000) with "Hello" (0x3020)
    LDI r12, 0x3000
    LDI r13, 0x3020
    STRCMP r12, r13    ; r0 = 1 (G > H, so s1 > s2)

; Display both strings + "DIFF" at y=85
    LDI r11, 85
    LDI r10, 10
    LDI r12, 0x3000
    TEXT r10, r11, r12

    LDI r10, 85
    LDI r12, 0x3048    ; "DIFF"
    TEXT r10, r11, r12

; Red indicator bar at y=98
    PSETI 10, 98, 0xFF0000
    PSETI 11, 98, 0xFF0000
    PSETI 12, 98, 0xFF0000
    PSETI 13, 98, 0xFF0000
    PSETI 14, 98, 0xFF0000

; ── Test 4: STRCPY ────────────────────────────────────────
; Copy "Hello" from 0x3020 to 0x3030
    LDI r12, 0x3020    ; source
    LDI r13, 0x3030    ; destination
    STRCPY r12, r13    ; r0 = 6 (bytes copied incl null)

; Save count to r3
    MOV r3, r0

; Display copied string at (10, 115)
    LDI r11, 115
    LDI r10, 10
    LDI r12, 0x3030
    TEXT r10, r11, r12

; Blue bar: 5 pixels (chars) at y=128
    LDI r14, 0x0000FF
    LDI r11, 128
    LDI r10, 10
    LDI r2, 0

copy_loop:
    CMP r2, r3         ; compare counter with total bytes copied
    BGE r0, copy_done
    PSET r10, r11, r14
    ADD r10, r1
    ADD r2, r1
    JMP copy_loop

copy_done:

; ── Separator lines ───────────────────────────────────────
    LDI r14, 0x444444  ; dark gray separators
    LDI r15, 100       ; separator width

sep1:
    LDI r11, 50
    LDI r10, 5
sep1_loop:
    PSET r10, r11, r14
    ADD r10, r1
    CMP r10, r15
    BLT r0, sep1_loop

sep2:
    LDI r11, 80
    LDI r10, 5
sep2_loop:
    PSET r10, r11, r14
    ADD r10, r1
    CMP r10, r15
    BLT r0, sep2_loop

sep3:
    LDI r11, 110
    LDI r10, 5
sep3_loop:
    PSET r10, r11, r14
    ADD r10, r1
    CMP r10, r15
    BLT r0, sep3_loop

    HALT
