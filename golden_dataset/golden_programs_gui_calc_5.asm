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
;   r12  = constant 1 (reloaded as needed)
;   r1  = scratch
;   r7  = scratch
;   r2  = scratch
;   r5  = scratch (colors, values)
;   r15  = scratch
;   r11 = mouse X from MOUSEQ
;   r8 = mouse Y from MOUSEQ
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
    LDI r12, 1

; Display value = 0
    LDI r20, DISP_VAL
    LDI r1, 0
    STORE r20, r1

; Accumulator = 0
    LDI r20, ACCUM
    STORE r20, r1

; Operator = none (0)
    LDI r20, OPER
    STORE r20, r1

; State = entering first number (0)
    LDI r20, STATE
    STORE r20, r1

; New entry = no (0)
    LDI r20, NEW_ENTRY
    STORE r20, r1

; Tick = 0
    LDI r20, TICK
    STORE r20, r1

; Fill screen dark
    LDI r1, 0x1A1A2E
    FILL r1

; ── Register all button hit regions ──
; Button grid: 4 cols x 5 rows
; Each button: 48x38, gap=4, total cell=52
; Start: x=20, y=70

; Row 0: C  /  *  -
    LDI r12, 20
    LDI r1, 70
    LDI r7, 48
    LDI r2, 38
    HITSET r12, r1, r7, r2, 1

    LDI r12, 72
    HITSET r12, r1, r7, r2, 2

    LDI r12, 124
    HITSET r12, r1, r7, r2, 3

    LDI r12, 176
    HITSET r12, r1, r7, r2, 4

; Row 1: 7  8  9  +
    LDI r12, 20
    LDI r1, 112
    HITSET r12, r1, r7, r2, 5

    LDI r12, 72
    HITSET r12, r1, r7, r2, 6

    LDI r12, 124
    HITSET r12, r1, r7, r2, 7

    LDI r12, 176
    HITSET r12, r1, r7, r2, 8

; Row 2: 4  5  6  =
    LDI r12, 20
    LDI r1, 154
    HITSET r12, r1, r7, r2, 9

    LDI r12, 72
    HITSET r12, r1, r7, r2, 10

    LDI r12, 124
    HITSET r12, r1, r7, r2, 11

    LDI r12, 176
    HITSET r12, r1, r7, r2, 12

; Row 3: 1  2  3  (empty)
    LDI r12, 20
    LDI r1, 196
    HITSET r12, r1, r7, r2, 13

    LDI r12, 72
    HITSET r12, r1, r7, r2, 14

    LDI r12, 124
    HITSET r12, r1, r7, r2, 15

; Row 4: 0 (wide)  .  (empty)
; Button 0 spans 2 cols: 100x38
    LDI r12, 20
    LDI r1, 238
    LDI r7, 100
    LDI r2, 16
    HITSET r12, r1, r7, r2, 16

    LDI r12, 124
    LDI r7, 48
    LDI r2, 16
    HITSET r12, r1, r7, r2, 17

; ── MAIN LOOP ─────────────────────────────────────
main_loop:
    LDI r12, 1

; Increment tick
    LDI r20, TICK
    LOAD r1, r20
    ADD r1, r12
    STORE r20, r1

; Read mouse
    MOUSEQ r11

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
    LDI r12, 1
    LDI r20, NEW_ENTRY
    LOAD r1, r20
    CMPI r1, 1
    JZ r6, do_0_clear
    JMP do_0_append
do_0_clear:
    LDI r20, DISP_VAL
    LDI r1, 0
    STORE r20, r1
    LDI r20, NEW_ENTRY
    STORE r20, r1
do_0_append:
    LDI r20, DISP_VAL
    LOAD r1, r20
    LDI r7, 10
    MUL r1, r7
    STORE r20, r1
    JMP draw_ui

btn_1:
    LDI r12, 1
    CALL enter_digit_start
    LDI r1, 1
    JMP enter_digit_finish

btn_2:
    LDI r12, 1
    CALL enter_digit_start
    LDI r1, 2
    JMP enter_digit_finish

btn_3:
    LDI r12, 1
    CALL enter_digit_start
    LDI r1, 3
    JMP enter_digit_finish

