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
;   r0  = scratch
;   r8  = scratch
;   r11  = scratch
;   r1  = scratch (colors, values)
;   r5  = scratch
;   r13 = mouse X from MOUSEQ
;   r15 = mouse Y from MOUSEQ
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
    LDI r0, 0
    STORE r20, r0

; Accumulator = 0
    LDI r20, ACCUM
    STORE r20, r0

; Operator = none (0)
    LDI r20, OPER
    STORE r20, r0

; State = entering first number (0)
    LDI r20, STATE
    STORE r20, r0

; New entry = no (0)
    LDI r20, NEW_ENTRY
    STORE r20, r0

; Tick = 0
    LDI r20, TICK
    STORE r20, r0

; Fill screen dark
    LDI r0, 0x1A1A2E
    FILL r0

; ── Register all button hit regions ──
; Button grid: 4 cols x 5 rows
; Each button: 48x38, gap=4, total cell=52
; Start: x=20, y=70

; Row 0: C  /  *  -
    LDI r14, 20
    LDI r0, 70
    LDI r8, 48
    LDI r11, 38
    HITSET r14, r0, r8, r11, 1

    LDI r14, 72
    HITSET r14, r0, r8, r11, 2

    LDI r14, 124
    HITSET r14, r0, r8, r11, 3

    LDI r14, 176
    HITSET r14, r0, r8, r11, 4

; Row 1: 7  8  9  +
    LDI r14, 20
    LDI r0, 112
    HITSET r14, r0, r8, r11, 5

    LDI r14, 72
    HITSET r14, r0, r8, r11, 6

    LDI r14, 124
    HITSET r14, r0, r8, r11, 7

    LDI r14, 176
    HITSET r14, r0, r8, r11, 8

; Row 2: 4  5  6  =
    LDI r14, 20
    LDI r0, 154
    HITSET r14, r0, r8, r11, 9

    LDI r14, 72
    HITSET r14, r0, r8, r11, 10

    LDI r14, 124
    HITSET r14, r0, r8, r11, 11

    LDI r14, 176
    HITSET r14, r0, r8, r11, 12

; Row 3: 1  2  3  (empty)
    LDI r14, 20
    LDI r0, 196
    HITSET r14, r0, r8, r11, 13

    LDI r14, 72
    HITSET r14, r0, r8, r11, 14

    LDI r14, 124
    HITSET r14, r0, r8, r11, 15

; Row 4: 0 (wide)  .  (empty)
; Button 0 spans 2 cols: 100x38
    LDI r14, 20
    LDI r0, 238
    LDI r8, 100
    LDI r11, 16
    HITSET r14, r0, r8, r11, 16

    LDI r14, 124
    LDI r8, 48
    LDI r11, 16
    HITSET r14, r0, r8, r11, 17

; ── MAIN LOOP ─────────────────────────────────────
main_loop:
    LDI r14, 1

; Increment tick
    LDI r20, TICK
    LOAD r0, r20
    ADD r0, r14
    STORE r20, r0

; Read mouse
    MOUSEQ r13

; Query hit regions
    HITQ r10
    JZ r10, draw_ui

; Handle button clicks
    CMPI r10, 1
    JZ r2, btn_clear

    CMPI r10, 2
    JZ r2, btn_div

    CMPI r10, 3
    JZ r2, btn_mul

    CMPI r10, 4
    JZ r2, btn_sub

    CMPI r10, 5
    JZ r2, btn_7

    CMPI r10, 6
    JZ r2, btn_8

    CMPI r10, 7
    JZ r2, btn_9

    CMPI r10, 8
    JZ r2, btn_add

    CMPI r10, 9
    JZ r2, btn_4

    CMPI r10, 10
    JZ r2, btn_5

    CMPI r10, 11
    JZ r2, btn_6

    CMPI r10, 12
    JZ r2, btn_eq

    CMPI r10, 13
    JZ r2, btn_1

    CMPI r10, 14
    JZ r2, btn_2

    CMPI r10, 15
    JZ r2, btn_3

    CMPI r10, 16
    JZ r2, btn_0

    CMPI r10, 17
    JZ r2, btn_dot

    JMP draw_ui

; ── Digit buttons ──────────────────────────────────
; Each digit: if new_entry, clear display first, then append digit
btn_0:
    LDI r14, 1
    LDI r20, NEW_ENTRY
    LOAD r0, r20
    CMPI r0, 1
    JZ r2, do_0_clear
    JMP do_0_append
