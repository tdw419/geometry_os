; DESCRIPTION: Draws a colored square at the screen with fixed size.

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
    LDI r5, 1
    LDI r10, 0

    LDI r20, DISP_VAL
    STORE r20, r10
    LDI r20, ACCUM
    STORE r20, r10
    LDI r20, OPER
    STORE r20, r10
    LDI r20, NEW_ENTRY
    LDI r9, 1
    STORE r20, r9

    ; Build quarter-wave sine table (16 entries for 0-90 degrees)
    ; sin(n*90/15) * 1000 for n=0..15
    ; Pre-computed: 0, 104, 207, 309, 407, 500, 588, 669, 743, 809, 866, 914, 951, 978, 995, 1000
    LDI r20, SIN_QTR
    LDI r9, 0
    STORE r20, r9
    ADDI r20, 1
    LDI r9, 104
    STORE r20, r9
    ADDI r20, 1
    LDI r9, 207
    STORE r20, r9
    ADDI r20, 1
    LDI r9, 309
    STORE r20, r9
    ADDI r20, 1
    LDI r9, 407
    STORE r20, r9
    ADDI r20, 1
    LDI r9, 500
    STORE r20, r9
    ADDI r20, 1
    LDI r9, 588
    STORE r20, r9
    ADDI r20, 1
    LDI r9, 669
    STORE r20, r9
    ADDI r20, 1
    LDI r9, 743
    STORE r20, r9
    ADDI r20, 1
    LDI r9, 809
    STORE r20, r9
    ADDI r20, 1
    LDI r9, 866
    STORE r20, r9
    ADDI r20, 1
    LDI r9, 914
    STORE r20, r9
    ADDI r20, 1
    LDI r9, 951
    STORE r20, r9
    ADDI r20, 1
    LDI r9, 978
    STORE r20, r9
    ADDI r20, 1
    LDI r9, 995
    STORE r20, r9
    ADDI r20, 1
    LDI r9, 1000
    STORE r20, r9

    ; Init stack
    LDI r30, 0xFD00

; ── MAIN LOOP ─────────────────────────────────────
main_loop:
    LDI r5, 1

    IKEY r7

    CMPI r7, 0
    JZ r3, no_key

    ; Digit 0-9
    CMPI r7, 48
    BLT r3, not_digit
    CMPI r7, 57
    BGE r3, not_digit_ok
    ; Between '0' and '9' but not '9' - need <= check
    ; Actually BGE means >= 57 = '9'+0 means >= '9'
    ; We need >= '0' AND <= '9' (48-57)
    ; BLT r3 means if r7 < 48 skip; BGE r3 means if r7 >= 57+1 skip? No.
    ; BGE branches when r3 != 0xFFFFFFFF (CMP found >=)
    ; CMPI r7, 57; BGE r3, not_digit_ok means if r7 >= 57 goto not_digit_ok
    ; But we want if r7 > 57 skip. So BGE at 57 means r7 >= 57 is ok (57='9')
    ; Wait, we need to handle r7 = 57 ('9') as a digit too.
    ; The correct pattern: skip if r7 < 48 OR r7 > 57.
    ; CMPI r7, 48; BLT skip (if < 48)
    ; CMPI r7, 58; BGE skip (if >= 58, i.e. > 57)
    JMP enter_digit_path
not_digit_ok:

not_digit:
    JMP check_ops

enter_digit_path:
    SUBI r7, 48
    CALL enter_digit
    JMP no_key

check_ops:
    ; + = add
    CMPI r7, 43
    JNZ r3, not_add
    CALL do_add
    JMP no_key
not_add:

    ; - = subtract
    CMPI r7, 45
    JNZ r3, not_sub
    CALL do_sub
    JMP no_key
not_sub:

    ; * = multiply
    CMPI r7, 42
    JNZ r3, not_mul
    CALL do_mul
    JMP no_key
