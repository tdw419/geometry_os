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
;   r14  = constant 1 (reloaded as needed)
;   r11  = scratch
;   r5  = scratch
;   r1  = scratch
;   r13  = scratch (colors, values)
;   r15  = scratch
;   r2 = mouse X from MOUSEQ
;   r8 = mouse Y from MOUSEQ
;   r10 = hit query result
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
    LDI r14, 1

; Display value = 0
    LDI r20, DISP_VAL
    LDI r11, 0
    STORE r20, r11

; Accumulator = 0
    LDI r20, ACCUM
    STORE r20, r11

; Operator = none (0)
    LDI r20, OPER
    STORE r20, r11

; State = entering first number (0)
    LDI r20, STATE
    STORE r20, r11

; New entry = no (0)
    LDI r20, NEW_ENTRY
    STORE r20, r11

; Tick = 0
    LDI r20, TICK
    STORE r20, r11

; Fill screen dark
    LDI r11, 0x1A1A2E
    FILL r11

; ── Register all button hit regions ──
; Button grid: 4 cols x 5 rows
; Each button: 48x38, gap=4, total cell=52
; Start: x=20, y=70

; Row 0: C  /  *  -
    LDI r14, 20
    LDI r11, 70
    LDI r5, 48
    LDI r1, 38
    HITSET r14, r11, r5, r1, 1

    LDI r14, 72
    HITSET r14, r11, r5, r1, 2

    LDI r14, 124
    HITSET r14, r11, r5, r1, 3

    LDI r14, 176
    HITSET r14, r11, r5, r1, 4

; Row 1: 7  8  9  +
    LDI r14, 20
    LDI r11, 112
    HITSET r14, r11, r5, r1, 5

    LDI r14, 72
    HITSET r14, r11, r5, r1, 6

    LDI r14, 124
    HITSET r14, r11, r5, r1, 7

    LDI r14, 176
    HITSET r14, r11, r5, r1, 8

; Row 2: 4  5  6  =
    LDI r14, 20
    LDI r11, 154
    HITSET r14, r11, r5, r1, 9

    LDI r14, 72
    HITSET r14, r11, r5, r1, 10

    LDI r14, 124
    HITSET r14, r11, r5, r1, 11

    LDI r14, 176
    HITSET r14, r11, r5, r1, 12

; Row 3: 1  2  3  (empty)
    LDI r14, 20
    LDI r11, 196
    HITSET r14, r11, r5, r1, 13

    LDI r14, 72
    HITSET r14, r11, r5, r1, 14

    LDI r14, 124
    HITSET r14, r11, r5, r1, 15

; Row 4: 0 (wide)  .  (empty)
; Button 0 spans 2 cols: 100x38
    LDI r14, 20
    LDI r11, 238
    LDI r5, 100
    LDI r1, 16
    HITSET r14, r11, r5, r1, 16

    LDI r14, 124
    LDI r5, 48
    LDI r1, 16
    HITSET r14, r11, r5, r1, 17

; ── MAIN LOOP ─────────────────────────────────────
main_loop:
    LDI r14, 1

; Increment tick
    LDI r20, TICK
    LOAD r11, r20
    ADD r11, r14
    STORE r20, r11

; Read mouse
    MOUSEQ r2

; Query hit regions
    HITQ r10
    JZ r10, draw_ui

; Handle button clicks
    CMPI r10, 1
    JZ r7, btn_clear

    CMPI r10, 2
    JZ r7, btn_div

    CMPI r10, 3
    JZ r7, btn_mul

    CMPI r10, 4
    JZ r7, btn_sub

    CMPI r10, 5
    JZ r7, btn_7

    CMPI r10, 6
    JZ r7, btn_8

    CMPI r10, 7
    JZ r7, btn_9

    CMPI r10, 8
    JZ r7, btn_add

    CMPI r10, 9
    JZ r7, btn_4

    CMPI r10, 10
    JZ r7, btn_5

    CMPI r10, 11
    JZ r7, btn_6

    CMPI r10, 12
    JZ r7, btn_eq

    CMPI r10, 13
    JZ r7, btn_1

    CMPI r10, 14
    JZ r7, btn_2

    CMPI r10, 15
    JZ r7, btn_3

    CMPI r10, 16
    JZ r7, btn_0

    CMPI r10, 17
    JZ r7, btn_dot

    JMP draw_ui

; ── Digit buttons ──────────────────────────────────
; Each digit: if new_entry, clear display first, then append digit
btn_0:
    LDI r14, 1
    LDI r20, NEW_ENTRY
    LOAD r11, r20
    CMPI r11, 1
    JZ r7, do_0_clear
    JMP do_0_append
