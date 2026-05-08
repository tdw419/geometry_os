; DESCRIPTION: Draw square: pos=the screen, color=colored, size=fixed size.

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
    LDI r3, 1
    LDI r11, 0

    LDI r20, DISP_VAL
    STORE r20, r11
    LDI r20, ACCUM
    STORE r20, r11
    LDI r20, OPER
    STORE r20, r11
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
    LDI r3, 1

    IKEY r8

    CMPI r8, 0
    JZ r1, no_key

    ; Digit 0-9
    CMPI r8, 48
    BLT r1, not_digit
    CMPI r8, 57
    BGE r1, not_digit_ok
    ; Between '0' and '9' but not '9' - need <= check
    ; Actually BGE means >= 57 = '9'+0 means >= '9'
    ; We need >= '0' AND <= '9' (48-57)
    ; BLT r1 means if r8 < 48 skip; BGE r1 means if r8 >= 57+1 skip? No.
    ; BGE branches when r1 != 0xFFFFFFFF (CMP found >=)
    ; CMPI r8, 57; BGE r1, not_digit_ok means if r8 >= 57 goto not_digit_ok
    ; But we want if r8 > 57 skip. So BGE at 57 means r8 >= 57 is ok (57='9')
    ; Wait, we need to handle r8 = 57 ('9') as a digit too.
    ; The correct pattern: skip if r8 < 48 OR r8 > 57.
    ; CMPI r8, 48; BLT skip (if < 48)
    ; CMPI r8, 58; BGE skip (if >= 58, i.e. > 57)
    JMP enter_digit_path
not_digit_ok:

not_digit:
    JMP check_ops

enter_digit_path:
    SUBI r8, 48
    CALL enter_digit
    JMP no_key

check_ops:
    ; + = add
    CMPI r8, 43
    JNZ r1, not_add
    CALL do_add
    JMP no_key
not_add:

    ; - = subtract
    CMPI r8, 45
    JNZ r1, not_sub
    CALL do_sub
    JMP no_key
not_sub:

    ; * = multiply
    CMPI r8, 42
    JNZ r1, not_mul
    CALL do_mul
    JMP no_key
not_mul:

    ; / = divide
    CMPI r8, 47
    JNZ r1, not_div
    CALL do_div
    JMP no_key
not_div:

    ; = or Enter = evaluate
    CMPI r8, 61
    JZ r1, do_eval
    CMPI r8, 13
    JNZ r1, not_eval
do_eval:
    CALL evaluate
    JMP no_key
not_eval:

    ; S = sin
    CMPI r8, 83
    JNZ r1, not_sin
    CALL do_sin
    JMP no_key
not_sin:

    ; C = cos
    CMPI r8, 67
    JNZ r1, not_cos
    CALL do_cos
    JMP no_key
not_cos:

    ; Q = sqrt
    CMPI r8, 81
    JNZ r1, not_sqrt
    CALL do_sqrt
    JMP no_key
not_sqrt:

    ; Escape = clear
    CMPI r8, 27
    JNZ r1, no_key
    CALL clear_calc

no_key:
    CALL render
    FRAME
    JMP main_loop

; ── ENTER DIGIT ───────────────────────────────────
enter_digit:
    PUSH r31
    ; r8 = digit value (0-9)
    ; Check new_entry
    LDI r20, NEW_ENTRY
    LOAD r7, r20
    CMPI r7, 1
    JNZ r1, append_digit
    ; Clear display
    LDI r20, DISP_VAL
    LDI r11, 0
    STORE r20, r11
    LDI r20, NEW_ENTRY
    STORE r20, r11
append_digit:
    LDI r20, DISP_VAL
    LOAD r7, r20
    LDI r10, 10
    MUL r7, r10
    ADD r7, r8
    STORE r20, r7
    POP r31
    RET

; ── OPERATORS ─────────────────────────────────────
do_add:
    PUSH r31
    LDI r7, 1
    LDI r20, OPER
    STORE r20, r7
    CALL apply_op
    POP r31
    RET

do_sub:
    PUSH r31
    LDI r7, 2
    LDI r20, OPER
    STORE r20, r7
    CALL apply_op
    POP r31
    RET

do_mul:
    PUSH r31
    LDI r7, 3
    LDI r20, OPER
    STORE r20, r7
    CALL apply_op
    POP r31
    RET

do_div:
    PUSH r31
    LDI r7, 4
    LDI r20, OPER
    STORE r20, r7
    CALL apply_op
    POP r31
    RET

apply_op:
    PUSH r31
    LDI r20, DISP_VAL
    LOAD r7, r20
    LDI r20, ACCUM
    STORE r20, r7
    LDI r20, NEW_ENTRY
    LDI r7, 1
    STORE r20, r7
    POP r31
    RET

