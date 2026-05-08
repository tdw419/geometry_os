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
;   r3  = constant 1 (reloaded as needed)
;   r6  = scratch
;   r1  = scratch
;   r7  = scratch
;   r12  = scratch (colors, values)
;   r13  = scratch
;   r11 = mouse X from MOUSEQ
;   r2 = mouse Y from MOUSEQ
;   r15 = hit query result
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
    LDI r3, 1

; Display value = 0
    LDI r20, DISP_VAL
    LDI r6, 0
    STORE r20, r6

; Accumulator = 0
    LDI r20, ACCUM
    STORE r20, r6

; Operator = none (0)
    LDI r20, OPER
    STORE r20, r6

; State = entering first number (0)
    LDI r20, STATE
    STORE r20, r6

; New entry = no (0)
    LDI r20, NEW_ENTRY
    STORE r20, r6

; Tick = 0
    LDI r20, TICK
    STORE r20, r6

; Fill screen dark
    LDI r6, 0x1A1A2E
    FILL r6

; ── Register all button hit regions ──
; Button grid: 4 cols x 5 rows
; Each button: 48x38, gap=4, total cell=52
; Start: x=20, y=70

; Row 0: C  /  *  -
    LDI r3, 20
    LDI r6, 70
    LDI r1, 48
    LDI r7, 38
    HITSET r3, r6, r1, r7, 1

    LDI r3, 72
    HITSET r3, r6, r1, r7, 2

    LDI r3, 124
    HITSET r3, r6, r1, r7, 3

    LDI r3, 176
    HITSET r3, r6, r1, r7, 4

; Row 1: 7  8  9  +
    LDI r3, 20
    LDI r6, 112
    HITSET r3, r6, r1, r7, 5

    LDI r3, 72
    HITSET r3, r6, r1, r7, 6

    LDI r3, 124
    HITSET r3, r6, r1, r7, 7

    LDI r3, 176
    HITSET r3, r6, r1, r7, 8

; Row 2: 4  5  6  =
    LDI r3, 20
    LDI r6, 154
    HITSET r3, r6, r1, r7, 9

    LDI r3, 72
    HITSET r3, r6, r1, r7, 10

    LDI r3, 124
    HITSET r3, r6, r1, r7, 11

    LDI r3, 176
    HITSET r3, r6, r1, r7, 12

; Row 3: 1  2  3  (empty)
    LDI r3, 20
    LDI r6, 196
    HITSET r3, r6, r1, r7, 13

    LDI r3, 72
    HITSET r3, r6, r1, r7, 14

    LDI r3, 124
    HITSET r3, r6, r1, r7, 15

; Row 4: 0 (wide)  .  (empty)
; Button 0 spans 2 cols: 100x38
    LDI r3, 20
    LDI r6, 238
    LDI r1, 100
    LDI r7, 16
    HITSET r3, r6, r1, r7, 16

    LDI r3, 124
    LDI r1, 48
    LDI r7, 16
    HITSET r3, r6, r1, r7, 17

; ── MAIN LOOP ─────────────────────────────────────
main_loop:
    LDI r3, 1

; Increment tick
    LDI r20, TICK
    LOAD r6, r20
    ADD r6, r3
    STORE r20, r6

; Read mouse
    MOUSEQ r11

; Query hit regions
    HITQ r15
    JZ r15, draw_ui

; Handle button clicks
    CMPI r15, 1
    JZ r9, btn_clear

    CMPI r15, 2
    JZ r9, btn_div

    CMPI r15, 3
    JZ r9, btn_mul

    CMPI r15, 4
    JZ r9, btn_sub

    CMPI r15, 5
    JZ r9, btn_7

    CMPI r15, 6
    JZ r9, btn_8

    CMPI r15, 7
    JZ r9, btn_9

    CMPI r15, 8
    JZ r9, btn_add

    CMPI r15, 9
    JZ r9, btn_4

    CMPI r15, 10
    JZ r9, btn_5

    CMPI r15, 11
    JZ r9, btn_6

    CMPI r15, 12
    JZ r9, btn_eq

    CMPI r15, 13
    JZ r9, btn_1

    CMPI r15, 14
    JZ r9, btn_2

    CMPI r15, 15
    JZ r9, btn_3

    CMPI r15, 16
    JZ r9, btn_0

    CMPI r15, 17
    JZ r9, btn_dot

    JMP draw_ui

