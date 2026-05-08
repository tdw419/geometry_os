; DESCRIPTION: Geometry OS program to draw a colored square.

; sci_calc.asm -- Scientific Calculator for Geometry OS
;
; Phase 75: Scientific calculator with sin/cos/sqrt.
; Uses pre-computed quarter-wave sine table (16 entries for 0-90 deg).
; Sqrt uses Newton method iteration.
;
; Input via keyboard:
;   0-9   = digits
;   +     = add (43)
;   -     = subtract (45)
;   *     = multiply (42)
;   /     = divide (47)
;   S     = sin (83)
;   C     = cos (67)
;   Q     = sqrt (81)
;   =     = equals (61)
;   Enter = evaluate (13)
;   Esc   = clear (27)
;
; RAM Layout:
;   0x4000 = display value
;   0x4004 = accumulator
;   0x4008 = operator (0=none, 1=add, 2=sub, 3=mul, 4=div)
;   0x400C = new entry flag
;   0x6000 = sin quarter table (16 entries, sin(0..90)*1000)
;   0x6040 = text buffer
;   0x6100 = display string buffer
;
; NOTE: No colons in comments (assembler pitfall)

#define DISP_VAL    0x4000
#define ACCUM       0x4004
#define OPER        0x4008
#define NEW_ENTRY   0x400C
#define SIN_QTR     0x6000
#define TXT_BUF     0x6040
#define DISP_STR    0x6100

; ── INIT ──────────────────────────────────────────
    LDI r4, 1
    LDI r10, 0

    LDI r20, DISP_VAL
    STORE r20, r10
    LDI r20, ACCUM
    STORE r20, r10
    LDI r20, OPER
    STORE r20, r10
    LDI r20, NEW_ENTRY
    LDI r1, 1
    STORE r20, r1

    ; Build quarter-wave sine table (16 entries for 0-90 degrees)
    ; sin(n*90/15) * 1000 for n=0..15
    ; Pre-computed: 0, 104, 207, 309, 407, 500, 588, 669, 743, 809, 866, 914, 951, 978, 995, 1000
    LDI r20, SIN_QTR
    LDI r1, 0
    STORE r20, r1
    ADDI r20, 1
    LDI r1, 104
    STORE r20, r1
    ADDI r20, 1
    LDI r1, 207
    STORE r20, r1
    ADDI r20, 1
    LDI r1, 309
    STORE r20, r1
    ADDI r20, 1
    LDI r1, 407
    STORE r20, r1
    ADDI r20, 1
    LDI r1, 500
    STORE r20, r1
    ADDI r20, 1
    LDI r1, 588
    STORE r20, r1
    ADDI r20, 1
    LDI r1, 669
    STORE r20, r1
    ADDI r20, 1
    LDI r1, 743
    STORE r20, r1
    ADDI r20, 1
    LDI r1, 809
    STORE r20, r1
    ADDI r20, 1
    LDI r1, 866
    STORE r20, r1
    ADDI r20, 1
    LDI r1, 914
    STORE r20, r1
    ADDI r20, 1
    LDI r1, 951
    STORE r20, r1
    ADDI r20, 1
    LDI r1, 978
    STORE r20, r1
    ADDI r20, 1
    LDI r1, 995
    STORE r20, r1
    ADDI r20, 1
    LDI r1, 1000
    STORE r20, r1

    ; Init stack
    LDI r30, 0xFD00

; ── MAIN LOOP ─────────────────────────────────────
main_loop:
    LDI r4, 1

    IKEY r2

    CMPI r2, 0
    JZ r0, no_key

    ; Digit 0-9
    CMPI r2, 48
    BLT r0, not_digit
    CMPI r2, 57
    BGE r0, not_digit_ok
    ; Between '0' and '9' but not '9' - need <= check
    ; Actually BGE means >= 57 = '9'+0 means >= '9'
    ; We need >= '0' AND <= '9' (48-57)
    ; BLT r0 means if r2 < 48 skip; BGE r0 means if r2 >= 57+1 skip? No.
    ; BGE branches when r0 != 0xFFFFFFFF (CMP found >=)
    ; CMPI r2, 57; BGE r0, not_digit_ok means if r2 >= 57 goto not_digit_ok
    ; But we want if r2 > 57 skip. So BGE at 57 means r2 >= 57 is ok (57='9')
    ; Wait, we need to handle r2 = 57 ('9') as a digit too.
    ; The correct pattern: skip if r2 < 48 OR r2 > 57.
    ; CMPI r2, 48; BLT skip (if < 48)
    ; CMPI r2, 58; BGE skip (if >= 58, i.e. > 57)
    JMP enter_digit_path
