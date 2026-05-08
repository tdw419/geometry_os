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
;   r1  = constant 1 (increment)
;   r15  = loop counter
;   r2  = saved value (length or count)
;   r6 = x coordinate
;   r12 = y coordinate
;   r14 = string address
;   r10, r7, r3 = temps

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
    LDI r15, 0x3000
    LDI r7, 71        ; G
    STORE r15, r7
    LDI r15, 0x3001
    LDI r7, 101       ; e
    STORE r15, r7
    LDI r15, 0x3002
    LDI r7, 111       ; o
    STORE r15, r7
    LDI r15, 0x3003
    LDI r7, 109       ; m
    STORE r15, r7
    LDI r15, 0x3004
    LDI r7, 101       ; e
    STORE r15, r7
    LDI r15, 0x3005
    LDI r7, 116       ; t
    STORE r15, r7
    LDI r15, 0x3006
    LDI r7, 114       ; r
    STORE r15, r7
    LDI r15, 0x3007
    LDI r7, 121       ; y
    STORE r15, r7
    LDI r15, 0x3008
    LDI r7, 0         ; null
    STORE r15, r7

; ── Build "Geometry" at 0x3010 (identical) ────────────────
    LDI r15, 0x3010
    LDI r7, 71
    STORE r15, r7
    LDI r15, 0x3011
    LDI r7, 101
    STORE r15, r7
    LDI r15, 0x3012
    LDI r7, 111
    STORE r15, r7
    LDI r15, 0x3013
    LDI r7, 109
    STORE r15, r7
    LDI r15, 0x3014
    LDI r7, 101
    STORE r15, r7
    LDI r15, 0x3015
    LDI r7, 116
    STORE r15, r7
    LDI r15, 0x3016
    LDI r7, 114
    STORE r15, r7
    LDI r15, 0x3017
    LDI r7, 121
    STORE r15, r7
    LDI r15, 0x3018
    LDI r7, 0
    STORE r15, r7

; ── Build "Hello" at 0x3020 ───────────────────────────────
    LDI r15, 0x3020
    LDI r7, 72        ; H
    STORE r15, r7
    LDI r15, 0x3021
    LDI r7, 101       ; e
    STORE r15, r7
    LDI r15, 0x3022
    LDI r7, 108       ; l
    STORE r15, r7
    LDI r15, 0x3023
    LDI r7, 108       ; l
    STORE r15, r7
    LDI r15, 0x3024
    LDI r7, 111       ; o
    STORE r15, r7
    LDI r15, 0x3025
    LDI r7, 0
    STORE r15, r7

; ── Build "MATCH" at 0x3040 ───────────────────────────────
    LDI r15, 0x3040
    LDI r7, 77        ; M
    STORE r15, r7
    LDI r15, 0x3041
    LDI r7, 65        ; A
    STORE r15, r7
    LDI r15, 0x3042
    LDI r7, 84        ; T
    STORE r15, r7
    LDI r15, 0x3043
    LDI r7, 67        ; C
    STORE r15, r7
    LDI r15, 0x3044
    LDI r7, 72        ; H
    STORE r15, r7
    LDI r15, 0x3045
    LDI r7, 0
    STORE r15, r7

; ── Build "DIFF" at 0x3048 ────────────────────────────────
    LDI r15, 0x3048
    LDI r7, 68        ; D
    STORE r15, r7
    LDI r15, 0x3049
    LDI r7, 73        ; I
    STORE r15, r7
    LDI r15, 0x304A
    LDI r7, 70        ; F
    STORE r15, r7
    LDI r15, 0x304B
    LDI r7, 70        ; F
    STORE r15, r7
    LDI r15, 0x304C
    LDI r7, 0
    STORE r15, r7

; ── Build "String Ops" at 0x3070 ──────────────────────────
    LDI r15, 0x3070
    LDI r7, 83        ; S
    STORE r15, r7
    LDI r15, 0x3071
    LDI r7, 116       ; t
    STORE r15, r7
    LDI r15, 0x3072
    LDI r7, 114       ; r
    STORE r15, r7
    LDI r15, 0x3073
    LDI r7, 105       ; i
    STORE r15, r7
    LDI r15, 0x3074
    LDI r7, 110       ; n
    STORE r15, r7
    LDI r15, 0x3075
    LDI r7, 103       ; g
    STORE r15, r7
    LDI r15, 0x3076
    LDI r7, 32        ; space
    STORE r15, r7
    LDI r15, 0x3077
    LDI r7, 79        ; O
    STORE r15, r7
    LDI r15, 0x3078
    LDI r7, 112       ; p
    STORE r15, r7
    LDI r15, 0x3079
    LDI r7, 115       ; s
    STORE r15, r7
    LDI r15, 0x307A
    LDI r7, 0
    STORE r15, r7

