; DESCRIPTION: Draws a colored object at the screen with fixed size.

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
;   r13  = constant 1 (reloaded as needed)
;   r7  = scratch
;   r10  = scratch
;   r4  = scratch
;   r11  = scratch (colors, values)
;   r15  = scratch
;   r6 = mouse X from MOUSEQ
;   r0 = mouse Y from MOUSEQ
;   r8 = hit query result
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
    LDI r13, 1

; Display value = 0
    LDI r20, DISP_VAL
    LDI r7, 0
    STORE r20, r7

; Accumulator = 0
    LDI r20, ACCUM
    STORE r20, r7

; Operator = none (0)
    LDI r20, OPER
    STORE r20, r7

; State = entering first number (0)
    LDI r20, STATE
    STORE r20, r7

; New entry = no (0)
    LDI r20, NEW_ENTRY
    STORE r20, r7

; Tick = 0
    LDI r20, TICK
    STORE r20, r7

; Fill screen dark
    LDI r7, 0x1A1A2E
    FILL r7

; ── Register all button hit regions ──
; Button grid: 4 cols x 5 rows
; Each button: 48x38, gap=4, total cell=52
; Start: x=20, y=70

; Row 0: C  /  *  -
    LDI r13, 20
    LDI r7, 70
    LDI r10, 48
    LDI r4, 38
    HITSET r13, r7, r10, r4, 1

    LDI r13, 72
    HITSET r13, r7, r10, r4, 2

    LDI r13, 124
    HITSET r13, r7, r10, r4, 3

    LDI r13, 176
    HITSET r13, r7, r10, r4, 4

; Row 1: 7  8  9  +
    LDI r13, 20
    LDI r7, 112
    HITSET r13, r7, r10, r4, 5

    LDI r13, 72
    HITSET r13, r7, r10, r4, 6

    LDI r13, 124
    HITSET r13, r7, r10, r4, 7

    LDI r13, 176
    HITSET r13, r7, r10, r4, 8

; Row 2: 4  5  6  =
    LDI r13, 20
    LDI r7, 154
    HITSET r13, r7, r10, r4, 9

    LDI r13, 72
    HITSET r13, r7, r10, r4, 10

    LDI r13, 124
    HITSET r13, r7, r10, r4, 11

    LDI r13, 176
    HITSET r13, r7, r10, r4, 12

; Row 3: 1  2  3  (empty)
    LDI r13, 20
    LDI r7, 196
    HITSET r13, r7, r10, r4, 13

    LDI r13, 72
    HITSET r13, r7, r10, r4, 14

    LDI r13, 124
    HITSET r13, r7, r10, r4, 15

; Row 4: 0 (wide)  .  (empty)
; Button 0 spans 2 cols: 100x38
    LDI r13, 20
    LDI r7, 238
    LDI r10, 100
    LDI r4, 16
    HITSET r13, r7, r10, r4, 16

    LDI r13, 124
    LDI r10, 48
    LDI r4, 16
    HITSET r13, r7, r10, r4, 17

; ── MAIN LOOP ─────────────────────────────────────
main_loop:
    LDI r13, 1

; Increment tick
    LDI r20, TICK
    LOAD r7, r20
    ADD r7, r13
    STORE r20, r7

; Read mouse
    MOUSEQ r6

; Query hit regions
    HITQ r8
    JZ r8, draw_ui

; Handle button clicks
    CMPI r8, 1
    JZ r2, btn_clear

    CMPI r8, 2
    JZ r2, btn_div

    CMPI r8, 3
    JZ r2, btn_mul

    CMPI r8, 4
    JZ r2, btn_sub

    CMPI r8, 5
    JZ r2, btn_7

    CMPI r8, 6
    JZ r2, btn_8

    CMPI r8, 7
    JZ r2, btn_9

    CMPI r8, 8
    JZ r2, btn_add

    CMPI r8, 9
    JZ r2, btn_4

    CMPI r8, 10
    JZ r2, btn_5

    CMPI r8, 11
    JZ r2, btn_6

    CMPI r8, 12
    JZ r2, btn_eq

    CMPI r8, 13
    JZ r2, btn_1

    CMPI r8, 14
    JZ r2, btn_2

    CMPI r8, 15
    JZ r2, btn_3

    CMPI r8, 16
    JZ r2, btn_0

    CMPI r8, 17
    JZ r2, btn_dot

    JMP draw_ui

