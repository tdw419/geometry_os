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
;   r9  = constant 1 (reloaded as needed)
;   r8  = scratch
;   r5  = scratch
;   r4  = scratch
;   r11  = scratch (colors, values)
;   r7  = scratch
;   r10 = mouse X from MOUSEQ
;   r0 = mouse Y from MOUSEQ
;   r13 = hit query result
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
    LDI r9, 1

; Display value = 0
    LDI r20, DISP_VAL
    LDI r8, 0
    STORE r20, r8

; Accumulator = 0
    LDI r20, ACCUM
    STORE r20, r8

; Operator = none (0)
    LDI r20, OPER
    STORE r20, r8

; State = entering first number (0)
    LDI r20, STATE
    STORE r20, r8

; New entry = no (0)
    LDI r20, NEW_ENTRY
    STORE r20, r8

; Tick = 0
    LDI r20, TICK
    STORE r20, r8

; Fill screen dark
    LDI r8, 0x1A1A2E
    FILL r8

; ── Register all button hit regions ──
; Button grid: 4 cols x 5 rows
; Each button: 48x38, gap=4, total cell=52
; Start: x=20, y=70

; Row 0: C  /  *  -
    LDI r9, 20
    LDI r8, 70
    LDI r5, 48
    LDI r4, 38
    HITSET r9, r8, r5, r4, 1

    LDI r9, 72
    HITSET r9, r8, r5, r4, 2

    LDI r9, 124
    HITSET r9, r8, r5, r4, 3

    LDI r9, 176
    HITSET r9, r8, r5, r4, 4

; Row 1: 7  8  9  +
    LDI r9, 20
    LDI r8, 112
    HITSET r9, r8, r5, r4, 5

    LDI r9, 72
    HITSET r9, r8, r5, r4, 6

    LDI r9, 124
    HITSET r9, r8, r5, r4, 7

    LDI r9, 176
    HITSET r9, r8, r5, r4, 8

; Row 2: 4  5  6  =
    LDI r9, 20
    LDI r8, 154
    HITSET r9, r8, r5, r4, 9

    LDI r9, 72
    HITSET r9, r8, r5, r4, 10

    LDI r9, 124
    HITSET r9, r8, r5, r4, 11

    LDI r9, 176
    HITSET r9, r8, r5, r4, 12

; Row 3: 1  2  3  (empty)
    LDI r9, 20
    LDI r8, 196
    HITSET r9, r8, r5, r4, 13

    LDI r9, 72
    HITSET r9, r8, r5, r4, 14

    LDI r9, 124
    HITSET r9, r8, r5, r4, 15

; Row 4: 0 (wide)  .  (empty)
; Button 0 spans 2 cols: 100x38
    LDI r9, 20
    LDI r8, 238
    LDI r5, 100
    LDI r4, 16
    HITSET r9, r8, r5, r4, 16

    LDI r9, 124
    LDI r5, 48
    LDI r4, 16
    HITSET r9, r8, r5, r4, 17

; ── MAIN LOOP ─────────────────────────────────────
main_loop:
    LDI r9, 1

; Increment tick
    LDI r20, TICK
    LOAD r8, r20
    ADD r8, r9
    STORE r20, r8

; Read mouse
    MOUSEQ r10

; Query hit regions
    HITQ r13
    JZ r13, draw_ui

; Handle button clicks
    CMPI r13, 1
    JZ r6, btn_clear

    CMPI r13, 2
    JZ r6, btn_div

    CMPI r13, 3
    JZ r6, btn_mul

    CMPI r13, 4
    JZ r6, btn_sub

    CMPI r13, 5
    JZ r6, btn_7

    CMPI r13, 6
    JZ r6, btn_8

    CMPI r13, 7
    JZ r6, btn_9

    CMPI r13, 8
    JZ r6, btn_add

    CMPI r13, 9
    JZ r6, btn_4

    CMPI r13, 10
    JZ r6, btn_5

    CMPI r13, 11
    JZ r6, btn_6

    CMPI r13, 12
    JZ r6, btn_eq

    CMPI r13, 13
    JZ r6, btn_1

    CMPI r13, 14
    JZ r6, btn_2

    CMPI r13, 15
    JZ r6, btn_3

    CMPI r13, 16
    JZ r6, btn_0

    CMPI r13, 17
    JZ r6, btn_dot

    JMP draw_ui

; ── Digit buttons ──────────────────────────────────
; Each digit: if new_entry, clear display first, then append digit
btn_0:
    LDI r9, 1
    LDI r20, NEW_ENTRY
    LOAD r8, r20
    CMPI r8, 1
    JZ r6, do_0_clear
    JMP do_0_append