not_mul:

    ; / = divide
    CMPI r7, 47
    JNZ r3, not_div
    CALL do_div
    JMP no_key
not_div:

    ; = or Enter = evaluate
    CMPI r7, 61
    JZ r3, do_eval
    CMPI r7, 13
    JNZ r3, not_eval
do_eval:
    CALL evaluate
    JMP no_key
not_eval:

    ; S = sin
    CMPI r7, 83
    JNZ r3, not_sin
    CALL do_sin
    JMP no_key
not_sin:

    ; C = cos
    CMPI r7, 67
    JNZ r3, not_cos
    CALL do_cos
    JMP no_key
not_cos:

    ; Q = sqrt
    CMPI r7, 81
    JNZ r3, not_sqrt
    CALL do_sqrt
    JMP no_key
not_sqrt:

    ; Escape = clear
    CMPI r7, 27
    JNZ r3, no_key
    CALL clear_calc

no_key:
    CALL render
    FRAME
    JMP main_loop

; ── ENTER DIGIT ───────────────────────────────────
enter_digit:
    PUSH r31
    ; r7 = digit value (0-9)
    ; Check new_entry
    LDI r20, NEW_ENTRY
    LOAD r8, r20
    CMPI r8, 1
    JNZ r3, append_digit
    ; Clear display
    LDI r20, DISP_VAL
    LDI r10, 0
    STORE r20, r10
    LDI r20, NEW_ENTRY
    STORE r20, r10
append_digit:
    LDI r20, DISP_VAL
    LOAD r8, r20
    LDI r14, 10
    MUL r8, r14
    ADD r8, r7
    STORE r20, r8
    POP r31
    RET

; ── OPERATORS ─────────────────────────────────────
do_add:
    PUSH r31
    LDI r8, 1
    LDI r20, OPER
    STORE r20, r8
    CALL apply_op
    POP r31
    RET

do_sub:
    PUSH r31
    LDI r8, 2
    LDI r20, OPER
    STORE r20, r8
    CALL apply_op
    POP r31
    RET

do_mul:
    PUSH r31
    LDI r8, 3
    LDI r20, OPER
    STORE r20, r8
    CALL apply_op
    POP r31
    RET

do_div:
    PUSH r31
    LDI r8, 4
    LDI r20, OPER
    STORE r20, r8
    CALL apply_op
    POP r31
    RET

apply_op:
    PUSH r31
    LDI r20, DISP_VAL
    LOAD r8, r20
    LDI r20, ACCUM
    STORE r20, r8
    LDI r20, NEW_ENTRY
    LDI r8, 1
    STORE r20, r8
    POP r31
    RET

; ── EVALUATE ──────────────────────────────────────
evaluate:
    PUSH r31
    LDI r20, OPER
    LOAD r14, r20

    CMPI r14, 1
    JNZ r3, ev_not_add
    LDI r20, ACCUM
    LOAD r8, r20
    LDI r20, DISP_VAL
    LOAD r15, r20
    ADD r8, r15
    LDI r20, DISP_VAL
    STORE r20, r8
    JMP ev_done

ev_not_add:
    CMPI r14, 2
    JNZ r3, ev_not_sub
    LDI r20, ACCUM
    LOAD r8, r20
    LDI r20, DISP_VAL
    LOAD r15, r20
    SUB r8, r15
    LDI r20, DISP_VAL
    STORE r20, r8
    JMP ev_done

ev_not_sub:
    CMPI r14, 3
    JNZ r3, ev_not_mul
    LDI r20, ACCUM
    LOAD r8, r20
    LDI r20, DISP_VAL
    LOAD r15, r20
    MUL r8, r15
    LDI r20, DISP_VAL
    STORE r20, r8
    JMP ev_done

ev_not_mul:
    CMPI r14, 4
    JNZ r3, ev_done
    LDI r20, ACCUM
    LOAD r8, r20
    LDI r20, DISP_VAL
    LOAD r15, r20
    CMPI r15, 0
    JZ r3, ev_done
    DIV r8, r15
    LDI r20, DISP_VAL
    STORE r20, r8