; ── Digit buttons ──────────────────────────────────
; Each digit: if new_entry, clear display first, then append digit
btn_0:
    LDI r3, 1
    LDI r20, NEW_ENTRY
    LOAD r6, r20
    CMPI r6, 1
    JZ r9, do_0_clear
    JMP do_0_append
do_0_clear:
    LDI r20, DISP_VAL
    LDI r6, 0
    STORE r20, r6
    LDI r20, NEW_ENTRY
    STORE r20, r6
do_0_append:
    LDI r20, DISP_VAL
    LOAD r6, r20
    LDI r1, 10
    MUL r6, r1
    STORE r20, r6
    JMP draw_ui

btn_1:
    LDI r3, 1
    CALL enter_digit_start
    LDI r6, 1
    JMP enter_digit_finish

btn_2:
    LDI r3, 1
    CALL enter_digit_start
    LDI r6, 2
    JMP enter_digit_finish

btn_3:
    LDI r3, 1
    CALL enter_digit_start
    LDI r6, 3
    JMP enter_digit_finish

btn_4:
    LDI r3, 1
    CALL enter_digit_start
    LDI r6, 4
    JMP enter_digit_finish

btn_5:
    LDI r3, 1
    CALL enter_digit_start
    LDI r6, 5
    JMP enter_digit_finish

btn_6:
    LDI r3, 1
    CALL enter_digit_start
    LDI r6, 6
    JMP enter_digit_finish

btn_7:
    LDI r3, 1
    CALL enter_digit_start
    LDI r6, 7
    JMP enter_digit_finish

btn_8:
    LDI r3, 1
    CALL enter_digit_start
    LDI r6, 8
    JMP enter_digit_finish

btn_9:
    LDI r3, 1
    CALL enter_digit_start
    LDI r6, 9
    JMP enter_digit_finish

btn_dot:
    ; For simplicity, just append a visual indicator -- skip real decimal
    ; In a full implementation we would track decimal position
    JMP draw_ui

; enter_digit_start: if new_entry, clear display value
enter_digit_start:
    LDI r3, 1
    LDI r20, NEW_ENTRY
    LOAD r6, r20
    CMPI r6, 1
    JZ r9, eds_clear
    RET
eds_clear:
    LDI r20, DISP_VAL
    LDI r6, 0
    STORE r20, r6
    LDI r20, NEW_ENTRY
    STORE r20, r6
    LDI r3, 1
    RET

; enter_digit_finish: r6=digit value, multiply display by 10 and add digit
enter_digit_finish:
    LDI r3, 1
    LDI r20, DISP_VAL
    LOAD r1, r20
    LDI r7, 10
    MUL r1, r7
    ADD r1, r6
    STORE r20, r1
    JMP draw_ui

; ── Operator buttons ───────────────────────────────
btn_add:
    LDI r3, 1
    LDI r20, OPER
    LDI r6, 1
    STORE r20, r6
    CALL save_accum_and_set_state
    JMP draw_ui

btn_sub:
    LDI r3, 1
    LDI r20, OPER
    LDI r6, 2
    STORE r20, r6
    CALL save_accum_and_set_state
    JMP draw_ui

btn_mul:
    LDI r3, 1
    LDI r20, OPER
    LDI r6, 3
    STORE r20, r6
    CALL save_accum_and_set_state
    JMP draw_ui

btn_div:
    LDI r3, 1
    LDI r20, OPER
    LDI r6, 4
    STORE r20, r6
    CALL save_accum_and_set_state
    JMP draw_ui

; save_accum_and_set_state: save display to accumulator, set state=2, new_entry=1
save_accum_and_set_state:
    LDI r3, 1
    ; If state is 2 (entering second), compute pending first
    LDI r20, STATE
    LOAD r6, r20
    CMPI r6, 2
    JNZ r9, sas_set
    ; Compute pending operation
    CALL do_compute
sas_set:
    ; Save display to accumulator
    LDI r20, DISP_VAL
    LOAD r6, r20
    LDI r20, ACCUM
    STORE r20, r6
    ; Set state = 2 (entering second number)
    LDI r20, STATE
    LDI r6, 2
    STORE r20, r6
    ; Set new_entry = 1
    LDI r20, NEW_ENTRY
    LDI r6, 1
    STORE r20, r6
    LDI r3, 1
    RET

; ── Equals button ──────────────────────────────────
btn_eq:
    LDI r3, 1
    CALL do_compute
    JMP draw_ui