; ── Digit buttons ──────────────────────────────────
; Each digit: if new_entry, clear display first, then append digit
btn_0:
    LDI r13, 1
    LDI r20, NEW_ENTRY
    LOAD r7, r20
    CMPI r7, 1
    JZ r2, do_0_clear
    JMP do_0_append
do_0_clear:
    LDI r20, DISP_VAL
    LDI r7, 0
    STORE r20, r7
    LDI r20, NEW_ENTRY
    STORE r20, r7
do_0_append:
    LDI r20, DISP_VAL
    LOAD r7, r20
    LDI r10, 10
    MUL r7, r10
    STORE r20, r7
    JMP draw_ui

btn_1:
    LDI r13, 1
    CALL enter_digit_start
    LDI r7, 1
    JMP enter_digit_finish

btn_2:
    LDI r13, 1
    CALL enter_digit_start
    LDI r7, 2
    JMP enter_digit_finish

btn_3:
    LDI r13, 1
    CALL enter_digit_start
    LDI r7, 3
    JMP enter_digit_finish

btn_4:
    LDI r13, 1
    CALL enter_digit_start
    LDI r7, 4
    JMP enter_digit_finish

btn_5:
    LDI r13, 1
    CALL enter_digit_start
    LDI r7, 5
    JMP enter_digit_finish

btn_6:
    LDI r13, 1
    CALL enter_digit_start
    LDI r7, 6
    JMP enter_digit_finish

btn_7:
    LDI r13, 1
    CALL enter_digit_start
    LDI r7, 7
    JMP enter_digit_finish

btn_8:
    LDI r13, 1
    CALL enter_digit_start
    LDI r7, 8
    JMP enter_digit_finish

btn_9:
    LDI r13, 1
    CALL enter_digit_start
    LDI r7, 9
    JMP enter_digit_finish

btn_dot:
    ; For simplicity, just append a visual indicator -- skip real decimal
    ; In a full implementation we would track decimal position
    JMP draw_ui

; enter_digit_start: if new_entry, clear display value
enter_digit_start:
    LDI r13, 1
    LDI r20, NEW_ENTRY
    LOAD r7, r20
    CMPI r7, 1
    JZ r2, eds_clear
    RET
eds_clear:
    LDI r20, DISP_VAL
    LDI r7, 0
    STORE r20, r7
    LDI r20, NEW_ENTRY
    STORE r20, r7
    LDI r13, 1
    RET

; enter_digit_finish: r7=digit value, multiply display by 10 and add digit
enter_digit_finish:
    LDI r13, 1
    LDI r20, DISP_VAL
    LOAD r10, r20
    LDI r4, 10
    MUL r10, r4
    ADD r10, r7
    STORE r20, r10
    JMP draw_ui

; ── Operator buttons ───────────────────────────────
btn_add:
    LDI r13, 1
    LDI r20, OPER
    LDI r7, 1
    STORE r20, r7
    CALL save_accum_and_set_state
    JMP draw_ui

btn_sub:
    LDI r13, 1
    LDI r20, OPER
    LDI r7, 2
    STORE r20, r7
    CALL save_accum_and_set_state
    JMP draw_ui

btn_mul:
    LDI r13, 1
    LDI r20, OPER
    LDI r7, 3
    STORE r20, r7
    CALL save_accum_and_set_state
    JMP draw_ui

btn_div:
    LDI r13, 1
    LDI r20, OPER
    LDI r7, 4
    STORE r20, r7
    CALL save_accum_and_set_state
    JMP draw_ui

; save_accum_and_set_state: save display to accumulator, set state=2, new_entry=1
save_accum_and_set_state:
    LDI r13, 1
    ; If state is 2 (entering second), compute pending first
    LDI r20, STATE
    LOAD r7, r20
    CMPI r7, 2
    JNZ r2, sas_set
    ; Compute pending operation
    CALL do_compute
sas_set:
    ; Save display to accumulator
    LDI r20, DISP_VAL
    LOAD r7, r20
    LDI r20, ACCUM
    STORE r20, r7
    ; Set state = 2 (entering second number)
    LDI r20, STATE
    LDI r7, 2
    STORE r20, r7
    ; Set new_entry = 1
    LDI r20, NEW_ENTRY
    LDI r7, 1
    STORE r20, r7
    LDI r13, 1
    RET

; ── Equals button ──────────────────────────────────
btn_eq:
    LDI r13, 1
    CALL do_compute
    JMP draw_ui

