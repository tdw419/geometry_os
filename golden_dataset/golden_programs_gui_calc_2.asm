; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

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
;   r8  = constant 1 (reloaded as needed)
;   r13  = scratch
;   r2  = scratch
;   r10  = scratch
;   r9  = scratch (colors, values)
;   r1  = scratch
;   r11 = mouse X from MOUSEQ
;   r12 = mouse Y from MOUSEQ
;   r5 = hit query result
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
    LDI r8, 1

; Display value = 0
    LDI r20, DISP_VAL
    LDI r13, 0
    STORE r20, r13

; Accumulator = 0
    LDI r20, ACCUM
    STORE r20, r13

; Operator = none (0)
    LDI r20, OPER
    STORE r20, r13

; State = entering first number (0)
    LDI r20, STATE
    STORE r20, r13

; New entry = no (0)
    LDI r20, NEW_ENTRY
    STORE r20, r13

; Tick = 0
    LDI r20, TICK
    STORE r20, r13

; Fill screen dark
    LDI r13, 0x1A1A2E
    FILL r13

; ── Register all button hit regions ──
; Button grid: 4 cols x 5 rows
; Each button: 48x38, gap=4, total cell=52
; Start: x=20, y=70

; Row 0: C  /  *  -
    LDI r8, 20
    LDI r13, 70
    LDI r2, 48
    LDI r10, 38
    HITSET r8, r13, r2, r10, 1

    LDI r8, 72
    HITSET r8, r13, r2, r10, 2

    LDI r8, 124
    HITSET r8, r13, r2, r10, 3

    LDI r8, 176
    HITSET r8, r13, r2, r10, 4

; Row 1: 7  8  9  +
    LDI r8, 20
    LDI r13, 112
    HITSET r8, r13, r2, r10, 5

    LDI r8, 72
    HITSET r8, r13, r2, r10, 6

    LDI r8, 124
    HITSET r8, r13, r2, r10, 7

    LDI r8, 176
    HITSET r8, r13, r2, r10, 8

; Row 2: 4  5  6  =
    LDI r8, 20
    LDI r13, 154
    HITSET r8, r13, r2, r10, 9

    LDI r8, 72
    HITSET r8, r13, r2, r10, 10

    LDI r8, 124
    HITSET r8, r13, r2, r10, 11

    LDI r8, 176
    HITSET r8, r13, r2, r10, 12

; Row 3: 1  2  3  (empty)
    LDI r8, 20
    LDI r13, 196
    HITSET r8, r13, r2, r10, 13

    LDI r8, 72
    HITSET r8, r13, r2, r10, 14

    LDI r8, 124
    HITSET r8, r13, r2, r10, 15

; Row 4: 0 (wide)  .  (empty)
; Button 0 spans 2 cols: 100x38
    LDI r8, 20
    LDI r13, 238
    LDI r2, 100
    LDI r10, 16
    HITSET r8, r13, r2, r10, 16

    LDI r8, 124
    LDI r2, 48
    LDI r10, 16
    HITSET r8, r13, r2, r10, 17

; ── MAIN LOOP ─────────────────────────────────────
main_loop:
    LDI r8, 1

; Increment tick
    LDI r20, TICK
    LOAD r13, r20
    ADD r13, r8
    STORE r20, r13

; Read mouse
    MOUSEQ r11

; Query hit regions
    HITQ r5
    JZ r5, draw_ui

; Handle button clicks
    CMPI r5, 1
    JZ r6, btn_clear

    CMPI r5, 2
    JZ r6, btn_div

    CMPI r5, 3
    JZ r6, btn_mul

    CMPI r5, 4
    JZ r6, btn_sub

    CMPI r5, 5
    JZ r6, btn_7

    CMPI r5, 6
    JZ r6, btn_8

    CMPI r5, 7
    JZ r6, btn_9

    CMPI r5, 8
    JZ r6, btn_add

    CMPI r5, 9
    JZ r6, btn_4

    CMPI r5, 10
    JZ r6, btn_5

    CMPI r5, 11
    JZ r6, btn_6

    CMPI r5, 12
    JZ r6, btn_eq

    CMPI r5, 13
    JZ r6, btn_1

    CMPI r5, 14
    JZ r6, btn_2

    CMPI r5, 15
    JZ r6, btn_3

    CMPI r5, 16
    JZ r6, btn_0

    CMPI r5, 17
    JZ r6, btn_dot

    JMP draw_ui