do_0_clear:
    LDI r20, DISP_VAL
    LDI r8, 0
    STORE r20, r8
    LDI r20, NEW_ENTRY
    STORE r20, r8
do_0_append:
    LDI r20, DISP_VAL
    LOAD r8, r20
    LDI r5, 10
    MUL r8, r5
    STORE r20, r8
    JMP draw_ui

btn_1:
    LDI r9, 1
    CALL enter_digit_start
    LDI r8, 1
    JMP enter_digit_finish

btn_2:
    LDI r9, 1
    CALL enter_digit_start
    LDI r8, 2
    JMP enter_digit_finish

btn_3:
    LDI r9, 1
    CALL enter_digit_start
    LDI r8, 3
    JMP enter_digit_finish

btn_4:
    LDI r9, 1
    CALL enter_digit_start
    LDI r8, 4
    JMP enter_digit_finish

btn_5:
    LDI r9, 1
    CALL enter_digit_start
    LDI r8, 5
    JMP enter_digit_finish

btn_6:
    LDI r9, 1
    CALL enter_digit_start
    LDI r8, 6
    JMP enter_digit_finish

btn_7:
    LDI r9, 1
    CALL enter_digit_start
    LDI r8, 7
    JMP enter_digit_finish

btn_8:
    LDI r9, 1
    CALL enter_digit_start
    LDI r8, 8
    JMP enter_digit_finish

btn_9:
    LDI r9, 1
    CALL enter_digit_start
    LDI r8, 9
    JMP enter_digit_finish

btn_dot:
    ; For simplicity, just append a visual indicator -- skip real decimal
    ; In a full implementation we would track decimal position
    JMP draw_ui

; enter_digit_start: if new_entry, clear display value
enter_digit_start:
    LDI r9, 1
    LDI r20, NEW_ENTRY
    LOAD r8, r20
    CMPI r8, 1
    JZ r6, eds_clear
    RET
eds_clear:
    LDI r20, DISP_VAL
    LDI r8, 0
    STORE r20, r8
    LDI r20, NEW_ENTRY
    STORE r20, r8
    LDI r9, 1
    RET

; enter_digit_finish: r8=digit value, multiply display by 10 and add digit
enter_digit_finish:
    LDI r9, 1
    LDI r20, DISP_VAL
    LOAD r5, r20
    LDI r4, 10
    MUL r5, r4
    ADD r5, r8
    STORE r20, r5
    JMP draw_ui

; ── Operator buttons ───────────────────────────────
btn_add:
    LDI r9, 1
    LDI r20, OPER
    LDI r8, 1
    STORE r20, r8
    CALL save_accum_and_set_state
    JMP draw_ui

btn_sub:
    LDI r9, 1
    LDI r20, OPER
    LDI r8, 2
    STORE r20, r8
    CALL save_accum_and_set_state
    JMP draw_ui

btn_mul:
    LDI r9, 1
    LDI r20, OPER
    LDI r8, 3
    STORE r20, r8
    CALL save_accum_and_set_state
    JMP draw_ui

btn_div:
    LDI r9, 1
    LDI r20, OPER
    LDI r8, 4
    STORE r20, r8
    CALL save_accum_and_set_state
    JMP draw_ui

; save_accum_and_set_state: save display to accumulator, set state=2, new_entry=1
save_accum_and_set_state:
    LDI r9, 1
    ; If state is 2 (entering second), compute pending first
    LDI r20, STATE
    LOAD r8, r20
    CMPI r8, 2
    JNZ r6, sas_set
    ; Compute pending operation
    CALL do_compute
sas_set:
    ; Save display to accumulator
    LDI r20, DISP_VAL
    LOAD r8, r20
    LDI r20, ACCUM
    STORE r20, r8
    ; Set state = 2 (entering second number)
    LDI r20, STATE
    LDI r8, 2
    STORE r20, r8
    ; Set new_entry = 1
    LDI r20, NEW_ENTRY
    LDI r8, 1
    STORE r20, r8
    LDI r9, 1
    RET

; ── Equals button ──────────────────────────────────
btn_eq:
    LDI r9, 1
    CALL do_compute
    JMP draw_ui

