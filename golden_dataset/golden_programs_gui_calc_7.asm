; DESCRIPTION: Display a object using color colored at the screen.

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
;   r12  = constant 1 (reloaded as needed)
;   r8  = scratch
;   r2  = scratch
;   r9  = scratch
;   r4  = scratch (colors, values)
;   r14  = scratch
;   r5 = mouse X from MOUSEQ
;   r7 = mouse Y from MOUSEQ
;   r11 = hit query result
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
    LDI r12, 1

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
    LDI r12, 20
    LDI r8, 70
    LDI r2, 48
    LDI r9, 38
    HITSET r12, r8, r2, r9, 1

    LDI r12, 72
    HITSET r12, r8, r2, r9, 2

    LDI r12, 124
    HITSET r12, r8, r2, r9, 3

    LDI r12, 176
    HITSET r12, r8, r2, r9, 4

; Row 1: 7  8  9  +
    LDI r12, 20
    LDI r8, 112
    HITSET r12, r8, r2, r9, 5

    LDI r12, 72
    HITSET r12, r8, r2, r9, 6

    LDI r12, 124
    HITSET r12, r8, r2, r9, 7

    LDI r12, 176
    HITSET r12, r8, r2, r9, 8

; Row 2: 4  5  6  =
    LDI r12, 20
    LDI r8, 154
    HITSET r12, r8, r2, r9, 9

    LDI r12, 72
    HITSET r12, r8, r2, r9, 10

    LDI r12, 124
    HITSET r12, r8, r2, r9, 11

    LDI r12, 176
    HITSET r12, r8, r2, r9, 12

; Row 3: 1  2  3  (empty)
    LDI r12, 20
    LDI r8, 196
    HITSET r12, r8, r2, r9, 13

    LDI r12, 72
    HITSET r12, r8, r2, r9, 14

    LDI r12, 124
    HITSET r12, r8, r2, r9, 15

; Row 4: 0 (wide)  .  (empty)
; Button 0 spans 2 cols: 100x38
    LDI r12, 20
    LDI r8, 238
    LDI r2, 100
    LDI r9, 16
    HITSET r12, r8, r2, r9, 16

    LDI r12, 124
    LDI r2, 48
    LDI r9, 16
    HITSET r12, r8, r2, r9, 17

; ── MAIN LOOP ─────────────────────────────────────
main_loop:
    LDI r12, 1

; Increment tick
    LDI r20, TICK
    LOAD r8, r20
    ADD r8, r12
    STORE r20, r8

; Read mouse
    MOUSEQ r5

; Query hit regions
    HITQ r11
    JZ r11, draw_ui

; Handle button clicks
    CMPI r11, 1
    JZ r13, btn_clear

    CMPI r11, 2
    JZ r13, btn_div

    CMPI r11, 3
    JZ r13, btn_mul

    CMPI r11, 4
    JZ r13, btn_sub

    CMPI r11, 5
    JZ r13, btn_7

    CMPI r11, 6
    JZ r13, btn_8

    CMPI r11, 7
    JZ r13, btn_9

    CMPI r11, 8
    JZ r13, btn_add

    CMPI r11, 9
    JZ r13, btn_4

    CMPI r11, 10
    JZ r13, btn_5

    CMPI r11, 11
    JZ r13, btn_6

    CMPI r11, 12
    JZ r13, btn_eq

    CMPI r11, 13
    JZ r13, btn_1

    CMPI r11, 14
    JZ r13, btn_2

    CMPI r11, 15
    JZ r13, btn_3

    CMPI r11, 16
    JZ r13, btn_0

    CMPI r11, 17
    JZ r13, btn_dot

    JMP draw_ui

; ── Digit buttons ──────────────────────────────────
; Each digit: if new_entry, clear display first, then append digit
btn_0:
    LDI r12, 1
    LDI r20, NEW_ENTRY
    LOAD r8, r20
    CMPI r8, 1
    JZ r13, do_0_clear
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
    LDI r2, 10
    MUL r8, r2
    STORE r20, r8
    JMP draw_ui