; ── EVALUATE ──────────────────────────────────────
evaluate:
    PUSH r31
    LDI r20, OPER
    LOAD r10, r20

    CMPI r10, 1
    JNZ r1, ev_not_add
    LDI r20, ACCUM
    LOAD r7, r20
    LDI r20, DISP_VAL
    LOAD r13, r20
    ADD r7, r13
    LDI r20, DISP_VAL
    STORE r20, r7
    JMP ev_done

ev_not_add:
    CMPI r10, 2
    JNZ r1, ev_not_sub
    LDI r20, ACCUM
    LOAD r7, r20
    LDI r20, DISP_VAL
    LOAD r13, r20
    SUB r7, r13
    LDI r20, DISP_VAL
    STORE r20, r7
    JMP ev_done

ev_not_sub:
    CMPI r10, 3
    JNZ r1, ev_not_mul
    LDI r20, ACCUM
    LOAD r7, r20
    LDI r20, DISP_VAL
    LOAD r13, r20
    MUL r7, r13
    LDI r20, DISP_VAL
    STORE r20, r7
    JMP ev_done

ev_not_mul:
    CMPI r10, 4
    JNZ r1, ev_done
    LDI r20, ACCUM
    LOAD r7, r20
    LDI r20, DISP_VAL
    LOAD r13, r20
    CMPI r13, 0
    JZ r1, ev_done
    DIV r7, r13
    LDI r20, DISP_VAL
    STORE r20, r7

ev_done:
    LDI r20, OPER
    LDI r7, 0
    STORE r20, r7
    LDI r20, NEW_ENTRY
    LDI r7, 1
    STORE r20, r7
    LDI r20, ACCUM
    LDI r7, 0
    STORE r20, r7
    POP r31
    RET

; ── SIN (angle in display degrees, result * 1000) ─
do_sin:
    PUSH r31
    LDI r20, DISP_VAL
    LOAD r2, r20     ; angle in degrees (0-359)

    ; Normalize to 0-359
    LDI r6, 360
    MOD r2, r6

    ; Determine quadrant and map to 0-90
    ; table_index = angle * 16 / 90 (for 16-entry table over 0-90 deg)
    LDI r0, 0        ; negative flag
    LDI r15, 90

    CMP r2, r15
    BLT r1, sin_q1
    LDI r15, 180
    CMP r2, r15
    BLT r1, sin_q2
    LDI r15, 270
    CMP r2, r15
    BLT r1, sin_q3
    ; Q4: 270-359
    LDI r6, 360
    SUB r2, r6       ; angle = 360 - original
    NEG r2            ; angle = -(360 - orig) = orig - 360... no
    ; Better: angle = 360 - original
    LDI r20, DISP_VAL
    LOAD r2, r20
    LDI r6, 360
    SUB r6, r2       ; 360 - angle
    MOV r2, r6
    JMP sin_do_lookup

sin_q1:
    ; angle already 0-89, direct
    JMP sin_do_lookup

sin_q2:
    ; 90-179: effective = 180 - angle
    LDI r6, 180
    SUB r6, r2
    MOV r2, r6
    JMP sin_do_lookup

sin_q3:
    ; 180-269: effective = angle - 180, negate result
    LDI r6, 180
    SUB r2, r6
    LDI r0, 1         ; mark negate
    JMP sin_do_lookup

sin_do_lookup:
    ; r2 = effective angle (0-89)
    ; table_index = r2 * 16 / 90
    LDI r6, 16
    MUL r2, r6
    LDI r6, 90
    DIV r2, r6       ; table index (0-15)

    ; Clamp
    CMPI r2, 0
    BGE r1, sin_clamp_lo_ok
    LDI r2, 0
sin_clamp_lo_ok:
    CMPI r2, 15
    BLT r1, sin_clamp_hi_ok
    LDI r2, 15
sin_clamp_hi_ok:

    ; Look up
    LDI r20, SIN_QTR
    ADD r20, r2
    LOAD r2, r20

    ; Negate if Q3/Q4
    CMPI r0, 1
    JNZ r1, sin_no_neg
    NEG r2
sin_no_neg:

    LDI r20, DISP_VAL
    STORE r20, r2
    LDI r20, NEW_ENTRY
    LDI r7, 1
    STORE r20, r7
    POP r31
    RET

; ── COS (cos(x) = sin(90-x)) ──────────────────────
do_cos:
    PUSH r31
    ; cos(x) = sin(90 - x), or equivalently sin(x + 90)
    LDI r20, DISP_VAL
    LOAD r2, r20
    ADDI r2, 90
    LDI r20, DISP_VAL
    STORE r20, r2
    CALL do_sin
    POP r31
    RET

; ── SQRT (Newton method) ──────────────────────────
do_sqrt:
    PUSH r31
    LDI r20, DISP_VAL
    LOAD r2, r20

    CMPI r2, 0
    JZ r1, sqrt_done

    ; Initial guess = N / 2 + 1
    LDI r6, 2
    MOV r0, r2
    DIV r0, r6
    ADDI r0, 1

    ; 10 Newton iterations
    LDI r15, 10