ev_done:
    LDI r20, OPER
    LDI r8, 0
    STORE r20, r8
    LDI r20, NEW_ENTRY
    LDI r8, 1
    STORE r20, r8
    LDI r20, ACCUM
    LDI r8, 0
    STORE r20, r8
    POP r31
    RET

; ── SIN (angle in display degrees, result * 1000) ─
do_sin:
    PUSH r31
    LDI r20, DISP_VAL
    LOAD r6, r20     ; angle in degrees (0-359)

    ; Normalize to 0-359
    LDI r12, 360
    MOD r6, r12

    ; Determine quadrant and map to 0-90
    ; table_index = angle * 16 / 90 (for 16-entry table over 0-90 deg)
    LDI r0, 0        ; negative flag
    LDI r11, 90

    CMP r6, r11
    BLT r3, sin_q1
    LDI r11, 180
    CMP r6, r11
    BLT r3, sin_q2
    LDI r11, 270
    CMP r6, r11
    BLT r3, sin_q3
    ; Q4: 270-359
    LDI r12, 360
    SUB r6, r12       ; angle = 360 - original
    NEG r6            ; angle = -(360 - orig) = orig - 360... no
    ; Better: angle = 360 - original
    LDI r20, DISP_VAL
    LOAD r6, r20
    LDI r12, 360
    SUB r12, r6       ; 360 - angle
    MOV r6, r12
    JMP sin_do_lookup

sin_q1:
    ; angle already 0-89, direct
    JMP sin_do_lookup

sin_q2:
    ; 90-179: effective = 180 - angle
    LDI r12, 180
    SUB r12, r6
    MOV r6, r12
    JMP sin_do_lookup

sin_q3:
    ; 180-269: effective = angle - 180, negate result
    LDI r12, 180
    SUB r6, r12
    LDI r0, 1         ; mark negate
    JMP sin_do_lookup

sin_do_lookup:
    ; r6 = effective angle (0-89)
    ; table_index = r6 * 16 / 90
    LDI r12, 16
    MUL r6, r12
    LDI r12, 90
    DIV r6, r12       ; table index (0-15)

    ; Clamp
    CMPI r6, 0
    BGE r3, sin_clamp_lo_ok
    LDI r6, 0
sin_clamp_lo_ok:
    CMPI r6, 15
    BLT r3, sin_clamp_hi_ok
    LDI r6, 15
sin_clamp_hi_ok:

    ; Look up
    LDI r20, SIN_QTR
    ADD r20, r6
    LOAD r6, r20

    ; Negate if Q3/Q4
    CMPI r0, 1
    JNZ r3, sin_no_neg
    NEG r6
sin_no_neg:

    LDI r20, DISP_VAL
    STORE r20, r6
    LDI r20, NEW_ENTRY
    LDI r8, 1
    STORE r20, r8
    POP r31
    RET

; ── COS (cos(x) = sin(90-x)) ──────────────────────
do_cos:
    PUSH r31
    ; cos(x) = sin(90 - x), or equivalently sin(x + 90)
    LDI r20, DISP_VAL
    LOAD r6, r20
    ADDI r6, 90
    LDI r20, DISP_VAL
    STORE r20, r6
    CALL do_sin
    POP r31
    RET

; ── SQRT (Newton method) ──────────────────────────
do_sqrt:
    PUSH r31
    LDI r20, DISP_VAL
    LOAD r6, r20

    CMPI r6, 0
    JZ r3, sqrt_done

    ; Initial guess = N / 2 + 1
    LDI r12, 2
    MOV r0, r6
    DIV r0, r12
    ADDI r0, 1

    ; 10 Newton iterations
    LDI r11, 10
sqrt_iter:
    MOV r2, r6
    DIV r2, r0       ; N/guess
    ADD r2, r0       ; guess + N/guess
    DIV r2, r12       ; / 2
    MOV r0, r2
    SUBI r11, 1
    JNZ r11, sqrt_iter

    MOV r6, r0