; do_compute: perform pending operation
; accumulator OP display_val -> display_val
; Then set state=0, new_entry=1
do_compute:
    LDI r13, 1
    ; Check if there is an operator
    LDI r20, OPER
    LOAD r7, r20
    CMPI r7, 0
    JZ r2, dc_done
    ; Load accumulator and display
    LDI r20, ACCUM
    LOAD r10, r20
    LDI r20, DISP_VAL
    LOAD r4, r20
    ; Branch on operator
    CMPI r7, 1
    JZ r2, dc_add
    CMPI r7, 2
    JZ r2, dc_sub
    CMPI r7, 3
    JZ r2, dc_mul
    CMPI r7, 4
    JZ r2, dc_div
    JMP dc_done

dc_add:
    ADD r10, r4
    JMP dc_store

dc_sub:
    SUB r10, r4
    JMP dc_store

dc_mul:
    MUL r10, r4
    JMP dc_store

dc_div:
    CMPI r4, 0
    JZ r2, dc_done
    DIV r10, r4

dc_store:
    LDI r20, DISP_VAL
    STORE r20, r10
    ; Clear operator
    LDI r20, OPER
    LDI r7, 0
    STORE r20, r7

dc_done:
    ; Set state=0, new_entry=1
    LDI r20, STATE
    LDI r7, 0
    STORE r20, r7
    LDI r20, NEW_ENTRY
    LDI r7, 1
    STORE r20, r7
    LDI r13, 1
    RET

; ── Clear button ───────────────────────────────────
btn_clear:
    LDI r13, 1
    LDI r20, DISP_VAL
    LDI r7, 0
    STORE r20, r7
    LDI r20, ACCUM
    STORE r20, r7
    LDI r20, OPER
    STORE r20, r7
    LDI r20, STATE
    STORE r20, r7
    LDI r20, NEW_ENTRY
    STORE r20, r7
    JMP draw_ui

