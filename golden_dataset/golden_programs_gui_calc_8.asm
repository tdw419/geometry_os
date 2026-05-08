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
;   r5  = constant 1 (reloaded as needed)
;   r10  = scratch
;   r11  = scratch
;   r12  = scratch
;   r6  = scratch (colors, values)
;   r2  = scratch
;   r9 = mouse X from MOUSEQ
;   r4 = mouse Y from MOUSEQ
;   r14 = hit query result
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
    LDI r5, 1

; Display value = 0
    LDI r20, DISP_VAL
    LDI r10, 0
    STORE r20, r10

; Accumulator = 0
    LDI r20, ACCUM
    STORE r20, r10

; Operator = none (0)
    LDI r20, OPER
    STORE r20, r10

; State = entering first number (0)
    LDI r20, STATE
    STORE r20, r10

; New entry = no (0)
    LDI r20, NEW_ENTRY
    STORE r20, r10

; Tick = 0
    LDI r20, TICK
    STORE r20, r10

; Fill screen dark
    LDI r10, 0x1A1A2E
    FILL r10

; ── Register all button hit regions ──
; Button grid: 4 cols x 5 rows
; Each button: 48x38, gap=4, total cell=52
; Start: x=20, y=70

; Row 0: C  /  *  -
    LDI r5, 20
    LDI r10, 70
    LDI r11, 48
    LDI r12, 38
    HITSET r5, r10, r11, r12, 1

    LDI r5, 72
    HITSET r5, r10, r11, r12, 2

    LDI r5, 124
    HITSET r5, r10, r11, r12, 3

    LDI r5, 176
    HITSET r5, r10, r11, r12, 4

; Row 1: 7  8  9  +
    LDI r5, 20
    LDI r10, 112
    HITSET r5, r10, r11, r12, 5

    LDI r5, 72
    HITSET r5, r10, r11, r12, 6

    LDI r5, 124
    HITSET r5, r10, r11, r12, 7

    LDI r5, 176
    HITSET r5, r10, r11, r12, 8

; Row 2: 4  5  6  =
    LDI r5, 20
    LDI r10, 154
    HITSET r5, r10, r11, r12, 9

    LDI r5, 72
    HITSET r5, r10, r11, r12, 10

    LDI r5, 124
    HITSET r5, r10, r11, r12, 11

    LDI r5, 176
    HITSET r5, r10, r11, r12, 12

; Row 3: 1  2  3  (empty)
    LDI r5, 20
    LDI r10, 196
    HITSET r5, r10, r11, r12, 13

    LDI r5, 72
    HITSET r5, r10, r11, r12, 14

    LDI r5, 124
    HITSET r5, r10, r11, r12, 15

; Row 4: 0 (wide)  .  (empty)
; Button 0 spans 2 cols: 100x38
    LDI r5, 20
    LDI r10, 238
    LDI r11, 100
    LDI r12, 16
    HITSET r5, r10, r11, r12, 16

    LDI r5, 124
    LDI r11, 48
    LDI r12, 16
    HITSET r5, r10, r11, r12, 17

; ── MAIN LOOP ─────────────────────────────────────
main_loop:
    LDI r5, 1

; Increment tick
    LDI r20, TICK
    LOAD r10, r20
    ADD r10, r5
    STORE r20, r10

; Read mouse
    MOUSEQ r9

; Query hit regions
    HITQ r14
    JZ r14, draw_ui

; Handle button clicks
    CMPI r14, 1
    JZ r0, btn_clear

    CMPI r14, 2
    JZ r0, btn_div

    CMPI r14, 3
    JZ r0, btn_mul

    CMPI r14, 4
    JZ r0, btn_sub

    CMPI r14, 5
    JZ r0, btn_7

    CMPI r14, 6
    JZ r0, btn_8

    CMPI r14, 7
    JZ r0, btn_9

    CMPI r14, 8
    JZ r0, btn_add

    CMPI r14, 9
    JZ r0, btn_4

    CMPI r14, 10
    JZ r0, btn_5

    CMPI r14, 11
    JZ r0, btn_6

    CMPI r14, 12
    JZ r0, btn_eq

    CMPI r14, 13
    JZ r0, btn_1

    CMPI r14, 14
    JZ r0, btn_2

    CMPI r14, 15
    JZ r0, btn_3

    CMPI r14, 16
    JZ r0, btn_0

    CMPI r14, 17
    JZ r0, btn_dot

    JMP draw_ui