do_0_clear:
    LDI r20, DISP_VAL
    LDI r0, 0
    STORE r20, r0
    LDI r20, NEW_ENTRY
    STORE r20, r0
do_0_append:
    LDI r20, DISP_VAL
    LOAD r0, r20
    LDI r8, 10
    MUL r0, r8
    STORE r20, r0
    JMP draw_ui

btn_1:
    LDI r14, 1
    CALL enter_digit_start
    LDI r0, 1
    JMP enter_digit_finish

btn_2:
    LDI r14, 1
    CALL enter_digit_start
    LDI r0, 2
    JMP enter_digit_finish

btn_3:
    LDI r14, 1
    CALL enter_digit_start
    LDI r0, 3
    JMP enter_digit_finish

btn_4:
    LDI r14, 1
    CALL enter_digit_start
    LDI r0, 4
    JMP enter_digit_finish

btn_5:
    LDI r14, 1
    CALL enter_digit_start
    LDI r0, 5
    JMP enter_digit_finish

btn_6:
    LDI r14, 1
    CALL enter_digit_start
    LDI r0, 6
    JMP enter_digit_finish

btn_7:
    LDI r14, 1
    CALL enter_digit_start
    LDI r0, 7
    JMP enter_digit_finish

btn_8:
    LDI r14, 1
    CALL enter_digit_start
    LDI r0, 8
    JMP enter_digit_finish

btn_9:
    LDI r14, 1
    CALL enter_digit_start
    LDI r0, 9
    JMP enter_digit_finish

btn_dot:
    ; For simplicity, just append a visual indicator -- skip real decimal
    ; In a full implementation we would track decimal position
    JMP draw_ui

; enter_digit_start: if new_entry, clear display value
enter_digit_start:
    LDI r14, 1
    LDI r20, NEW_ENTRY
    LOAD r0, r20
    CMPI r0, 1
    JZ r2, eds_clear
    RET
eds_clear:
    LDI r20, DISP_VAL
    LDI r0, 0
    STORE r20, r0
    LDI r20, NEW_ENTRY
    STORE r20, r0
    LDI r14, 1
    RET

; enter_digit_finish: r0=digit value, multiply display by 10 and add digit
enter_digit_finish:
    LDI r14, 1
    LDI r20, DISP_VAL
    LOAD r8, r20
    LDI r11, 10
    MUL r8, r11
    ADD r8, r0
    STORE r20, r8
    JMP draw_ui

; ── Operator buttons ───────────────────────────────
btn_add:
    LDI r14, 1
    LDI r20, OPER
    LDI r0, 1
    STORE r20, r0
    CALL save_accum_and_set_state
    JMP draw_ui

btn_sub:
    LDI r14, 1
    LDI r20, OPER
    LDI r0, 2
    STORE r20, r0
    CALL save_accum_and_set_state
    JMP draw_ui

btn_mul:
    LDI r14, 1
    LDI r20, OPER
    LDI r0, 3
    STORE r20, r0
    CALL save_accum_and_set_state
    JMP draw_ui

btn_div:
    LDI r14, 1
    LDI r20, OPER
    LDI r0, 4
    STORE r20, r0
    CALL save_accum_and_set_state
    JMP draw_ui

; save_accum_and_set_state: save display to accumulator, set state=2, new_entry=1
save_accum_and_set_state:
    LDI r14, 1
    ; If state is 2 (entering second), compute pending first
    LDI r20, STATE
    LOAD r0, r20
    CMPI r0, 2
    JNZ r2, sas_set
    ; Compute pending operation
    CALL do_compute
sas_set:
    ; Save display to accumulator
    LDI r20, DISP_VAL
    LOAD r0, r20
    LDI r20, ACCUM
    STORE r20, r0
    ; Set state = 2 (entering second number)
    LDI r20, STATE
    LDI r0, 2
    STORE r20, r0
    ; Set new_entry = 1
    LDI r20, NEW_ENTRY
    LDI r0, 1
    STORE r20, r0
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
    LOAD r0, r20
    CMPI r0, 0
    JZ r2, dc_done
    ; Load accumulator and display
    LDI r20, ACCUM
    LOAD r8, r20
    LDI r20, DISP_VAL
    LOAD r11, r20
    ; Branch on operator
    CMPI r0, 1
    JZ r2, dc_add
    CMPI r0, 2
    JZ r2, dc_sub
    CMPI r0, 3
    JZ r2, dc_mul
    CMPI r0, 4
    JZ r2, dc_div
    JMP dc_done