; ── Digit buttons ──────────────────────────────────
; Each digit: if new_entry, clear display first, then append digit
btn_0:
    LDI r8, 1
    LDI r20, NEW_ENTRY
    LOAD r13, r20
    CMPI r13, 1
    JZ r6, do_0_clear
    JMP do_0_append
do_0_clear:
    LDI r20, DISP_VAL
    LDI r13, 0
    STORE r20, r13
    LDI r20, NEW_ENTRY
    STORE r20, r13
do_0_append:
    LDI r20, DISP_VAL
    LOAD r13, r20
    LDI r2, 10
    MUL r13, r2
    STORE r20, r13
    JMP draw_ui

btn_1:
    LDI r8, 1
    CALL enter_digit_start
    LDI r13, 1
    JMP enter_digit_finish

btn_2:
    LDI r8, 1
    CALL enter_digit_start
    LDI r13, 2
    JMP enter_digit_finish

btn_3:
    LDI r8, 1
    CALL enter_digit_start
    LDI r13, 3
    JMP enter_digit_finish

btn_4:
    LDI r8, 1
    CALL enter_digit_start
    LDI r13, 4
    JMP enter_digit_finish

btn_5:
    LDI r8, 1
    CALL enter_digit_start
    LDI r13, 5
    JMP enter_digit_finish

btn_6:
    LDI r8, 1
    CALL enter_digit_start
    LDI r13, 6
    JMP enter_digit_finish

btn_7:
    LDI r8, 1
    CALL enter_digit_start
    LDI r13, 7
    JMP enter_digit_finish

btn_8:
    LDI r8, 1
    CALL enter_digit_start
    LDI r13, 8
    JMP enter_digit_finish

btn_9:
    LDI r8, 1
    CALL enter_digit_start
    LDI r13, 9
    JMP enter_digit_finish

btn_dot:
    ; For simplicity, just append a visual indicator -- skip real decimal
    ; In a full implementation we would track decimal position
    JMP draw_ui

; enter_digit_start: if new_entry, clear display value
enter_digit_start:
    LDI r8, 1
    LDI r20, NEW_ENTRY
    LOAD r13, r20
    CMPI r13, 1
    JZ r6, eds_clear
    RET
eds_clear:
    LDI r20, DISP_VAL
    LDI r13, 0
    STORE r20, r13
    LDI r20, NEW_ENTRY
    STORE r20, r13
    LDI r8, 1
    RET

; enter_digit_finish: r13=digit value, multiply display by 10 and add digit
enter_digit_finish:
    LDI r8, 1
    LDI r20, DISP_VAL
    LOAD r2, r20
    LDI r10, 10
    MUL r2, r10
    ADD r2, r13
    STORE r20, r2
    JMP draw_ui

; ── Operator buttons ───────────────────────────────
btn_add:
    LDI r8, 1
    LDI r20, OPER
    LDI r13, 1
    STORE r20, r13
    CALL save_accum_and_set_state
    JMP draw_ui

btn_sub:
    LDI r8, 1
    LDI r20, OPER
    LDI r13, 2
    STORE r20, r13
    CALL save_accum_and_set_state
    JMP draw_ui

btn_mul:
    LDI r8, 1
    LDI r20, OPER
    LDI r13, 3
    STORE r20, r13
    CALL save_accum_and_set_state
    JMP draw_ui

btn_div:
    LDI r8, 1
    LDI r20, OPER
    LDI r13, 4
    STORE r20, r13
    CALL save_accum_and_set_state
    JMP draw_ui

; save_accum_and_set_state: save display to accumulator, set state=2, new_entry=1
save_accum_and_set_state:
    LDI r8, 1
    ; If state is 2 (entering second), compute pending first
    LDI r20, STATE
    LOAD r13, r20
    CMPI r13, 2
    JNZ r6, sas_set
    ; Compute pending operation
    CALL do_compute
sas_set:
    ; Save display to accumulator
    LDI r20, DISP_VAL
    LOAD r13, r20
    LDI r20, ACCUM
    STORE r20, r13
    ; Set state = 2 (entering second number)
    LDI r20, STATE
    LDI r13, 2
    STORE r20, r13
    ; Set new_entry = 1
    LDI r20, NEW_ENTRY
    LDI r13, 1
    STORE r20, r13
    LDI r8, 1
    RET

; ── Equals button ──────────────────────────────────
btn_eq:
    LDI r8, 1
    CALL do_compute
    JMP draw_ui