; ── Digit buttons ──────────────────────────────────
; Each digit: if new_entry, clear display first, then append digit
btn_0:
    LDI r5, 1
    LDI r20, NEW_ENTRY
    LOAD r10, r20
    CMPI r10, 1
    JZ r0, do_0_clear
    JMP do_0_append
do_0_clear:
    LDI r20, DISP_VAL
    LDI r10, 0
    STORE r20, r10
    LDI r20, NEW_ENTRY
    STORE r20, r10
do_0_append:
    LDI r20, DISP_VAL
    LOAD r10, r20
    LDI r11, 10
    MUL r10, r11
    STORE r20, r10
    JMP draw_ui

btn_1:
    LDI r5, 1
    CALL enter_digit_start
    LDI r10, 1
    JMP enter_digit_finish

btn_2:
    LDI r5, 1
    CALL enter_digit_start
    LDI r10, 2
    JMP enter_digit_finish

btn_3:
    LDI r5, 1
    CALL enter_digit_start
    LDI r10, 3
    JMP enter_digit_finish

btn_4:
    LDI r5, 1
    CALL enter_digit_start
    LDI r10, 4
    JMP enter_digit_finish

btn_5:
    LDI r5, 1
    CALL enter_digit_start
    LDI r10, 5
    JMP enter_digit_finish

btn_6:
    LDI r5, 1
    CALL enter_digit_start
    LDI r10, 6
    JMP enter_digit_finish

btn_7:
    LDI r5, 1
    CALL enter_digit_start
    LDI r10, 7
    JMP enter_digit_finish

btn_8:
    LDI r5, 1
    CALL enter_digit_start
    LDI r10, 8
    JMP enter_digit_finish

btn_9:
    LDI r5, 1
    CALL enter_digit_start
    LDI r10, 9
    JMP enter_digit_finish

btn_dot:
    ; For simplicity, just append a visual indicator -- skip real decimal
    ; In a full implementation we would track decimal position
    JMP draw_ui

; enter_digit_start: if new_entry, clear display value
enter_digit_start:
    LDI r5, 1
    LDI r20, NEW_ENTRY
    LOAD r10, r20
    CMPI r10, 1
    JZ r0, eds_clear
    RET
eds_clear:
    LDI r20, DISP_VAL
    LDI r10, 0
    STORE r20, r10
    LDI r20, NEW_ENTRY
    STORE r20, r10
    LDI r5, 1
    RET

; enter_digit_finish: r10=digit value, multiply display by 10 and add digit
enter_digit_finish:
    LDI r5, 1
    LDI r20, DISP_VAL
    LOAD r11, r20
    LDI r12, 10
    MUL r11, r12
    ADD r11, r10
    STORE r20, r11
    JMP draw_ui

; ── Operator buttons ───────────────────────────────
btn_add:
    LDI r5, 1
    LDI r20, OPER
    LDI r10, 1
    STORE r20, r10
    CALL save_accum_and_set_state
    JMP draw_ui

btn_sub:
    LDI r5, 1
    LDI r20, OPER
    LDI r10, 2
    STORE r20, r10
    CALL save_accum_and_set_state
    JMP draw_ui

btn_mul:
    LDI r5, 1
    LDI r20, OPER
    LDI r10, 3
    STORE r20, r10
    CALL save_accum_and_set_state
    JMP draw_ui

btn_div:
    LDI r5, 1
    LDI r20, OPER
    LDI r10, 4
    STORE r20, r10
    CALL save_accum_and_set_state
    JMP draw_ui

; save_accum_and_set_state: save display to accumulator, set state=2, new_entry=1
save_accum_and_set_state:
    LDI r5, 1
    ; If state is 2 (entering second), compute pending first
    LDI r20, STATE
    LOAD r10, r20
    CMPI r10, 2
    JNZ r0, sas_set
    ; Compute pending operation
    CALL do_compute
sas_set:
    ; Save display to accumulator
    LDI r20, DISP_VAL
    LOAD r10, r20
    LDI r20, ACCUM
    STORE r20, r10
    ; Set state = 2 (entering second number)
    LDI r20, STATE
    LDI r10, 2
    STORE r20, r10
    ; Set new_entry = 1
    LDI r20, NEW_ENTRY
    LDI r10, 1
    STORE r20, r10
    LDI r5, 1
    RET

; ── Equals button ──────────────────────────────────
btn_eq:
    LDI r5, 1
    CALL do_compute
    JMP draw_ui