dc_add:
    ADD r8, r11
    JMP dc_store

dc_sub:
    SUB r8, r11
    JMP dc_store

dc_mul:
    MUL r8, r11
    JMP dc_store

dc_div:
    CMPI r11, 0
    JZ r2, dc_done
    DIV r8, r11

dc_store:
    LDI r20, DISP_VAL
    STORE r20, r8
    ; Clear operator
    LDI r20, OPER
    LDI r0, 0
    STORE r20, r0

dc_done:
    ; Set state=0, new_entry=1
    LDI r20, STATE
    LDI r0, 0
    STORE r20, r0
    LDI r20, NEW_ENTRY
    LDI r0, 1
    STORE r20, r0
    LDI r14, 1
    RET

; ── Clear button ───────────────────────────────────
btn_clear:
    LDI r14, 1
    LDI r20, DISP_VAL
    LDI r0, 0
    STORE r20, r0
    LDI r20, ACCUM
    STORE r20, r0
    LDI r20, OPER
    STORE r20, r0
    LDI r20, STATE
    STORE r20, r0
    LDI r20, NEW_ENTRY
    STORE r20, r0
    JMP draw_ui

; ── DRAW UI ────────────────────────────────────────
draw_ui:
    LDI r14, 1

    ; Redraw background
    LDI r0, 0x1A1A2E
    FILL r0

    ; ── Display area ──
    LDI r14, 20
    LDI r0, 20
    LDI r8, 216
    LDI r11, 40
    LDI r1, 0x0F3460
    RECTF r14, r0, r8, r11, r1

    ; Convert display value to string
    LDI r20, DISP_VAL
    LOAD r1, r20
    LDI r20, TXT_BUF
    CALL num_to_str

    ; Render display text (right-aligned at x=220, y=32)
    LDI r14, 220
    LDI r0, 32
    LDI r8, TXT_BUF
    TEXT r14, r0, r8

    ; ── Draw buttons ──
    ; Row 0: C(1) /(2) *(3) -(4)
    LDI r14, 20
    LDI r0, 70
    LDI r8, 48
    LDI r11, 38
    LDI r1, 0xE74C3C
    RECTF r14, r0, r8, r11, r1
    ; "C" label
    LDI r20, TXT_BUF
    LDI r0, 67
    STORE r20, r0
    LDI r0, 0
    ADD r20, r14
    STORE r20, r0
    LDI r14, 40
    LDI r0, 82
    LDI r8, TXT_BUF
    TEXT r14, r0, r8

    ; / button (orange)
    LDI r14, 72
    LDI r0, 70
    LDI r1, 0xFF8800
    RECTF r14, r0, r8, r11, r1
    LDI r20, TXT_BUF
    LDI r0, 47
    STORE r20, r0
    LDI r0, 0
    ADD r20, r14
    STORE r20, r0
    LDI r14, 92
    LDI r0, 82
    LDI r8, TXT_BUF
    TEXT r14, r0, r8

    ; * button (orange)
    LDI r14, 124
    LDI r0, 70
    RECTF r14, r0, r8, r11, r1
    LDI r20, TXT_BUF
    LDI r0, 42
    STORE r20, r0
    LDI r0, 0
    ADD r20, r14
    STORE r20, r0
    LDI r14, 144
    LDI r0, 82
    LDI r8, TXT_BUF
    TEXT r14, r0, r8

    ; - button (orange)
    LDI r14, 176
    LDI r0, 70
    RECTF r14, r0, r8, r11, r1
    LDI r20, TXT_BUF
    LDI r0, 45
    STORE r20, r0
    LDI r0, 0
    ADD r20, r14
    STORE r20, r0
    LDI r14, 196
    LDI r0, 82
    LDI r8, TXT_BUF
    TEXT r14, r0, r8

    ; Row 1: 7(5) 8(6) 9(7) +(8)
    LDI r14, 20
    LDI r0, 112
    LDI r8, 48
    LDI r11, 38
    LDI r1, 0x2C3E50
    RECTF r14, r0, r8, r11, r1
    ; "7"
    LDI r20, TXT_BUF
    LDI r0, 55
    STORE r20, r0
    LDI r0, 0
    ADD r20, r14
    STORE r20, r0
    LDI r14, 40
    LDI r0, 124
    LDI r8, TXT_BUF
    TEXT r14, r0, r8

    LDI r14, 72
    LDI r0, 112
    RECTF r14, r0, r8, r11, r1
    LDI r20, TXT_BUF
    LDI r0, 56
    STORE r20, r0
    LDI r0, 0
    ADD r20, r14
    STORE r20, r0
    LDI r14, 92
    LDI r0, 124
    LDI r8, TXT_BUF
    TEXT r14, r0, r8

    LDI r14, 124
    LDI r0, 112
    RECTF r14, r0, r8, r11, r1
    LDI r20, TXT_BUF
    LDI r0, 57
    STORE r20, r0
    LDI r0, 0
    ADD r20, r14
    STORE r20, r0
    LDI r14, 144
    LDI r0, 124
    LDI r8, TXT_BUF
    TEXT r14, r0, r8

    ; + button (green)
    LDI r14, 176
    LDI r0, 112
    LDI r1, 0x27AE60
    RECTF r14, r0, r8, r11, r1
    LDI r20, TXT_BUF
    LDI r0, 43
    STORE r20, r0
    LDI r0, 0
    ADD r20, r14
    STORE r20, r0
    LDI r14, 196
    LDI r0, 124
    LDI r8, TXT_BUF
    TEXT r14, r0, r8

    ; Row 2: 4(9) 5(10) 6(11) =(12)
    LDI r14, 20
    LDI r0, 154
    LDI r8, 48
    LDI r11, 38
    LDI r1, 0x2C3E50
    RECTF r14, r0, r8, r11, r1
    LDI r20, TXT_BUF
    LDI r0, 52
    STORE r20, r0
    LDI r0, 0
    ADD r20, r14
    STORE r20, r0
    LDI r14, 40
    LDI r0, 166
    LDI r8, TXT_BUF
    TEXT r14, r0, r8

    LDI r14, 72
    LDI r0, 154
    RECTF r14, r0, r8, r11, r1
    LDI r20, TXT_BUF
    LDI r0, 53
    STORE r20, r0
    LDI r0, 0
    ADD r20, r14
    STORE r20, r0
    LDI r14, 92
    LDI r0, 166
    LDI r8, TXT_BUF
    TEXT r14, r0, r8

    LDI r14, 124
    LDI r0, 154
    RECTF r14, r0, r8, r11, r1
    LDI r20, TXT_BUF
    LDI r0, 54
    STORE r20, r0
    LDI r0, 0
    ADD r20, r14
    STORE r20, r0
    LDI r14, 144
    LDI r0, 166
    LDI r8, TXT_BUF
    TEXT r14, r0, r8

    ; = button (green)
    LDI r14, 176
    LDI r0, 154
    LDI r1, 0x27AE60
    RECTF r14, r0, r8, r11, r1
    LDI r20, TXT_BUF
    LDI r0, 61
    STORE r20, r0
    LDI r0, 0
    ADD r20, r14
    STORE r20, r0
    LDI r14, 196
    LDI r0, 166
    LDI r8, TXT_BUF
    TEXT r14, r0, r8

    ; Row 3: 1(13) 2(14) 3(15) (empty)
    LDI r14, 20
    LDI r0, 196
    LDI r8, 48
    LDI r11, 38
    LDI r1, 0x2C3E50
    RECTF r14, r0, r8, r11, r1
    LDI r20, TXT_BUF
    LDI r0, 49
    STORE r20, r0
    LDI r0, 0
    ADD r20, r14
    STORE r20, r0
    LDI r14, 40
    LDI r0, 208
    LDI r8, TXT_BUF
    TEXT r14, r0, r8

    LDI r14, 72
    LDI r0, 196
    RECTF r14, r0, r8, r11, r1
    LDI r20, TXT_BUF
    LDI r0, 50
    STORE r20, r0
    LDI r0, 0
    ADD r20, r14
    STORE r20, r0
    LDI r14, 92
    LDI r0, 208
    LDI r8, TXT_BUF
    TEXT r14, r0, r8

    LDI r14, 124
    LDI r0, 196
    RECTF r14, r0, r8, r11, r1
    LDI r20, TXT_BUF
    LDI r0, 51
    STORE r20, r0
    LDI r0, 0
    ADD r20, r14
    STORE r20, r0
    LDI r14, 144
    LDI r0, 208
    LDI r8, TXT_BUF
    TEXT r14, r0, r8

    ; Row 4: 0(16, wide) .(17) (empty)
    LDI r14, 20
    LDI r0, 238
    LDI r8, 100
    LDI r11, 16
    LDI r1, 0x2C3E50
    RECTF r14, r0, r8, r11, r1
    LDI r20, TXT_BUF
    LDI r0, 48
    STORE r20, r0
    LDI r0, 0
    ADD r20, r14
    STORE r20, r0
    LDI r14, 60
    LDI r0, 242
    LDI r8, TXT_BUF
    TEXT r14, r0, r8

    LDI r14, 124
    LDI r0, 238
    LDI r8, 48
    LDI r11, 16
    LDI r1, 0x2C3E50
    RECTF r14, r0, r8, r11, r1
    LDI r20, TXT_BUF
    LDI r0, 46
    STORE r20, r0
    LDI r0, 0
    ADD r20, r14
    STORE r20, r0
    LDI r14, 144
    LDI r0, 242
    LDI r8, TXT_BUF
    TEXT r14, r0, r8

    ; ── Title ──
    LDI r20, TXT_BUF
    LDI r0, 71
    STORE r20, r0
    LDI r0, 85
    ADD r20, r14
    STORE r20, r0
    LDI r0, 73
    ADD r20, r14
    STORE r20, r0
    LDI r0, 32
    ADD r20, r14
    STORE r20, r0
    LDI r0, 67
    ADD r20, r14
    STORE r20, r0
    LDI r0, 65
    ADD r20, r14
    STORE r20, r0
    LDI r0, 76
    ADD r20, r14
    STORE r20, r0
    LDI r0, 0
    ADD r20, r14
    STORE r20, r0
    LDI r14, 80
    LDI r0, 5
    LDI r8, TXT_BUF
    TEXT r14, r0, r8

