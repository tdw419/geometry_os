; DESCRIPTION: Geometry OS program to draw a colored object.

; gui_calc.asm -- GUI Calculator App for Geometry OS
;
; Proves: HITSET/HITQ mouse buttons, RECTF rendering, TEXT display,
;         ADD/SUB/MUL/DIV arithmetic, FRAME loop, number conversion.
;
; Layout (256x256 canvas):
;   Display area: x=20, y=20, w=216, h=40 (shows current number)
;   Button grid:  4 columns x 5 rows, starting at (20, 70)
;   Each button:  48x38 pixels, 4px gap
;   Row 0: C  /  *  -
;   Row 1: 7  8  9  +
;   Row 2: 4  5  6  =
;   Row 3: 1  2  3  (blank)
;   Row 4: 0 (span 2 cols)  .  (blank)
;
; RAM Layout:
;   0x400 = display value (current number shown)
;   0x404 = accumulator (stored from first operand)
;   0x408 = operator (0=none, 1=add, 2=sub, 3=mul, 4=div)
;   0x40C = state (0=entering first, 1=operator pressed, 2=entering second)
;   0x410 = new entry flag (1=next digit starts fresh)
;   0x414 = tick counter (for animation)
;   0x500 = text buffer for display (20 chars)
;   0x600 = digit conversion temp buffer
;   0x620 = digit count temp
;   0x624 = quotient temp
;   0x628 = buffer pointer temp
;
; Register allocation:
;   r2  = constant 1 (reloaded as needed)
;   r15  = scratch
;   r14  = scratch
;   r11  = scratch
;   r6  = scratch (colors, values)
;   r10  = scratch
;   r5 = mouse X from MOUSEQ
;   r13 = mouse Y from MOUSEQ
;   r1 = hit query result
;   r20 = RAM pointer
;   r21 = digit conversion scratch
;   r22 = temp
;
; Button IDs:
;   1=C, 2=/, 3=*, 4=-, 5=7, 6=8, 7=9, 8=+,
;   9=4, 10=5, 11=6, 12==, 13=1, 14=2, 15=3,
;   16=0, 17=., 99=nothing
;
; NOTE: Avoid colons in comments (assembler pitfall)
; NOTE: SLEEP takes a register, not an immediate
; NOTE: STORE takes registers, not immediates

#define DISP_VAL   0x400
#define ACCUM      0x404
#define OPER       0x408
#define STATE      0x40C
#define NEW_ENTRY  0x410
#define TICK       0x414
#define TXT_BUF    0x500
#define DIG_BUF    0x600
#define DIG_COUNT  0x620
#define DIG_QUOT   0x624
#define DIG_PTR    0x628

; ── INIT ──────────────────────────────────────────
    LDI r2, 1

; Display value = 0
    LDI r20, DISP_VAL
    LDI r15, 0
    STORE r20, r15

; Accumulator = 0
    LDI r20, ACCUM
    STORE r20, r15

; Operator = none (0)
    LDI r20, OPER
    STORE r20, r15

; State = entering first number (0)
    LDI r20, STATE
    STORE r20, r15

; New entry = no (0)
    LDI r20, NEW_ENTRY
    STORE r20, r15

; Tick = 0
    LDI r20, TICK
    STORE r20, r15

; Fill screen dark
    LDI r15, 0x1A1A2E
    FILL r15

; ── Register all button hit regions ──
; Button grid: 4 cols x 5 rows
; Each button: 48x38, gap=4, total cell=52
; Start: x=20, y=70

; Row 0: C  /  *  -
    LDI r2, 20
    LDI r15, 70
    LDI r14, 48
    LDI r11, 38
    HITSET r2, r15, r14, r11, 1

    LDI r2, 72
    HITSET r2, r15, r14, r11, 2

    LDI r2, 124
    HITSET r2, r15, r14, r11, 3

    LDI r2, 176
    HITSET r2, r15, r14, r11, 4

; Row 1: 7  8  9  +
    LDI r2, 20
    LDI r15, 112
    HITSET r2, r15, r14, r11, 5

    LDI r2, 72
    HITSET r2, r15, r14, r11, 6

    LDI r2, 124
    HITSET r2, r15, r14, r11, 7

    LDI r2, 176
    HITSET r2, r15, r14, r11, 8