; ── DRAW UI ────────────────────────────────────────
draw_ui:
    LDI r13, 1

    ; Redraw background
    LDI r7, 0x1A1A2E
    FILL r7

    ; ── Display area ──
    LDI r13, 20
    LDI r7, 20
    LDI r10, 216
    LDI r4, 40
    LDI r11, 0x0F3460
    RECTF r13, r7, r10, r4, r11

    ; Convert display value to string
    LDI r20, DISP_VAL
    LOAD r11, r20
    LDI r20, TXT_BUF
    CALL num_to_str

    ; Render display text (right-aligned at x=220, y=32)
    LDI r13, 220
    LDI r7, 32
    LDI r10, TXT_BUF
    TEXT r13, r7, r10

    ; ── Draw buttons ──
    ; Row 0: C(1) /(2) *(3) -(4)
    LDI r13, 20
    LDI r7, 70
    LDI r10, 48
    LDI r4, 38
    LDI r11, 0xE74C3C
    RECTF r13, r7, r10, r4, r11
    ; "C" label
    LDI r20, TXT_BUF
    LDI r7, 67
    STORE r20, r7
    LDI r7, 0
    ADD r20, r13
    STORE r20, r7
    LDI r13, 40
    LDI r7, 82
    LDI r10, TXT_BUF
    TEXT r13, r7, r10

    ; / button (orange)
    LDI r13, 72
    LDI r7, 70
    LDI r11, 0xFF8800
    RECTF r13, r7, r10, r4, r11
    LDI r20, TXT_BUF
    LDI r7, 47
    STORE r20, r7
    LDI r7, 0
    ADD r20, r13
    STORE r20, r7
    LDI r13, 92
    LDI r7, 82
    LDI r10, TXT_BUF
    TEXT r13, r7, r10

    ; * button (orange)
    LDI r13, 124
    LDI r7, 70
    RECTF r13, r7, r10, r4, r11
    LDI r20, TXT_BUF
    LDI r7, 42
    STORE r20, r7
    LDI r7, 0
    ADD r20, r13
    STORE r20, r7
    LDI r13, 144
    LDI r7, 82
    LDI r10, TXT_BUF
    TEXT r13, r7, r10

    ; - button (orange)
    LDI r13, 176
    LDI r7, 70
    RECTF r13, r7, r10, r4, r11
    LDI r20, TXT_BUF
    LDI r7, 45
    STORE r20, r7
    LDI r7, 0
    ADD r20, r13
    STORE r20, r7
    LDI r13, 196
    LDI r7, 82
    LDI r10, TXT_BUF
    TEXT r13, r7, r10

    ; Row 1: 7(5) 8(6) 9(7) +(8)
    LDI r13, 20
    LDI r7, 112
    LDI r10, 48
    LDI r4, 38
    LDI r11, 0x2C3E50
    RECTF r13, r7, r10, r4, r11
    ; "7"
    LDI r20, TXT_BUF
    LDI r7, 55
    STORE r20, r7
    LDI r7, 0
    ADD r20, r13
    STORE r20, r7
    LDI r13, 40
    LDI r7, 124
    LDI r10, TXT_BUF
    TEXT r13, r7, r10

    LDI r13, 72
    LDI r7, 112
    RECTF r13, r7, r10, r4, r11
    LDI r20, TXT_BUF
    LDI r7, 56
    STORE r20, r7
    LDI r7, 0
    ADD r20, r13
    STORE r20, r7
    LDI r13, 92
    LDI r7, 124
    LDI r10, TXT_BUF
    TEXT r13, r7, r10

    LDI r13, 124
    LDI r7, 112
    RECTF r13, r7, r10, r4, r11
    LDI r20, TXT_BUF
    LDI r7, 57
    STORE r20, r7
    LDI r7, 0
    ADD r20, r13
    STORE r20, r7
    LDI r13, 144
    LDI r7, 124
    LDI r10, TXT_BUF
    TEXT r13, r7, r10

    ; + button (green)
    LDI r13, 176
    LDI r7, 112
    LDI r11, 0x27AE60
    RECTF r13, r7, r10, r4, r11
    LDI r20, TXT_BUF
    LDI r7, 43
    STORE r20, r7
    LDI r7, 0
    ADD r20, r13
    STORE r20, r7
    LDI r13, 196
    LDI r7, 124
    LDI r10, TXT_BUF
    TEXT r13, r7, r10

    ; Row 2: 4(9) 5(10) 6(11) =(12)
    LDI r13, 20
    LDI r7, 154
    LDI r10, 48
    LDI r4, 38
    LDI r11, 0x2C3E50
    RECTF r13, r7, r10, r4, r11
    LDI r20, TXT_BUF
    LDI r7, 52
    STORE r20, r7
    LDI r7, 0
    ADD r20, r13
    STORE r20, r7
    LDI r13, 40
    LDI r7, 166
    LDI r10, TXT_BUF
    TEXT r13, r7, r10

    LDI r13, 72
    LDI r7, 154
    RECTF r13, r7, r10, r4, r11
    LDI r20, TXT_BUF
    LDI r7, 53
    STORE r20, r7
    LDI r7, 0
    ADD r20, r13
    STORE r20, r7
    LDI r13, 92
    LDI r7, 166
    LDI r10, TXT_BUF
    TEXT r13, r7, r10

    LDI r13, 124
    LDI r7, 154
    RECTF r13, r7, r10, r4, r11
    LDI r20, TXT_BUF
    LDI r7, 54
    STORE r20, r7
    LDI r7, 0
    ADD r20, r13
    STORE r20, r7
    LDI r13, 144
    LDI r7, 166
    LDI r10, TXT_BUF
    TEXT r13, r7, r10

    ; = button (green)
    LDI r13, 176
    LDI r7, 154
    LDI r11, 0x27AE60
    RECTF r13, r7, r10, r4, r11
    LDI r20, TXT_BUF
    LDI r7, 61
    STORE r20, r7
    LDI r7, 0
    ADD r20, r13
    STORE r20, r7
    LDI r13, 196
    LDI r7, 166
    LDI r10, TXT_BUF
    TEXT r13, r7, r10

    ; Row 3: 1(13) 2(14) 3(15) (empty)
    LDI r13, 20
    LDI r7, 196
    LDI r10, 48
    LDI r4, 38
    LDI r11, 0x2C3E50
    RECTF r13, r7, r10, r4, r11
    LDI r20, TXT_BUF
    LDI r7, 49
    STORE r20, r7
    LDI r7, 0
    ADD r20, r13
    STORE r20, r7
    LDI r13, 40
    LDI r7, 208
    LDI r10, TXT_BUF
    TEXT r13, r7, r10

    LDI r13, 72
    LDI r7, 196
    RECTF r13, r7, r10, r4, r11
    LDI r20, TXT_BUF
    LDI r7, 50
    STORE r20, r7
    LDI r7, 0
    ADD r20, r13
    STORE r20, r7
    LDI r13, 92
    LDI r7, 208
    LDI r10, TXT_BUF
    TEXT r13, r7, r10

    LDI r13, 124
    LDI r7, 196
    RECTF r13, r7, r10, r4, r11
    LDI r20, TXT_BUF
    LDI r7, 51
    STORE r20, r7
    LDI r7, 0
    ADD r20, r13
    STORE r20, r7
    LDI r13, 144
    LDI r7, 208
    LDI r10, TXT_BUF
    TEXT r13, r7, r10

    ; Row 4: 0(16, wide) .(17) (empty)
    LDI r13, 20
    LDI r7, 238
    LDI r10, 100
    LDI r4, 16
    LDI r11, 0x2C3E50
    RECTF r13, r7, r10, r4, r11
    LDI r20, TXT_BUF
    LDI r7, 48
    STORE r20, r7
    LDI r7, 0
    ADD r20, r13
    STORE r20, r7
    LDI r13, 60
    LDI r7, 242
    LDI r10, TXT_BUF
    TEXT r13, r7, r10

    LDI r13, 124
    LDI r7, 238
    LDI r10, 48
    LDI r4, 16
    LDI r11, 0x2C3E50
    RECTF r13, r7, r10, r4, r11
    LDI r20, TXT_BUF
    LDI r7, 46
    STORE r20, r7
    LDI r7, 0
    ADD r20, r13
    STORE r20, r7
    LDI r13, 144
    LDI r7, 242
    LDI r10, TXT_BUF
    TEXT r13, r7, r10

    ; ── Title ──
    LDI r20, TXT_BUF
    LDI r7, 71
    STORE r20, r7
    LDI r7, 85
    ADD r20, r13
    STORE r20, r7
    LDI r7, 73
    ADD r20, r13
    STORE r20, r7
    LDI r7, 32
    ADD r20, r13
    STORE r20, r7
    LDI r7, 67
    ADD r20, r13
    STORE r20, r7
    LDI r7, 65
    ADD r20, r13
    STORE r20, r7
    LDI r7, 76
    ADD r20, r13
    STORE r20, r7
    LDI r7, 0
    ADD r20, r13
    STORE r20, r7
    LDI r13, 80
    LDI r7, 5
    LDI r10, TXT_BUF
    TEXT r13, r7, r10

