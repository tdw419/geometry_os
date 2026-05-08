; DESCRIPTION: This GeOS assembly code implements a graphical user interface (GUI) calculator application. It handles mouse input to detect button clicks, performs arithmetic operations such as addition, subtraction, multiplication, and division, and updates the display accordingly. The calculator features a 256x256 pixel canvas with buttons arranged in a grid, and it uses RAM for storing various states and temporary values during computation.

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
;   r0  = constant 1 (reloaded as needed)
;   r9  = scratch
;   r13  = scratch
;   r1  = scratch
;   r5  = scratch (colors, values)
;   r6  = scratch
;   r7 = mouse X from MOUSEQ
;   r2 = mouse Y from MOUSEQ
;   r4 = hit query result
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
    LDI r0, 1

; Display value = 0
    LDI r20, DISP_VAL
    LDI r9, 0
    STORE r20, r9

; Accumulator = 0
    LDI r20, ACCUM
    STORE r20, r9

; Operator = none (0)
    LDI r20, OPER
    STORE r20, r9

; State = entering first number (0)
    LDI r20, STATE
    STORE r20, r9

; New entry = no (0)
    LDI r20, NEW_ENTRY
    STORE r20, r9

; Tick = 0
    LDI r20, TICK
    STORE r20, r9

; Fill screen dark
    LDI r9, 0x1A1A2E
    FILL r9

; ── Register all button hit regions ──
; Button grid: 4 cols x 5 rows
; Each button: 48x38, gap=4, total cell=52
; Start: x=20, y=70

; Row 0: C  /  *  -
    LDI r0, 20
    LDI r9, 70
    LDI r13, 48
    LDI r1, 38
    HITSET r0, r9, r13, r1, 1

    LDI r0, 72
    HITSET r0, r9, r13, r1, 2

    LDI r0, 124
    HITSET r0, r9, r13, r1, 3

    LDI r0, 176
    HITSET r0, r9, r13, r1, 4

; Row 1: 7  8  9  +
    LDI r0, 20
    LDI r9, 112
    HITSET r0, r9, r13, r1, 5

    LDI r0, 72
    HITSET r0, r9, r13, r1, 6

    LDI r0, 124
    HITSET r0, r9, r13, r1, 7

    LDI r0, 176
    HITSET r0, r9, r13, r1, 8

; Row 2: 4  5  6  =
    LDI r0, 20
    LDI r9, 154
    HITSET r0, r9, r13, r1, 9

    LDI r0, 72
    HITSET r0, r9, r13, r1, 10

    LDI r0, 124
    HITSET r0, r9, r13, r1, 11

    LDI r0, 176
    HITSET r0, r9, r13, r1, 12

; Row 3: 1  2  3  (empty)
    LDI r0, 20
    LDI r9, 196
    HITSET r0, r9, r13, r1, 13

    LDI r0, 72
    HITSET r0, r9, r13, r1, 14

    LDI r0, 124
    HITSET r0, r9, r13, r1, 15

; Row 4: 0 (wide)  .  (empty)
; Button 0 spans 2 cols: 100x38
    LDI r0, 20
    LDI r9, 238
    LDI r13, 100
    LDI r1, 16
    HITSET r0, r9, r13, r1, 16

    LDI r0, 124
    LDI r13, 48
    LDI r1, 16
    HITSET r0, r9, r13, r1, 17

; ── MAIN LOOP ─────────────────────────────────────
main_loop:
    LDI r0, 1

; Increment tick
    LDI r20, TICK
    LOAD r9, r20
    ADD r9, r0
    STORE r20, r9

; Read mouse
    MOUSEQ r7

; Query hit regions
    HITQ r4
    JZ r4, draw_ui

; Handle button clicks
    CMPI r4, 1
    JZ r3, btn_clear

    CMPI r4, 2
    JZ r3, btn_div

    CMPI r4, 3
    JZ r3, btn_mul

    CMPI r4, 4
    JZ r3, btn_sub

    CMPI r4, 5
    JZ r3, btn_7

    CMPI r4, 6
    JZ r3, btn_8

    CMPI r4, 7
    JZ r3, btn_9

    CMPI r4, 8
    JZ r3, btn_add

    CMPI r4, 9
    JZ r3, btn_4

    CMPI r4, 10
    JZ r3, btn_5

    CMPI r4, 11
    JZ r3, btn_6

    CMPI r4, 12
    JZ r3, btn_eq

    CMPI r4, 13
    JZ r3, btn_1

    CMPI r4, 14
    JZ r3, btn_2

    CMPI r4, 15
    JZ r3, btn_3

    CMPI r4, 16
    JZ r3, btn_0

    CMPI r4, 17
    JZ r3, btn_dot

    JMP draw_ui

