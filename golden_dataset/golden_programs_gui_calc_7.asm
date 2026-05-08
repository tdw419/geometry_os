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
;   r15  = constant 1 (reloaded as needed)
;   r9  = scratch
;   r10  = scratch
;   r5  = scratch
;   r3  = scratch (colors, values)
;   r4  = scratch
;   r12 = mouse X from MOUSEQ
;   r7 = mouse Y from MOUSEQ
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
    LDI r15, 1

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
    LDI r15, 20
    LDI r9, 70
    LDI r10, 48
    LDI r5, 38
    HITSET r15, r9, r10, r5, 1

    LDI r15, 72
    HITSET r15, r9, r10, r5, 2

    LDI r15, 124
    HITSET r15, r9, r10, r5, 3

    LDI r15, 176
    HITSET r15, r9, r10, r5, 4

; Row 1: 7  8  9  +
    LDI r15, 20
    LDI r9, 112
    HITSET r15, r9, r10, r5, 5

    LDI r15, 72
    HITSET r15, r9, r10, r5, 6

    LDI r15, 124
    HITSET r15, r9, r10, r5, 7

    LDI r15, 176
    HITSET r15, r9, r10, r5, 8

; Row 2: 4  5  6  =
    LDI r15, 20
    LDI r9, 154
    HITSET r15, r9, r10, r5, 9

    LDI r15, 72
    HITSET r15, r9, r10, r5, 10

    LDI r15, 124
    HITSET r15, r9, r10, r5, 11

    LDI r15, 176
    HITSET r15, r9, r10, r5, 12

; Row 3: 1  2  3  (empty)
    LDI r15, 20
    LDI r9, 196
    HITSET r15, r9, r10, r5, 13

    LDI r15, 72
    HITSET r15, r9, r10, r5, 14

    LDI r15, 124
    HITSET r15, r9, r10, r5, 15

; Row 4: 0 (wide)  .  (empty)
; Button 0 spans 2 cols: 100x38
    LDI r15, 20
    LDI r9, 238
    LDI r10, 100
    LDI r5, 16
    HITSET r15, r9, r10, r5, 16

    LDI r15, 124
    LDI r10, 48
    LDI r5, 16
    HITSET r15, r9, r10, r5, 17

; ── MAIN LOOP ─────────────────────────────────────
main_loop:
    LDI r15, 1

; Increment tick
    LDI r20, TICK
    LOAD r9, r20
    ADD r9, r15
    STORE r20, r9

; Read mouse
    MOUSEQ r12

; Query hit regions
    HITQ r14
    JZ r14, draw_ui

; Handle button clicks
    CMPI r14, 1
    JZ r8, btn_clear

    CMPI r14, 2
    JZ r8, btn_div

    CMPI r14, 3
    JZ r8, btn_mul

    CMPI r14, 4
    JZ r8, btn_sub

    CMPI r14, 5
    JZ r8, btn_7

    CMPI r14, 6
    JZ r8, btn_8

    CMPI r14, 7
    JZ r8, btn_9

    CMPI r14, 8
    JZ r8, btn_add

    CMPI r14, 9
    JZ r8, btn_4

    CMPI r14, 10
    JZ r8, btn_5

    CMPI r14, 11
    JZ r8, btn_6

    CMPI r14, 12
    JZ r8, btn_eq

    CMPI r14, 13
    JZ r8, btn_1

    CMPI r14, 14
    JZ r8, btn_2

    CMPI r14, 15
    JZ r8, btn_3

    CMPI r14, 16
    JZ r8, btn_0

    CMPI r14, 17
    JZ r8, btn_dot

    JMP draw_ui

; ── Digit buttons ──────────────────────────────────
; Each digit: if new_entry, clear display first, then append digit
btn_0:
    LDI r15, 1
    LDI r20, NEW_ENTRY
    LOAD r9, r20
    CMPI r9, 1
    JZ r8, do_0_clear
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
    LDI r10, 10
    MUL r9, r10
    STORE r20, r9
    JMP draw_ui

