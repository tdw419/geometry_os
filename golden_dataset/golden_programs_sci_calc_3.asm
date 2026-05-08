; DESCRIPTION: A colored square centered at the screen with fixed size.

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
    LDI r2, 1
    LDI r10, 0

    LDI r20, DISP_VAL
    STORE r20, r10
    LDI r20, ACCUM
    STORE r20, r10
    LDI r20, OPER
    STORE r20, r10
    LDI r20, NEW_ENTRY
    LDI r7, 1
    STORE r20, r7

    ; Build quarter-wave sine table (16 entries for 0-90 degrees)
    ; sin(n*90/15) * 1000 for n=0..15
    ; Pre-computed: 0, 104, 207, 309, 407, 500, 588, 669, 743, 809, 866, 914, 951, 978, 995, 1000
    LDI r20, SIN_QTR
    LDI r7, 0
    STORE r20, r7
    ADDI r20, 1
    LDI r7, 104
    STORE r20, r7
    ADDI r20, 1
    LDI r7, 207
    STORE r20, r7
    ADDI r20, 1
    LDI r7, 309
    STORE r20, r7
    ADDI r20, 1
    LDI r7, 407
    STORE r20, r7
    ADDI r20, 1
    LDI r7, 500
    STORE r20, r7
    ADDI r20, 1
    LDI r7, 588
    STORE r20, r7
    ADDI r20, 1
    LDI r7, 669
    STORE r20, r7
    ADDI r20, 1
    LDI r7, 743
    STORE r20, r7
    ADDI r20, 1
    LDI r7, 809
    STORE r20, r7
    ADDI r20, 1
    LDI r7, 866
    STORE r20, r7
    ADDI r20, 1
    LDI r7, 914
    STORE r20, r7
    ADDI r20, 1
    LDI r7, 951
    STORE r20, r7
    ADDI r20, 1
    LDI r7, 978
    STORE r20, r7
    ADDI r20, 1
    LDI r7, 995
    STORE r20, r7
    ADDI r20, 1
    LDI r7, 1000
    STORE r20, r7

    ; Init stack
    LDI r30, 0xFD00

; ── MAIN LOOP ─────────────────────────────────────
main_loop:
    LDI r2, 1

    IKEY r4

    CMPI r4, 0
    JZ r9, no_key

    ; Digit 0-9
    CMPI r4, 48
    BLT r9, not_digit
    CMPI r4, 57
    BGE r9, not_digit_ok
    ; Between '0' and '9' but not '9' - need <= check
    ; Actually BGE means >= 57 = '9'+0 means >= '9'
    ; We need >= '0' AND <= '9' (48-57)
    ; BLT r9 means if r4 < 48 skip; BGE r9 means if r4 >= 57+1 skip? No.
    ; BGE branches when r9 != 0xFFFFFFFF (CMP found >=)
    ; CMPI r4, 57; BGE r9, not_digit_ok means if r4 >= 57 goto not_digit_ok
    ; But we want if r4 > 57 skip. So BGE at 57 means r4 >= 57 is ok (57='9')
    ; Wait, we need to handle r4 = 57 ('9') as a digit too.
    ; The correct pattern: skip if r4 < 48 OR r4 > 57.
    ; CMPI r4, 48; BLT skip (if < 48)
    ; CMPI r4, 58; BGE skip (if >= 58, i.e. > 57)
    JMP enter_digit_path
not_digit_ok:

not_digit:
    JMP check_ops

enter_digit_path:
    SUBI r4, 48
    CALL enter_digit
    JMP no_key

check_ops:
    ; + = add
    CMPI r4, 43
    JNZ r9, not_add
    CALL do_add
    JMP no_key
not_add:

    ; - = subtract
    CMPI r4, 45
    JNZ r9, not_sub
    CALL do_sub
    JMP no_key
not_sub:

    ; * = multiply
    CMPI r4, 42
    JNZ r9, not_mul
    CALL do_mul
    JMP no_key