do_0_clear:
    LDI r20, DISP_VAL
    LDI r11, 0
    STORE r20, r11
    LDI r20, NEW_ENTRY
    STORE r20, r11
do_0_append:
    LDI r20, DISP_VAL
    LOAD r11, r20
    LDI r5, 10
    MUL r11, r5
    STORE r20, r11
    JMP draw_ui

btn_1:
    LDI r14, 1
    CALL enter_digit_start
    LDI r11, 1
    JMP enter_digit_finish

btn_2:
    LDI r14, 1
    CALL enter_digit_start
    LDI r11, 2
    JMP enter_digit_finish

btn_3:
    LDI r14, 1
    CALL enter_digit_start
    LDI r11, 3
    JMP enter_digit_finish

btn_4:
    LDI r14, 1
    CALL enter_digit_start
    LDI r11, 4
    JMP enter_digit_finish

btn_5:
    LDI r14, 1
    CALL enter_digit_start
    LDI r11, 5
    JMP enter_digit_finish

btn_6:
    LDI r14, 1
    CALL enter_digit_start
    LDI r11, 6
    JMP enter_digit_finish

btn_7:
    LDI r14, 1
    CALL enter_digit_start
    LDI r11, 7
    JMP enter_digit_finish

btn_8:
    LDI r14, 1
    CALL enter_digit_start
    LDI r11, 8
    JMP enter_digit_finish

btn_9:
    LDI r14, 1
    CALL enter_digit_start
    LDI r11, 9
    JMP enter_digit_finish

btn_dot:
    ; For simplicity, just append a visual indicator -- skip real decimal
    ; In a full implementation we would track decimal position
    JMP draw_ui

; enter_digit_start: if new_entry, clear display value
enter_digit_start:
    LDI r14, 1
    LDI r20, NEW_ENTRY
    LOAD r11, r20
    CMPI r11, 1
    JZ r7, eds_clear
    RET
eds_clear:
    LDI r20, DISP_VAL
    LDI r11, 0
    STORE r20, r11
    LDI r20, NEW_ENTRY
    STORE r20, r11
    LDI r14, 1
    RET

; enter_digit_finish: r11=digit value, multiply display by 10 and add digit
enter_digit_finish:
    LDI r14, 1
    LDI r20, DISP_VAL
    LOAD r5, r20
    LDI r1, 10
    MUL r5, r1
    ADD r5, r11
    STORE r20, r5
    JMP draw_ui

; ── Operator buttons ───────────────────────────────
btn_add:
    LDI r14, 1
    LDI r20, OPER
    LDI r11, 1
    STORE r20, r11
    CALL save_accum_and_set_state
    JMP draw_ui

btn_sub:
    LDI r14, 1
    LDI r20, OPER
    LDI r11, 2
    STORE r20, r11
    CALL save_accum_and_set_state
    JMP draw_ui

btn_mul:
    LDI r14, 1
    LDI r20, OPER
    LDI r11, 3
    STORE r20, r11
    CALL save_accum_and_set_state
    JMP draw_ui

btn_div:
    LDI r14, 1
    LDI r20, OPER
    LDI r11, 4
    STORE r20, r11
    CALL save_accum_and_set_state
    JMP draw_ui

; save_accum_and_set_state: save display to accumulator, set state=2, new_entry=1
save_accum_and_set_state:
    LDI r14, 1
    ; If state is 2 (entering second), compute pending first
    LDI r20, STATE
    LOAD r11, r20
    CMPI r11, 2
    JNZ r7, sas_set
    ; Compute pending operation
    CALL do_compute
sas_set:
    ; Save display to accumulator
    LDI r20, DISP_VAL
    LOAD r11, r20
    LDI r20, ACCUM
    STORE r20, r11
    ; Set state = 2 (entering second number)
    LDI r20, STATE
    LDI r11, 2
    STORE r20, r11
    ; Set new_entry = 1
    LDI r20, NEW_ENTRY
    LDI r11, 1
    STORE r20, r11
    LDI r14, 1
    RET

; ── Equals button ──────────────────────────────────
btn_eq:
    LDI r14, 1
    CALL do_compute
    JMP draw_ui