; ── Title bar (yellow, 100 pixels wide) ───────────────────
    LDI r7, 0xFFFF00
    LDI r12, 2
    LDI r6, 5
    LDI r3, 105

title_loop:
    PSET r6, r12, r7
    ADD r6, r1
    CMP r6, r3
    BLT r8, title_loop

; Display title "String Ops" at (10, 5)
    LDI r12, 5
    LDI r6, 10
    LDI r14, 0x3070
    TEXT r6, r12, r14

; ── Test 1: STRLEN ────────────────────────────────────────
; Display "Geometry" at (10, 25)
    LDI r12, 25
    LDI r6, 10
    LDI r14, 0x3000
    TEXT r6, r12, r14

; Get length of "Geometry" -> r8 = 8
    LDI r14, 0x3000
    STRLEN r14

; Save length to r2 (r8 will be clobbered by CMP in loop)
    MOV r2, r8

; Draw green bar: 8 pixels wide at y=38
    LDI r7, 0x00FF00
    LDI r12, 38
    LDI r6, 10
    LDI r15, 0

len_loop:
    CMP r15, r2
    BGE r8, len_done
    PSET r6, r12, r7
    ADD r6, r1
    ADD r15, r1
    JMP len_loop

len_done:

; ── Test 2: STRCMP (equal strings) ────────────────────────
; Compare "Geometry" at 0x3000 with copy at 0x3010
    LDI r14, 0x3000
    LDI r10, 0x3010
    STRCMP r14, r10    ; r8 = 0 (equal)

; Display both strings + "MATCH" at y=55
    LDI r12, 55
    LDI r6, 10
    LDI r14, 0x3000
    TEXT r6, r12, r14

    LDI r6, 85
    LDI r14, 0x3040    ; "MATCH"
    TEXT r6, r12, r14

; Green indicator bar at y=68
    PSETI 10, 68, 0x00FF00
    PSETI 11, 68, 0x00FF00
    PSETI 12, 68, 0x00FF00
    PSETI 13, 68, 0x00FF00
    PSETI 14, 68, 0x00FF00

; ── Test 3: STRCMP (different strings) ────────────────────
; Compare "Geometry" (0x3000) with "Hello" (0x3020)
    LDI r14, 0x3000
    LDI r10, 0x3020
    STRCMP r14, r10    ; r8 = 1 (G > H, so s1 > s2)

; Display both strings + "DIFF" at y=85
    LDI r12, 85
    LDI r6, 10
    LDI r14, 0x3000
    TEXT r6, r12, r14

    LDI r6, 85
    LDI r14, 0x3048    ; "DIFF"
    TEXT r6, r12, r14

; Red indicator bar at y=98
    PSETI 10, 98, 0xFF0000
    PSETI 11, 98, 0xFF0000
    PSETI 12, 98, 0xFF0000
    PSETI 13, 98, 0xFF0000
    PSETI 14, 98, 0xFF0000

; ── Test 4: STRCPY ────────────────────────────────────────
; Copy "Hello" from 0x3020 to 0x3030
    LDI r14, 0x3020    ; source
    LDI r10, 0x3030    ; destination
    STRCPY r14, r10    ; r8 = 6 (bytes copied incl null)

; Save count to r2
    MOV r2, r8

; Display copied string at (10, 115)
    LDI r12, 115
    LDI r6, 10
    LDI r14, 0x3030
    TEXT r6, r12, r14

; Blue bar: 5 pixels (chars) at y=128
    LDI r7, 0x0000FF
    LDI r12, 128
    LDI r6, 10
    LDI r15, 0

copy_loop:
    CMP r15, r2         ; compare counter with total bytes copied
    BGE r8, copy_done
    PSET r6, r12, r7
    ADD r6, r1
    ADD r15, r1
    JMP copy_loop

copy_done:

; ── Separator lines ───────────────────────────────────────
    LDI r7, 0x444444  ; dark gray separators
    LDI r3, 100       ; separator width

sep1:
    LDI r12, 50
    LDI r6, 5
sep1_loop:
    PSET r6, r12, r7
    ADD r6, r1
    CMP r6, r3
    BLT r8, sep1_loop

sep2:
    LDI r12, 80
    LDI r6, 5
sep2_loop:
    PSET r6, r12, r7
    ADD r6, r1
    CMP r6, r3
    BLT r8, sep2_loop

sep3:
    LDI r12, 110
    LDI r6, 5
sep3_loop:
    PSET r6, r12, r7
    ADD r6, r1
    CMP r6, r3
    BLT r8, sep3_loop

    HALT