btn_1:
    LDI r15, 1
    CALL enter_digit_start
    LDI r9, 1
    JMP enter_digit_finish

btn_2:
    LDI r15, 1
    CALL enter_digit_start
    LDI r9, 2
    JMP enter_digit_finish

btn_3:
    LDI r15, 1
    CALL enter_digit_start
    LDI r9, 3
    JMP enter_digit_finish

btn_4:
    LDI r15, 1
    CALL enter_digit_start
    LDI r9, 4
    JMP enter_digit_finish

btn_5:
    LDI r15, 1
    CALL enter_digit_start
    LDI r9, 5
    JMP enter_digit_finish

btn_6:
    LDI r15, 1
    CALL enter_digit_start
    LDI r9, 6
    JMP enter_digit_finish

btn_7:
    LDI r15, 1
    CALL enter_digit_start
    LDI r9, 7
    JMP enter_digit_finish

btn_8:
    LDI r15, 1
    CALL enter_digit_start
    LDI r9, 8
    JMP enter_digit_finish

btn_9:
    LDI r15, 1
    CALL enter_digit_start
    LDI r9, 9
    JMP enter_digit_finish

btn_dot:
    ; For simplicity, just append a visual indicator -- skip real decimal
    ; In a full implementation we would track decimal position
    JMP draw_ui

; enter_digit_start: if new_entry, clear display value
enter_digit_start:
    LDI r15, 1
    LDI r20, NEW_ENTRY
    LOAD r9, r20
    CMPI r9, 1
    JZ r8, eds_clear
    RET
eds_clear:
    LDI r20, DISP_VAL
    LDI r9, 0
    STORE r20, r9
    LDI r20, NEW_ENTRY
    STORE r20, r9
    LDI r15, 1
    RET

; enter_digit_finish: r9=digit value, multiply display by 10 and add digit
enter_digit_finish:
    LDI r15, 1
    LDI r20, DISP_VAL
    LOAD r10, r20
    LDI r5, 10
    MUL r10, r5
    ADD r10, r9
    STORE r20, r10
    JMP draw_ui

; ── Operator buttons ───────────────────────────────
btn_add:
    LDI r15, 1
    LDI r20, OPER
    LDI r9, 1
    STORE r20, r9
    CALL save_accum_and_set_state
    JMP draw_ui

btn_sub:
    LDI r15, 1
    LDI r20, OPER
    LDI r9, 2
    STORE r20, r9
    CALL save_accum_and_set_state
    JMP draw_ui

btn_mul:
    LDI r15, 1
    LDI r20, OPER
    LDI r9, 3
    STORE r20, r9
    CALL save_accum_and_set_state
    JMP draw_ui

btn_div:
    LDI r15, 1
    LDI r20, OPER
    LDI r9, 4
    STORE r20, r9
    CALL save_accum_and_set_state
    JMP draw_ui

; save_accum_and_set_state: save display to accumulator, set state=2, new_entry=1
save_accum_and_set_state:
    LDI r15, 1
    ; If state is 2 (entering second), compute pending first
    LDI r20, STATE
    LOAD r9, r20
    CMPI r9, 2
    JNZ r8, sas_set
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
    LDI r15, 1
    RET

; ── Equals button ──────────────────────────────────
btn_eq:
    LDI r15, 1
    CALL do_compute
    JMP draw_ui

; do_compute: perform pending operation
; accumulator OP display_val -> display_val
; Then set state=0, new_entry=1
do_compute:
    LDI r15, 1
    ; Check if there is an operator
    LDI r20, OPER
    LOAD r9, r20
    CMPI r9, 0
    JZ r8, dc_done
    ; Load accumulator and display
    LDI r20, ACCUM
    LOAD r10, r20
    LDI r20, DISP_VAL
    LOAD r5, r20
    ; Branch on operator
    CMPI r9, 1
    JZ r8, dc_add
    CMPI r9, 2
    JZ r8, dc_sub
    CMPI r9, 3
    JZ r8, dc_mul
    CMPI r9, 4
    JZ r8, dc_div
    JMP dc_done