; Row 2: 4  5  6  =
    LDI r2, 20
    LDI r15, 154
    HITSET r2, r15, r14, r11, 9

    LDI r2, 72
    HITSET r2, r15, r14, r11, 10

    LDI r2, 124
    HITSET r2, r15, r14, r11, 11

    LDI r2, 176
    HITSET r2, r15, r14, r11, 12

; Row 3: 1  2  3  (empty)
    LDI r2, 20
    LDI r15, 196
    HITSET r2, r15, r14, r11, 13

    LDI r2, 72
    HITSET r2, r15, r14, r11, 14

    LDI r2, 124
    HITSET r2, r15, r14, r11, 15

; Row 4: 0 (wide)  .  (empty)
; Button 0 spans 2 cols: 100x38
    LDI r2, 20
    LDI r15, 238
    LDI r14, 100
    LDI r11, 16
    HITSET r2, r15, r14, r11, 16

    LDI r2, 124
    LDI r14, 48
    LDI r11, 16
    HITSET r2, r15, r14, r11, 17

; ── MAIN LOOP ─────────────────────────────────────
main_loop:
    LDI r2, 1

; Increment tick
    LDI r20, TICK
    LOAD r15, r20
    ADD r15, r2
    STORE r20, r15

; Read mouse
    MOUSEQ r5

; Query hit regions
    HITQ r1
    JZ r1, draw_ui

; Handle button clicks
    CMPI r1, 1
    JZ r12, btn_clear

    CMPI r1, 2
    JZ r12, btn_div

    CMPI r1, 3
    JZ r12, btn_mul

    CMPI r1, 4
    JZ r12, btn_sub

    CMPI r1, 5
    JZ r12, btn_7

    CMPI r1, 6
    JZ r12, btn_8

    CMPI r1, 7
    JZ r12, btn_9

    CMPI r1, 8
    JZ r12, btn_add

    CMPI r1, 9
    JZ r12, btn_4

    CMPI r1, 10
    JZ r12, btn_5

    CMPI r1, 11
    JZ r12, btn_6

    CMPI r1, 12
    JZ r12, btn_eq

    CMPI r1, 13
    JZ r12, btn_1

    CMPI r1, 14
    JZ r12, btn_2

    CMPI r1, 15
    JZ r12, btn_3

    CMPI r1, 16
    JZ r12, btn_0

    CMPI r1, 17
    JZ r12, btn_dot

    JMP draw_ui

; ── Digit buttons ──────────────────────────────────
; Each digit: if new_entry, clear display first, then append digit
btn_0:
    LDI r2, 1
    LDI r20, NEW_ENTRY
    LOAD r15, r20
    CMPI r15, 1
    JZ r12, do_0_clear
    JMP do_0_append
do_0_clear:
    LDI r20, DISP_VAL
    LDI r15, 0
    STORE r20, r15
    LDI r20, NEW_ENTRY
    STORE r20, r15
do_0_append:
    LDI r20, DISP_VAL
    LOAD r15, r20
    LDI r14, 10
    MUL r15, r14
    STORE r20, r15
    JMP draw_ui

btn_1:
    LDI r2, 1
    CALL enter_digit_start
    LDI r15, 1
    JMP enter_digit_finish

btn_2:
    LDI r2, 1
    CALL enter_digit_start
    LDI r15, 2
    JMP enter_digit_finish

btn_3:
    LDI r2, 1
    CALL enter_digit_start
    LDI r15, 3
    JMP enter_digit_finish

btn_4:
    LDI r2, 1
    CALL enter_digit_start
    LDI r15, 4
    JMP enter_digit_finish

btn_5:
    LDI r2, 1
    CALL enter_digit_start
    LDI r15, 5
    JMP enter_digit_finish

btn_6:
    LDI r2, 1
    CALL enter_digit_start
    LDI r15, 6
    JMP enter_digit_finish

btn_7:
    LDI r2, 1
    CALL enter_digit_start
    LDI r15, 7
    JMP enter_digit_finish

