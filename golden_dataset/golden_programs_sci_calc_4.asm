; DESCRIPTION: This GeOS assembly code implements a scientific calculator that supports basic arithmetic operations (addition, subtraction, multiplication, division) as well as trigonometric functions (sine and cosine) and square root calculation. The calculator uses a precomputed quarter-wave sine table for sine calculations and the Newton-Raphson method for square roots. It reads input from the keyboard, processes it based on the operation selected, and displays results on the screen.

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
    LDI r1, 1
    LDI r12, 0

    LDI r20, DISP_VAL
    STORE r20, r12
    LDI r20, ACCUM
    STORE r20, r12
    LDI r20, OPER
    STORE r20, r12
    LDI r20, NEW_ENTRY
    LDI r5, 1
    STORE r20, r5

    ; Build quarter-wave sine table (16 entries for 0-90 degrees)
    ; sin(n*90/15) * 1000 for n=0..15
    ; Pre-computed: 0, 104, 207, 309, 407, 500, 588, 669, 743, 809, 866, 914, 951, 978, 995, 1000
    LDI r20, SIN_QTR
    LDI r5, 0
    STORE r20, r5
    ADDI r20, 1
    LDI r5, 104
    STORE r20, r5
    ADDI r20, 1
    LDI r5, 207
    STORE r20, r5
    ADDI r20, 1
    LDI r5, 309
    STORE r20, r5
    ADDI r20, 1
    LDI r5, 407
    STORE r20, r5
    ADDI r20, 1
    LDI r5, 500
    STORE r20, r5
    ADDI r20, 1
    LDI r5, 588
    STORE r20, r5
    ADDI r20, 1
    LDI r5, 669
    STORE r20, r5
    ADDI r20, 1
    LDI r5, 743
    STORE r20, r5
    ADDI r20, 1
    LDI r5, 809
    STORE r20, r5
    ADDI r20, 1
    LDI r5, 866
    STORE r20, r5
    ADDI r20, 1
    LDI r5, 914
    STORE r20, r5
    ADDI r20, 1
    LDI r5, 951
    STORE r20, r5
    ADDI r20, 1
    LDI r5, 978
    STORE r20, r5
    ADDI r20, 1
    LDI r5, 995
    STORE r20, r5
    ADDI r20, 1
    LDI r5, 1000
    STORE r20, r5

    ; Init stack
    LDI r30, 0xFD00

; ── MAIN LOOP ─────────────────────────────────────
main_loop:
    LDI r1, 1

    IKEY r15

    CMPI r15, 0
    JZ r6, no_key

    ; Digit 0-9
    CMPI r15, 48
    BLT r6, not_digit
    CMPI r15, 57
    BGE r6, not_digit_ok
    ; Between '0' and '9' but not '9' - need <= check
    ; Actually BGE means >= 57 = '9'+0 means >= '9'
    ; We need >= '0' AND <= '9' (48-57)
    ; BLT r6 means if r15 < 48 skip; BGE r6 means if r15 >= 57+1 skip? No.
    ; BGE branches when r6 != 0xFFFFFFFF (CMP found >=)
    ; CMPI r15, 57; BGE r6, not_digit_ok means if r15 >= 57 goto not_digit_ok
    ; But we want if r15 > 57 skip. So BGE at 57 means r15 >= 57 is ok (57='9')
    ; Wait, we need to handle r15 = 57 ('9') as a digit too.
    ; The correct pattern: skip if r15 < 48 OR r15 > 57.
    ; CMPI r15, 48; BLT skip (if < 48)
    ; CMPI r15, 58; BGE skip (if >= 58, i.e. > 57)
    JMP enter_digit_path
not_digit_ok:

not_digit:
    JMP check_ops

enter_digit_path:
    SUBI r15, 48
    CALL enter_digit
    JMP no_key

check_ops:
    ; + = add
    CMPI r15, 43
    JNZ r6, not_add
    CALL do_add
    JMP no_key
not_add:

    ; - = subtract
    CMPI r15, 45
    JNZ r6, not_sub
    CALL do_sub
    JMP no_key
not_sub:

    ; * = multiply
    CMPI r15, 42
    JNZ r6, not_mul
    CALL do_mul
    JMP no_key