dc_add:
    ADD r10, r5
    JMP dc_store

dc_sub:
    SUB r10, r5
    JMP dc_store

dc_mul:
    MUL r10, r5
    JMP dc_store

dc_div:
    CMPI r5, 0
    JZ r8, dc_done
    DIV r10, r5

dc_store:
    LDI r20, DISP_VAL
    STORE r20, r10
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
    LDI r15, 1
    RET

; ── Clear button ───────────────────────────────────
btn_clear:
    LDI r15, 1
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
    LDI r15, 1

    ; Redraw background
    LDI r9, 0x1A1A2E
    FILL r9

    ; ── Display area ──
    LDI r15, 20
    LDI r9, 20
    LDI r10, 216
    LDI r5, 40
    LDI r3, 0x0F3460
    RECTF r15, r9, r10, r5, r3

    ; Convert display value to string
    LDI r20, DISP_VAL
    LOAD r3, r20
    LDI r20, TXT_BUF
    CALL num_to_str

    ; Render display text (right-aligned at x=220, y=32)
    LDI r15, 220
    LDI r9, 32
    LDI r10, TXT_BUF
    TEXT r15, r9, r10

    ; ── Draw buttons ──
    ; Row 0: C(1) /(2) *(3) -(4)
    LDI r15, 20
    LDI r9, 70
    LDI r10, 48
    LDI r5, 38
    LDI r3, 0xE74C3C
    RECTF r15, r9, r10, r5, r3
    ; "C" label
    LDI r20, TXT_BUF
    LDI r9, 67
    STORE r20, r9
    LDI r9, 0
    ADD r20, r15
    STORE r20, r9
    LDI r15, 40
    LDI r9, 82
    LDI r10, TXT_BUF
    TEXT r15, r9, r10

    ; / button (orange)
    LDI r15, 72
    LDI r9, 70
    LDI r3, 0xFF8800
    RECTF r15, r9, r10, r5, r3
    LDI r20, TXT_BUF
    LDI r9, 47
    STORE r20, r9
    LDI r9, 0
    ADD r20, r15
    STORE r20, r9
    LDI r15, 92
    LDI r9, 82
    LDI r10, TXT_BUF
    TEXT r15, r9, r10

    ; * button (orange)
    LDI r15, 124
    LDI r9, 70
    RECTF r15, r9, r10, r5, r3
    LDI r20, TXT_BUF
    LDI r9, 42
    STORE r20, r9
    LDI r9, 0
    ADD r20, r15
    STORE r20, r9
    LDI r15, 144
    LDI r9, 82
    LDI r10, TXT_BUF
    TEXT r15, r9, r10

    ; - button (orange)
    LDI r15, 176
    LDI r9, 70
    RECTF r15, r9, r10, r5, r3
    LDI r20, TXT_BUF
    LDI r9, 45
    STORE r20, r9
    LDI r9, 0
    ADD r20, r15
    STORE r20, r9
    LDI r15, 196
    LDI r9, 82
    LDI r10, TXT_BUF
    TEXT r15, r9, r10

    ; Row 1: 7(5) 8(6) 9(7) +(8)
    LDI r15, 20
    LDI r9, 112
    LDI r10, 48
    LDI r5, 38
    LDI r3, 0x2C3E50
    RECTF r15, r9, r10, r5, r3
    ; "7"
    LDI r20, TXT_BUF
    LDI r9, 55
    STORE r20, r9
    LDI r9, 0
    ADD r20, r15
    STORE r20, r9
    LDI r15, 40
    LDI r9, 124
    LDI r10, TXT_BUF
    TEXT r15, r9, r10

    LDI r15, 72
    LDI r9, 112
    RECTF r15, r9, r10, r5, r3
    LDI r20, TXT_BUF
    LDI r9, 56
    STORE r20, r9
    LDI r9, 0
    ADD r20, r15
    STORE r20, r9
    LDI r15, 92
    LDI r9, 124
    LDI r10, TXT_BUF
    TEXT r15, r9, r10

    LDI r15, 124
    LDI r9, 112
    RECTF r15, r9, r10, r5, r3
    LDI r20, TXT_BUF
    LDI r9, 57
    STORE r20, r9
    LDI r9, 0
    ADD r20, r15
    STORE r20, r9
    LDI r15, 144
    LDI r9, 124
    LDI r10, TXT_BUF
    TEXT r15, r9, r10

    ; + button (green)
    LDI r15, 176
    LDI r9, 112
    LDI r3, 0x27AE60
    RECTF r15, r9, r10, r5, r3
    LDI r20, TXT_BUF
    LDI r9, 43
    STORE r20, r9
    LDI r9, 0
    ADD r20, r15
    STORE r20, r9
    LDI r15, 196
    LDI r9, 124
    LDI r10, TXT_BUF
    TEXT r15, r9, r10

    ; Row 2: 4(9) 5(10) 6(11) =(12)
    LDI r15, 20
    LDI r9, 154
    LDI r10, 48
    LDI r5, 38
    LDI r3, 0x2C3E50
    RECTF r15, r9, r10, r5, r3
    LDI r20, TXT_BUF
    LDI r9, 52
    STORE r20, r9
    LDI r9, 0
    ADD r20, r15
    STORE r20, r9
    LDI r15, 40
    LDI r9, 166
    LDI r10, TXT_BUF
    TEXT r15, r9, r10

    LDI r15, 72
    LDI r9, 154
    RECTF r15, r9, r10, r5, r3
    LDI r20, TXT_BUF
    LDI r9, 53
    STORE r20, r9
    LDI r9, 0
    ADD r20, r15
    STORE r20, r9
    LDI r15, 92
    LDI r9, 166
    LDI r10, TXT_BUF
    TEXT r15, r9, r10

    LDI r15, 124
    LDI r9, 154
    RECTF r15, r9, r10, r5, r3
    LDI r20, TXT_BUF
    LDI r9, 54
    STORE r20, r9
    LDI r9, 0
    ADD r20, r15
    STORE r20, r9
    LDI r15, 144
    LDI r9, 166
    LDI r10, TXT_BUF
    TEXT r15, r9, r10

    ; = button (green)
    LDI r15, 176
    LDI r9, 154
    LDI r3, 0x27AE60
    RECTF r15, r9, r10, r5, r3
    LDI r20, TXT_BUF
    LDI r9, 61
    STORE r20, r9
    LDI r9, 0
    ADD r20, r15
    STORE r20, r9
    LDI r15, 196
    LDI r9, 166
    LDI r10, TXT_BUF
    TEXT r15, r9, r10

    ; Row 3: 1(13) 2(14) 3(15) (empty)
    LDI r15, 20
    LDI r9, 196
    LDI r10, 48
    LDI r5, 38
    LDI r3, 0x2C3E50
    RECTF r15, r9, r10, r5, r3
    LDI r20, TXT_BUF
    LDI r9, 49
    STORE r20, r9
    LDI r9, 0
    ADD r20, r15
    STORE r20, r9
    LDI r15, 40
    LDI r9, 208
    LDI r10, TXT_BUF
    TEXT r15, r9, r10

    LDI r15, 72
    LDI r9, 196
    RECTF r15, r9, r10, r5, r3
    LDI r20, TXT_BUF
    LDI r9, 50
    STORE r20, r9
    LDI r9, 0
    ADD r20, r15
    STORE r20, r9
    LDI r15, 92
    LDI r9, 208
    LDI r10, TXT_BUF
    TEXT r15, r9, r10

    LDI r15, 124
    LDI r9, 196
    RECTF r15, r9, r10, r5, r3
    LDI r20, TXT_BUF
    LDI r9, 51
    STORE r20, r9
    LDI r9, 0
    ADD r20, r15
    STORE r20, r9
    LDI r15, 144
    LDI r9, 208
    LDI r10, TXT_BUF
    TEXT r15, r9, r10

    ; Row 4: 0(16, wide) .(17) (empty)
    LDI r15, 20
    LDI r9, 238
    LDI r10, 100
    LDI r5, 16
    LDI r3, 0x2C3E50
    RECTF r15, r9, r10, r5, r3
    LDI r20, TXT_BUF
    LDI r9, 48
    STORE r20, r9
    LDI r9, 0
    ADD r20, r15
    STORE r20, r9
    LDI r15, 60
    LDI r9, 242
    LDI r10, TXT_BUF
    TEXT r15, r9, r10

    LDI r15, 124
    LDI r9, 238
    LDI r10, 48
    LDI r5, 16
    LDI r3, 0x2C3E50
    RECTF r15, r9, r10, r5, r3
    LDI r20, TXT_BUF
    LDI r9, 46
    STORE r20, r9
    LDI r9, 0
    ADD r20, r15
    STORE r20, r9
    LDI r15, 144
    LDI r9, 242
    LDI r10, TXT_BUF
    TEXT r15, r9, r10

    ; ── Title ──
    LDI r20, TXT_BUF
    LDI r9, 71
    STORE r20, r9
    LDI r9, 85
    ADD r20, r15
    STORE r20, r9
    LDI r9, 73
    ADD r20, r15
    STORE r20, r9
    LDI r9, 32
    ADD r20, r15
    STORE r20, r9
    LDI r9, 67
    ADD r20, r15
    STORE r20, r9
    LDI r9, 65
    ADD r20, r15
    STORE r20, r9
    LDI r9, 76
    ADD r20, r15
    STORE r20, r9
    LDI r9, 0
    ADD r20, r15
    STORE r20, r9
    LDI r15, 80
    LDI r9, 5
    LDI r10, TXT_BUF
    TEXT r15, r9, r10