; do_compute: perform pending operation
; accumulator OP display_val -> display_val
; Then set state=0, new_entry=1
do_compute:
    LDI r5, 1
    ; Check if there is an operator
    LDI r20, OPER
    LOAD r10, r20
    CMPI r10, 0
    JZ r0, dc_done
    ; Load accumulator and display
    LDI r20, ACCUM
    LOAD r11, r20
    LDI r20, DISP_VAL
    LOAD r12, r20
    ; Branch on operator
    CMPI r10, 1
    JZ r0, dc_add
    CMPI r10, 2
    JZ r0, dc_sub
    CMPI r10, 3
    JZ r0, dc_mul
    CMPI r10, 4
    JZ r0, dc_div
    JMP dc_done

dc_add:
    ADD r11, r12
    JMP dc_store

dc_sub:
    SUB r11, r12
    JMP dc_store

dc_mul:
    MUL r11, r12
    JMP dc_store

dc_div:
    CMPI r12, 0
    JZ r0, dc_done
    DIV r11, r12

dc_store:
    LDI r20, DISP_VAL
    STORE r20, r11
    ; Clear operator
    LDI r20, OPER
    LDI r10, 0
    STORE r20, r10

dc_done:
    ; Set state=0, new_entry=1
    LDI r20, STATE
    LDI r10, 0
    STORE r20, r10
    LDI r20, NEW_ENTRY
    LDI r10, 1
    STORE r20, r10
    LDI r5, 1
    RET

; ── Clear button ───────────────────────────────────
btn_clear:
    LDI r5, 1
    LDI r20, DISP_VAL
    LDI r10, 0
    STORE r20, r10
    LDI r20, ACCUM
    STORE r20, r10
    LDI r20, OPER
    STORE r20, r10
    LDI r20, STATE
    STORE r20, r10
    LDI r20, NEW_ENTRY
    STORE r20, r10
    JMP draw_ui