btn_1:
    LDI r12, 1
    CALL enter_digit_start
    LDI r8, 1
    JMP enter_digit_finish

btn_2:
    LDI r12, 1
    CALL enter_digit_start
    LDI r8, 2
    JMP enter_digit_finish

btn_3:
    LDI r12, 1
    CALL enter_digit_start
    LDI r8, 3
    JMP enter_digit_finish

btn_4:
    LDI r12, 1
    CALL enter_digit_start
    LDI r8, 4
    JMP enter_digit_finish

btn_5:
    LDI r12, 1
    CALL enter_digit_start
    LDI r8, 5
    JMP enter_digit_finish

btn_6:
    LDI r12, 1
    CALL enter_digit_start
    LDI r8, 6
    JMP enter_digit_finish

btn_7:
    LDI r12, 1
    CALL enter_digit_start
    LDI r8, 7
    JMP enter_digit_finish

btn_8:
    LDI r12, 1
    CALL enter_digit_start
    LDI r8, 8
    JMP enter_digit_finish

btn_9:
    LDI r12, 1
    CALL enter_digit_start
    LDI r8, 9
    JMP enter_digit_finish

btn_dot:
    ; For simplicity, just append a visual indicator -- skip real decimal
    ; In a full implementation we would track decimal position
    JMP draw_ui

; enter_digit_start: if new_entry, clear display value
enter_digit_start:
    LDI r12, 1
    LDI r20, NEW_ENTRY
    LOAD r8, r20
    CMPI r8, 1
    JZ r13, eds_clear
    RET
eds_clear:
    LDI r20, DISP_VAL
    LDI r8, 0
    STORE r20, r8
    LDI r20, NEW_ENTRY
    STORE r20, r8
    LDI r12, 1
    RET

; enter_digit_finish: r8=digit value, multiply display by 10 and add digit
enter_digit_finish:
    LDI r12, 1
    LDI r20, DISP_VAL
    LOAD r2, r20
    LDI r9, 10
    MUL r2, r9
    ADD r2, r8
    STORE r20, r2
    JMP draw_ui

; ── Operator buttons ───────────────────────────────
btn_add:
    LDI r12, 1
    LDI r20, OPER
    LDI r8, 1
    STORE r20, r8
    CALL save_accum_and_set_state
    JMP draw_ui

btn_sub:
    LDI r12, 1
    LDI r20, OPER
    LDI r8, 2
    STORE r20, r8
    CALL save_accum_and_set_state
    JMP draw_ui

btn_mul:
    LDI r12, 1
    LDI r20, OPER
    LDI r8, 3
    STORE r20, r8
    CALL save_accum_and_set_state
    JMP draw_ui

btn_div:
    LDI r12, 1
    LDI r20, OPER
    LDI r8, 4
    STORE r20, r8
    CALL save_accum_and_set_state
    JMP draw_ui

; save_accum_and_set_state: save display to accumulator, set state=2, new_entry=1
save_accum_and_set_state:
    LDI r12, 1
    ; If state is 2 (entering second), compute pending first
    LDI r20, STATE
    LOAD r8, r20
    CMPI r8, 2
    JNZ r13, sas_set
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
    LDI r12, 1
    RET

; ── Equals button ──────────────────────────────────
btn_eq:
    LDI r12, 1
    CALL do_compute
    JMP draw_ui

; do_compute: perform pending operation
; accumulator OP display_val -> display_val
; Then set state=0, new_entry=1
do_compute:
    LDI r12, 1
    ; Check if there is an operator
    LDI r20, OPER
    LOAD r8, r20
    CMPI r8, 0
    JZ r13, dc_done
    ; Load accumulator and display
    LDI r20, ACCUM
    LOAD r2, r20
    LDI r20, DISP_VAL
    LOAD r9, r20
    ; Branch on operator
    CMPI r8, 1
    JZ r13, dc_add
    CMPI r8, 2
    JZ r13, dc_sub
    CMPI r8, 3
    JZ r13, dc_mul
    CMPI r8, 4
    JZ r13, dc_div
    JMP dc_done