; do_compute: perform pending operation
; accumulator OP display_val -> display_val
; Then set state=0, new_entry=1
do_compute:
    LDI r14, 1
    ; Check if there is an operator
    LDI r20, OPER
    LOAD r11, r20
    CMPI r11, 0
    JZ r7, dc_done
    ; Load accumulator and display
    LDI r20, ACCUM
    LOAD r5, r20
    LDI r20, DISP_VAL
    LOAD r1, r20
    ; Branch on operator
    CMPI r11, 1
    JZ r7, dc_add
    CMPI r11, 2
    JZ r7, dc_sub
    CMPI r11, 3
    JZ r7, dc_mul
    CMPI r11, 4
    JZ r7, dc_div
    JMP dc_done

dc_add:
    ADD r5, r1
    JMP dc_store

dc_sub:
    SUB r5, r1
    JMP dc_store

dc_mul:
    MUL r5, r1
    JMP dc_store

dc_div:
    CMPI r1, 0
    JZ r7, dc_done
    DIV r5, r1

dc_store:
    LDI r20, DISP_VAL
    STORE r20, r5
    ; Clear operator
    LDI r20, OPER
    LDI r11, 0
    STORE r20, r11

dc_done:
    ; Set state=0, new_entry=1
    LDI r20, STATE
    LDI r11, 0
    STORE r20, r11
    LDI r20, NEW_ENTRY
    LDI r11, 1
    STORE r20, r11
    LDI r14, 1
    RET

; ── Clear button ───────────────────────────────────
btn_clear:
    LDI r14, 1
    LDI r20, DISP_VAL
    LDI r11, 0
    STORE r20, r11
    LDI r20, ACCUM
    STORE r20, r11
    LDI r20, OPER
    STORE r20, r11
    LDI r20, STATE
    STORE r20, r11
    LDI r20, NEW_ENTRY
    STORE r20, r11
    JMP draw_ui