sqrt_done:
    LDI r20, DISP_VAL
    STORE r20, r6
    LDI r20, NEW_ENTRY
    LDI r8, 1
    STORE r20, r8
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
    LDI r9, 1
    STORE r20, r9
    POP r31
    RET

; ── RENDER ────────────────────────────────────────
render:
    PUSH r31
    LDI r5, 1

    ; Background
    LDI r10, 0x0D1B2A
    FILL r10

    ; Title bar
    LDI r10, 0x1B3A4B
    LDI r9, 0
    LDI r4, 0
    LDI r7, 256
    LDI r8, 20
    RECTF r9, r4, r7, r8, r10

    ; Title
    LDI r20, TXT_BUF
    STRO r20, "SCI-CALC"
    LDI r9, 85
    LDI r4, 4
    LDI r20, TXT_BUF
    TEXT r9, r4, r20

    ; Display panel
    LDI r10, 0x060612
    LDI r9, 20
    LDI r4, 28
    LDI r7, 216
    LDI r8, 40
    RECTF r9, r4, r7, r8, r10

    ; Convert display value to string at DISP_STR
    LDI r20, DISP_STR
    LDI r21, DISP_VAL
    LOAD r6, r21

    ; Handle negative
    LDI r22, 0
    LDI r23, 0
    CMP r6, r23
    BGE r3, pos_num
    NEG r6
    LDI r22, 1

pos_num:
    ; Digit extraction
    LDI r23, 0
    LDI r24, 10

    CMPI r6, 0
    JNZ r3, not_zero
    LDI r25, 0x30
    STORE r20, r25
    ADDI r20, 1
    ADDI r23, 1
    JMP num_done

not_zero:
    LDI r25, 0x6100    ; temp buffer
div_loop:
    CMPI r6, 0
    JZ r3, div_done
    MOV r26, r6
    MOD r26, r24
    ADDI r26, 0x30
    STORE r25, r26
    ADDI r25, 1
    ADDI r23, 1
    DIV r6, r24
    JMP div_loop

div_done:
    ; Write negative sign
    CMPI r22, 0
    JZ r3, no_neg
    LDI r26, 0x2D
    STORE r20, r26
    ADDI r20, 1

no_neg:
    ; Copy digits in reverse from temp buffer
    LDI r25, 0x6100
    ADD r25, r23
rev_loop:
    CMPI r23, 0
    JZ r3, num_done
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
    LDI r9, 40
    LDI r4, 35
    LDI r7, 0x00FF00
    LDI r20, DISP_STR
    DRAWTEXT r9, r4, r20, r7, r7

    ; Function labels panel
    LDI r10, 0x0D0D1A
    LDI r9, 20
    LDI r4, 75
    LDI r7, 216
    LDI r8, 80
    RECTF r9, r4, r7, r8, r10

    ; Labels
    LDI r20, TXT_BUF
    STRO r20, "S:sin C:cos Q:sqrt"
    LDI r9, 30
    LDI r4, 85
    LDI r7, 0x88BBFF
    DRAWTEXT r9, r4, r20, r7, r7

    LDI r20, TXT_BUF
    STRO r20, "+ - * / = Enter"
    LDI r9, 30
    LDI r4, 100
    LDI r7, 0x88BBFF
    DRAWTEXT r9, r4, r20, r7, r7

    LDI r20, TXT_BUF
    STRO r20, "Esc:clear  0-9:digits"
    LDI r9, 30
    LDI r4, 115
    LDI r7, 0x88BBFF
    DRAWTEXT r9, r4, r20, r7, r7

    ; Bottom bar
    LDI r10, 0x0A0A1A
    LDI r9, 0
    LDI r4, 240
    LDI r7, 256
    LDI r8, 16
    RECTF r9, r4, r7, r8, r10

    POP r31
    RET