btn_8:
    LDI r2, 1
    CALL enter_digit_start
    LDI r15, 8
    JMP enter_digit_finish

btn_9:
    LDI r2, 1
    CALL enter_digit_start
    LDI r15, 9
    JMP enter_digit_finish

btn_dot:
    ; For simplicity, just append a visual indicator -- skip real decimal
    ; In a full implementation we would track decimal position
    JMP draw_ui

; enter_digit_start: if new_entry, clear display value
enter_digit_start:
    LDI r2, 1
    LDI r20, NEW_ENTRY
    LOAD r15, r20
    CMPI r15, 1
    JZ r12, eds_clear
    RET
eds_clear:
    LDI r20, DISP_VAL
    LDI r15, 0
    STORE r20, r15
    LDI r20, NEW_ENTRY
    STORE r20, r15
    LDI r2, 1
    RET

; enter_digit_finish: r15=digit value, multiply display by 10 and add digit
enter_digit_finish:
    LDI r2, 1
    LDI r20, DISP_VAL
    LOAD r14, r20
    LDI r11, 10
    MUL r14, r11
    ADD r14, r15
    STORE r20, r14
    JMP draw_ui

; ── Operator buttons ───────────────────────────────
btn_add:
    LDI r2, 1
    LDI r20, OPER
    LDI r15, 1
    STORE r20, r15
    CALL save_accum_and_set_state
    JMP draw_ui

btn_sub:
    LDI r2, 1
    LDI r20, OPER
    LDI r15, 2
    STORE r20, r15
    CALL save_accum_and_set_state
    JMP draw_ui

btn_mul:
    LDI r2, 1
    LDI r20, OPER
    LDI r15, 3
    STORE r20, r15
    CALL save_accum_and_set_state
    JMP draw_ui

btn_div:
    LDI r2, 1
    LDI r20, OPER
    LDI r15, 4
    STORE r20, r15
    CALL save_accum_and_set_state
    JMP draw_ui

; save_accum_and_set_state: save display to accumulator, set state=2, new_entry=1
save_accum_and_set_state:
    LDI r2, 1
    ; If state is 2 (entering second), compute pending first
    LDI r20, STATE
    LOAD r15, r20
    CMPI r15, 2
    JNZ r12, sas_set
    ; Compute pending operation
    CALL do_compute
sas_set:
    ; Save display to accumulator
    LDI r20, DISP_VAL
    LOAD r15, r20
    LDI r20, ACCUM
    STORE r20, r15
    ; Set state = 2 (entering second number)
    LDI r20, STATE
    LDI r15, 2
    STORE r20, r15
    ; Set new_entry = 1
    LDI r20, NEW_ENTRY
    LDI r15, 1
    STORE r20, r15
    LDI r2, 1
    RET

; ── Equals button ──────────────────────────────────
btn_eq:
    LDI r2, 1
    CALL do_compute
    JMP draw_ui

; do_compute: perform pending operation
; accumulator OP display_val -> display_val
; Then set state=0, new_entry=1
do_compute:
    LDI r2, 1
    ; Check if there is an operator
    LDI r20, OPER
    LOAD r15, r20
    CMPI r15, 0
    JZ r12, dc_done
    ; Load accumulator and display
    LDI r20, ACCUM
    LOAD r14, r20
    LDI r20, DISP_VAL
    LOAD r11, r20
    ; Branch on operator
    CMPI r15, 1
    JZ r12, dc_add
    CMPI r15, 2
    JZ r12, dc_sub
    CMPI r15, 3
    JZ r12, dc_mul
    CMPI r15, 4
    JZ r12, dc_div
    JMP dc_done

dc_add:
    ADD r14, r11
    JMP dc_store

dc_sub:
    SUB r14, r11
    JMP dc_store

dc_mul:
    MUL r14, r11
    JMP dc_store

dc_div:
    CMPI r11, 0
    JZ r12, dc_done
    DIV r14, r11

dc_store:
    LDI r20, DISP_VAL
    STORE r20, r14
    ; Clear operator
    LDI r20, OPER
    LDI r15, 0
    STORE r20, r15