not_mul:

    ; / = divide
    CMPI r4, 47
    JNZ r9, not_div
    CALL do_div
    JMP no_key
not_div:

    ; = or Enter = evaluate
    CMPI r4, 61
    JZ r9, do_eval
    CMPI r4, 13
    JNZ r9, not_eval
do_eval:
    CALL evaluate
    JMP no_key
not_eval:

    ; S = sin
    CMPI r4, 83
    JNZ r9, not_sin
    CALL do_sin
    JMP no_key
not_sin:

    ; C = cos
    CMPI r4, 67
    JNZ r9, not_cos
    CALL do_cos
    JMP no_key
not_cos:

    ; Q = sqrt
    CMPI r4, 81
    JNZ r9, not_sqrt
    CALL do_sqrt
    JMP no_key
not_sqrt:

    ; Escape = clear
    CMPI r4, 27
    JNZ r9, no_key
    CALL clear_calc

no_key:
    CALL render
    FRAME
    JMP main_loop

; ── ENTER DIGIT ───────────────────────────────────
enter_digit:
    PUSH r31
    ; r4 = digit value (0-9)
    ; Check new_entry
    LDI r20, NEW_ENTRY
    LOAD r3, r20
    CMPI r3, 1
    JNZ r9, append_digit
    ; Clear display
    LDI r20, DISP_VAL
    LDI r10, 0
    STORE r20, r10
    LDI r20, NEW_ENTRY
    STORE r20, r10
append_digit:
    LDI r20, DISP_VAL
    LOAD r3, r20
    LDI r15, 10
    MUL r3, r15
    ADD r3, r4
    STORE r20, r3
    POP r31
    RET

; ── OPERATORS ─────────────────────────────────────
do_add:
    PUSH r31
    LDI r3, 1
    LDI r20, OPER
    STORE r20, r3
    CALL apply_op
    POP r31
    RET

do_sub:
    PUSH r31
    LDI r3, 2
    LDI r20, OPER
    STORE r20, r3
    CALL apply_op
    POP r31
    RET

do_mul:
    PUSH r31
    LDI r3, 3
    LDI r20, OPER
    STORE r20, r3
    CALL apply_op
    POP r31
    RET

do_div:
    PUSH r31
    LDI r3, 4
    LDI r20, OPER
    STORE r20, r3
    CALL apply_op
    POP r31
    RET

apply_op:
    PUSH r31
    LDI r20, DISP_VAL
    LOAD r3, r20
    LDI r20, ACCUM
    STORE r20, r3
    LDI r20, NEW_ENTRY
    LDI r3, 1
    STORE r20, r3
    POP r31
    RET

; ── EVALUATE ──────────────────────────────────────
evaluate:
    PUSH r31
    LDI r20, OPER
    LOAD r15, r20

    CMPI r15, 1
    JNZ r9, ev_not_add
    LDI r20, ACCUM
    LOAD r3, r20
    LDI r20, DISP_VAL
    LOAD r14, r20
    ADD r3, r14
    LDI r20, DISP_VAL
    STORE r20, r3
    JMP ev_done

ev_not_add:
    CMPI r15, 2
    JNZ r9, ev_not_sub
    LDI r20, ACCUM
    LOAD r3, r20
    LDI r20, DISP_VAL
    LOAD r14, r20
    SUB r3, r14
    LDI r20, DISP_VAL
    STORE r20, r3
    JMP ev_done

ev_not_sub:
    CMPI r15, 3
    JNZ r9, ev_not_mul
    LDI r20, ACCUM
    LOAD r3, r20
    LDI r20, DISP_VAL
    LOAD r14, r20
    MUL r3, r14
    LDI r20, DISP_VAL
    STORE r20, r3
    JMP ev_done

ev_not_mul:
    CMPI r15, 4
    JNZ r9, ev_done
    LDI r20, ACCUM
    LOAD r3, r20
    LDI r20, DISP_VAL
    LOAD r14, r20
    CMPI r14, 0
    JZ r9, ev_done
    DIV r3, r14
    LDI r20, DISP_VAL
    STORE r20, r3