; do_compute: perform pending operation
; accumulator OP display_val -> display_val
; Then set state=0, new_entry=1
do_compute:
    LDI r9, 1
    ; Check if there is an operator
    LDI r20, OPER
    LOAD r8, r20
    CMPI r8, 0
    JZ r6, dc_done
    ; Load accumulator and display
    LDI r20, ACCUM
    LOAD r5, r20
    LDI r20, DISP_VAL
    LOAD r4, r20
    ; Branch on operator
    CMPI r8, 1
    JZ r6, dc_add
    CMPI r8, 2
    JZ r6, dc_sub
    CMPI r8, 3
    JZ r6, dc_mul
    CMPI r8, 4
    JZ r6, dc_div
    JMP dc_done

dc_add:
    ADD r5, r4
    JMP dc_store

dc_sub:
    SUB r5, r4
    JMP dc_store

dc_mul:
    MUL r5, r4
    JMP dc_store

dc_div:
    CMPI r4, 0
    JZ r6, dc_done
    DIV r5, r4

dc_store:
    LDI r20, DISP_VAL
    STORE r20, r5
    ; Clear operator
    LDI r20, OPER
    LDI r8, 0
    STORE r20, r8

dc_done:
    ; Set state=0, new_entry=1
    LDI r20, STATE
    LDI r8, 0
    STORE r20, r8
    LDI r20, NEW_ENTRY
    LDI r8, 1
    STORE r20, r8
    LDI r9, 1
    RET

; ── Clear button ───────────────────────────────────
btn_clear:
    LDI r9, 1
    LDI r20, DISP_VAL
    LDI r8, 0
    STORE r20, r8
    LDI r20, ACCUM
    STORE r20, r8
    LDI r20, OPER
    STORE r20, r8
    LDI r20, STATE
    STORE r20, r8
    LDI r20, NEW_ENTRY
    STORE r20, r8
    JMP draw_ui