do_frame:
    FRAME
    JMP main_loop

; ── num_to_str subroutine ──────────────────────────
; Input:  r11 = number, r20 = buffer address
; Output: null-terminated string at r20, r20 advanced
; Clobbers: r2, r7, r10, r4, r21, r22
; Uses RAM: DIG_BUF(0x600), DIG_COUNT(0x620), DIG_QUOT(0x624), DIG_PTR(0x628)
num_to_str:
    LDI r13, 1
    CMPI r11, 0
    JNZ r2, nts_loop1

    ; Handle zero
    LDI r7, 48
    STORE r20, r7
    ADD r20, r13
    LDI r7, 0
    STORE r20, r7
    RET

nts_loop1:
    ; Init reversed buffer
    LDI r22, DIG_BUF
    LDI r7, DIG_PTR
    STORE r7, r22
    LDI r21, 0
    LDI r7, DIG_COUNT
    STORE r7, r21

nts_loop2:
    CMPI r11, 0
    JZ r2, nts_rev1

    ; r10 = r11 / 10
    LDI r10, 0
    ADD r10, r11
    LDI r4, 10
    DIV r10, r4
    LDI r7, DIG_QUOT
    STORE r7, r10

    ; r11 = r11 - r10*10 (remainder)
    LDI r7, 0
    ADD r7, r10
    MUL r7, r4
    SUB r11, r7
    ; Convert to ASCII
    LDI r7, 48
    ADD r11, r7

    ; Store in reversed buffer
    LDI r7, DIG_PTR
    LOAD r22, r7
    STORE r22, r11
    ADD r22, r13
    LDI r7, DIG_PTR
    STORE r7, r22

    ; Increment count
    LDI r7, DIG_COUNT
    LOAD r21, r7
    ADD r21, r13
    LDI r7, DIG_COUNT
    STORE r7, r21

    ; r11 = quotient
    LDI r7, DIG_QUOT
    LOAD r11, r7
    JMP nts_loop2

nts_rev1:
    ; Reverse digits into output buffer
    LDI r7, DIG_COUNT
    LOAD r21, r7
    LDI r22, DIG_BUF

nts_rev2:
    CMPI r21, 0
    JZ r2, nts_end
    SUB r21, r13
    ; Load digit from reversed buffer
    LDI r7, 0
    ADD r7, r22
    ADD r7, r21
    LOAD r7, r7
    ; Store to output buffer
    STORE r20, r7
    ADD r20, r13
    JMP nts_rev2

nts_end:
    LDI r7, 0
    STORE r20, r7
    LDI r13, 1
    RET