; ── Digit buttons ──────────────────────────────────
; Each digit: if new_entry, clear display first, then append digit
btn_0:
    LDI r0, 1
    LDI r20, NEW_ENTRY
    LOAD r9, r20
    CMPI r9, 1
    JZ r3, do_0_clear
    JMP do_0_append
do_0_clear:
    LDI r20, DISP_VAL
    LDI r9, 0
    STORE r20, r9
    LDI r20, NEW_ENTRY
    STORE r20, r9
do_0_append:
    LDI r20, DISP_VAL
    LOAD r9, r20
    LDI r13, 10
    MUL r9, r13
    STORE r20, r9
    JMP draw_ui

btn_1:
    LDI r0, 1
    CALL enter_digit_start
    LDI r9, 1
    JMP enter_digit_finish

btn_2:
    LDI r0, 1
    CALL enter_digit_start
    LDI r9, 2
    JMP enter_digit_finish

btn_3:
    LDI r0, 1
    CALL enter_digit_start
    LDI r9, 3
    JMP enter_digit_finish

btn_4:
    LDI r0, 1
    CALL enter_digit_start
    LDI r9, 4
    JMP enter_digit_finish

btn_5:
    LDI r0, 1
    CALL enter_digit_start
    LDI r9, 5
    JMP enter_digit_finish

btn_6:
    LDI r0, 1
    CALL enter_digit_start
    LDI r9, 6
    JMP enter_digit_finish

btn_7:
    LDI r0, 1
    CALL enter_digit_start
    LDI r9, 7
    JMP enter_digit_finish

btn_8:
    LDI r0, 1
    CALL enter_digit_start
    LDI r9, 8
    JMP enter_digit_finish

btn_9:
    LDI r0, 1
    CALL enter_digit_start
    LDI r9, 9
    JMP enter_digit_finish

btn_dot:
    ; For simplicity, just append a visual indicator -- skip real decimal
    ; In a full implementation we would track decimal position
    JMP draw_ui

; enter_digit_start: if new_entry, clear display value
enter_digit_start:
    LDI r0, 1
    LDI r20, NEW_ENTRY
    LOAD r9, r20
    CMPI r9, 1
    JZ r3, eds_clear
    RET
eds_clear:
    LDI r20, DISP_VAL
    LDI r9, 0
    STORE r20, r9
    LDI r20, NEW_ENTRY
    STORE r20, r9
    LDI r0, 1
    RET

; enter_digit_finish: r9=digit value, multiply display by 10 and add digit
enter_digit_finish:
    LDI r0, 1
    LDI r20, DISP_VAL
    LOAD r13, r20
    LDI r1, 10
    MUL r13, r1
    ADD r13, r9
    STORE r20, r13
    JMP draw_ui

; ── Operator buttons ───────────────────────────────
btn_add:
    LDI r0, 1
    LDI r20, OPER
    LDI r9, 1
    STORE r20, r9
    CALL save_accum_and_set_state
    JMP draw_ui

btn_sub:
    LDI r0, 1
    LDI r20, OPER
    LDI r9, 2
    STORE r20, r9
    CALL save_accum_and_set_state
    JMP draw_ui

btn_mul:
    LDI r0, 1
    LDI r20, OPER
    LDI r9, 3
    STORE r20, r9
    CALL save_accum_and_set_state
    JMP draw_ui

btn_div:
    LDI r0, 1
    LDI r20, OPER
    LDI r9, 4
    STORE r20, r9
    CALL save_accum_and_set_state
    JMP draw_ui

; save_accum_and_set_state: save display to accumulator, set state=2, new_entry=1
save_accum_and_set_state:
    LDI r0, 1
    ; If state is 2 (entering second), compute pending first
    LDI r20, STATE
    LOAD r9, r20
    CMPI r9, 2
    JNZ r3, sas_set
    ; Compute pending operation
    CALL do_compute
sas_set:
    ; Save display to accumulator
    LDI r20, DISP_VAL
    LOAD r9, r20
    LDI r20, ACCUM
    STORE r20, r9
    ; Set state = 2 (entering second number)
    LDI r20, STATE
    LDI r9, 2
    STORE r20, r9
    ; Set new_entry = 1
    LDI r20, NEW_ENTRY
    LDI r9, 1
    STORE r20, r9
    LDI r0, 1
    RET

; ── Equals button ──────────────────────────────────
btn_eq:
    LDI r0, 1
    CALL do_compute
    JMP draw_ui