; do_compute: perform pending operation
; accumulator OP display_val -> display_val
; Then set state=0, new_entry=1
do_compute:
    LDI r3, 1
    ; Check if there is an operator
    LDI r20, OPER
    LOAD r6, r20
    CMPI r6, 0
    JZ r9, dc_done
    ; Load accumulator and display
    LDI r20, ACCUM
    LOAD r1, r20
    LDI r20, DISP_VAL
    LOAD r7, r20
    ; Branch on operator
    CMPI r6, 1
    JZ r9, dc_add
    CMPI r6, 2
    JZ r9, dc_sub
    CMPI r6, 3
    JZ r9, dc_mul
    CMPI r6, 4
    JZ r9, dc_div
    JMP dc_done

dc_add:
    ADD r1, r7
    JMP dc_store

dc_sub:
    SUB r1, r7
    JMP dc_store

dc_mul:
    MUL r1, r7
    JMP dc_store

dc_div:
    CMPI r7, 0
    JZ r9, dc_done
    DIV r1, r7

dc_store:
    LDI r20, DISP_VAL
    STORE r20, r1
    ; Clear operator
    LDI r20, OPER
    LDI r6, 0
    STORE r20, r6

dc_done:
    ; Set state=0, new_entry=1
    LDI r20, STATE
    LDI r6, 0
    STORE r20, r6
    LDI r20, NEW_ENTRY
    LDI r6, 1
    STORE r20, r6
    LDI r3, 1
    RET

; ── Clear button ───────────────────────────────────
btn_clear:
    LDI r3, 1
    LDI r20, DISP_VAL
    LDI r6, 0
    STORE r20, r6
    LDI r20, ACCUM
    STORE r20, r6
    LDI r20, OPER
    STORE r20, r6
    LDI r20, STATE
    STORE r20, r6
    LDI r20, NEW_ENTRY
    STORE r20, r6
    JMP draw_ui