dc_add:
    ADD r2, r9
    JMP dc_store

dc_sub:
    SUB r2, r9
    JMP dc_store

dc_mul:
    MUL r2, r9
    JMP dc_store

dc_div:
    CMPI r9, 0
    JZ r13, dc_done
    DIV r2, r9

dc_store:
    LDI r20, DISP_VAL
    STORE r20, r2
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
    LDI r12, 1
    RET

; ── Clear button ───────────────────────────────────
btn_clear:
    LDI r12, 1
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
    LDI r12, 1

    ; Redraw background
    LDI r8, 0x1A1A2E
    FILL r8

    ; ── Display area ──
    LDI r12, 20
    LDI r8, 20
    LDI r2, 216
    LDI r9, 40
    LDI r4, 0x0F3460
    RECTF r12, r8, r2, r9, r4

    ; Convert display value to string
    LDI r20, DISP_VAL
    LOAD r4, r20
    LDI r20, TXT_BUF
    CALL num_to_str

    ; Render display text (right-aligned at x=220, y=32)
    LDI r12, 220
    LDI r8, 32
    LDI r2, TXT_BUF
    TEXT r12, r8, r2

    ; ── Draw buttons ──
    ; Row 0: C(1) /(2) *(3) -(4)
    LDI r12, 20
    LDI r8, 70
    LDI r2, 48
    LDI r9, 38
    LDI r4, 0xE74C3C
    RECTF r12, r8, r2, r9, r4
    ; "C" label
    LDI r20, TXT_BUF
    LDI r8, 67
    STORE r20, r8
    LDI r8, 0
    ADD r20, r12
    STORE r20, r8
    LDI r12, 40
    LDI r8, 82
    LDI r2, TXT_BUF
    TEXT r12, r8, r2

    ; / button (orange)
    LDI r12, 72
    LDI r8, 70
    LDI r4, 0xFF8800
    RECTF r12, r8, r2, r9, r4
    LDI r20, TXT_BUF
    LDI r8, 47
    STORE r20, r8
    LDI r8, 0
    ADD r20, r12
    STORE r20, r8
    LDI r12, 92
    LDI r8, 82
    LDI r2, TXT_BUF
    TEXT r12, r8, r2

    ; * button (orange)
    LDI r12, 124
    LDI r8, 70
    RECTF r12, r8, r2, r9, r4
    LDI r20, TXT_BUF
    LDI r8, 42
    STORE r20, r8
    LDI r8, 0
    ADD r20, r12
    STORE r20, r8
    LDI r12, 144
    LDI r8, 82
    LDI r2, TXT_BUF
    TEXT r12, r8, r2

    ; - button (orange)
    LDI r12, 176
    LDI r8, 70
    RECTF r12, r8, r2, r9, r4
    LDI r20, TXT_BUF
    LDI r8, 45
    STORE r20, r8
    LDI r8, 0
    ADD r20, r12
    STORE r20, r8
    LDI r12, 196
    LDI r8, 82
    LDI r2, TXT_BUF
    TEXT r12, r8, r2

    ; Row 1: 7(5) 8(6) 9(7) +(8)
    LDI r12, 20
    LDI r8, 112
    LDI r2, 48
    LDI r9, 38
    LDI r4, 0x2C3E50
    RECTF r12, r8, r2, r9, r4
    ; "7"
    LDI r20, TXT_BUF
    LDI r8, 55
    STORE r20, r8
    LDI r8, 0
    ADD r20, r12
    STORE r20, r8
    LDI r12, 40
    LDI r8, 124
    LDI r2, TXT_BUF
    TEXT r12, r8, r2

    LDI r12, 72
    LDI r8, 112
    RECTF r12, r8, r2, r9, r4
    LDI r20, TXT_BUF
    LDI r8, 56
    STORE r20, r8
    LDI r8, 0
    ADD r20, r12
    STORE r20, r8
    LDI r12, 92
    LDI r8, 124
    LDI r2, TXT_BUF
    TEXT r12, r8, r2

    LDI r12, 124
    LDI r8, 112
    RECTF r12, r8, r2, r9, r4
    LDI r20, TXT_BUF
    LDI r8, 57
    STORE r20, r8
    LDI r8, 0
    ADD r20, r12
    STORE r20, r8
    LDI r12, 144
    LDI r8, 124
    LDI r2, TXT_BUF
    TEXT r12, r8, r2

    ; + button (green)
    LDI r12, 176
    LDI r8, 112
    LDI r4, 0x27AE60
    RECTF r12, r8, r2, r9, r4
    LDI r20, TXT_BUF
    LDI r8, 43
    STORE r20, r8
    LDI r8, 0
    ADD r20, r12
    STORE r20, r8
    LDI r12, 196
    LDI r8, 124
    LDI r2, TXT_BUF
    TEXT r12, r8, r2

    ; Row 2: 4(9) 5(10) 6(11) =(12)
    LDI r12, 20
    LDI r8, 154
    LDI r2, 48
    LDI r9, 38
    LDI r4, 0x2C3E50
    RECTF r12, r8, r2, r9, r4
    LDI r20, TXT_BUF
    LDI r8, 52
    STORE r20, r8
    LDI r8, 0
    ADD r20, r12
    STORE r20, r8
    LDI r12, 40
    LDI r8, 166
    LDI r2, TXT_BUF
    TEXT r12, r8, r2

    LDI r12, 72
    LDI r8, 154
    RECTF r12, r8, r2, r9, r4
    LDI r20, TXT_BUF
    LDI r8, 53
    STORE r20, r8
    LDI r8, 0
    ADD r20, r12
    STORE r20, r8
    LDI r12, 92
    LDI r8, 166
    LDI r2, TXT_BUF
    TEXT r12, r8, r2

    LDI r12, 124
    LDI r8, 154
    RECTF r12, r8, r2, r9, r4
    LDI r20, TXT_BUF
    LDI r8, 54
    STORE r20, r8
    LDI r8, 0
    ADD r20, r12
    STORE r20, r8
    LDI r12, 144
    LDI r8, 166
    LDI r2, TXT_BUF
    TEXT r12, r8, r2

    ; = button (green)
    LDI r12, 176
    LDI r8, 154
    LDI r4, 0x27AE60
    RECTF r12, r8, r2, r9, r4
    LDI r20, TXT_BUF
    LDI r8, 61
    STORE r20, r8
    LDI r8, 0
    ADD r20, r12
    STORE r20, r8
    LDI r12, 196
    LDI r8, 166
    LDI r2, TXT_BUF
    TEXT r12, r8, r2

    ; Row 3: 1(13) 2(14) 3(15) (empty)
    LDI r12, 20
    LDI r8, 196
    LDI r2, 48
    LDI r9, 38
    LDI r4, 0x2C3E50
    RECTF r12, r8, r2, r9, r4
    LDI r20, TXT_BUF
    LDI r8, 49
    STORE r20, r8
    LDI r8, 0
    ADD r20, r12
    STORE r20, r8
    LDI r12, 40
    LDI r8, 208
    LDI r2, TXT_BUF
    TEXT r12, r8, r2

    LDI r12, 72
    LDI r8, 196
    RECTF r12, r8, r2, r9, r4
    LDI r20, TXT_BUF
    LDI r8, 50
    STORE r20, r8
    LDI r8, 0
    ADD r20, r12
    STORE r20, r8
    LDI r12, 92
    LDI r8, 208
    LDI r2, TXT_BUF
    TEXT r12, r8, r2

    LDI r12, 124
    LDI r8, 196
    RECTF r12, r8, r2, r9, r4
    LDI r20, TXT_BUF
    LDI r8, 51
    STORE r20, r8
    LDI r8, 0
    ADD r20, r12
    STORE r20, r8
    LDI r12, 144
    LDI r8, 208
    LDI r2, TXT_BUF
    TEXT r12, r8, r2

    ; Row 4: 0(16, wide) .(17) (empty)
    LDI r12, 20
    LDI r8, 238
    LDI r2, 100
    LDI r9, 16
    LDI r4, 0x2C3E50
    RECTF r12, r8, r2, r9, r4
    LDI r20, TXT_BUF
    LDI r8, 48
    STORE r20, r8
    LDI r8, 0
    ADD r20, r12
    STORE r20, r8
    LDI r12, 60
    LDI r8, 242
    LDI r2, TXT_BUF
    TEXT r12, r8, r2

    LDI r12, 124
    LDI r8, 238
    LDI r2, 48
    LDI r9, 16
    LDI r4, 0x2C3E50
    RECTF r12, r8, r2, r9, r4
    LDI r20, TXT_BUF
    LDI r8, 46
    STORE r20, r8
    LDI r8, 0
    ADD r20, r12
    STORE r20, r8
    LDI r12, 144
    LDI r8, 242
    LDI r2, TXT_BUF
    TEXT r12, r8, r2

    ; ── Title ──
    LDI r20, TXT_BUF
    LDI r8, 71
    STORE r20, r8
    LDI r8, 85
    ADD r20, r12
    STORE r20, r8
    LDI r8, 73
    ADD r20, r12
    STORE r20, r8
    LDI r8, 32
    ADD r20, r12
    STORE r20, r8
    LDI r8, 67
    ADD r20, r12
    STORE r20, r8
    LDI r8, 65
    ADD r20, r12
    STORE r20, r8
    LDI r8, 76
    ADD r20, r12
    STORE r20, r8
    LDI r8, 0
    ADD r20, r12
    STORE r20, r8
    LDI r12, 80
    LDI r8, 5
    LDI r2, TXT_BUF
    TEXT r12, r8, r2