; ── DRAW UI ────────────────────────────────────────
draw_ui:
    LDI r14, 1

    ; Redraw background
    LDI r11, 0x1A1A2E
    FILL r11

    ; ── Display area ──
    LDI r14, 20
    LDI r11, 20
    LDI r5, 216
    LDI r1, 40
    LDI r13, 0x0F3460
    RECTF r14, r11, r5, r1, r13

    ; Convert display value to string
    LDI r20, DISP_VAL
    LOAD r13, r20
    LDI r20, TXT_BUF
    CALL num_to_str

    ; Render display text (right-aligned at x=220, y=32)
    LDI r14, 220
    LDI r11, 32
    LDI r5, TXT_BUF
    TEXT r14, r11, r5

    ; ── Draw buttons ──
    ; Row 0: C(1) /(2) *(3) -(4)
    LDI r14, 20
    LDI r11, 70
    LDI r5, 48
    LDI r1, 38
    LDI r13, 0xE74C3C
    RECTF r14, r11, r5, r1, r13
    ; "C" label
    LDI r20, TXT_BUF
    LDI r11, 67
    STORE r20, r11
    LDI r11, 0
    ADD r20, r14
    STORE r20, r11
    LDI r14, 40
    LDI r11, 82
    LDI r5, TXT_BUF
    TEXT r14, r11, r5

    ; / button (orange)
    LDI r14, 72
    LDI r11, 70
    LDI r13, 0xFF8800
    RECTF r14, r11, r5, r1, r13
    LDI r20, TXT_BUF
    LDI r11, 47
    STORE r20, r11
    LDI r11, 0
    ADD r20, r14
    STORE r20, r11
    LDI r14, 92
    LDI r11, 82
    LDI r5, TXT_BUF
    TEXT r14, r11, r5

    ; * button (orange)
    LDI r14, 124
    LDI r11, 70
    RECTF r14, r11, r5, r1, r13
    LDI r20, TXT_BUF
    LDI r11, 42
    STORE r20, r11
    LDI r11, 0
    ADD r20, r14
    STORE r20, r11
    LDI r14, 144
    LDI r11, 82
    LDI r5, TXT_BUF
    TEXT r14, r11, r5

    ; - button (orange)
    LDI r14, 176
    LDI r11, 70
    RECTF r14, r11, r5, r1, r13
    LDI r20, TXT_BUF
    LDI r11, 45
    STORE r20, r11
    LDI r11, 0
    ADD r20, r14
    STORE r20, r11
    LDI r14, 196
    LDI r11, 82
    LDI r5, TXT_BUF
    TEXT r14, r11, r5

    ; Row 1: 7(5) 8(6) 9(7) +(8)
    LDI r14, 20
    LDI r11, 112
    LDI r5, 48
    LDI r1, 38
    LDI r13, 0x2C3E50
    RECTF r14, r11, r5, r1, r13
    ; "7"
    LDI r20, TXT_BUF
    LDI r11, 55
    STORE r20, r11
    LDI r11, 0
    ADD r20, r14
    STORE r20, r11
    LDI r14, 40
    LDI r11, 124
    LDI r5, TXT_BUF
    TEXT r14, r11, r5

    LDI r14, 72
    LDI r11, 112
    RECTF r14, r11, r5, r1, r13
    LDI r20, TXT_BUF
    LDI r11, 56
    STORE r20, r11
    LDI r11, 0
    ADD r20, r14
    STORE r20, r11
    LDI r14, 92
    LDI r11, 124
    LDI r5, TXT_BUF
    TEXT r14, r11, r5

    LDI r14, 124
    LDI r11, 112
    RECTF r14, r11, r5, r1, r13
    LDI r20, TXT_BUF
    LDI r11, 57
    STORE r20, r11
    LDI r11, 0
    ADD r20, r14
    STORE r20, r11
    LDI r14, 144
    LDI r11, 124
    LDI r5, TXT_BUF
    TEXT r14, r11, r5

    ; + button (green)
    LDI r14, 176
    LDI r11, 112
    LDI r13, 0x27AE60
    RECTF r14, r11, r5, r1, r13
    LDI r20, TXT_BUF
    LDI r11, 43
    STORE r20, r11
    LDI r11, 0
    ADD r20, r14
    STORE r20, r11
    LDI r14, 196
    LDI r11, 124
    LDI r5, TXT_BUF
    TEXT r14, r11, r5

    ; Row 2: 4(9) 5(10) 6(11) =(12)
    LDI r14, 20
    LDI r11, 154
    LDI r5, 48
    LDI r1, 38
    LDI r13, 0x2C3E50
    RECTF r14, r11, r5, r1, r13
    LDI r20, TXT_BUF
    LDI r11, 52
    STORE r20, r11
    LDI r11, 0
    ADD r20, r14
    STORE r20, r11
    LDI r14, 40
    LDI r11, 166
    LDI r5, TXT_BUF
    TEXT r14, r11, r5

    LDI r14, 72
    LDI r11, 154
    RECTF r14, r11, r5, r1, r13
    LDI r20, TXT_BUF
    LDI r11, 53
    STORE r20, r11
    LDI r11, 0
    ADD r20, r14
    STORE r20, r11
    LDI r14, 92
    LDI r11, 166
    LDI r5, TXT_BUF
    TEXT r14, r11, r5

    LDI r14, 124
    LDI r11, 154
    RECTF r14, r11, r5, r1, r13
    LDI r20, TXT_BUF
    LDI r11, 54
    STORE r20, r11
    LDI r11, 0
    ADD r20, r14
    STORE r20, r11
    LDI r14, 144
    LDI r11, 166
    LDI r5, TXT_BUF
    TEXT r14, r11, r5

    ; = button (green)
    LDI r14, 176
    LDI r11, 154
    LDI r13, 0x27AE60
    RECTF r14, r11, r5, r1, r13
    LDI r20, TXT_BUF
    LDI r11, 61
    STORE r20, r11
    LDI r11, 0
    ADD r20, r14
    STORE r20, r11
    LDI r14, 196
    LDI r11, 166
    LDI r5, TXT_BUF
    TEXT r14, r11, r5

    ; Row 3: 1(13) 2(14) 3(15) (empty)
    LDI r14, 20
    LDI r11, 196
    LDI r5, 48
    LDI r1, 38
    LDI r13, 0x2C3E50
    RECTF r14, r11, r5, r1, r13
    LDI r20, TXT_BUF
    LDI r11, 49
    STORE r20, r11
    LDI r11, 0
    ADD r20, r14
    STORE r20, r11
    LDI r14, 40
    LDI r11, 208
    LDI r5, TXT_BUF
    TEXT r14, r11, r5

    LDI r14, 72
    LDI r11, 196
    RECTF r14, r11, r5, r1, r13
    LDI r20, TXT_BUF
    LDI r11, 50
    STORE r20, r11
    LDI r11, 0
    ADD r20, r14
    STORE r20, r11
    LDI r14, 92
    LDI r11, 208
    LDI r5, TXT_BUF
    TEXT r14, r11, r5

    LDI r14, 124
    LDI r11, 196
    RECTF r14, r11, r5, r1, r13
    LDI r20, TXT_BUF
    LDI r11, 51
    STORE r20, r11
    LDI r11, 0
    ADD r20, r14
    STORE r20, r11
    LDI r14, 144
    LDI r11, 208
    LDI r5, TXT_BUF
    TEXT r14, r11, r5

    ; Row 4: 0(16, wide) .(17) (empty)
    LDI r14, 20
    LDI r11, 238
    LDI r5, 100
    LDI r1, 16
    LDI r13, 0x2C3E50
    RECTF r14, r11, r5, r1, r13
    LDI r20, TXT_BUF
    LDI r11, 48
    STORE r20, r11
    LDI r11, 0
    ADD r20, r14
    STORE r20, r11
    LDI r14, 60
    LDI r11, 242
    LDI r5, TXT_BUF
    TEXT r14, r11, r5

    LDI r14, 124
    LDI r11, 238
    LDI r5, 48
    LDI r1, 16
    LDI r13, 0x2C3E50
    RECTF r14, r11, r5, r1, r13
    LDI r20, TXT_BUF
    LDI r11, 46
    STORE r20, r11
    LDI r11, 0
    ADD r20, r14
    STORE r20, r11
    LDI r14, 144
    LDI r11, 242
    LDI r5, TXT_BUF
    TEXT r14, r11, r5

    ; ── Title ──
    LDI r20, TXT_BUF
    LDI r11, 71
    STORE r20, r11
    LDI r11, 85
    ADD r20, r14
    STORE r20, r11
    LDI r11, 73
    ADD r20, r14
    STORE r20, r11
    LDI r11, 32
    ADD r20, r14
    STORE r20, r11
    LDI r11, 67
    ADD r20, r14
    STORE r20, r11
    LDI r11, 65
    ADD r20, r14
    STORE r20, r11
    LDI r11, 76
    ADD r20, r14
    STORE r20, r11
    LDI r11, 0
    ADD r20, r14
    STORE r20, r11
    LDI r14, 80
    LDI r11, 5
    LDI r5, TXT_BUF
    TEXT r14, r11, r5