; ── DRAW UI ────────────────────────────────────────
draw_ui:
    LDI r3, 1

    ; Redraw background
    LDI r6, 0x1A1A2E
    FILL r6

    ; ── Display area ──
    LDI r3, 20
    LDI r6, 20
    LDI r1, 216
    LDI r7, 40
    LDI r12, 0x0F3460
    RECTF r3, r6, r1, r7, r12

    ; Convert display value to string
    LDI r20, DISP_VAL
    LOAD r12, r20
    LDI r20, TXT_BUF
    CALL num_to_str

    ; Render display text (right-aligned at x=220, y=32)
    LDI r3, 220
    LDI r6, 32
    LDI r1, TXT_BUF
    TEXT r3, r6, r1

    ; ── Draw buttons ──
    ; Row 0: C(1) /(2) *(3) -(4)
    LDI r3, 20
    LDI r6, 70
    LDI r1, 48
    LDI r7, 38
    LDI r12, 0xE74C3C
    RECTF r3, r6, r1, r7, r12
    ; "C" label
    LDI r20, TXT_BUF
    LDI r6, 67
    STORE r20, r6
    LDI r6, 0
    ADD r20, r3
    STORE r20, r6
    LDI r3, 40
    LDI r6, 82
    LDI r1, TXT_BUF
    TEXT r3, r6, r1

    ; / button (orange)
    LDI r3, 72
    LDI r6, 70
    LDI r12, 0xFF8800
    RECTF r3, r6, r1, r7, r12
    LDI r20, TXT_BUF
    LDI r6, 47
    STORE r20, r6
    LDI r6, 0
    ADD r20, r3
    STORE r20, r6
    LDI r3, 92
    LDI r6, 82
    LDI r1, TXT_BUF
    TEXT r3, r6, r1

    ; * button (orange)
    LDI r3, 124
    LDI r6, 70
    RECTF r3, r6, r1, r7, r12
    LDI r20, TXT_BUF
    LDI r6, 42
    STORE r20, r6
    LDI r6, 0
    ADD r20, r3
    STORE r20, r6
    LDI r3, 144
    LDI r6, 82
    LDI r1, TXT_BUF
    TEXT r3, r6, r1

    ; - button (orange)
    LDI r3, 176
    LDI r6, 70
    RECTF r3, r6, r1, r7, r12
    LDI r20, TXT_BUF
    LDI r6, 45
    STORE r20, r6
    LDI r6, 0
    ADD r20, r3
    STORE r20, r6
    LDI r3, 196
    LDI r6, 82
    LDI r1, TXT_BUF
    TEXT r3, r6, r1

    ; Row 1: 7(5) 8(6) 9(7) +(8)
    LDI r3, 20
    LDI r6, 112
    LDI r1, 48
    LDI r7, 38
    LDI r12, 0x2C3E50
    RECTF r3, r6, r1, r7, r12
    ; "7"
    LDI r20, TXT_BUF
    LDI r6, 55
    STORE r20, r6
    LDI r6, 0
    ADD r20, r3
    STORE r20, r6
    LDI r3, 40
    LDI r6, 124
    LDI r1, TXT_BUF
    TEXT r3, r6, r1

    LDI r3, 72
    LDI r6, 112
    RECTF r3, r6, r1, r7, r12
    LDI r20, TXT_BUF
    LDI r6, 56
    STORE r20, r6
    LDI r6, 0
    ADD r20, r3
    STORE r20, r6
    LDI r3, 92
    LDI r6, 124
    LDI r1, TXT_BUF
    TEXT r3, r6, r1

    LDI r3, 124
    LDI r6, 112
    RECTF r3, r6, r1, r7, r12
    LDI r20, TXT_BUF
    LDI r6, 57
    STORE r20, r6
    LDI r6, 0
    ADD r20, r3
    STORE r20, r6
    LDI r3, 144
    LDI r6, 124
    LDI r1, TXT_BUF
    TEXT r3, r6, r1

    ; + button (green)
    LDI r3, 176
    LDI r6, 112
    LDI r12, 0x27AE60
    RECTF r3, r6, r1, r7, r12
    LDI r20, TXT_BUF
    LDI r6, 43
    STORE r20, r6
    LDI r6, 0
    ADD r20, r3
    STORE r20, r6
    LDI r3, 196
    LDI r6, 124
    LDI r1, TXT_BUF
    TEXT r3, r6, r1

    ; Row 2: 4(9) 5(10) 6(11) =(12)
    LDI r3, 20
    LDI r6, 154
    LDI r1, 48
    LDI r7, 38
    LDI r12, 0x2C3E50
    RECTF r3, r6, r1, r7, r12
    LDI r20, TXT_BUF
    LDI r6, 52
    STORE r20, r6
    LDI r6, 0
    ADD r20, r3
    STORE r20, r6
    LDI r3, 40
    LDI r6, 166
    LDI r1, TXT_BUF
    TEXT r3, r6, r1

    LDI r3, 72
    LDI r6, 154
    RECTF r3, r6, r1, r7, r12
    LDI r20, TXT_BUF
    LDI r6, 53
    STORE r20, r6
    LDI r6, 0
    ADD r20, r3
    STORE r20, r6
    LDI r3, 92
    LDI r6, 166
    LDI r1, TXT_BUF
    TEXT r3, r6, r1

    LDI r3, 124
    LDI r6, 154
    RECTF r3, r6, r1, r7, r12
    LDI r20, TXT_BUF
    LDI r6, 54
    STORE r20, r6
    LDI r6, 0
    ADD r20, r3
    STORE r20, r6
    LDI r3, 144
    LDI r6, 166
    LDI r1, TXT_BUF
    TEXT r3, r6, r1

    ; = button (green)
    LDI r3, 176
    LDI r6, 154
    LDI r12, 0x27AE60
    RECTF r3, r6, r1, r7, r12
    LDI r20, TXT_BUF
    LDI r6, 61
    STORE r20, r6
    LDI r6, 0
    ADD r20, r3
    STORE r20, r6
    LDI r3, 196
    LDI r6, 166
    LDI r1, TXT_BUF
    TEXT r3, r6, r1

    ; Row 3: 1(13) 2(14) 3(15) (empty)
    LDI r3, 20
    LDI r6, 196
    LDI r1, 48
    LDI r7, 38
    LDI r12, 0x2C3E50
    RECTF r3, r6, r1, r7, r12
    LDI r20, TXT_BUF
    LDI r6, 49
    STORE r20, r6
    LDI r6, 0
    ADD r20, r3
    STORE r20, r6
    LDI r3, 40
    LDI r6, 208
    LDI r1, TXT_BUF
    TEXT r3, r6, r1

    LDI r3, 72
    LDI r6, 196
    RECTF r3, r6, r1, r7, r12
    LDI r20, TXT_BUF
    LDI r6, 50
    STORE r20, r6
    LDI r6, 0
    ADD r20, r3
    STORE r20, r6
    LDI r3, 92
    LDI r6, 208
    LDI r1, TXT_BUF
    TEXT r3, r6, r1

    LDI r3, 124
    LDI r6, 196
    RECTF r3, r6, r1, r7, r12
    LDI r20, TXT_BUF
    LDI r6, 51
    STORE r20, r6
    LDI r6, 0
    ADD r20, r3
    STORE r20, r6
    LDI r3, 144
    LDI r6, 208
    LDI r1, TXT_BUF
    TEXT r3, r6, r1

    ; Row 4: 0(16, wide) .(17) (empty)
    LDI r3, 20
    LDI r6, 238
    LDI r1, 100
    LDI r7, 16
    LDI r12, 0x2C3E50
    RECTF r3, r6, r1, r7, r12
    LDI r20, TXT_BUF
    LDI r6, 48
    STORE r20, r6
    LDI r6, 0
    ADD r20, r3
    STORE r20, r6
    LDI r3, 60
    LDI r6, 242
    LDI r1, TXT_BUF
    TEXT r3, r6, r1

    LDI r3, 124
    LDI r6, 238
    LDI r1, 48
    LDI r7, 16
    LDI r12, 0x2C3E50
    RECTF r3, r6, r1, r7, r12
    LDI r20, TXT_BUF
    LDI r6, 46
    STORE r20, r6
    LDI r6, 0
    ADD r20, r3
    STORE r20, r6
    LDI r3, 144
    LDI r6, 242
    LDI r1, TXT_BUF
    TEXT r3, r6, r1

    ; ── Title ──
    LDI r20, TXT_BUF
    LDI r6, 71
    STORE r20, r6
    LDI r6, 85
    ADD r20, r3
    STORE r20, r6
    LDI r6, 73
    ADD r20, r3
    STORE r20, r6
    LDI r6, 32
    ADD r20, r3
    STORE r20, r6
    LDI r6, 67
    ADD r20, r3
    STORE r20, r6
    LDI r6, 65
    ADD r20, r3
    STORE r20, r6
    LDI r6, 76
    ADD r20, r3
    STORE r20, r6
    LDI r6, 0
    ADD r20, r3
    STORE r20, r6
    LDI r3, 80
    LDI r6, 5
    LDI r1, TXT_BUF
    TEXT r3, r6, r1