; ── DRAW UI ────────────────────────────────────────
draw_ui:
    LDI r9, 1

    ; Redraw background
    LDI r8, 0x1A1A2E
    FILL r8

    ; ── Display area ──
    LDI r9, 20
    LDI r8, 20
    LDI r5, 216
    LDI r4, 40
    LDI r11, 0x0F3460
    RECTF r9, r8, r5, r4, r11

    ; Convert display value to string
    LDI r20, DISP_VAL
    LOAD r11, r20
    LDI r20, TXT_BUF
    CALL num_to_str

    ; Render display text (right-aligned at x=220, y=32)
    LDI r9, 220
    LDI r8, 32
    LDI r5, TXT_BUF
    TEXT r9, r8, r5

    ; ── Draw buttons ──
    ; Row 0: C(1) /(2) *(3) -(4)
    LDI r9, 20
    LDI r8, 70
    LDI r5, 48
    LDI r4, 38
    LDI r11, 0xE74C3C
    RECTF r9, r8, r5, r4, r11
    ; "C" label
    LDI r20, TXT_BUF
    LDI r8, 67
    STORE r20, r8
    LDI r8, 0
    ADD r20, r9
    STORE r20, r8
    LDI r9, 40
    LDI r8, 82
    LDI r5, TXT_BUF
    TEXT r9, r8, r5

    ; / button (orange)
    LDI r9, 72
    LDI r8, 70
    LDI r11, 0xFF8800
    RECTF r9, r8, r5, r4, r11
    LDI r20, TXT_BUF
    LDI r8, 47
    STORE r20, r8
    LDI r8, 0
    ADD r20, r9
    STORE r20, r8
    LDI r9, 92
    LDI r8, 82
    LDI r5, TXT_BUF
    TEXT r9, r8, r5

    ; * button (orange)
    LDI r9, 124
    LDI r8, 70
    RECTF r9, r8, r5, r4, r11
    LDI r20, TXT_BUF
    LDI r8, 42
    STORE r20, r8
    LDI r8, 0
    ADD r20, r9
    STORE r20, r8
    LDI r9, 144
    LDI r8, 82
    LDI r5, TXT_BUF
    TEXT r9, r8, r5

    ; - button (orange)
    LDI r9, 176
    LDI r8, 70
    RECTF r9, r8, r5, r4, r11
    LDI r20, TXT_BUF
    LDI r8, 45
    STORE r20, r8
    LDI r8, 0
    ADD r20, r9
    STORE r20, r8
    LDI r9, 196
    LDI r8, 82
    LDI r5, TXT_BUF
    TEXT r9, r8, r5

    ; Row 1: 7(5) 8(6) 9(7) +(8)
    LDI r9, 20
    LDI r8, 112
    LDI r5, 48
    LDI r4, 38
    LDI r11, 0x2C3E50
    RECTF r9, r8, r5, r4, r11
    ; "7"
    LDI r20, TXT_BUF
    LDI r8, 55
    STORE r20, r8
    LDI r8, 0
    ADD r20, r9
    STORE r20, r8
    LDI r9, 40
    LDI r8, 124
    LDI r5, TXT_BUF
    TEXT r9, r8, r5

    LDI r9, 72
    LDI r8, 112
    RECTF r9, r8, r5, r4, r11
    LDI r20, TXT_BUF
    LDI r8, 56
    STORE r20, r8
    LDI r8, 0
    ADD r20, r9
    STORE r20, r8
    LDI r9, 92
    LDI r8, 124
    LDI r5, TXT_BUF
    TEXT r9, r8, r5

    LDI r9, 124
    LDI r8, 112
    RECTF r9, r8, r5, r4, r11
    LDI r20, TXT_BUF
    LDI r8, 57
    STORE r20, r8
    LDI r8, 0
    ADD r20, r9
    STORE r20, r8
    LDI r9, 144
    LDI r8, 124
    LDI r5, TXT_BUF
    TEXT r9, r8, r5

    ; + button (green)
    LDI r9, 176
    LDI r8, 112
    LDI r11, 0x27AE60
    RECTF r9, r8, r5, r4, r11
    LDI r20, TXT_BUF
    LDI r8, 43
    STORE r20, r8
    LDI r8, 0
    ADD r20, r9
    STORE r20, r8
    LDI r9, 196
    LDI r8, 124
    LDI r5, TXT_BUF
    TEXT r9, r8, r5

    ; Row 2: 4(9) 5(10) 6(11) =(12)
    LDI r9, 20
    LDI r8, 154
    LDI r5, 48
    LDI r4, 38
    LDI r11, 0x2C3E50
    RECTF r9, r8, r5, r4, r11
    LDI r20, TXT_BUF
    LDI r8, 52
    STORE r20, r8
    LDI r8, 0
    ADD r20, r9
    STORE r20, r8
    LDI r9, 40
    LDI r8, 166
    LDI r5, TXT_BUF
    TEXT r9, r8, r5

    LDI r9, 72
    LDI r8, 154
    RECTF r9, r8, r5, r4, r11
    LDI r20, TXT_BUF
    LDI r8, 53
    STORE r20, r8
    LDI r8, 0
    ADD r20, r9
    STORE r20, r8
    LDI r9, 92
    LDI r8, 166
    LDI r5, TXT_BUF
    TEXT r9, r8, r5

    LDI r9, 124
    LDI r8, 154
    RECTF r9, r8, r5, r4, r11
    LDI r20, TXT_BUF
    LDI r8, 54
    STORE r20, r8
    LDI r8, 0
    ADD r20, r9
    STORE r20, r8
    LDI r9, 144
    LDI r8, 166
    LDI r5, TXT_BUF
    TEXT r9, r8, r5

    ; = button (green)
    LDI r9, 176
    LDI r8, 154
    LDI r11, 0x27AE60
    RECTF r9, r8, r5, r4, r11
    LDI r20, TXT_BUF
    LDI r8, 61
    STORE r20, r8
    LDI r8, 0
    ADD r20, r9
    STORE r20, r8
    LDI r9, 196
    LDI r8, 166
    LDI r5, TXT_BUF
    TEXT r9, r8, r5

    ; Row 3: 1(13) 2(14) 3(15) (empty)
    LDI r9, 20
    LDI r8, 196
    LDI r5, 48
    LDI r4, 38
    LDI r11, 0x2C3E50
    RECTF r9, r8, r5, r4, r11
    LDI r20, TXT_BUF
    LDI r8, 49
    STORE r20, r8
    LDI r8, 0
    ADD r20, r9
    STORE r20, r8
    LDI r9, 40
    LDI r8, 208
    LDI r5, TXT_BUF
    TEXT r9, r8, r5

    LDI r9, 72
    LDI r8, 196
    RECTF r9, r8, r5, r4, r11
    LDI r20, TXT_BUF
    LDI r8, 50
    STORE r20, r8
    LDI r8, 0
    ADD r20, r9
    STORE r20, r8
    LDI r9, 92
    LDI r8, 208
    LDI r5, TXT_BUF
    TEXT r9, r8, r5

    LDI r9, 124
    LDI r8, 196
    RECTF r9, r8, r5, r4, r11
    LDI r20, TXT_BUF
    LDI r8, 51
    STORE r20, r8
    LDI r8, 0
    ADD r20, r9
    STORE r20, r8
    LDI r9, 144
    LDI r8, 208
    LDI r5, TXT_BUF
    TEXT r9, r8, r5

    ; Row 4: 0(16, wide) .(17) (empty)
    LDI r9, 20
    LDI r8, 238
    LDI r5, 100
    LDI r4, 16
    LDI r11, 0x2C3E50
    RECTF r9, r8, r5, r4, r11
    LDI r20, TXT_BUF
    LDI r8, 48
    STORE r20, r8
    LDI r8, 0
    ADD r20, r9
    STORE r20, r8
    LDI r9, 60
    LDI r8, 242
    LDI r5, TXT_BUF
    TEXT r9, r8, r5

    LDI r9, 124
    LDI r8, 238
    LDI r5, 48
    LDI r4, 16
    LDI r11, 0x2C3E50
    RECTF r9, r8, r5, r4, r11
    LDI r20, TXT_BUF
    LDI r8, 46
    STORE r20, r8
    LDI r8, 0
    ADD r20, r9
    STORE r20, r8
    LDI r9, 144
    LDI r8, 242
    LDI r5, TXT_BUF
    TEXT r9, r8, r5

    ; ── Title ──
    LDI r20, TXT_BUF
    LDI r8, 71
    STORE r20, r8
    LDI r8, 85
    ADD r20, r9
    STORE r20, r8
    LDI r8, 73
    ADD r20, r9
    STORE r20, r8
    LDI r8, 32
    ADD r20, r9
    STORE r20, r8
    LDI r8, 67
    ADD r20, r9
    STORE r20, r8
    LDI r8, 65
    ADD r20, r9
    STORE r20, r8
    LDI r8, 76
    ADD r20, r9
    STORE r20, r8
    LDI r8, 0
    ADD r20, r9
    STORE r20, r8
    LDI r9, 80
    LDI r8, 5
    LDI r5, TXT_BUF
    TEXT r9, r8, r5