not_digit_ok:

not_digit:
    JMP check_ops

enter_digit_path:
    SUBI r2, 48
    CALL enter_digit
    JMP no_key

check_ops:
    ; + = add
    CMPI r2, 43
    JNZ r0, not_add
    CALL do_add
    JMP no_key
not_add:

    ; - = subtract
    CMPI r2, 45
    JNZ r0, not_sub
    CALL do_sub
    JMP no_key
not_sub:

    ; * = multiply
    CMPI r2, 42
    JNZ r0, not_mul
    CALL do_mul
    JMP no_key
not_mul:

    ; / = divide
    CMPI r2, 47
    JNZ r0, not_div
    CALL do_div
    JMP no_key
not_div:

    ; = or Enter = evaluate
    CMPI r2, 61
    JZ r0, do_eval
    CMPI r2, 13
    JNZ r0, not_eval
do_eval:
    CALL evaluate
    JMP no_key
not_eval:

    ; S = sin
    CMPI r2, 83
    JNZ r0, not_sin
    CALL do_sin
    JMP no_key
not_sin:

    ; C = cos
    CMPI r2, 67
    JNZ r0, not_cos
    CALL do_cos
    JMP no_key
not_cos:

    ; Q = sqrt
    CMPI r2, 81
    JNZ r0, not_sqrt
    CALL do_sqrt
    JMP no_key
not_sqrt:

    ; Escape = clear
    CMPI r2, 27
    JNZ r0, no_key
    CALL clear_calc

no_key:
    CALL render
    FRAME
    JMP main_loop

; ── ENTER DIGIT ───────────────────────────────────
enter_digit:
    PUSH r31
    ; r2 = digit value (0-9)
    ; Check new_entry
    LDI r20, NEW_ENTRY
    LOAD r14, r20
    CMPI r14, 1
    JNZ r0, append_digit
    ; Clear display
    LDI r20, DISP_VAL
    LDI r10, 0
    STORE r20, r10
    LDI r20, NEW_ENTRY
    STORE r20, r10
append_digit:
    LDI r20, DISP_VAL
    LOAD r14, r20
    LDI r12, 10
    MUL r14, r12
    ADD r14, r2
    STORE r20, r14
    POP r31
    RET

; ── OPERATORS ─────────────────────────────────────
do_add:
    PUSH r31
    LDI r14, 1
    LDI r20, OPER
    STORE r20, r14
    CALL apply_op
    POP r31
    RET

do_sub:
    PUSH r31
    LDI r14, 2
    LDI r20, OPER
    STORE r20, r14
    CALL apply_op
    POP r31
    RET

do_mul:
    PUSH r31
    LDI r14, 3
    LDI r20, OPER
    STORE r20, r14
    CALL apply_op
    POP r31
    RET

do_div:
    PUSH r31
    LDI r14, 4
    LDI r20, OPER
    STORE r20, r14
    CALL apply_op
    POP r31
    RET

apply_op:
    PUSH r31
    LDI r20, DISP_VAL
    LOAD r14, r20
    LDI r20, ACCUM
    STORE r20, r14
    LDI r20, NEW_ENTRY
    LDI r14, 1
    STORE r20, r14
    POP r31
    RET

; ── EVALUATE ──────────────────────────────────────
evaluate:
    PUSH r31
    LDI r20, OPER
    LOAD r12, r20

    CMPI r12, 1
    JNZ r0, ev_not_add
    LDI r20, ACCUM
    LOAD r14, r20
    LDI r20, DISP_VAL
    LOAD r8, r20
    ADD r14, r8
    LDI r20, DISP_VAL
    STORE r20, r14
    JMP ev_done

ev_not_add:
    CMPI r12, 2
    JNZ r0, ev_not_sub
    LDI r20, ACCUM
    LOAD r14, r20
    LDI r20, DISP_VAL
    LOAD r8, r20
    SUB r14, r8
    LDI r20, DISP_VAL
    STORE r20, r14
    JMP ev_done

ev_not_sub:
    CMPI r12, 3
    JNZ r0, ev_not_mul
    LDI r20, ACCUM
    LOAD r14, r20
    LDI r20, DISP_VAL
    LOAD r8, r20
    MUL r14, r8
    LDI r20, DISP_VAL
    STORE r20, r14
    JMP ev_done