dc_done:
    ; Set state=0, new_entry=1
    LDI r20, STATE
    LDI r15, 0
    STORE r20, r15
    LDI r20, NEW_ENTRY
    LDI r15, 1
    STORE r20, r15
    LDI r2, 1
    RET

; ── Clear button ───────────────────────────────────
btn_clear:
    LDI r2, 1
    LDI r20, DISP_VAL
    LDI r15, 0
    STORE r20, r15
    LDI r20, ACCUM
    STORE r20, r15
    LDI r20, OPER
    STORE r20, r15
    LDI r20, STATE
    STORE r20, r15
    LDI r20, NEW_ENTRY
    STORE r20, r15
    JMP draw_ui

; ── DRAW UI ────────────────────────────────────────
draw_ui:
    LDI r2, 1

    ; Redraw background
    LDI r15, 0x1A1A2E
    FILL r15

    ; ── Display area ──
    LDI r2, 20
    LDI r15, 20
    LDI r14, 216
    LDI r11, 40
    LDI r6, 0x0F3460
    RECTF r2, r15, r14, r11, r6

    ; Convert display value to string
    LDI r20, DISP_VAL
    LOAD r6, r20
    LDI r20, TXT_BUF
    CALL num_to_str

    ; Render display text (right-aligned at x=220, y=32)
    LDI r2, 220
    LDI r15, 32
    LDI r14, TXT_BUF
    TEXT r2, r15, r14

    ; ── Draw buttons ──
    ; Row 0: C(1) /(2) *(3) -(4)
    LDI r2, 20
    LDI r15, 70
    LDI r14, 48
    LDI r11, 38
    LDI r6, 0xE74C3C
    RECTF r2, r15, r14, r11, r6
    ; "C" label
    LDI r20, TXT_BUF
    LDI r15, 67
    STORE r20, r15
    LDI r15, 0
    ADD r20, r2
    STORE r20, r15
    LDI r2, 40
    LDI r15, 82
    LDI r14, TXT_BUF
    TEXT r2, r15, r14

    ; / button (orange)
    LDI r2, 72
    LDI r15, 70
    LDI r6, 0xFF8800
    RECTF r2, r15, r14, r11, r6
    LDI r20, TXT_BUF
    LDI r15, 47
    STORE r20, r15
    LDI r15, 0
    ADD r20, r2
    STORE r20, r15
    LDI r2, 92
    LDI r15, 82
    LDI r14, TXT_BUF
    TEXT r2, r15, r14

    ; * button (orange)
    LDI r2, 124
    LDI r15, 70
    RECTF r2, r15, r14, r11, r6
    LDI r20, TXT_BUF
    LDI r15, 42
    STORE r20, r15
    LDI r15, 0
    ADD r20, r2
    STORE r20, r15
    LDI r2, 144
    LDI r15, 82
    LDI r14, TXT_BUF
    TEXT r2, r15, r14

    ; - button (orange)
    LDI r2, 176
    LDI r15, 70
    RECTF r2, r15, r14, r11, r6
    LDI r20, TXT_BUF
    LDI r15, 45
    STORE r20, r15
    LDI r15, 0
    ADD r20, r2
    STORE r20, r15
    LDI r2, 196
    LDI r15, 82
    LDI r14, TXT_BUF
    TEXT r2, r15, r14

    ; Row 1: 7(5) 8(6) 9(7) +(8)
    LDI r2, 20
    LDI r15, 112
    LDI r14, 48
    LDI r11, 38
    LDI r6, 0x2C3E50
    RECTF r2, r15, r14, r11, r6
    ; "7"
    LDI r20, TXT_BUF
    LDI r15, 55
    STORE r20, r15
    LDI r15, 0
    ADD r20, r2
    STORE r20, r15
    LDI r2, 40
    LDI r15, 124
    LDI r14, TXT_BUF
    TEXT r2, r15, r14

    LDI r2, 72
    LDI r15, 112
    RECTF r2, r15, r14, r11, r6
    LDI r20, TXT_BUF
    LDI r15, 56
    STORE r20, r15
    LDI r15, 0
    ADD r20, r2
    STORE r20, r15
    LDI r2, 92
    LDI r15, 124
    LDI r14, TXT_BUF
    TEXT r2, r15, r14

    LDI r2, 124
    LDI r15, 112
    RECTF r2, r15, r14, r11, r6
    LDI r20, TXT_BUF
    LDI r15, 57
    STORE r20, r15
    LDI r15, 0
    ADD r20, r2
    STORE r20, r15
    LDI r2, 144
    LDI r15, 124
    LDI r14, TXT_BUF
    TEXT r2, r15, r14

    ; + button (green)
    LDI r2, 176
    LDI r15, 112
    LDI r6, 0x27AE60
    RECTF r2, r15, r14, r11, r6
    LDI r20, TXT_BUF
    LDI r15, 43
    STORE r20, r15
    LDI r15, 0
    ADD r20, r2
    STORE r20, r15
    LDI r2, 196
    LDI r15, 124
    LDI r14, TXT_BUF
    TEXT r2, r15, r14

    ; Row 2: 4(9) 5(10) 6(11) =(12)
    LDI r2, 20
    LDI r15, 154
    LDI r14, 48
    LDI r11, 38
    LDI r6, 0x2C3E50
    RECTF r2, r15, r14, r11, r6
    LDI r20, TXT_BUF
    LDI r15, 52
    STORE r20, r15
    LDI r15, 0
    ADD r20, r2
    STORE r20, r15
    LDI r2, 40
    LDI r15, 166
    LDI r14, TXT_BUF
    TEXT r2, r15, r14

    LDI r2, 72
    LDI r15, 154
    RECTF r2, r15, r14, r11, r6
    LDI r20, TXT_BUF
    LDI r15, 53
    STORE r20, r15
    LDI r15, 0
    ADD r20, r2
    STORE r20, r15
    LDI r2, 92
    LDI r15, 166
    LDI r14, TXT_BUF
    TEXT r2, r15, r14

    LDI r2, 124
    LDI r15, 154
    RECTF r2, r15, r14, r11, r6
    LDI r20, TXT_BUF
    LDI r15, 54
    STORE r20, r15
    LDI r15, 0
    ADD r20, r2
    STORE r20, r15
    LDI r2, 144
    LDI r15, 166
    LDI r14, TXT_BUF
    TEXT r2, r15, r14

    ; = button (green)
    LDI r2, 176
    LDI r15, 154
    LDI r6, 0x27AE60
    RECTF r2, r15, r14, r11, r6
    LDI r20, TXT_BUF
    LDI r15, 61
    STORE r20, r15
    LDI r15, 0
    ADD r20, r2
    STORE r20, r15
    LDI r2, 196
    LDI r15, 166
    LDI r14, TXT_BUF
    TEXT r2, r15, r14

    ; Row 3: 1(13) 2(14) 3(15) (empty)
    LDI r2, 20
    LDI r15, 196
    LDI r14, 48
    LDI r11, 38
    LDI r6, 0x2C3E50
    RECTF r2, r15, r14, r11, r6
    LDI r20, TXT_BUF
    LDI r15, 49
    STORE r20, r15
    LDI r15, 0
    ADD r20, r2
    STORE r20, r15
    LDI r2, 40
    LDI r15, 208
    LDI r14, TXT_BUF
    TEXT r2, r15, r14

    LDI r2, 72
    LDI r15, 196
    RECTF r2, r15, r14, r11, r6
    LDI r20, TXT_BUF
    LDI r15, 50
    STORE r20, r15
    LDI r15, 0
    ADD r20, r2
    STORE r20, r15
    LDI r2, 92
    LDI r15, 208
    LDI r14, TXT_BUF
    TEXT r2, r15, r14

    LDI r2, 124
    LDI r15, 196
    RECTF r2, r15, r14, r11, r6
    LDI r20, TXT_BUF
    LDI r15, 51
    STORE r20, r15
    LDI r15, 0
    ADD r20, r2
    STORE r20, r15
    LDI r2, 144
    LDI r15, 208
    LDI r14, TXT_BUF
    TEXT r2, r15, r14

    ; Row 4: 0(16, wide) .(17) (empty)
    LDI r2, 20
    LDI r15, 238
    LDI r14, 100
    LDI r11, 16
    LDI r6, 0x2C3E50
    RECTF r2, r15, r14, r11, r6
    LDI r20, TXT_BUF
    LDI r15, 48
    STORE r20, r15
    LDI r15, 0
    ADD r20, r2
    STORE r20, r15
    LDI r2, 60
    LDI r15, 242
    LDI r14, TXT_BUF
    TEXT r2, r15, r14

    LDI r2, 124
    LDI r15, 238
    LDI r14, 48
    LDI r11, 16
    LDI r6, 0x2C3E50
    RECTF r2, r15, r14, r11, r6
    LDI r20, TXT_BUF
    LDI r15, 46
    STORE r20, r15
    LDI r15, 0
    ADD r20, r2
    STORE r20, r15
    LDI r2, 144
    LDI r15, 242
    LDI r14, TXT_BUF
    TEXT r2, r15, r14

    ; ── Title ──
    LDI r20, TXT_BUF
    LDI r15, 71
    STORE r20, r15
    LDI r15, 85
    ADD r20, r2
    STORE r20, r15
    LDI r15, 73
    ADD r20, r2
    STORE r20, r15
    LDI r15, 32
    ADD r20, r2
    STORE r20, r15
    LDI r15, 67
    ADD r20, r2
    STORE r20, r15
    LDI r15, 65
    ADD r20, r2
    STORE r20, r15
    LDI r15, 76
    ADD r20, r2
    STORE r20, r15
    LDI r15, 0
    ADD r20, r2
    STORE r20, r15
    LDI r2, 80
    LDI r15, 5
    LDI r14, TXT_BUF
    TEXT r2, r15, r14