do_frame:
    FRAME
    JMP main_loop

; ── num_to_str subroutine ──────────────────────────
; Input:  r11 = number, r20 = buffer address
; Output: null-terminated string at r20, r20 advanced
; Clobbers: r6, r8, r5, r4, r21, r22
; Uses RAM: DIG_BUF(0x600), DIG_COUNT(0x620), DIG_QUOT(0x624), DIG_PTR(0x628)
num_to_str:
    LDI r9, 1
    CMPI r11, 0
    JNZ r6, nts_loop1

    ; Handle zero
    LDI r8, 48
    STORE r20, r8
    ADD r20, r9
    LDI r8, 0
    STORE r20, r8
    RET

nts_loop1:
    ; Init reversed buffer
    LDI r22, DIG_BUF
    LDI r8, DIG_PTR
    STORE r8, r22
    LDI r21, 0
    LDI r8, DIG_COUNT
    STORE r8, r21

nts_loop2:
    CMPI r11, 0
    JZ r6, nts_rev1

    ; r5 = r11 / 10
    LDI r5, 0
    ADD r5, r11
    LDI r4, 10
    DIV r5, r4
    LDI r8, DIG_QUOT
    STORE r8, r5

    ; r11 = r11 - r5*10 (remainder)
    LDI r8, 0
    ADD r8, r5
    MUL r8, r4
    SUB r11, r8
    ; Convert to ASCII
    LDI r8, 48
    ADD r11, r8

    ; Store in reversed buffer
    LDI r8, DIG_PTR
    LOAD r22, r8
    STORE r22, r11
    ADD r22, r9
    LDI r8, DIG_PTR
    STORE r8, r22

    ; Increment count
    LDI r8, DIG_COUNT
    LOAD r21, r8
    ADD r21, r9
    LDI r8, DIG_COUNT
    STORE r8, r21

    ; r11 = quotient
    LDI r8, DIG_QUOT
    LOAD r11, r8
    JMP nts_loop2

nts_rev1:
    ; Reverse digits into output buffer
    LDI r8, DIG_COUNT
    LOAD r21, r8
    LDI r22, DIG_BUF

nts_rev2:
    CMPI r21, 0
    JZ r6, nts_end
    SUB r21, r9
    ; Load digit from reversed buffer
    LDI r8, 0
    ADD r8, r22
    ADD r8, r21
    LOAD r8, r8
    ; Store to output buffer
    STORE r20, r8
    ADD r20, r9
    JMP nts_rev2

nts_end:
    LDI r8, 0
    STORE r20, r8
    LDI r9, 1
    RET