; do_compute: perform pending operation
; accumulator OP display_val -> display_val
; Then set state=0, new_entry=1
do_compute:
    LDI r0, 1
    ; Check if there is an operator
    LDI r20, OPER
    LOAD r9, r20
    CMPI r9, 0
    JZ r3, dc_done
    ; Load accumulator and display
    LDI r20, ACCUM
    LOAD r13, r20
    LDI r20, DISP_VAL
    LOAD r1, r20
    ; Branch on operator
    CMPI r9, 1
    JZ r3, dc_add
    CMPI r9, 2
    JZ r3, dc_sub
    CMPI r9, 3
    JZ r3, dc_mul
    CMPI r9, 4
    JZ r3, dc_div
    JMP dc_done

dc_add:
    ADD r13, r1
    JMP dc_store

dc_sub:
    SUB r13, r1
    JMP dc_store

dc_mul:
    MUL r13, r1
    JMP dc_store

dc_div:
    CMPI r1, 0
    JZ r3, dc_done
    DIV r13, r1

dc_store:
    LDI r20, DISP_VAL
    STORE r20, r13
    ; Clear operator
    LDI r20, OPER
    LDI r9, 0
    STORE r20, r9

dc_done:
    ; Set state=0, new_entry=1
    LDI r20, STATE
    LDI r9, 0
    STORE r20, r9
    LDI r20, NEW_ENTRY
    LDI r9, 1
    STORE r20, r9
    LDI r0, 1
    RET

; ── Clear button ───────────────────────────────────
btn_clear:
    LDI r0, 1
    LDI r20, DISP_VAL
    LDI r9, 0
    STORE r20, r9
    LDI r20, ACCUM
    STORE r20, r9
    LDI r20, OPER
    STORE r20, r9
    LDI r20, STATE
    STORE r20, r9
    LDI r20, NEW_ENTRY
    STORE r20, r9
    JMP draw_ui