btn_4:
    LDI r12, 1
    CALL enter_digit_start
    LDI r1, 4
    JMP enter_digit_finish

btn_5:
    LDI r12, 1
    CALL enter_digit_start
    LDI r1, 5
    JMP enter_digit_finish

btn_6:
    LDI r12, 1
    CALL enter_digit_start
    LDI r1, 6
    JMP enter_digit_finish

btn_7:
    LDI r12, 1
    CALL enter_digit_start
    LDI r1, 7
    JMP enter_digit_finish

btn_8:
    LDI r12, 1
    CALL enter_digit_start
    LDI r1, 8
    JMP enter_digit_finish

btn_9:
    LDI r12, 1
    CALL enter_digit_start
    LDI r1, 9
    JMP enter_digit_finish

btn_dot:
    ; For simplicity, just append a visual indicator -- skip real decimal
    ; In a full implementation we would track decimal position
    JMP draw_ui

; enter_digit_start: if new_entry, clear display value
enter_digit_start:
    LDI r12, 1
    LDI r20, NEW_ENTRY
    LOAD r1, r20
    CMPI r1, 1
    JZ r6, eds_clear
    RET
eds_clear:
    LDI r20, DISP_VAL
    LDI r1, 0
    STORE r20, r1
    LDI r20, NEW_ENTRY
    STORE r20, r1
    LDI r12, 1
    RET

; enter_digit_finish: r1=digit value, multiply display by 10 and add digit
enter_digit_finish:
    LDI r12, 1
    LDI r20, DISP_VAL
    LOAD r7, r20
    LDI r2, 10
    MUL r7, r2
    ADD r7, r1
    STORE r20, r7
    JMP draw_ui

; ── Operator buttons ───────────────────────────────
btn_add:
    LDI r12, 1
    LDI r20, OPER
    LDI r1, 1
    STORE r20, r1
    CALL save_accum_and_set_state
    JMP draw_ui

btn_sub:
    LDI r12, 1
    LDI r20, OPER
    LDI r1, 2
    STORE r20, r1
    CALL save_accum_and_set_state
    JMP draw_ui

btn_mul:
    LDI r12, 1
    LDI r20, OPER
    LDI r1, 3
    STORE r20, r1
    CALL save_accum_and_set_state
    JMP draw_ui

btn_div:
    LDI r12, 1
    LDI r20, OPER
    LDI r1, 4
    STORE r20, r1
    CALL save_accum_and_set_state
    JMP draw_ui

; save_accum_and_set_state: save display to accumulator, set state=2, new_entry=1
save_accum_and_set_state:
    LDI r12, 1
    ; If state is 2 (entering second), compute pending first
    LDI r20, STATE
    LOAD r1, r20
    CMPI r1, 2
    JNZ r6, sas_set
    ; Compute pending operation
    CALL do_compute
sas_set:
    ; Save display to accumulator
    LDI r20, DISP_VAL
    LOAD r1, r20
    LDI r20, ACCUM
    STORE r20, r1
    ; Set state = 2 (entering second number)
    LDI r20, STATE
    LDI r1, 2
    STORE r20, r1
    ; Set new_entry = 1
    LDI r20, NEW_ENTRY
    LDI r1, 1
    STORE r20, r1
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
    LOAD r1, r20
    CMPI r1, 0
    JZ r6, dc_done
    ; Load accumulator and display
    LDI r20, ACCUM
    LOAD r7, r20
    LDI r20, DISP_VAL
    LOAD r2, r20
    ; Branch on operator
    CMPI r1, 1
    JZ r6, dc_add
    CMPI r1, 2
    JZ r6, dc_sub
    CMPI r1, 3
    JZ r6, dc_mul
    CMPI r1, 4
    JZ r6, dc_div
    JMP dc_done

dc_add:
    ADD r7, r2
    JMP dc_store

dc_sub:
    SUB r7, r2
    JMP dc_store

dc_mul:
    MUL r7, r2
    JMP dc_store

dc_div:
    CMPI r2, 0
    JZ r6, dc_done
    DIV r7, r2

dc_store:
    LDI r20, DISP_VAL
    STORE r20, r7
    ; Clear operator
    LDI r20, OPER
    LDI r1, 0
    STORE r20, r1