do_frame:
    FRAME
    JMP main_loop

; ── num_to_str subroutine ──────────────────────────
; Input:  r13 = number, r20 = buffer address
; Output: null-terminated string at r20, r20 advanced
; Clobbers: r7, r11, r5, r1, r21, r22
; Uses RAM: DIG_BUF(0x600), DIG_COUNT(0x620), DIG_QUOT(0x624), DIG_PTR(0x628)
num_to_str:
    LDI r14, 1
    CMPI r13, 0
    JNZ r7, nts_loop1

    ; Handle zero
    LDI r11, 48
    STORE r20, r11
    ADD r20, r14
    LDI r11, 0
    STORE r20, r11
    RET

nts_loop1:
    ; Init reversed buffer
    LDI r22, DIG_BUF
    LDI r11, DIG_PTR
    STORE r11, r22
    LDI r21, 0
    LDI r11, DIG_COUNT
    STORE r11, r21

nts_loop2:
    CMPI r13, 0
    JZ r7, nts_rev1

    ; r5 = r13 / 10
    LDI r5, 0
    ADD r5, r13
    LDI r1, 10
    DIV r5, r1
    LDI r11, DIG_QUOT
    STORE r11, r5

    ; r13 = r13 - r5*10 (remainder)
    LDI r11, 0
    ADD r11, r5
    MUL r11, r1
    SUB r13, r11
    ; Convert to ASCII
    LDI r11, 48
    ADD r13, r11

    ; Store in reversed buffer
    LDI r11, DIG_PTR
    LOAD r22, r11
    STORE r22, r13
    ADD r22, r14
    LDI r11, DIG_PTR
    STORE r11, r22

    ; Increment count
    LDI r11, DIG_COUNT
    LOAD r21, r11
    ADD r21, r14
    LDI r11, DIG_COUNT
    STORE r11, r21

    ; r13 = quotient
    LDI r11, DIG_QUOT
    LOAD r13, r11
    JMP nts_loop2

nts_rev1:
    ; Reverse digits into output buffer
    LDI r11, DIG_COUNT
    LOAD r21, r11
    LDI r22, DIG_BUF

nts_rev2:
    CMPI r21, 0
    JZ r7, nts_end
    SUB r21, r14
    ; Load digit from reversed buffer
    LDI r11, 0
    ADD r11, r22
    ADD r11, r21
    LOAD r11, r11
    ; Store to output buffer
    STORE r20, r11
    ADD r20, r14
    JMP nts_rev2

nts_end:
    LDI r11, 0
    STORE r20, r11
    LDI r14, 1
    RET