; ── DRAW UI ────────────────────────────────────────
draw_ui:
    LDI r5, 1

    ; Redraw background
    LDI r10, 0x1A1A2E
    FILL r10

    ; ── Display area ──
    LDI r5, 20
    LDI r10, 20
    LDI r11, 216
    LDI r12, 40
    LDI r6, 0x0F3460
    RECTF r5, r10, r11, r12, r6

    ; Convert display value to string
    LDI r20, DISP_VAL
    LOAD r6, r20
    LDI r20, TXT_BUF
    CALL num_to_str

    ; Render display text (right-aligned at x=220, y=32)
    LDI r5, 220
    LDI r10, 32
    LDI r11, TXT_BUF
    TEXT r5, r10, r11

    ; ── Draw buttons ──
    ; Row 0: C(1) /(2) *(3) -(4)
    LDI r5, 20
    LDI r10, 70
    LDI r11, 48
    LDI r12, 38
    LDI r6, 0xE74C3C
    RECTF r5, r10, r11, r12, r6
    ; "C" label
    LDI r20, TXT_BUF
    LDI r10, 67
    STORE r20, r10
    LDI r10, 0
    ADD r20, r5
    STORE r20, r10
    LDI r5, 40
    LDI r10, 82
    LDI r11, TXT_BUF
    TEXT r5, r10, r11

    ; / button (orange)
    LDI r5, 72
    LDI r10, 70
    LDI r6, 0xFF8800
    RECTF r5, r10, r11, r12, r6
    LDI r20, TXT_BUF
    LDI r10, 47
    STORE r20, r10
    LDI r10, 0
    ADD r20, r5
    STORE r20, r10
    LDI r5, 92
    LDI r10, 82
    LDI r11, TXT_BUF
    TEXT r5, r10, r11

    ; * button (orange)
    LDI r5, 124
    LDI r10, 70
    RECTF r5, r10, r11, r12, r6
    LDI r20, TXT_BUF
    LDI r10, 42
    STORE r20, r10
    LDI r10, 0
    ADD r20, r5
    STORE r20, r10
    LDI r5, 144
    LDI r10, 82
    LDI r11, TXT_BUF
    TEXT r5, r10, r11

    ; - button (orange)
    LDI r5, 176
    LDI r10, 70
    RECTF r5, r10, r11, r12, r6
    LDI r20, TXT_BUF
    LDI r10, 45
    STORE r20, r10
    LDI r10, 0
    ADD r20, r5
    STORE r20, r10
    LDI r5, 196
    LDI r10, 82
    LDI r11, TXT_BUF
    TEXT r5, r10, r11

    ; Row 1: 7(5) 8(6) 9(7) +(8)
    LDI r5, 20
    LDI r10, 112
    LDI r11, 48
    LDI r12, 38
    LDI r6, 0x2C3E50
    RECTF r5, r10, r11, r12, r6
    ; "7"
    LDI r20, TXT_BUF
    LDI r10, 55
    STORE r20, r10
    LDI r10, 0
    ADD r20, r5
    STORE r20, r10
    LDI r5, 40
    LDI r10, 124
    LDI r11, TXT_BUF
    TEXT r5, r10, r11

    LDI r5, 72
    LDI r10, 112
    RECTF r5, r10, r11, r12, r6
    LDI r20, TXT_BUF
    LDI r10, 56
    STORE r20, r10
    LDI r10, 0
    ADD r20, r5
    STORE r20, r10
    LDI r5, 92
    LDI r10, 124
    LDI r11, TXT_BUF
    TEXT r5, r10, r11

    LDI r5, 124
    LDI r10, 112
    RECTF r5, r10, r11, r12, r6
    LDI r20, TXT_BUF
    LDI r10, 57
    STORE r20, r10
    LDI r10, 0
    ADD r20, r5
    STORE r20, r10
    LDI r5, 144
    LDI r10, 124
    LDI r11, TXT_BUF
    TEXT r5, r10, r11

    ; + button (green)
    LDI r5, 176
    LDI r10, 112
    LDI r6, 0x27AE60
    RECTF r5, r10, r11, r12, r6
    LDI r20, TXT_BUF
    LDI r10, 43
    STORE r20, r10
    LDI r10, 0
    ADD r20, r5
    STORE r20, r10
    LDI r5, 196
    LDI r10, 124
    LDI r11, TXT_BUF
    TEXT r5, r10, r11

    ; Row 2: 4(9) 5(10) 6(11) =(12)
    LDI r5, 20
    LDI r10, 154
    LDI r11, 48
    LDI r12, 38
    LDI r6, 0x2C3E50
    RECTF r5, r10, r11, r12, r6
    LDI r20, TXT_BUF
    LDI r10, 52
    STORE r20, r10
    LDI r10, 0
    ADD r20, r5
    STORE r20, r10
    LDI r5, 40
    LDI r10, 166
    LDI r11, TXT_BUF
    TEXT r5, r10, r11

    LDI r5, 72
    LDI r10, 154
    RECTF r5, r10, r11, r12, r6
    LDI r20, TXT_BUF
    LDI r10, 53
    STORE r20, r10
    LDI r10, 0
    ADD r20, r5
    STORE r20, r10
    LDI r5, 92
    LDI r10, 166
    LDI r11, TXT_BUF
    TEXT r5, r10, r11

    LDI r5, 124
    LDI r10, 154
    RECTF r5, r10, r11, r12, r6
    LDI r20, TXT_BUF
    LDI r10, 54
    STORE r20, r10
    LDI r10, 0
    ADD r20, r5
    STORE r20, r10
    LDI r5, 144
    LDI r10, 166
    LDI r11, TXT_BUF
    TEXT r5, r10, r11

    ; = button (green)
    LDI r5, 176
    LDI r10, 154
    LDI r6, 0x27AE60
    RECTF r5, r10, r11, r12, r6
    LDI r20, TXT_BUF
    LDI r10, 61
    STORE r20, r10
    LDI r10, 0
    ADD r20, r5
    STORE r20, r10
    LDI r5, 196
    LDI r10, 166
    LDI r11, TXT_BUF
    TEXT r5, r10, r11

    ; Row 3: 1(13) 2(14) 3(15) (empty)
    LDI r5, 20
    LDI r10, 196
    LDI r11, 48
    LDI r12, 38
    LDI r6, 0x2C3E50
    RECTF r5, r10, r11, r12, r6
    LDI r20, TXT_BUF
    LDI r10, 49
    STORE r20, r10
    LDI r10, 0
    ADD r20, r5
    STORE r20, r10
    LDI r5, 40
    LDI r10, 208
    LDI r11, TXT_BUF
    TEXT r5, r10, r11

    LDI r5, 72
    LDI r10, 196
    RECTF r5, r10, r11, r12, r6
    LDI r20, TXT_BUF
    LDI r10, 50
    STORE r20, r10
    LDI r10, 0
    ADD r20, r5
    STORE r20, r10
    LDI r5, 92
    LDI r10, 208
    LDI r11, TXT_BUF
    TEXT r5, r10, r11

    LDI r5, 124
    LDI r10, 196
    RECTF r5, r10, r11, r12, r6
    LDI r20, TXT_BUF
    LDI r10, 51
    STORE r20, r10
    LDI r10, 0
    ADD r20, r5
    STORE r20, r10
    LDI r5, 144
    LDI r10, 208
    LDI r11, TXT_BUF
    TEXT r5, r10, r11

    ; Row 4: 0(16, wide) .(17) (empty)
    LDI r5, 20
    LDI r10, 238
    LDI r11, 100
    LDI r12, 16
    LDI r6, 0x2C3E50
    RECTF r5, r10, r11, r12, r6
    LDI r20, TXT_BUF
    LDI r10, 48
    STORE r20, r10
    LDI r10, 0
    ADD r20, r5
    STORE r20, r10
    LDI r5, 60
    LDI r10, 242
    LDI r11, TXT_BUF
    TEXT r5, r10, r11

    LDI r5, 124
    LDI r10, 238
    LDI r11, 48
    LDI r12, 16
    LDI r6, 0x2C3E50
    RECTF r5, r10, r11, r12, r6
    LDI r20, TXT_BUF
    LDI r10, 46
    STORE r20, r10
    LDI r10, 0
    ADD r20, r5
    STORE r20, r10
    LDI r5, 144
    LDI r10, 242
    LDI r11, TXT_BUF
    TEXT r5, r10, r11

    ; ── Title ──
    LDI r20, TXT_BUF
    LDI r10, 71
    STORE r20, r10
    LDI r10, 85
    ADD r20, r5
    STORE r20, r10
    LDI r10, 73
    ADD r20, r5
    STORE r20, r10
    LDI r10, 32
    ADD r20, r5
    STORE r20, r10
    LDI r10, 67
    ADD r20, r5
    STORE r20, r10
    LDI r10, 65
    ADD r20, r5
    STORE r20, r10
    LDI r10, 76
    ADD r20, r5
    STORE r20, r10
    LDI r10, 0
    ADD r20, r5
    STORE r20, r10
    LDI r5, 80
    LDI r10, 5
    LDI r11, TXT_BUF
    TEXT r5, r10, r11