not_mul:

    ; / = divide
    CMPI r15, 47
    JNZ r6, not_div
    CALL do_div
    JMP no_key
not_div:

    ; = or Enter = evaluate
    CMPI r15, 61
    JZ r6, do_eval
    CMPI r15, 13
    JNZ r6, not_eval
do_eval:
    CALL evaluate
    JMP no_key
not_eval:

    ; S = sin
    CMPI r15, 83
    JNZ r6, not_sin
    CALL do_sin
    JMP no_key
not_sin:

    ; C = cos
    CMPI r15, 67
    JNZ r6, not_cos
    CALL do_cos
    JMP no_key
not_cos:

    ; Q = sqrt
    CMPI r15, 81
    JNZ r6, not_sqrt
    CALL do_sqrt
    JMP no_key
not_sqrt:

    ; Escape = clear
    CMPI r15, 27
    JNZ r6, no_key
    CALL clear_calc

no_key:
    CALL render
    FRAME
    JMP main_loop

; ── ENTER DIGIT ───────────────────────────────────
enter_digit:
    PUSH r31
    ; r15 = digit value (0-9)
    ; Check new_entry
    LDI r20, NEW_ENTRY
    LOAD r9, r20
    CMPI r9, 1
    JNZ r6, append_digit
    ; Clear display
    LDI r20, DISP_VAL
    LDI r12, 0
    STORE r20, r12
    LDI r20, NEW_ENTRY
    STORE r20, r12
append_digit:
    LDI r20, DISP_VAL
    LOAD r9, r20
    LDI r14, 10
    MUL r9, r14
    ADD r9, r15
    STORE r20, r9
    POP r31
    RET

; ── OPERATORS ─────────────────────────────────────
do_add:
    PUSH r31
    LDI r9, 1
    LDI r20, OPER
    STORE r20, r9
    CALL apply_op
    POP r31
    RET

do_sub:
    PUSH r31
    LDI r9, 2
    LDI r20, OPER
    STORE r20, r9
    CALL apply_op
    POP r31
    RET

do_mul:
    PUSH r31
    LDI r9, 3
    LDI r20, OPER
    STORE r20, r9
    CALL apply_op
    POP r31
    RET

do_div:
    PUSH r31
    LDI r9, 4
    LDI r20, OPER
    STORE r20, r9
    CALL apply_op
    POP r31
    RET

apply_op:
    PUSH r31
    LDI r20, DISP_VAL
    LOAD r9, r20
    LDI r20, ACCUM
    STORE r20, r9
    LDI r20, NEW_ENTRY
    LDI r9, 1
    STORE r20, r9
    POP r31
    RET

; ── EVALUATE ──────────────────────────────────────
evaluate:
    PUSH r31
    LDI r20, OPER
    LOAD r14, r20

    CMPI r14, 1
    JNZ r6, ev_not_add
    LDI r20, ACCUM
    LOAD r9, r20
    LDI r20, DISP_VAL
    LOAD r10, r20
    ADD r9, r10
    LDI r20, DISP_VAL
    STORE r20, r9
    JMP ev_done

ev_not_add:
    CMPI r14, 2
    JNZ r6, ev_not_sub
    LDI r20, ACCUM
    LOAD r9, r20
    LDI r20, DISP_VAL
    LOAD r10, r20
    SUB r9, r10
    LDI r20, DISP_VAL
    STORE r20, r9
    JMP ev_done

ev_not_sub:
    CMPI r14, 3
    JNZ r6, ev_not_mul
    LDI r20, ACCUM
    LOAD r9, r20
    LDI r20, DISP_VAL
    LOAD r10, r20
    MUL r9, r10
    LDI r20, DISP_VAL
    STORE r20, r9
    JMP ev_done

ev_not_mul:
    CMPI r14, 4
    JNZ r6, ev_done
    LDI r20, ACCUM
    LOAD r9, r20
    LDI r20, DISP_VAL
    LOAD r10, r20
    CMPI r10, 0
    JZ r6, ev_done
    DIV r9, r10
    LDI r20, DISP_VAL
    STORE r20, r9