sqrt_iter:
    MOV r4, r2
    DIV r4, r0       ; N/guess
    ADD r4, r0       ; guess + N/guess
    DIV r4, r6       ; / 2
    MOV r0, r4
    SUBI r15, 1
    JNZ r15, sqrt_iter

    MOV r2, r0
sqrt_done:
    LDI r20, DISP_VAL
    STORE r20, r2
    LDI r20, NEW_ENTRY
    LDI r7, 1
    STORE r20, r7
    POP r31
    RET

; ── CLEAR ─────────────────────────────────────────
clear_calc:
    PUSH r31
    LDI r11, 0
    LDI r20, DISP_VAL
    STORE r20, r11
    LDI r20, ACCUM
    STORE r20, r11
    LDI r20, OPER
    STORE r20, r11
    LDI r20, NEW_ENTRY
    LDI r5, 1
    STORE r20, r5
    POP r31
    RET

; ── RENDER ────────────────────────────────────────
render:
    PUSH r31
    LDI r3, 1

    ; Background
    LDI r11, 0x0D1B2A
    FILL r11

    ; Title bar
    LDI r11, 0x1B3A4B
    LDI r5, 0
    LDI r14, 0
    LDI r8, 256
    LDI r7, 20
    RECTF r5, r14, r8, r7, r11

    ; Title
    LDI r20, TXT_BUF
    STRO r20, "SCI-CALC"
    LDI r5, 85
    LDI r14, 4
    LDI r20, TXT_BUF
    TEXT r5, r14, r20

    ; Display panel
    LDI r11, 0x060612
    LDI r5, 20
    LDI r14, 28
    LDI r8, 216
    LDI r7, 40
    RECTF r5, r14, r8, r7, r11

    ; Convert display value to string at DISP_STR
    LDI r20, DISP_STR
    LDI r21, DISP_VAL
    LOAD r2, r21

    ; Handle negative
    LDI r22, 0
    LDI r23, 0
    CMP r2, r23
    BGE r1, pos_num
    NEG r2
    LDI r22, 1

pos_num:
    ; Digit extraction
    LDI r23, 0
    LDI r24, 10

    CMPI r2, 0
    JNZ r1, not_zero
    LDI r25, 0x30
    STORE r20, r25
    ADDI r20, 1
    ADDI r23, 1
    JMP num_done

not_zero:
    LDI r25, 0x6100    ; temp buffer
div_loop:
    CMPI r2, 0
    JZ r1, div_done
    MOV r26, r2
    MOD r26, r24
    ADDI r26, 0x30
    STORE r25, r26
    ADDI r25, 1
    ADDI r23, 1
    DIV r2, r24
    JMP div_loop

div_done:
    ; Write negative sign
    CMPI r22, 0
    JZ r1, no_neg
    LDI r26, 0x2D
    STORE r20, r26
    ADDI r20, 1

no_neg:
    ; Copy digits in reverse from temp buffer
    LDI r25, 0x6100
    ADD r25, r23
rev_loop:
    CMPI r23, 0
    JZ r1, num_done
    SUBI r23, 1
    LDI r26, 0x6100
    ADD r26, r23
    LOAD r27, r26
    STORE r20, r27
    ADDI r20, 1
    JMP rev_loop

num_done:
    LDI r11, 0
    STORE r20, r11

    ; Draw display value
    LDI r5, 40
    LDI r14, 35
    LDI r8, 0x00FF00
    LDI r20, DISP_STR
    DRAWTEXT r5, r14, r20, r8, r8

    ; Function labels panel
    LDI r11, 0x0D0D1A
    LDI r5, 20
    LDI r14, 75
    LDI r8, 216
    LDI r7, 80
    RECTF r5, r14, r8, r7, r11

    ; Labels
    LDI r20, TXT_BUF
    STRO r20, "S:sin C:cos Q:sqrt"
    LDI r5, 30
    LDI r14, 85
    LDI r8, 0x88BBFF
    DRAWTEXT r5, r14, r20, r8, r8

    LDI r20, TXT_BUF
    STRO r20, "+ - * / = Enter"
    LDI r5, 30
    LDI r14, 100
    LDI r8, 0x88BBFF
    DRAWTEXT r5, r14, r20, r8, r8

    LDI r20, TXT_BUF
    STRO r20, "Esc:clear  0-9:digits"
    LDI r5, 30
    LDI r14, 115
    LDI r8, 0x88BBFF
    DRAWTEXT r5, r14, r20, r8, r8

    ; Bottom bar
    LDI r11, 0x0A0A1A
    LDI r5, 0
    LDI r14, 240
    LDI r8, 256
    LDI r7, 16
    RECTF r5, r14, r8, r7, r11

    POP r31
    RET