; do_compute: perform pending operation
; accumulator OP display_val -> display_val
; Then set state=0, new_entry=1
do_compute:
    LDI r8, 1
    ; Check if there is an operator
    LDI r20, OPER
    LOAD r13, r20
    CMPI r13, 0
    JZ r6, dc_done
    ; Load accumulator and display
    LDI r20, ACCUM
    LOAD r2, r20
    LDI r20, DISP_VAL
    LOAD r10, r20
    ; Branch on operator
    CMPI r13, 1
    JZ r6, dc_add
    CMPI r13, 2
    JZ r6, dc_sub
    CMPI r13, 3
    JZ r6, dc_mul
    CMPI r13, 4
    JZ r6, dc_div
    JMP dc_done

dc_add:
    ADD r2, r10
    JMP dc_store

dc_sub:
    SUB r2, r10
    JMP dc_store

dc_mul:
    MUL r2, r10
    JMP dc_store

dc_div:
    CMPI r10, 0
    JZ r6, dc_done
    DIV r2, r10

dc_store:
    LDI r20, DISP_VAL
    STORE r20, r2
    ; Clear operator
    LDI r20, OPER
    LDI r13, 0
    STORE r20, r13

dc_done:
    ; Set state=0, new_entry=1
    LDI r20, STATE
    LDI r13, 0
    STORE r20, r13
    LDI r20, NEW_ENTRY
    LDI r13, 1
    STORE r20, r13
    LDI r8, 1
    RET

; ── Clear button ───────────────────────────────────
btn_clear:
    LDI r8, 1
    LDI r20, DISP_VAL
    LDI r13, 0
    STORE r20, r13
    LDI r20, ACCUM
    STORE r20, r13
    LDI r20, OPER
    STORE r20, r13
    LDI r20, STATE
    STORE r20, r13
    LDI r20, NEW_ENTRY
    STORE r20, r13
    JMP draw_ui