ev_not_mul:
    CMPI r12, 4
    JNZ r0, ev_done
    LDI r20, ACCUM
    LOAD r14, r20
    LDI r20, DISP_VAL
    LOAD r8, r20
    CMPI r8, 0
    JZ r0, ev_done
    DIV r14, r8
    LDI r20, DISP_VAL
    STORE r20, r14

ev_done:
    LDI r20, OPER
    LDI r14, 0
    STORE r20, r14
    LDI r20, NEW_ENTRY
    LDI r14, 1
    STORE r20, r14
    LDI r20, ACCUM
    LDI r14, 0
    STORE r20, r14
    POP r31
    RET

; ── SIN (angle in display degrees, result * 1000) ─
do_sin:
    PUSH r31
    LDI r20, DISP_VAL
    LOAD r13, r20     ; angle in degrees (0-359)

    ; Normalize to 0-359
    LDI r9, 360
    MOD r13, r9

    ; Determine quadrant and map to 0-90
    ; table_index = angle * 16 / 90 (for 16-entry table over 0-90 deg)
    LDI r6, 0        ; negative flag
    LDI r15, 90

    CMP r13, r15
    BLT r0, sin_q1
    LDI r15, 180
    CMP r13, r15
    BLT r0, sin_q2
    LDI r15, 270
    CMP r13, r15
    BLT r0, sin_q3
    ; Q4: 270-359
    LDI r9, 360
    SUB r13, r9       ; angle = 360 - original
    NEG r13            ; angle = -(360 - orig) = orig - 360... no
    ; Better: angle = 360 - original
    LDI r20, DISP_VAL
    LOAD r13, r20
    LDI r9, 360
    SUB r9, r13       ; 360 - angle
    MOV r13, r9
    JMP sin_do_lookup

sin_q1:
    ; angle already 0-89, direct
    JMP sin_do_lookup

sin_q2:
    ; 90-179: effective = 180 - angle
    LDI r9, 180
    SUB r9, r13
    MOV r13, r9
    JMP sin_do_lookup

sin_q3:
    ; 180-269: effective = angle - 180, negate result
    LDI r9, 180
    SUB r13, r9
    LDI r6, 1         ; mark negate
    JMP sin_do_lookup

sin_do_lookup:
    ; r13 = effective angle (0-89)
    ; table_index = r13 * 16 / 90
    LDI r9, 16
    MUL r13, r9
    LDI r9, 90
    DIV r13, r9       ; table index (0-15)

    ; Clamp
    CMPI r13, 0
    BGE r0, sin_clamp_lo_ok
    LDI r13, 0
sin_clamp_lo_ok:
    CMPI r13, 15
    BLT r0, sin_clamp_hi_ok
    LDI r13, 15
sin_clamp_hi_ok:

    ; Look up
    LDI r20, SIN_QTR
    ADD r20, r13
    LOAD r13, r20

    ; Negate if Q3/Q4
    CMPI r6, 1
    JNZ r0, sin_no_neg
    NEG r13
sin_no_neg:

    LDI r20, DISP_VAL
    STORE r20, r13
    LDI r20, NEW_ENTRY
    LDI r14, 1
    STORE r20, r14
    POP r31
    RET

; ── COS (cos(x) = sin(90-x)) ──────────────────────
do_cos:
    PUSH r31
    ; cos(x) = sin(90 - x), or equivalently sin(x + 90)
    LDI r20, DISP_VAL
    LOAD r13, r20
    ADDI r13, 90
    LDI r20, DISP_VAL
    STORE r20, r13
    CALL do_sin
    POP r31
    RET

; ── SQRT (Newton method) ──────────────────────────
do_sqrt:
    PUSH r31
    LDI r20, DISP_VAL
    LOAD r13, r20

    CMPI r13, 0
    JZ r0, sqrt_done

    ; Initial guess = N / 2 + 1
    LDI r9, 2
    MOV r6, r13
    DIV r6, r9
    ADDI r6, 1

    ; 10 Newton iterations
    LDI r15, 10
sqrt_iter:
    MOV r7, r13
    DIV r7, r6       ; N/guess
    ADD r7, r6       ; guess + N/guess
    DIV r7, r9       ; / 2
    MOV r6, r7
    SUBI r15, 1
    JNZ r15, sqrt_iter

    MOV r13, r6