dc_done:
    ; Set state=0, new_entry=1
    LDI r20, STATE
    LDI r1, 0
    STORE r20, r1
    LDI r20, NEW_ENTRY
    LDI r1, 1
    STORE r20, r1
    LDI r12, 1
    RET

; ── Clear button ───────────────────────────────────
btn_clear:
    LDI r12, 1
    LDI r20, DISP_VAL
    LDI r1, 0
    STORE r20, r1
    LDI r20, ACCUM
    STORE r20, r1
    LDI r20, OPER
    STORE r20, r1
    LDI r20, STATE
    STORE r20, r1
    LDI r20, NEW_ENTRY
    STORE r20, r1
    JMP draw_ui

; ── DRAW UI ────────────────────────────────────────
draw_ui:
    LDI r12, 1

    ; Redraw background
    LDI r1, 0x1A1A2E
    FILL r1

    ; ── Display area ──
    LDI r12, 20
    LDI r1, 20
    LDI r7, 216
    LDI r2, 40
    LDI r5, 0x0F3460
    RECTF r12, r1, r7, r2, r5

    ; Convert display value to string
    LDI r20, DISP_VAL
    LOAD r5, r20
    LDI r20, TXT_BUF
    CALL num_to_str

    ; Render display text (right-aligned at x=220, y=32)
    LDI r12, 220
    LDI r1, 32
    LDI r7, TXT_BUF
    TEXT r12, r1, r7

    ; ── Draw buttons ──
    ; Row 0: C(1) /(2) *(3) -(4)
    LDI r12, 20
    LDI r1, 70
    LDI r7, 48
    LDI r2, 38
    LDI r5, 0xE74C3C
    RECTF r12, r1, r7, r2, r5
    ; "C" label
    LDI r20, TXT_BUF
    LDI r1, 67
    STORE r20, r1
    LDI r1, 0
    ADD r20, r12
    STORE r20, r1
    LDI r12, 40
    LDI r1, 82
    LDI r7, TXT_BUF
    TEXT r12, r1, r7

    ; / button (orange)
    LDI r12, 72
    LDI r1, 70
    LDI r5, 0xFF8800
    RECTF r12, r1, r7, r2, r5
    LDI r20, TXT_BUF
    LDI r1, 47
    STORE r20, r1
    LDI r1, 0
    ADD r20, r12
    STORE r20, r1
    LDI r12, 92
    LDI r1, 82
    LDI r7, TXT_BUF
    TEXT r12, r1, r7

    ; * button (orange)
    LDI r12, 124
    LDI r1, 70
    RECTF r12, r1, r7, r2, r5
    LDI r20, TXT_BUF
    LDI r1, 42
    STORE r20, r1
    LDI r1, 0
    ADD r20, r12
    STORE r20, r1
    LDI r12, 144
    LDI r1, 82
    LDI r7, TXT_BUF
    TEXT r12, r1, r7

    ; - button (orange)
    LDI r12, 176
    LDI r1, 70
    RECTF r12, r1, r7, r2, r5
    LDI r20, TXT_BUF
    LDI r1, 45
    STORE r20, r1
    LDI r1, 0
    ADD r20, r12
    STORE r20, r1
    LDI r12, 196
    LDI r1, 82
    LDI r7, TXT_BUF
    TEXT r12, r1, r7

    ; Row 1: 7(5) 8(6) 9(7) +(8)
    LDI r12, 20
    LDI r1, 112
    LDI r7, 48
    LDI r2, 38
    LDI r5, 0x2C3E50
    RECTF r12, r1, r7, r2, r5
    ; "7"
    LDI r20, TXT_BUF
    LDI r1, 55
    STORE r20, r1
    LDI r1, 0
    ADD r20, r12
    STORE r20, r1
    LDI r12, 40
    LDI r1, 124
    LDI r7, TXT_BUF
    TEXT r12, r1, r7

    LDI r12, 72
    LDI r1, 112
    RECTF r12, r1, r7, r2, r5
    LDI r20, TXT_BUF
    LDI r1, 56
    STORE r20, r1
    LDI r1, 0
    ADD r20, r12
    STORE r20, r1
    LDI r12, 92
    LDI r1, 124
    LDI r7, TXT_BUF
    TEXT r12, r1, r7

    LDI r12, 124
    LDI r1, 112
    RECTF r12, r1, r7, r2, r5
    LDI r20, TXT_BUF
    LDI r1, 57
    STORE r20, r1
    LDI r1, 0
    ADD r20, r12
    STORE r20, r1
    LDI r12, 144
    LDI r1, 124
    LDI r7, TXT_BUF
    TEXT r12, r1, r7

    ; + button (green)
    LDI r12, 176
    LDI r1, 112
    LDI r5, 0x27AE60
    RECTF r12, r1, r7, r2, r5
    LDI r20, TXT_BUF
    LDI r1, 43
    STORE r20, r1
    LDI r1, 0
    ADD r20, r12
    STORE r20, r1
    LDI r12, 196
    LDI r1, 124
    LDI r7, TXT_BUF
    TEXT r12, r1, r7

    ; Row 2: 4(9) 5(10) 6(11) =(12)
    LDI r12, 20
    LDI r1, 154
    LDI r7, 48
    LDI r2, 38
    LDI r5, 0x2C3E50
    RECTF r12, r1, r7, r2, r5
    LDI r20, TXT_BUF
    LDI r1, 52
    STORE r20, r1
    LDI r1, 0
    ADD r20, r12
    STORE r20, r1
    LDI r12, 40
    LDI r1, 166
    LDI r7, TXT_BUF
    TEXT r12, r1, r7

    LDI r12, 72
    LDI r1, 154
    RECTF r12, r1, r7, r2, r5
    LDI r20, TXT_BUF
    LDI r1, 53
    STORE r20, r1
    LDI r1, 0
    ADD r20, r12
    STORE r20, r1
    LDI r12, 92
    LDI r1, 166
    LDI r7, TXT_BUF
    TEXT r12, r1, r7

    LDI r12, 124
    LDI r1, 154
    RECTF r12, r1, r7, r2, r5
    LDI r20, TXT_BUF
    LDI r1, 54
    STORE r20, r1
    LDI r1, 0
    ADD r20, r12
    STORE r20, r1
    LDI r12, 144
    LDI r1, 166
    LDI r7, TXT_BUF
    TEXT r12, r1, r7

    ; = button (green)
    LDI r12, 176
    LDI r1, 154
    LDI r5, 0x27AE60
    RECTF r12, r1, r7, r2, r5
    LDI r20, TXT_BUF
    LDI r1, 61
    STORE r20, r1
    LDI r1, 0
    ADD r20, r12
    STORE r20, r1
    LDI r12, 196
    LDI r1, 166
    LDI r7, TXT_BUF
    TEXT r12, r1, r7

    ; Row 3: 1(13) 2(14) 3(15) (empty)
    LDI r12, 20
    LDI r1, 196
    LDI r7, 48
    LDI r2, 38
    LDI r5, 0x2C3E50
    RECTF r12, r1, r7, r2, r5
    LDI r20, TXT_BUF
    LDI r1, 49
    STORE r20, r1
    LDI r1, 0
    ADD r20, r12
    STORE r20, r1
    LDI r12, 40
    LDI r1, 208
    LDI r7, TXT_BUF
    TEXT r12, r1, r7

    LDI r12, 72
    LDI r1, 196
    RECTF r12, r1, r7, r2, r5
    LDI r20, TXT_BUF
    LDI r1, 50
    STORE r20, r1
    LDI r1, 0
    ADD r20, r12
    STORE r20, r1
    LDI r12, 92
    LDI r1, 208
    LDI r7, TXT_BUF
    TEXT r12, r1, r7

    LDI r12, 124
    LDI r1, 196
    RECTF r12, r1, r7, r2, r5
    LDI r20, TXT_BUF
    LDI r1, 51
    STORE r20, r1
    LDI r1, 0
    ADD r20, r12
    STORE r20, r1
    LDI r12, 144
    LDI r1, 208
    LDI r7, TXT_BUF
    TEXT r12, r1, r7

    ; Row 4: 0(16, wide) .(17) (empty)
    LDI r12, 20
    LDI r1, 238
    LDI r7, 100
    LDI r2, 16
    LDI r5, 0x2C3E50
    RECTF r12, r1, r7, r2, r5
    LDI r20, TXT_BUF
    LDI r1, 48
    STORE r20, r1
    LDI r1, 0
    ADD r20, r12
    STORE r20, r1
    LDI r12, 60
    LDI r1, 242
    LDI r7, TXT_BUF
    TEXT r12, r1, r7

    LDI r12, 124
    LDI r1, 238
    LDI r7, 48
    LDI r2, 16
    LDI r5, 0x2C3E50
    RECTF r12, r1, r7, r2, r5
    LDI r20, TXT_BUF
    LDI r1, 46
    STORE r20, r1
    LDI r1, 0
    ADD r20, r12
    STORE r20, r1
    LDI r12, 144
    LDI r1, 242
    LDI r7, TXT_BUF
    TEXT r12, r1, r7

    ; ── Title ──
    LDI r20, TXT_BUF
    LDI r1, 71
    STORE r20, r1
    LDI r1, 85
    ADD r20, r12
    STORE r20, r1
    LDI r1, 73
    ADD r20, r12
    STORE r20, r1
    LDI r1, 32
    ADD r20, r12
    STORE r20, r1
    LDI r1, 67
    ADD r20, r12
    STORE r20, r1
    LDI r1, 65
    ADD r20, r12
    STORE r20, r1
    LDI r1, 76
    ADD r20, r12
    STORE r20, r1
    LDI r1, 0
    ADD r20, r12
    STORE r20, r1
    LDI r12, 80
    LDI r1, 5
    LDI r7, TXT_BUF
    TEXT r12, r1, r7