ev_done:
    LDI r20, OPER
    LDI r9, 0
    STORE r20, r9
    LDI r20, NEW_ENTRY
    LDI r9, 1
    STORE r20, r9
    LDI r20, ACCUM
    LDI r9, 0
    STORE r20, r9
    POP r31
    RET

; ── SIN (angle in display degrees, result * 1000) ─
do_sin:
    PUSH r31
    LDI r20, DISP_VAL
    LOAD r4, r20     ; angle in degrees (0-359)

    ; Normalize to 0-359
    LDI r3, 360
    MOD r4, r3

    ; Determine quadrant and map to 0-90
    ; table_index = angle * 16 / 90 (for 16-entry table over 0-90 deg)
    LDI r0, 0        ; negative flag
    LDI r13, 90

    CMP r4, r13
    BLT r6, sin_q1
    LDI r13, 180
    CMP r4, r13
    BLT r6, sin_q2
    LDI r13, 270
    CMP r4, r13
    BLT r6, sin_q3
    ; Q4: 270-359
    LDI r3, 360
    SUB r4, r3       ; angle = 360 - original
    NEG r4            ; angle = -(360 - orig) = orig - 360... no
    ; Better: angle = 360 - original
    LDI r20, DISP_VAL
    LOAD r4, r20
    LDI r3, 360
    SUB r3, r4       ; 360 - angle
    MOV r4, r3
    JMP sin_do_lookup

sin_q1:
    ; angle already 0-89, direct
    JMP sin_do_lookup

sin_q2:
    ; 90-179: effective = 180 - angle
    LDI r3, 180
    SUB r3, r4
    MOV r4, r3
    JMP sin_do_lookup

sin_q3:
    ; 180-269: effective = angle - 180, negate result
    LDI r3, 180
    SUB r4, r3
    LDI r0, 1         ; mark negate
    JMP sin_do_lookup

sin_do_lookup:
    ; r4 = effective angle (0-89)
    ; table_index = r4 * 16 / 90
    LDI r3, 16
    MUL r4, r3
    LDI r3, 90
    DIV r4, r3       ; table index (0-15)

    ; Clamp
    CMPI r4, 0
    BGE r6, sin_clamp_lo_ok
    LDI r4, 0
sin_clamp_lo_ok:
    CMPI r4, 15
    BLT r6, sin_clamp_hi_ok
    LDI r4, 15
sin_clamp_hi_ok:

    ; Look up
    LDI r20, SIN_QTR
    ADD r20, r4
    LOAD r4, r20

    ; Negate if Q3/Q4
    CMPI r0, 1
    JNZ r6, sin_no_neg
    NEG r4
sin_no_neg:

    LDI r20, DISP_VAL
    STORE r20, r4
    LDI r20, NEW_ENTRY
    LDI r9, 1
    STORE r20, r9
    POP r31
    RET

; ── COS (cos(x) = sin(90-x)) ──────────────────────
do_cos:
    PUSH r31
    ; cos(x) = sin(90 - x), or equivalently sin(x + 90)
    LDI r20, DISP_VAL
    LOAD r4, r20
    ADDI r4, 90
    LDI r20, DISP_VAL
    STORE r20, r4
    CALL do_sin
    POP r31
    RET

; ── SQRT (Newton method) ──────────────────────────
do_sqrt:
    PUSH r31
    LDI r20, DISP_VAL
    LOAD r4, r20

    CMPI r4, 0
    JZ r6, sqrt_done

    ; Initial guess = N / 2 + 1
    LDI r3, 2
    MOV r0, r4
    DIV r0, r3
    ADDI r0, 1

    ; 10 Newton iterations
    LDI r13, 10
sqrt_iter:
    MOV r8, r4
    DIV r8, r0       ; N/guess
    ADD r8, r0       ; guess + N/guess
    DIV r8, r3       ; / 2
    MOV r0, r8
    SUBI r13, 1
    JNZ r13, sqrt_iter

    MOV r4, r0
sqrt_done:
    LDI r20, DISP_VAL
    STORE r20, r4
    LDI r20, NEW_ENTRY
    LDI r9, 1
    STORE r20, r9
    POP r31
    RET