do_frame:
    FRAME
    JMP main_loop

; ── num_to_str subroutine ──────────────────────────
; Input:  r1 = number, r20 = buffer address
; Output: null-terminated string at r20, r20 advanced
; Clobbers: r2, r0, r8, r11, r21, r22
; Uses RAM: DIG_BUF(0x600), DIG_COUNT(0x620), DIG_QUOT(0x624), DIG_PTR(0x628)
num_to_str:
    LDI r14, 1
    CMPI r1, 0
    JNZ r2, nts_loop1

    ; Handle zero
    LDI r0, 48
    STORE r20, r0
    ADD r20, r14
    LDI r0, 0
    STORE r20, r0
    RET

nts_loop1:
    ; Init reversed buffer
    LDI r22, DIG_BUF
    LDI r0, DIG_PTR
    STORE r0, r22
    LDI r21, 0
    LDI r0, DIG_COUNT
    STORE r0, r21

nts_loop2:
    CMPI r1, 0
    JZ r2, nts_rev1

    ; r8 = r1 / 10
    LDI r8, 0
    ADD r8, r1
    LDI r11, 10
    DIV r8, r11
    LDI r0, DIG_QUOT
    STORE r0, r8

    ; r1 = r1 - r8*10 (remainder)
    LDI r0, 0
    ADD r0, r8
    MUL r0, r11
    SUB r1, r0
    ; Convert to ASCII
    LDI r0, 48
    ADD r1, r0

    ; Store in reversed buffer
    LDI r0, DIG_PTR
    LOAD r22, r0
    STORE r22, r1
    ADD r22, r14
    LDI r0, DIG_PTR
    STORE r0, r22

    ; Increment count
    LDI r0, DIG_COUNT
    LOAD r21, r0
    ADD r21, r14
    LDI r0, DIG_COUNT
    STORE r0, r21

    ; r1 = quotient
    LDI r0, DIG_QUOT
    LOAD r1, r0
    JMP nts_loop2

nts_rev1:
    ; Reverse digits into output buffer
    LDI r0, DIG_COUNT
    LOAD r21, r0
    LDI r22, DIG_BUF

nts_rev2:
    CMPI r21, 0
    JZ r2, nts_end
    SUB r21, r14
    ; Load digit from reversed buffer
    LDI r0, 0
    ADD r0, r22
    ADD r0, r21
    LOAD r0, r0
    ; Store to output buffer
    STORE r20, r0
    ADD r20, r14
    JMP nts_rev2

nts_end:
    LDI r0, 0
    STORE r20, r0
    LDI r14, 1
    RET