do_frame:
    FRAME
    JMP main_loop

; ── num_to_str subroutine ──────────────────────────
; Input:  r6 = number, r20 = buffer address
; Output: null-terminated string at r20, r20 advanced
; Clobbers: r12, r15, r14, r11, r21, r22
; Uses RAM: DIG_BUF(0x600), DIG_COUNT(0x620), DIG_QUOT(0x624), DIG_PTR(0x628)
num_to_str:
    LDI r2, 1
    CMPI r6, 0
    JNZ r12, nts_loop1

    ; Handle zero
    LDI r15, 48
    STORE r20, r15
    ADD r20, r2
    LDI r15, 0
    STORE r20, r15
    RET

nts_loop1:
    ; Init reversed buffer
    LDI r22, DIG_BUF
    LDI r15, DIG_PTR
    STORE r15, r22
    LDI r21, 0
    LDI r15, DIG_COUNT
    STORE r15, r21

nts_loop2:
    CMPI r6, 0
    JZ r12, nts_rev1

    ; r14 = r6 / 10
    LDI r14, 0
    ADD r14, r6
    LDI r11, 10
    DIV r14, r11
    LDI r15, DIG_QUOT
    STORE r15, r14

    ; r6 = r6 - r14*10 (remainder)
    LDI r15, 0
    ADD r15, r14
    MUL r15, r11
    SUB r6, r15
    ; Convert to ASCII
    LDI r15, 48
    ADD r6, r15

    ; Store in reversed buffer
    LDI r15, DIG_PTR
    LOAD r22, r15
    STORE r22, r6
    ADD r22, r2
    LDI r15, DIG_PTR
    STORE r15, r22

    ; Increment count
    LDI r15, DIG_COUNT
    LOAD r21, r15
    ADD r21, r2
    LDI r15, DIG_COUNT
    STORE r15, r21

    ; r6 = quotient
    LDI r15, DIG_QUOT
    LOAD r6, r15
    JMP nts_loop2

nts_rev1:
    ; Reverse digits into output buffer
    LDI r15, DIG_COUNT
    LOAD r21, r15
    LDI r22, DIG_BUF

nts_rev2:
    CMPI r21, 0
    JZ r12, nts_end
    SUB r21, r2
    ; Load digit from reversed buffer
    LDI r15, 0
    ADD r15, r22
    ADD r15, r21
    LOAD r15, r15
    ; Store to output buffer
    STORE r20, r15
    ADD r20, r2
    JMP nts_rev2

nts_end:
    LDI r15, 0
    STORE r20, r15
    LDI r2, 1
    RET