; ── DRAW UI ────────────────────────────────────────
draw_ui:
    LDI r0, 1

    ; Redraw background
    LDI r9, 0x1A1A2E
    FILL r9

    ; ── Display area ──
    LDI r0, 20
    LDI r9, 20
    LDI r13, 216
    LDI r1, 40
    LDI r5, 0x0F3460
    RECTF r0, r9, r13, r1, r5

    ; Convert display value to string
    LDI r20, DISP_VAL
    LOAD r5, r20
    LDI r20, TXT_BUF
    CALL num_to_str

    ; Render display text (right-aligned at x=220, y=32)
    LDI r0, 220
    LDI r9, 32
    LDI r13, TXT_BUF
    TEXT r0, r9, r13

    ; ── Draw buttons ──
    ; Row 0: C(1) /(2) *(3) -(4)
    LDI r0, 20
    LDI r9, 70
    LDI r13, 48
    LDI r1, 38
    LDI r5, 0xE74C3C
    RECTF r0, r9, r13, r1, r5
    ; "C" label
    LDI r20, TXT_BUF
    LDI r9, 67
    STORE r20, r9
    LDI r9, 0
    ADD r20, r0
    STORE r20, r9
    LDI r0, 40
    LDI r9, 82
    LDI r13, TXT_BUF
    TEXT r0, r9, r13

    ; / button (orange)
    LDI r0, 72
    LDI r9, 70
    LDI r5, 0xFF8800
    RECTF r0, r9, r13, r1, r5
    LDI r20, TXT_BUF
    LDI r9, 47
    STORE r20, r9
    LDI r9, 0
    ADD r20, r0
    STORE r20, r9
    LDI r0, 92
    LDI r9, 82
    LDI r13, TXT_BUF
    TEXT r0, r9, r13

    ; * button (orange)
    LDI r0, 124
    LDI r9, 70
    RECTF r0, r9, r13, r1, r5
    LDI r20, TXT_BUF
    LDI r9, 42
    STORE r20, r9
    LDI r9, 0
    ADD r20, r0
    STORE r20, r9
    LDI r0, 144
    LDI r9, 82
    LDI r13, TXT_BUF
    TEXT r0, r9, r13

    ; - button (orange)
    LDI r0, 176
    LDI r9, 70
    RECTF r0, r9, r13, r1, r5
    LDI r20, TXT_BUF
    LDI r9, 45
    STORE r20, r9
    LDI r9, 0
    ADD r20, r0
    STORE r20, r9
    LDI r0, 196
    LDI r9, 82
    LDI r13, TXT_BUF
    TEXT r0, r9, r13

    ; Row 1: 7(5) 8(6) 9(7) +(8)
    LDI r0, 20
    LDI r9, 112
    LDI r13, 48
    LDI r1, 38
    LDI r5, 0x2C3E50
    RECTF r0, r9, r13, r1, r5
    ; "7"
    LDI r20, TXT_BUF
    LDI r9, 55
    STORE r20, r9
    LDI r9, 0
    ADD r20, r0
    STORE r20, r9
    LDI r0, 40
    LDI r9, 124
    LDI r13, TXT_BUF
    TEXT r0, r9, r13

    LDI r0, 72
    LDI r9, 112
    RECTF r0, r9, r13, r1, r5
    LDI r20, TXT_BUF
    LDI r9, 56
    STORE r20, r9
    LDI r9, 0
    ADD r20, r0
    STORE r20, r9
    LDI r0, 92
    LDI r9, 124
    LDI r13, TXT_BUF
    TEXT r0, r9, r13

    LDI r0, 124
    LDI r9, 112
    RECTF r0, r9, r13, r1, r5
    LDI r20, TXT_BUF
    LDI r9, 57
    STORE r20, r9
    LDI r9, 0
    ADD r20, r0
    STORE r20, r9
    LDI r0, 144
    LDI r9, 124
    LDI r13, TXT_BUF
    TEXT r0, r9, r13

    ; + button (green)
    LDI r0, 176
    LDI r9, 112
    LDI r5, 0x27AE60
    RECTF r0, r9, r13, r1, r5
    LDI r20, TXT_BUF
    LDI r9, 43
    STORE r20, r9
    LDI r9, 0
    ADD r20, r0
    STORE r20, r9
    LDI r0, 196
    LDI r9, 124
    LDI r13, TXT_BUF
    TEXT r0, r9, r13

    ; Row 2: 4(9) 5(10) 6(11) =(12)
    LDI r0, 20
    LDI r9, 154
    LDI r13, 48
    LDI r1, 38
    LDI r5, 0x2C3E50
    RECTF r0, r9, r13, r1, r5
    LDI r20, TXT_BUF
    LDI r9, 52
    STORE r20, r9
    LDI r9, 0
    ADD r20, r0
    STORE r20, r9
    LDI r0, 40
    LDI r9, 166
    LDI r13, TXT_BUF
    TEXT r0, r9, r13

    LDI r0, 72
    LDI r9, 154
    RECTF r0, r9, r13, r1, r5
    LDI r20, TXT_BUF
    LDI r9, 53
    STORE r20, r9
    LDI r9, 0
    ADD r20, r0
    STORE r20, r9
    LDI r0, 92
    LDI r9, 166
    LDI r13, TXT_BUF
    TEXT r0, r9, r13

    LDI r0, 124
    LDI r9, 154
    RECTF r0, r9, r13, r1, r5
    LDI r20, TXT_BUF
    LDI r9, 54
    STORE r20, r9
    LDI r9, 0
    ADD r20, r0
    STORE r20, r9
    LDI r0, 144
    LDI r9, 166
    LDI r13, TXT_BUF
    TEXT r0, r9, r13

    ; = button (green)
    LDI r0, 176
    LDI r9, 154
    LDI r5, 0x27AE60
    RECTF r0, r9, r13, r1, r5
    LDI r20, TXT_BUF
    LDI r9, 61
    STORE r20, r9
    LDI r9, 0
    ADD r20, r0
    STORE r20, r9
    LDI r0, 196
    LDI r9, 166
    LDI r13, TXT_BUF
    TEXT r0, r9, r13

    ; Row 3: 1(13) 2(14) 3(15) (empty)
    LDI r0, 20
    LDI r9, 196
    LDI r13, 48
    LDI r1, 38
    LDI r5, 0x2C3E50
    RECTF r0, r9, r13, r1, r5
    LDI r20, TXT_BUF
    LDI r9, 49
    STORE r20, r9
    LDI r9, 0
    ADD r20, r0
    STORE r20, r9
    LDI r0, 40
    LDI r9, 208
    LDI r13, TXT_BUF
    TEXT r0, r9, r13

    LDI r0, 72
    LDI r9, 196
    RECTF r0, r9, r13, r1, r5
    LDI r20, TXT_BUF
    LDI r9, 50
    STORE r20, r9
    LDI r9, 0
    ADD r20, r0
    STORE r20, r9
    LDI r0, 92
    LDI r9, 208
    LDI r13, TXT_BUF
    TEXT r0, r9, r13

    LDI r0, 124
    LDI r9, 196
    RECTF r0, r9, r13, r1, r5
    LDI r20, TXT_BUF
    LDI r9, 51
    STORE r20, r9
    LDI r9, 0
    ADD r20, r0
    STORE r20, r9
    LDI r0, 144
    LDI r9, 208
    LDI r13, TXT_BUF
    TEXT r0, r9, r13

    ; Row 4: 0(16, wide) .(17) (empty)
    LDI r0, 20
    LDI r9, 238
    LDI r13, 100
    LDI r1, 16
    LDI r5, 0x2C3E50
    RECTF r0, r9, r13, r1, r5
    LDI r20, TXT_BUF
    LDI r9, 48
    STORE r20, r9
    LDI r9, 0
    ADD r20, r0
    STORE r20, r9
    LDI r0, 60
    LDI r9, 242
    LDI r13, TXT_BUF
    TEXT r0, r9, r13

    LDI r0, 124
    LDI r9, 238
    LDI r13, 48
    LDI r1, 16
    LDI r5, 0x2C3E50
    RECTF r0, r9, r13, r1, r5
    LDI r20, TXT_BUF
    LDI r9, 46
    STORE r20, r9
    LDI r9, 0
    ADD r20, r0
    STORE r20, r9
    LDI r0, 144
    LDI r9, 242
    LDI r13, TXT_BUF
    TEXT r0, r9, r13

    ; ── Title ──
    LDI r20, TXT_BUF
    LDI r9, 71
    STORE r20, r9
    LDI r9, 85
    ADD r20, r0
    STORE r20, r9
    LDI r9, 73
    ADD r20, r0
    STORE r20, r9
    LDI r9, 32
    ADD r20, r0
    STORE r20, r9
    LDI r9, 67
    ADD r20, r0
    STORE r20, r9
    LDI r9, 65
    ADD r20, r0
    STORE r20, r9
    LDI r9, 76
    ADD r20, r0
    STORE r20, r9
    LDI r9, 0
    ADD r20, r0
    STORE r20, r9
    LDI r0, 80
    LDI r9, 5
    LDI r13, TXT_BUF
    TEXT r0, r9, r13