do_frame:
    FRAME
    JMP main_loop

; ── num_to_str subroutine ──────────────────────────
; Input:  r3 = number, r20 = buffer address
; Output: null-terminated string at r20, r20 advanced
; Clobbers: r8, r9, r10, r5, r21, r22
; Uses RAM: DIG_BUF(0x600), DIG_COUNT(0x620), DIG_QUOT(0x624), DIG_PTR(0x628)
num_to_str:
    LDI r15, 1
    CMPI r3, 0
    JNZ r8, nts_loop1

    ; Handle zero
    LDI r9, 48
    STORE r20, r9
    ADD r20, r15
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
    CMPI r3, 0
    JZ r8, nts_rev1

    ; r10 = r3 / 10
    LDI r10, 0
    ADD r10, r3
    LDI r5, 10
    DIV r10, r5
    LDI r9, DIG_QUOT
    STORE r9, r10

    ; r3 = r3 - r10*10 (remainder)
    LDI r9, 0
    ADD r9, r10
    MUL r9, r5
    SUB r3, r9
    ; Convert to ASCII
    LDI r9, 48
    ADD r3, r9

    ; Store in reversed buffer
    LDI r9, DIG_PTR
    LOAD r22, r9
    STORE r22, r3
    ADD r22, r15
    LDI r9, DIG_PTR
    STORE r9, r22

    ; Increment count
    LDI r9, DIG_COUNT
    LOAD r21, r9
    ADD r21, r15
    LDI r9, DIG_COUNT
    STORE r9, r21

    ; r3 = quotient
    LDI r9, DIG_QUOT
    LOAD r3, r9
    JMP nts_loop2

nts_rev1:
    ; Reverse digits into output buffer
    LDI r9, DIG_COUNT
    LOAD r21, r9
    LDI r22, DIG_BUF

nts_rev2:
    CMPI r21, 0
    JZ r8, nts_end
    SUB r21, r15
    ; Load digit from reversed buffer
    LDI r9, 0
    ADD r9, r22
    ADD r9, r21
    LOAD r9, r9
    ; Store to output buffer
    STORE r20, r9
    ADD r20, r15
    JMP nts_rev2

nts_end:
    LDI r9, 0
    STORE r20, r9
    LDI r15, 1
    RET