do_frame:
    FRAME
    JMP main_loop

; ── num_to_str subroutine ──────────────────────────
; Input:  r6 = number, r20 = buffer address
; Output: null-terminated string at r20, r20 advanced
; Clobbers: r0, r10, r11, r12, r21, r22
; Uses RAM: DIG_BUF(0x600), DIG_COUNT(0x620), DIG_QUOT(0x624), DIG_PTR(0x628)
num_to_str:
    LDI r5, 1
    CMPI r6, 0
    JNZ r0, nts_loop1

    ; Handle zero
    LDI r10, 48
    STORE r20, r10
    ADD r20, r5
    LDI r10, 0
    STORE r20, r10
    RET

nts_loop1:
    ; Init reversed buffer
    LDI r22, DIG_BUF
    LDI r10, DIG_PTR
    STORE r10, r22
    LDI r21, 0
    LDI r10, DIG_COUNT
    STORE r10, r21

nts_loop2:
    CMPI r6, 0
    JZ r0, nts_rev1

    ; r11 = r6 / 10
    LDI r11, 0
    ADD r11, r6
    LDI r12, 10
    DIV r11, r12
    LDI r10, DIG_QUOT
    STORE r10, r11

    ; r6 = r6 - r11*10 (remainder)
    LDI r10, 0
    ADD r10, r11
    MUL r10, r12
    SUB r6, r10
    ; Convert to ASCII
    LDI r10, 48
    ADD r6, r10

    ; Store in reversed buffer
    LDI r10, DIG_PTR
    LOAD r22, r10
    STORE r22, r6
    ADD r22, r5
    LDI r10, DIG_PTR
    STORE r10, r22

    ; Increment count
    LDI r10, DIG_COUNT
    LOAD r21, r10
    ADD r21, r5
    LDI r10, DIG_COUNT
    STORE r10, r21

    ; r6 = quotient
    LDI r10, DIG_QUOT
    LOAD r6, r10
    JMP nts_loop2

nts_rev1:
    ; Reverse digits into output buffer
    LDI r10, DIG_COUNT
    LOAD r21, r10
    LDI r22, DIG_BUF

nts_rev2:
    CMPI r21, 0
    JZ r0, nts_end
    SUB r21, r5
    ; Load digit from reversed buffer
    LDI r10, 0
    ADD r10, r22
    ADD r10, r21
    LOAD r10, r10
    ; Store to output buffer
    STORE r20, r10
    ADD r20, r5
    JMP nts_rev2

nts_end:
    LDI r10, 0
    STORE r20, r10
    LDI r5, 1
    RET