do_frame:
    FRAME
    JMP main_loop

; ── num_to_str subroutine ──────────────────────────
; Input:  r5 = number, r20 = buffer address
; Output: null-terminated string at r20, r20 advanced
; Clobbers: r3, r9, r13, r1, r21, r22
; Uses RAM: DIG_BUF(0x600), DIG_COUNT(0x620), DIG_QUOT(0x624), DIG_PTR(0x628)
num_to_str:
    LDI r0, 1
    CMPI r5, 0
    JNZ r3, nts_loop1

    ; Handle zero
    LDI r9, 48
    STORE r20, r9
    ADD r20, r0
    LDI r9, 0
    STORE r20, r9
    RET

nts_loop1:
    ; Init reversed buffer
    LDI r22, DIG_BUF
    LDI r9, DIG_PTR
    STORE r9, r22
    LDI r21, 0
    LDI r9, DIG_COUNT
    STORE r9, r21

nts_loop2:
    CMPI r5, 0
    JZ r3, nts_rev1

    ; r13 = r5 / 10
    LDI r13, 0
    ADD r13, r5
    LDI r1, 10
    DIV r13, r1
    LDI r9, DIG_QUOT
    STORE r9, r13

    ; r5 = r5 - r13*10 (remainder)
    LDI r9, 0
    ADD r9, r13
    MUL r9, r1
    SUB r5, r9
    ; Convert to ASCII
    LDI r9, 48
    ADD r5, r9

    ; Store in reversed buffer
    LDI r9, DIG_PTR
    LOAD r22, r9
    STORE r22, r5
    ADD r22, r0
    LDI r9, DIG_PTR
    STORE r9, r22

    ; Increment count
    LDI r9, DIG_COUNT
    LOAD r21, r9
    ADD r21, r0
    LDI r9, DIG_COUNT
    STORE r9, r21

    ; r5 = quotient
    LDI r9, DIG_QUOT
    LOAD r5, r9
    JMP nts_loop2

nts_rev1:
    ; Reverse digits into output buffer
    LDI r9, DIG_COUNT
    LOAD r21, r9
    LDI r22, DIG_BUF

nts_rev2:
    CMPI r21, 0
    JZ r3, nts_end
    SUB r21, r0
    ; Load digit from reversed buffer
    LDI r9, 0
    ADD r9, r22
    ADD r9, r21
    LOAD r9, r9
    ; Store to output buffer
    STORE r20, r9
    ADD r20, r0
    JMP nts_rev2

nts_end:
    LDI r9, 0
    STORE r20, r9
    LDI r0, 1
    RET