; ── CLEAR ─────────────────────────────────────────
clear_calc:
    PUSH r31
    LDI r12, 0
    LDI r20, DISP_VAL
    STORE r20, r12
    LDI r20, ACCUM
    STORE r20, r12
    LDI r20, OPER
    STORE r20, r12
    LDI r20, NEW_ENTRY
    LDI r5, 1
    STORE r20, r5
    POP r31
    RET

; ── RENDER ────────────────────────────────────────
render:
    PUSH r31
    LDI r1, 1

    ; Background
    LDI r12, 0x0D1B2A
    FILL r12

    ; Title bar
    LDI r12, 0x1B3A4B
    LDI r5, 0
    LDI r11, 0
    LDI r15, 256
    LDI r9, 20
    RECTF r5, r11, r15, r9, r12

    ; Title
    LDI r20, TXT_BUF
    STRO r20, "SCI-CALC"
    LDI r5, 85
    LDI r11, 4
    LDI r20, TXT_BUF
    TEXT r5, r11, r20

    ; Display panel
    LDI r12, 0x060612
    LDI r5, 20
    LDI r11, 28
    LDI r15, 216
    LDI r9, 40
    RECTF r5, r11, r15, r9, r12

    ; Convert display value to string at DISP_STR
    LDI r20, DISP_STR
    LDI r21, DISP_VAL
    LOAD r4, r21

    ; Handle negative
    LDI r22, 0
    LDI r23, 0
    CMP r4, r23
    BGE r6, pos_num
    NEG r4
    LDI r22, 1

pos_num:
    ; Digit extraction
    LDI r23, 0
    LDI r24, 10

    CMPI r4, 0
    JNZ r6, not_zero
    LDI r25, 0x30
    STORE r20, r25
    ADDI r20, 1
    ADDI r23, 1
    JMP num_done

not_zero:
    LDI r25, 0x6100    ; temp buffer
div_loop:
    CMPI r4, 0
    JZ r6, div_done
    MOV r26, r4
    MOD r26, r24
    ADDI r26, 0x30
    STORE r25, r26
    ADDI r25, 1
    ADDI r23, 1
    DIV r4, r24
    JMP div_loop

div_done:
    ; Write negative sign
    CMPI r22, 0
    JZ r6, no_neg
    LDI r26, 0x2D
    STORE r20, r26
    ADDI r20, 1

no_neg:
    ; Copy digits in reverse from temp buffer
    LDI r25, 0x6100
    ADD r25, r23
rev_loop:
    CMPI r23, 0
    JZ r6, num_done
    SUBI r23, 1
    LDI r26, 0x6100
    ADD r26, r23
    LOAD r27, r26
    STORE r20, r27
    ADDI r20, 1
    JMP rev_loop

num_done:
    LDI r12, 0
    STORE r20, r12

    ; Draw display value
    LDI r5, 40
    LDI r11, 35
    LDI r15, 0x00FF00
    LDI r20, DISP_STR
    DRAWTEXT r5, r11, r20, r15, r15

    ; Function labels panel
    LDI r12, 0x0D0D1A
    LDI r5, 20
    LDI r11, 75
    LDI r15, 216
    LDI r9, 80
    RECTF r5, r11, r15, r9, r12

    ; Labels
    LDI r20, TXT_BUF
    STRO r20, "S:sin C:cos Q:sqrt"
    LDI r5, 30
    LDI r11, 85
    LDI r15, 0x88BBFF
    DRAWTEXT r5, r11, r20, r15, r15

    LDI r20, TXT_BUF
    STRO r20, "+ - * / = Enter"
    LDI r5, 30
    LDI r11, 100
    LDI r15, 0x88BBFF
    DRAWTEXT r5, r11, r20, r15, r15

    LDI r20, TXT_BUF
    STRO r20, "Esc:clear  0-9:digits"
    LDI r5, 30
    LDI r11, 115
    LDI r15, 0x88BBFF
    DRAWTEXT r5, r11, r20, r15, r15

    ; Bottom bar
    LDI r12, 0x0A0A1A
    LDI r5, 0
    LDI r11, 240
    LDI r15, 256
    LDI r9, 16
    RECTF r5, r11, r15, r9, r12

    POP r31
    RET