; ── DRAW UI ────────────────────────────────────────
draw_ui:
    LDI r8, 1

    ; Redraw background
    LDI r13, 0x1A1A2E
    FILL r13

    ; ── Display area ──
    LDI r8, 20
    LDI r13, 20
    LDI r2, 216
    LDI r10, 40
    LDI r9, 0x0F3460
    RECTF r8, r13, r2, r10, r9

    ; Convert display value to string
    LDI r20, DISP_VAL
    LOAD r9, r20
    LDI r20, TXT_BUF
    CALL num_to_str

    ; Render display text (right-aligned at x=220, y=32)
    LDI r8, 220
    LDI r13, 32
    LDI r2, TXT_BUF
    TEXT r8, r13, r2

    ; ── Draw buttons ──
    ; Row 0: C(1) /(2) *(3) -(4)
    LDI r8, 20
    LDI r13, 70
    LDI r2, 48
    LDI r10, 38
    LDI r9, 0xE74C3C
    RECTF r8, r13, r2, r10, r9
    ; "C" label
    LDI r20, TXT_BUF
    LDI r13, 67
    STORE r20, r13
    LDI r13, 0
    ADD r20, r8
    STORE r20, r13
    LDI r8, 40
    LDI r13, 82
    LDI r2, TXT_BUF
    TEXT r8, r13, r2

    ; / button (orange)
    LDI r8, 72
    LDI r13, 70
    LDI r9, 0xFF8800
    RECTF r8, r13, r2, r10, r9
    LDI r20, TXT_BUF
    LDI r13, 47
    STORE r20, r13
    LDI r13, 0
    ADD r20, r8
    STORE r20, r13
    LDI r8, 92
    LDI r13, 82
    LDI r2, TXT_BUF
    TEXT r8, r13, r2

    ; * button (orange)
    LDI r8, 124
    LDI r13, 70
    RECTF r8, r13, r2, r10, r9
    LDI r20, TXT_BUF
    LDI r13, 42
    STORE r20, r13
    LDI r13, 0
    ADD r20, r8
    STORE r20, r13
    LDI r8, 144
    LDI r13, 82
    LDI r2, TXT_BUF
    TEXT r8, r13, r2

    ; - button (orange)
    LDI r8, 176
    LDI r13, 70
    RECTF r8, r13, r2, r10, r9
    LDI r20, TXT_BUF
    LDI r13, 45
    STORE r20, r13
    LDI r13, 0
    ADD r20, r8
    STORE r20, r13
    LDI r8, 196
    LDI r13, 82
    LDI r2, TXT_BUF
    TEXT r8, r13, r2

    ; Row 1: 7(5) 8(6) 9(7) +(8)
    LDI r8, 20
    LDI r13, 112
    LDI r2, 48
    LDI r10, 38
    LDI r9, 0x2C3E50
    RECTF r8, r13, r2, r10, r9
    ; "7"
    LDI r20, TXT_BUF
    LDI r13, 55
    STORE r20, r13
    LDI r13, 0
    ADD r20, r8
    STORE r20, r13
    LDI r8, 40
    LDI r13, 124
    LDI r2, TXT_BUF
    TEXT r8, r13, r2

    LDI r8, 72
    LDI r13, 112
    RECTF r8, r13, r2, r10, r9
    LDI r20, TXT_BUF
    LDI r13, 56
    STORE r20, r13
    LDI r13, 0
    ADD r20, r8
    STORE r20, r13
    LDI r8, 92
    LDI r13, 124
    LDI r2, TXT_BUF
    TEXT r8, r13, r2

    LDI r8, 124
    LDI r13, 112
    RECTF r8, r13, r2, r10, r9
    LDI r20, TXT_BUF
    LDI r13, 57
    STORE r20, r13
    LDI r13, 0
    ADD r20, r8
    STORE r20, r13
    LDI r8, 144
    LDI r13, 124
    LDI r2, TXT_BUF
    TEXT r8, r13, r2

    ; + button (green)
    LDI r8, 176
    LDI r13, 112
    LDI r9, 0x27AE60
    RECTF r8, r13, r2, r10, r9
    LDI r20, TXT_BUF
    LDI r13, 43
    STORE r20, r13
    LDI r13, 0
    ADD r20, r8
    STORE r20, r13
    LDI r8, 196
    LDI r13, 124
    LDI r2, TXT_BUF
    TEXT r8, r13, r2

    ; Row 2: 4(9) 5(10) 6(11) =(12)
    LDI r8, 20
    LDI r13, 154
    LDI r2, 48
    LDI r10, 38
    LDI r9, 0x2C3E50
    RECTF r8, r13, r2, r10, r9
    LDI r20, TXT_BUF
    LDI r13, 52
    STORE r20, r13
    LDI r13, 0
    ADD r20, r8
    STORE r20, r13
    LDI r8, 40
    LDI r13, 166
    LDI r2, TXT_BUF
    TEXT r8, r13, r2

    LDI r8, 72
    LDI r13, 154
    RECTF r8, r13, r2, r10, r9
    LDI r20, TXT_BUF
    LDI r13, 53
    STORE r20, r13
    LDI r13, 0
    ADD r20, r8
    STORE r20, r13
    LDI r8, 92
    LDI r13, 166
    LDI r2, TXT_BUF
    TEXT r8, r13, r2

    LDI r8, 124
    LDI r13, 154
    RECTF r8, r13, r2, r10, r9
    LDI r20, TXT_BUF
    LDI r13, 54
    STORE r20, r13
    LDI r13, 0
    ADD r20, r8
    STORE r20, r13
    LDI r8, 144
    LDI r13, 166
    LDI r2, TXT_BUF
    TEXT r8, r13, r2

    ; = button (green)
    LDI r8, 176
    LDI r13, 154
    LDI r9, 0x27AE60
    RECTF r8, r13, r2, r10, r9
    LDI r20, TXT_BUF
    LDI r13, 61
    STORE r20, r13
    LDI r13, 0
    ADD r20, r8
    STORE r20, r13
    LDI r8, 196
    LDI r13, 166
    LDI r2, TXT_BUF
    TEXT r8, r13, r2

    ; Row 3: 1(13) 2(14) 3(15) (empty)
    LDI r8, 20
    LDI r13, 196
    LDI r2, 48
    LDI r10, 38
    LDI r9, 0x2C3E50
    RECTF r8, r13, r2, r10, r9
    LDI r20, TXT_BUF
    LDI r13, 49
    STORE r20, r13
    LDI r13, 0
    ADD r20, r8
    STORE r20, r13
    LDI r8, 40
    LDI r13, 208
    LDI r2, TXT_BUF
    TEXT r8, r13, r2

    LDI r8, 72
    LDI r13, 196
    RECTF r8, r13, r2, r10, r9
    LDI r20, TXT_BUF
    LDI r13, 50
    STORE r20, r13
    LDI r13, 0
    ADD r20, r8
    STORE r20, r13
    LDI r8, 92
    LDI r13, 208
    LDI r2, TXT_BUF
    TEXT r8, r13, r2

    LDI r8, 124
    LDI r13, 196
    RECTF r8, r13, r2, r10, r9
    LDI r20, TXT_BUF
    LDI r13, 51
    STORE r20, r13
    LDI r13, 0
    ADD r20, r8
    STORE r20, r13
    LDI r8, 144
    LDI r13, 208
    LDI r2, TXT_BUF
    TEXT r8, r13, r2

    ; Row 4: 0(16, wide) .(17) (empty)
    LDI r8, 20
    LDI r13, 238
    LDI r2, 100
    LDI r10, 16
    LDI r9, 0x2C3E50
    RECTF r8, r13, r2, r10, r9
    LDI r20, TXT_BUF
    LDI r13, 48
    STORE r20, r13
    LDI r13, 0
    ADD r20, r8
    STORE r20, r13
    LDI r8, 60
    LDI r13, 242
    LDI r2, TXT_BUF
    TEXT r8, r13, r2

    LDI r8, 124
    LDI r13, 238
    LDI r2, 48
    LDI r10, 16
    LDI r9, 0x2C3E50
    RECTF r8, r13, r2, r10, r9
    LDI r20, TXT_BUF
    LDI r13, 46
    STORE r20, r13
    LDI r13, 0
    ADD r20, r8
    STORE r20, r13
    LDI r8, 144
    LDI r13, 242
    LDI r2, TXT_BUF
    TEXT r8, r13, r2

    ; ── Title ──
    LDI r20, TXT_BUF
    LDI r13, 71
    STORE r20, r13
    LDI r13, 85
    ADD r20, r8
    STORE r20, r13
    LDI r13, 73
    ADD r20, r8
    STORE r20, r13
    LDI r13, 32
    ADD r20, r8
    STORE r20, r13
    LDI r13, 67
    ADD r20, r8
    STORE r20, r13
    LDI r13, 65
    ADD r20, r8
    STORE r20, r13
    LDI r13, 76
    ADD r20, r8
    STORE r20, r13
    LDI r13, 0
    ADD r20, r8
    STORE r20, r13
    LDI r8, 80
    LDI r13, 5
    LDI r2, TXT_BUF
    TEXT r8, r13, r2