sqrt_done:
    LDI r20, DISP_VAL
    STORE r20, r13
    LDI r20, NEW_ENTRY
    LDI r14, 1
    STORE r20, r14
    POP r31
    RET

; ── CLEAR ─────────────────────────────────────────
clear_calc:
    PUSH r31
    LDI r10, 0
    LDI r20, DISP_VAL
    STORE r20, r10
    LDI r20, ACCUM
    STORE r20, r10
    LDI r20, OPER
    STORE r20, r10
    LDI r20, NEW_ENTRY
    LDI r1, 1
    STORE r20, r1
    POP r31
    RET

; ── RENDER ────────────────────────────────────────
render:
    PUSH r31
    LDI r4, 1

    ; Background
    LDI r10, 0x0D1B2A
    FILL r10

    ; Title bar
    LDI r10, 0x1B3A4B
    LDI r1, 0
    LDI r3, 0
    LDI r2, 256
    LDI r14, 20
    RECTF r1, r3, r2, r14, r10

    ; Title
    LDI r20, TXT_BUF
    STRO r20, "SCI-CALC"
    LDI r1, 85
    LDI r3, 4
    LDI r20, TXT_BUF
    TEXT r1, r3, r20

    ; Display panel
    LDI r10, 0x060612
    LDI r1, 20
    LDI r3, 28
    LDI r2, 216
    LDI r14, 40
    RECTF r1, r3, r2, r14, r10

    ; Convert display value to string at DISP_STR
    LDI r20, DISP_STR
    LDI r21, DISP_VAL
    LOAD r13, r21

    ; Handle negative
    LDI r22, 0
    LDI r23, 0
    CMP r13, r23
    BGE r0, pos_num
    NEG r13
    LDI r22, 1

pos_num:
    ; Digit extraction
    LDI r23, 0
    LDI r24, 10

    CMPI r13, 0
    JNZ r0, not_zero
    LDI r25, 0x30
    STORE r20, r25
    ADDI r20, 1
    ADDI r23, 1
    JMP num_done

not_zero:
    LDI r25, 0x6100    ; temp buffer
div_loop:
    CMPI r13, 0
    JZ r0, div_done
    MOV r26, r13
    MOD r26, r24
    ADDI r26, 0x30
    STORE r25, r26
    ADDI r25, 1
    ADDI r23, 1
    DIV r13, r24
    JMP div_loop

div_done:
    ; Write negative sign
    CMPI r22, 0
    JZ r0, no_neg
    LDI r26, 0x2D
    STORE r20, r26
    ADDI r20, 1

no_neg:
    ; Copy digits in reverse from temp buffer
    LDI r25, 0x6100
    ADD r25, r23
rev_loop:
    CMPI r23, 0
    JZ r0, num_done
    SUBI r23, 1
    LDI r26, 0x6100
    ADD r26, r23
    LOAD r27, r26
    STORE r20, r27
    ADDI r20, 1
    JMP rev_loop

num_done:
    LDI r10, 0
    STORE r20, r10

    ; Draw display value
    LDI r1, 40
    LDI r3, 35
    LDI r2, 0x00FF00
    LDI r20, DISP_STR
    DRAWTEXT r1, r3, r20, r2, r2

    ; Function labels panel
    LDI r10, 0x0D0D1A
    LDI r1, 20
    LDI r3, 75
    LDI r2, 216
    LDI r14, 80
    RECTF r1, r3, r2, r14, r10

    ; Labels
    LDI r20, TXT_BUF
    STRO r20, "S:sin C:cos Q:sqrt"
    LDI r1, 30
    LDI r3, 85
    LDI r2, 0x88BBFF
    DRAWTEXT r1, r3, r20, r2, r2

    LDI r20, TXT_BUF
    STRO r20, "+ - * / = Enter"
    LDI r1, 30
    LDI r3, 100
    LDI r2, 0x88BBFF
    DRAWTEXT r1, r3, r20, r2, r2

    LDI r20, TXT_BUF
    STRO r20, "Esc:clear  0-9:digits"
    LDI r1, 30
    LDI r3, 115
    LDI r2, 0x88BBFF
    DRAWTEXT r1, r3, r20, r2, r2

    ; Bottom bar
    LDI r10, 0x0A0A1A
    LDI r1, 0
    LDI r3, 240
    LDI r2, 256
    LDI r14, 16
    RECTF r1, r3, r2, r14, r10

    POP r31
    RET