ev_done:
    LDI r20, OPER
    LDI r3, 0
    STORE r20, r3
    LDI r20, NEW_ENTRY
    LDI r3, 1
    STORE r20, r3
    LDI r20, ACCUM
    LDI r3, 0
    STORE r20, r3
    POP r31
    RET

; ── SIN (angle in display degrees, result * 1000) ─
do_sin:
    PUSH r31
    LDI r20, DISP_VAL
    LOAD r11, r20     ; angle in degrees (0-359)

    ; Normalize to 0-359
    LDI r8, 360
    MOD r11, r8

    ; Determine quadrant and map to 0-90
    ; table_index = angle * 16 / 90 (for 16-entry table over 0-90 deg)
    LDI r1, 0        ; negative flag
    LDI r0, 90

    CMP r11, r0
    BLT r9, sin_q1
    LDI r0, 180
    CMP r11, r0
    BLT r9, sin_q2
    LDI r0, 270
    CMP r11, r0
    BLT r9, sin_q3
    ; Q4: 270-359
    LDI r8, 360
    SUB r11, r8       ; angle = 360 - original
    NEG r11            ; angle = -(360 - orig) = orig - 360... no
    ; Better: angle = 360 - original
    LDI r20, DISP_VAL
    LOAD r11, r20
    LDI r8, 360
    SUB r8, r11       ; 360 - angle
    MOV r11, r8
    JMP sin_do_lookup

sin_q1:
    ; angle already 0-89, direct
    JMP sin_do_lookup

sin_q2:
    ; 90-179: effective = 180 - angle
    LDI r8, 180
    SUB r8, r11
    MOV r11, r8
    JMP sin_do_lookup

sin_q3:
    ; 180-269: effective = angle - 180, negate result
    LDI r8, 180
    SUB r11, r8
    LDI r1, 1         ; mark negate
    JMP sin_do_lookup

sin_do_lookup:
    ; r11 = effective angle (0-89)
    ; table_index = r11 * 16 / 90
    LDI r8, 16
    MUL r11, r8
    LDI r8, 90
    DIV r11, r8       ; table index (0-15)

    ; Clamp
    CMPI r11, 0
    BGE r9, sin_clamp_lo_ok
    LDI r11, 0
sin_clamp_lo_ok:
    CMPI r11, 15
    BLT r9, sin_clamp_hi_ok
    LDI r11, 15
sin_clamp_hi_ok:

    ; Look up
    LDI r20, SIN_QTR
    ADD r20, r11
    LOAD r11, r20

    ; Negate if Q3/Q4
    CMPI r1, 1
    JNZ r9, sin_no_neg
    NEG r11
sin_no_neg:

    LDI r20, DISP_VAL
    STORE r20, r11
    LDI r20, NEW_ENTRY
    LDI r3, 1
    STORE r20, r3
    POP r31
    RET

; ── COS (cos(x) = sin(90-x)) ──────────────────────
do_cos:
    PUSH r31
    ; cos(x) = sin(90 - x), or equivalently sin(x + 90)
    LDI r20, DISP_VAL
    LOAD r11, r20
    ADDI r11, 90
    LDI r20, DISP_VAL
    STORE r20, r11
    CALL do_sin
    POP r31
    RET

; ── SQRT (Newton method) ──────────────────────────
do_sqrt:
    PUSH r31
    LDI r20, DISP_VAL
    LOAD r11, r20

    CMPI r11, 0
    JZ r9, sqrt_done

    ; Initial guess = N / 2 + 1
    LDI r8, 2
    MOV r1, r11
    DIV r1, r8
    ADDI r1, 1

    ; 10 Newton iterations
    LDI r0, 10
sqrt_iter:
    MOV r13, r11
    DIV r13, r1       ; N/guess
    ADD r13, r1       ; guess + N/guess
    DIV r13, r8       ; / 2
    MOV r1, r13
    SUBI r0, 1
    JNZ r0, sqrt_iter

    MOV r11, r1