do_frame:
    FRAME
    JMP main_loop

; ── num_to_str subroutine ──────────────────────────
; Input:  r9 = number, r20 = buffer address
; Output: null-terminated string at r20, r20 advanced
; Clobbers: r6, r13, r2, r10, r21, r22
; Uses RAM: DIG_BUF(0x600), DIG_COUNT(0x620), DIG_QUOT(0x624), DIG_PTR(0x628)
num_to_str:
    LDI r8, 1
    CMPI r9, 0
    JNZ r6, nts_loop1

    ; Handle zero
    LDI r13, 48
    STORE r20, r13
    ADD r20, r8
    LDI r13, 0
    STORE r20, r13
    RET

nts_loop1:
    ; Init reversed buffer
    LDI r22, DIG_BUF
    LDI r13, DIG_PTR
    STORE r13, r22
    LDI r21, 0
    LDI r13, DIG_COUNT
    STORE r13, r21

nts_loop2:
    CMPI r9, 0
    JZ r6, nts_rev1

    ; r2 = r9 / 10
    LDI r2, 0
    ADD r2, r9
    LDI r10, 10
    DIV r2, r10
    LDI r13, DIG_QUOT
    STORE r13, r2

    ; r9 = r9 - r2*10 (remainder)
    LDI r13, 0
    ADD r13, r2
    MUL r13, r10
    SUB r9, r13
    ; Convert to ASCII
    LDI r13, 48
    ADD r9, r13

    ; Store in reversed buffer
    LDI r13, DIG_PTR
    LOAD r22, r13
    STORE r22, r9
    ADD r22, r8
    LDI r13, DIG_PTR
    STORE r13, r22

    ; Increment count
    LDI r13, DIG_COUNT
    LOAD r21, r13
    ADD r21, r8
    LDI r13, DIG_COUNT
    STORE r13, r21

    ; r9 = quotient
    LDI r13, DIG_QUOT
    LOAD r9, r13
    JMP nts_loop2

nts_rev1:
    ; Reverse digits into output buffer
    LDI r13, DIG_COUNT
    LOAD r21, r13
    LDI r22, DIG_BUF

nts_rev2:
    CMPI r21, 0
    JZ r6, nts_end
    SUB r21, r8
    ; Load digit from reversed buffer
    LDI r13, 0
    ADD r13, r22
    ADD r13, r21
    LOAD r13, r13
    ; Store to output buffer
    STORE r20, r13
    ADD r20, r8
    JMP nts_rev2

nts_end:
    LDI r13, 0
    STORE r20, r13
    LDI r8, 1
    RET