do_frame:
    FRAME
    JMP main_loop

; ── num_to_str subroutine ──────────────────────────
; Input:  r12 = number, r20 = buffer address
; Output: null-terminated string at r20, r20 advanced
; Clobbers: r9, r6, r1, r7, r21, r22
; Uses RAM: DIG_BUF(0x600), DIG_COUNT(0x620), DIG_QUOT(0x624), DIG_PTR(0x628)
num_to_str:
    LDI r3, 1
    CMPI r12, 0
    JNZ r9, nts_loop1

    ; Handle zero
    LDI r6, 48
    STORE r20, r6
    ADD r20, r3
    LDI r6, 0
    STORE r20, r6
    RET

nts_loop1:
    ; Init reversed buffer
    LDI r22, DIG_BUF
    LDI r6, DIG_PTR
    STORE r6, r22
    LDI r21, 0
    LDI r6, DIG_COUNT
    STORE r6, r21

nts_loop2:
    CMPI r12, 0
    JZ r9, nts_rev1

    ; r1 = r12 / 10
    LDI r1, 0
    ADD r1, r12
    LDI r7, 10
    DIV r1, r7
    LDI r6, DIG_QUOT
    STORE r6, r1

    ; r12 = r12 - r1*10 (remainder)
    LDI r6, 0
    ADD r6, r1
    MUL r6, r7
    SUB r12, r6
    ; Convert to ASCII
    LDI r6, 48
    ADD r12, r6

    ; Store in reversed buffer
    LDI r6, DIG_PTR
    LOAD r22, r6
    STORE r22, r12
    ADD r22, r3
    LDI r6, DIG_PTR
    STORE r6, r22

    ; Increment count
    LDI r6, DIG_COUNT
    LOAD r21, r6
    ADD r21, r3
    LDI r6, DIG_COUNT
    STORE r6, r21

    ; r12 = quotient
    LDI r6, DIG_QUOT
    LOAD r12, r6
    JMP nts_loop2

nts_rev1:
    ; Reverse digits into output buffer
    LDI r6, DIG_COUNT
    LOAD r21, r6
    LDI r22, DIG_BUF

nts_rev2:
    CMPI r21, 0
    JZ r9, nts_end
    SUB r21, r3
    ; Load digit from reversed buffer
    LDI r6, 0
    ADD r6, r22
    ADD r6, r21
    LOAD r6, r6
    ; Store to output buffer
    STORE r20, r6
    ADD r20, r3
    JMP nts_rev2

nts_end:
    LDI r6, 0
    STORE r20, r6
    LDI r3, 1
    RET