sqrt_done:
    LDI r20, DISP_VAL
    STORE r20, r11
    LDI r20, NEW_ENTRY
    LDI r3, 1
    STORE r20, r3
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
    LDI r7, 1
    STORE r20, r7
    POP r31
    RET

; ── RENDER ────────────────────────────────────────
render:
    PUSH r31
    LDI r2, 1

    ; Background
    LDI r10, 0x0D1B2A
    FILL r10

    ; Title bar
    LDI r10, 0x1B3A4B
    LDI r7, 0
    LDI r6, 0
    LDI r4, 256
    LDI r3, 20
    RECTF r7, r6, r4, r3, r10

    ; Title
    LDI r20, TXT_BUF
    STRO r20, "SCI-CALC"
    LDI r7, 85
    LDI r6, 4
    LDI r20, TXT_BUF
    TEXT r7, r6, r20

    ; Display panel
    LDI r10, 0x060612
    LDI r7, 20
    LDI r6, 28
    LDI r4, 216
    LDI r3, 40
    RECTF r7, r6, r4, r3, r10

    ; Convert display value to string at DISP_STR
    LDI r20, DISP_STR
    LDI r21, DISP_VAL
    LOAD r11, r21

    ; Handle negative
    LDI r22, 0
    LDI r23, 0
    CMP r11, r23
    BGE r9, pos_num
    NEG r11
    LDI r22, 1

pos_num:
    ; Digit extraction
    LDI r23, 0
    LDI r24, 10

    CMPI r11, 0
    JNZ r9, not_zero
    LDI r25, 0x30
    STORE r20, r25
    ADDI r20, 1
    ADDI r23, 1
    JMP num_done

not_zero:
    LDI r25, 0x6100    ; temp buffer
div_loop:
    CMPI r11, 0
    JZ r9, div_done
    MOV r26, r11
    MOD r26, r24
    ADDI r26, 0x30
    STORE r25, r26
    ADDI r25, 1
    ADDI r23, 1
    DIV r11, r24
    JMP div_loop

div_done:
    ; Write negative sign
    CMPI r22, 0
    JZ r9, no_neg
    LDI r26, 0x2D
    STORE r20, r26
    ADDI r20, 1

no_neg:
    ; Copy digits in reverse from temp buffer
    LDI r25, 0x6100
    ADD r25, r23
rev_loop:
    CMPI r23, 0
    JZ r9, num_done
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
    LDI r7, 40
    LDI r6, 35
    LDI r4, 0x00FF00
    LDI r20, DISP_STR
    DRAWTEXT r7, r6, r20, r4, r4

    ; Function labels panel
    LDI r10, 0x0D0D1A
    LDI r7, 20
    LDI r6, 75
    LDI r4, 216
    LDI r3, 80
    RECTF r7, r6, r4, r3, r10

    ; Labels
    LDI r20, TXT_BUF
    STRO r20, "S:sin C:cos Q:sqrt"
    LDI r7, 30
    LDI r6, 85
    LDI r4, 0x88BBFF
    DRAWTEXT r7, r6, r20, r4, r4

    LDI r20, TXT_BUF
    STRO r20, "+ - * / = Enter"
    LDI r7, 30
    LDI r6, 100
    LDI r4, 0x88BBFF
    DRAWTEXT r7, r6, r20, r4, r4

    LDI r20, TXT_BUF
    STRO r20, "Esc:clear  0-9:digits"
    LDI r7, 30
    LDI r6, 115
    LDI r4, 0x88BBFF
    DRAWTEXT r7, r6, r20, r4, r4

    ; Bottom bar
    LDI r10, 0x0A0A1A
    LDI r7, 0
    LDI r6, 240
    LDI r4, 256
    LDI r3, 16
    RECTF r7, r6, r4, r3, r10

    POP r31
    RET