do_frame:
    FRAME
    JMP main_loop

; ── num_to_str subroutine ──────────────────────────
; Input:  r5 = number, r20 = buffer address
; Output: null-terminated string at r20, r20 advanced
; Clobbers: r6, r1, r7, r2, r21, r22
; Uses RAM: DIG_BUF(0x600), DIG_COUNT(0x620), DIG_QUOT(0x624), DIG_PTR(0x628)
num_to_str:
    LDI r12, 1
    CMPI r5, 0
    JNZ r6, nts_loop1

    ; Handle zero
    LDI r1, 48
    STORE r20, r1
    ADD r20, r12
    LDI r1, 0
    STORE r20, r1
    RET

nts_loop1:
    ; Init reversed buffer
    LDI r22, DIG_BUF
    LDI r1, DIG_PTR
    STORE r1, r22
    LDI r21, 0
    LDI r1, DIG_COUNT
    STORE r1, r21

nts_loop2:
    CMPI r5, 0
    JZ r6, nts_rev1

    ; r7 = r5 / 10
    LDI r7, 0
    ADD r7, r5
    LDI r2, 10
    DIV r7, r2
    LDI r1, DIG_QUOT
    STORE r1, r7

    ; r5 = r5 - r7*10 (remainder)
    LDI r1, 0
    ADD r1, r7
    MUL r1, r2
    SUB r5, r1
    ; Convert to ASCII
    LDI r1, 48
    ADD r5, r1

    ; Store in reversed buffer
    LDI r1, DIG_PTR
    LOAD r22, r1
    STORE r22, r5
    ADD r22, r12
    LDI r1, DIG_PTR
    STORE r1, r22

    ; Increment count
    LDI r1, DIG_COUNT
    LOAD r21, r1
    ADD r21, r12
    LDI r1, DIG_COUNT
    STORE r1, r21

    ; r5 = quotient
    LDI r1, DIG_QUOT
    LOAD r5, r1
    JMP nts_loop2

nts_rev1:
    ; Reverse digits into output buffer
    LDI r1, DIG_COUNT
    LOAD r21, r1
    LDI r22, DIG_BUF

nts_rev2:
    CMPI r21, 0
    JZ r6, nts_end
    SUB r21, r12
    ; Load digit from reversed buffer
    LDI r1, 0
    ADD r1, r22
    ADD r1, r21
    LOAD r1, r1
    ; Store to output buffer
    STORE r20, r1
    ADD r20, r12
    JMP nts_rev2

nts_end:
    LDI r1, 0
    STORE r20, r1
    LDI r12, 1
    RET