do_frame:
    FRAME
    JMP main_loop

; ── num_to_str subroutine ──────────────────────────
; Input:  r4 = number, r20 = buffer address
; Output: null-terminated string at r20, r20 advanced
; Clobbers: r13, r8, r2, r9, r21, r22
; Uses RAM: DIG_BUF(0x600), DIG_COUNT(0x620), DIG_QUOT(0x624), DIG_PTR(0x628)
num_to_str:
    LDI r12, 1
    CMPI r4, 0
    JNZ r13, nts_loop1

    ; Handle zero
    LDI r8, 48
    STORE r20, r8
    ADD r20, r12
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
    CMPI r4, 0
    JZ r13, nts_rev1

    ; r2 = r4 / 10
    LDI r2, 0
    ADD r2, r4
    LDI r9, 10
    DIV r2, r9
    LDI r8, DIG_QUOT
    STORE r8, r2

    ; r4 = r4 - r2*10 (remainder)
    LDI r8, 0
    ADD r8, r2
    MUL r8, r9
    SUB r4, r8
    ; Convert to ASCII
    LDI r8, 48
    ADD r4, r8

    ; Store in reversed buffer
    LDI r8, DIG_PTR
    LOAD r22, r8
    STORE r22, r4
    ADD r22, r12
    LDI r8, DIG_PTR
    STORE r8, r22

    ; Increment count
    LDI r8, DIG_COUNT
    LOAD r21, r8
    ADD r21, r12
    LDI r8, DIG_COUNT
    STORE r8, r21

    ; r4 = quotient
    LDI r8, DIG_QUOT
    LOAD r4, r8
    JMP nts_loop2

nts_rev1:
    ; Reverse digits into output buffer
    LDI r8, DIG_COUNT
    LOAD r21, r8
    LDI r22, DIG_BUF

nts_rev2:
    CMPI r21, 0
    JZ r13, nts_end
    SUB r21, r12
    ; Load digit from reversed buffer
    LDI r8, 0
    ADD r8, r22
    ADD r8, r21
    LOAD r8, r8
    ; Store to output buffer
    STORE r20, r8
    ADD r20, r12
    JMP nts_rev2

nts_end:
    LDI r8, 0
    STORE r20, r8
    LDI r12, 1
    RET
