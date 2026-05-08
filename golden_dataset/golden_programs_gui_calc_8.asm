; DESCRIPTION: A colored object centered at the screen with fixed size.

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
;   r1  = scratch
;   r10  = scratch
;   r13  = scratch
;   r5  = scratch (colors, values)
;   r8  = scratch
;   r15 = mouse X from MOUSEQ
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
    LDI r9, 1

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
    LDI r9, 20
    LDI r1, 70
    LDI r10, 48
    LDI r13, 38
    HITSET r9, r1, r10, r13, 1

    LDI r9, 72
    HITSET r9, r1, r10, r13, 2

    LDI r9, 124
    HITSET r9, r1, r10, r13, 3

    LDI r9, 176
    HITSET r9, r1, r10, r13, 4

; Row 1: 7  8  9  +
    LDI r9, 20
    LDI r1, 112
    HITSET r9, r1, r10, r13, 5

    LDI r9, 72
    HITSET r9, r1, r10, r13, 6

    LDI r9, 124
    HITSET r9, r1, r10, r13, 7

    LDI r9, 176
    HITSET r9, r1, r10, r13, 8

; Row 2: 4  5  6  =
    LDI r9, 20
    LDI r1, 154
    HITSET r9, r1, r10, r13, 9

    LDI r9, 72
    HITSET r9, r1, r10, r13, 10

    LDI r9, 124
    HITSET r9, r1, r10, r13, 11

    LDI r9, 176
    HITSET r9, r1, r10, r13, 12

; Row 3: 1  2  3  (empty)
    LDI r9, 20
    LDI r1, 196
    HITSET r9, r1, r10, r13, 13

    LDI r9, 72
    HITSET r9, r1, r10, r13, 14

    LDI r9, 124
    HITSET r9, r1, r10, r13, 15

; Row 4: 0 (wide)  .  (empty)
; Button 0 spans 2 cols: 100x38
    LDI r9, 20
    LDI r1, 238
    LDI r10, 100
    LDI r13, 16
    HITSET r9, r1, r10, r13, 16

    LDI r9, 124
    LDI r10, 48
    LDI r13, 16
    HITSET r9, r1, r10, r13, 17

; ── MAIN LOOP ─────────────────────────────────────
main_loop:
    LDI r9, 1

; Increment tick
    LDI r20, TICK
    LOAD r1, r20
    ADD r1, r9
    STORE r20, r1

; Read mouse
    MOUSEQ r15

; Query hit regions
    HITQ r14
    JZ r14, draw_ui

; Handle button clicks
    CMPI r14, 1
    JZ r3, btn_clear

    CMPI r14, 2
    JZ r3, btn_div

    CMPI r14, 3
    JZ r3, btn_mul

    CMPI r14, 4
    JZ r3, btn_sub

    CMPI r14, 5
    JZ r3, btn_7

    CMPI r14, 6
    JZ r3, btn_8

    CMPI r14, 7
    JZ r3, btn_9

    CMPI r14, 8
    JZ r3, btn_add

    CMPI r14, 9
    JZ r3, btn_4

    CMPI r14, 10
    JZ r3, btn_5

    CMPI r14, 11
    JZ r3, btn_6

    CMPI r14, 12
    JZ r3, btn_eq

    CMPI r14, 13
    JZ r3, btn_1

    CMPI r14, 14
    JZ r3, btn_2

    CMPI r14, 15
    JZ r3, btn_3

    CMPI r14, 16
    JZ r3, btn_0

    CMPI r14, 17
    JZ r3, btn_dot

    JMP draw_ui

; ── Digit buttons ──────────────────────────────────
; Each digit: if new_entry, clear display first, then append digit
btn_0:
    LDI r9, 1
    LDI r20, NEW_ENTRY
    LOAD r1, r20
    CMPI r1, 1
    JZ r3, do_0_clear
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
    LDI r10, 10
    MUL r1, r10
    STORE r20, r1
    JMP draw_ui

btn_1:
    LDI r9, 1
    CALL enter_digit_start
    LDI r1, 1
    JMP enter_digit_finish

btn_2:
    LDI r9, 1
    CALL enter_digit_start
    LDI r1, 2
    JMP enter_digit_finish

btn_3:
    LDI r9, 1
    CALL enter_digit_start
    LDI r1, 3
    JMP enter_digit_finish

btn_4:
    LDI r9, 1
    CALL enter_digit_start
    LDI r1, 4
    JMP enter_digit_finish

btn_5:
    LDI r9, 1
    CALL enter_digit_start
    LDI r1, 5
    JMP enter_digit_finish

btn_6:
    LDI r9, 1
    CALL enter_digit_start
    LDI r1, 6
    JMP enter_digit_finish

btn_7:
    LDI r9, 1
    CALL enter_digit_start
    LDI r1, 7
    JMP enter_digit_finish

btn_8:
    LDI r9, 1
    CALL enter_digit_start
    LDI r1, 8
    JMP enter_digit_finish

btn_9:
    LDI r9, 1
    CALL enter_digit_start
    LDI r1, 9
    JMP enter_digit_finish

btn_dot:
    ; For simplicity, just append a visual indicator -- skip real decimal
    ; In a full implementation we would track decimal position
    JMP draw_ui

; enter_digit_start: if new_entry, clear display value
enter_digit_start:
    LDI r9, 1
    LDI r20, NEW_ENTRY
    LOAD r1, r20
    CMPI r1, 1
    JZ r3, eds_clear
    RET
eds_clear:
    LDI r20, DISP_VAL
    LDI r1, 0
    STORE r20, r1
    LDI r20, NEW_ENTRY
    STORE r20, r1
    LDI r9, 1
    RET

; enter_digit_finish: r1=digit value, multiply display by 10 and add digit
enter_digit_finish:
    LDI r9, 1
    LDI r20, DISP_VAL
    LOAD r10, r20
    LDI r13, 10
    MUL r10, r13
    ADD r10, r1
    STORE r20, r10
    JMP draw_ui

; ── Operator buttons ───────────────────────────────
btn_add:
    LDI r9, 1
    LDI r20, OPER
    LDI r1, 1
    STORE r20, r1
    CALL save_accum_and_set_state
    JMP draw_ui

btn_sub:
    LDI r9, 1
    LDI r20, OPER
    LDI r1, 2
    STORE r20, r1
    CALL save_accum_and_set_state
    JMP draw_ui

btn_mul:
    LDI r9, 1
    LDI r20, OPER
    LDI r1, 3
    STORE r20, r1
    CALL save_accum_and_set_state
    JMP draw_ui

btn_div:
    LDI r9, 1
    LDI r20, OPER
    LDI r1, 4
    STORE r20, r1
    CALL save_accum_and_set_state
    JMP draw_ui

; save_accum_and_set_state: save display to accumulator, set state=2, new_entry=1
save_accum_and_set_state:
    LDI r9, 1
    ; If state is 2 (entering second), compute pending first
    LDI r20, STATE
    LOAD r1, r20
    CMPI r1, 2
    JNZ r3, sas_set
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
    LOAD r1, r20
    CMPI r1, 0
    JZ r3, dc_done
    ; Load accumulator and display
    LDI r20, ACCUM
    LOAD r10, r20
    LDI r20, DISP_VAL
    LOAD r13, r20
    ; Branch on operator
    CMPI r1, 1
    JZ r3, dc_add
    CMPI r1, 2
    JZ r3, dc_sub
    CMPI r1, 3
    JZ r3, dc_mul
    CMPI r1, 4
    JZ r3, dc_div
    JMP dc_done

dc_add:
    ADD r10, r13
    JMP dc_store

dc_sub:
    SUB r10, r13
    JMP dc_store

dc_mul:
    MUL r10, r13
    JMP dc_store

dc_div:
    CMPI r13, 0
    JZ r3, dc_done
    DIV r10, r13

dc_store:
    LDI r20, DISP_VAL
    STORE r20, r10
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
    LDI r9, 1
    RET

; ── Clear button ───────────────────────────────────
btn_clear:
    LDI r9, 1
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
    LDI r9, 1

    ; Redraw background
    LDI r1, 0x1A1A2E
    FILL r1

    ; ── Display area ──
    LDI r9, 20
    LDI r1, 20
    LDI r10, 216
    LDI r13, 40
    LDI r5, 0x0F3460
    RECTF r9, r1, r10, r13, r5

    ; Convert display value to string
    LDI r20, DISP_VAL
    LOAD r5, r20
    LDI r20, TXT_BUF
    CALL num_to_str

    ; Render display text (right-aligned at x=220, y=32)
    LDI r9, 220
    LDI r1, 32
    LDI r10, TXT_BUF
    TEXT r9, r1, r10

    ; ── Draw buttons ──
    ; Row 0: C(1) /(2) *(3) -(4)
    LDI r9, 20
    LDI r1, 70
    LDI r10, 48
    LDI r13, 38
    LDI r5, 0xE74C3C
    RECTF r9, r1, r10, r13, r5
    ; "C" label
    LDI r20, TXT_BUF
    LDI r1, 67
    STORE r20, r1
    LDI r1, 0
    ADD r20, r9
    STORE r20, r1
    LDI r9, 40
    LDI r1, 82
    LDI r10, TXT_BUF
    TEXT r9, r1, r10

    ; / button (orange)
    LDI r9, 72
    LDI r1, 70
    LDI r5, 0xFF8800
    RECTF r9, r1, r10, r13, r5
    LDI r20, TXT_BUF
    LDI r1, 47
    STORE r20, r1
    LDI r1, 0
    ADD r20, r9
    STORE r20, r1
    LDI r9, 92
    LDI r1, 82
    LDI r10, TXT_BUF
    TEXT r9, r1, r10

    ; * button (orange)
    LDI r9, 124
    LDI r1, 70
    RECTF r9, r1, r10, r13, r5
    LDI r20, TXT_BUF
    LDI r1, 42
    STORE r20, r1
    LDI r1, 0
    ADD r20, r9
    STORE r20, r1
    LDI r9, 144
    LDI r1, 82
    LDI r10, TXT_BUF
    TEXT r9, r1, r10

    ; - button (orange)
    LDI r9, 176
    LDI r1, 70
    RECTF r9, r1, r10, r13, r5
    LDI r20, TXT_BUF
    LDI r1, 45
    STORE r20, r1
    LDI r1, 0
    ADD r20, r9
    STORE r20, r1
    LDI r9, 196
    LDI r1, 82
    LDI r10, TXT_BUF
    TEXT r9, r1, r10

    ; Row 1: 7(5) 8(6) 9(7) +(8)
    LDI r9, 20
    LDI r1, 112
    LDI r10, 48
    LDI r13, 38
    LDI r5, 0x2C3E50
    RECTF r9, r1, r10, r13, r5
    ; "7"
    LDI r20, TXT_BUF
    LDI r1, 55
    STORE r20, r1
    LDI r1, 0
    ADD r20, r9
    STORE r20, r1
    LDI r9, 40
    LDI r1, 124
    LDI r10, TXT_BUF
    TEXT r9, r1, r10

    LDI r9, 72
    LDI r1, 112
    RECTF r9, r1, r10, r13, r5
    LDI r20, TXT_BUF
    LDI r1, 56
    STORE r20, r1
    LDI r1, 0
    ADD r20, r9
    STORE r20, r1
    LDI r9, 92
    LDI r1, 124
    LDI r10, TXT_BUF
    TEXT r9, r1, r10

    LDI r9, 124
    LDI r1, 112
    RECTF r9, r1, r10, r13, r5
    LDI r20, TXT_BUF
    LDI r1, 57
    STORE r20, r1
    LDI r1, 0
    ADD r20, r9
    STORE r20, r1
    LDI r9, 144
    LDI r1, 124
    LDI r10, TXT_BUF
    TEXT r9, r1, r10

    ; + button (green)
    LDI r9, 176
    LDI r1, 112
    LDI r5, 0x27AE60
    RECTF r9, r1, r10, r13, r5
    LDI r20, TXT_BUF
    LDI r1, 43
    STORE r20, r1
    LDI r1, 0
    ADD r20, r9
    STORE r20, r1
    LDI r9, 196
    LDI r1, 124
    LDI r10, TXT_BUF
    TEXT r9, r1, r10

    ; Row 2: 4(9) 5(10) 6(11) =(12)
    LDI r9, 20
    LDI r1, 154
    LDI r10, 48
    LDI r13, 38
    LDI r5, 0x2C3E50
    RECTF r9, r1, r10, r13, r5
    LDI r20, TXT_BUF
    LDI r1, 52
    STORE r20, r1
    LDI r1, 0
    ADD r20, r9
    STORE r20, r1
    LDI r9, 40
    LDI r1, 166
    LDI r10, TXT_BUF
    TEXT r9, r1, r10

    LDI r9, 72
    LDI r1, 154
    RECTF r9, r1, r10, r13, r5
    LDI r20, TXT_BUF
    LDI r1, 53
    STORE r20, r1
    LDI r1, 0
    ADD r20, r9
    STORE r20, r1
    LDI r9, 92
    LDI r1, 166
    LDI r10, TXT_BUF
    TEXT r9, r1, r10

    LDI r9, 124
    LDI r1, 154
    RECTF r9, r1, r10, r13, r5
    LDI r20, TXT_BUF
    LDI r1, 54
    STORE r20, r1
    LDI r1, 0
    ADD r20, r9
    STORE r20, r1
    LDI r9, 144
    LDI r1, 166
    LDI r10, TXT_BUF
    TEXT r9, r1, r10

    ; = button (green)
    LDI r9, 176
    LDI r1, 154
    LDI r5, 0x27AE60
    RECTF r9, r1, r10, r13, r5
    LDI r20, TXT_BUF
    LDI r1, 61
    STORE r20, r1
    LDI r1, 0
    ADD r20, r9
    STORE r20, r1
    LDI r9, 196
    LDI r1, 166
    LDI r10, TXT_BUF
    TEXT r9, r1, r10

    ; Row 3: 1(13) 2(14) 3(15) (empty)
    LDI r9, 20
    LDI r1, 196
    LDI r10, 48
    LDI r13, 38
    LDI r5, 0x2C3E50
    RECTF r9, r1, r10, r13, r5
    LDI r20, TXT_BUF
    LDI r1, 49
    STORE r20, r1
    LDI r1, 0
    ADD r20, r9
    STORE r20, r1
    LDI r9, 40
    LDI r1, 208
    LDI r10, TXT_BUF
    TEXT r9, r1, r10

    LDI r9, 72
    LDI r1, 196
    RECTF r9, r1, r10, r13, r5
    LDI r20, TXT_BUF
    LDI r1, 50
    STORE r20, r1
    LDI r1, 0
    ADD r20, r9
    STORE r20, r1
    LDI r9, 92
    LDI r1, 208
    LDI r10, TXT_BUF
    TEXT r9, r1, r10

    LDI r9, 124
    LDI r1, 196
    RECTF r9, r1, r10, r13, r5
    LDI r20, TXT_BUF
    LDI r1, 51
    STORE r20, r1
    LDI r1, 0
    ADD r20, r9
    STORE r20, r1
    LDI r9, 144
    LDI r1, 208
    LDI r10, TXT_BUF
    TEXT r9, r1, r10

    ; Row 4: 0(16, wide) .(17) (empty)
    LDI r9, 20
    LDI r1, 238
    LDI r10, 100
    LDI r13, 16
    LDI r5, 0x2C3E50
    RECTF r9, r1, r10, r13, r5
    LDI r20, TXT_BUF
    LDI r1, 48
    STORE r20, r1
    LDI r1, 0
    ADD r20, r9
    STORE r20, r1
    LDI r9, 60
    LDI r1, 242
    LDI r10, TXT_BUF
    TEXT r9, r1, r10

    LDI r9, 124
    LDI r1, 238
    LDI r10, 48
    LDI r13, 16
    LDI r5, 0x2C3E50
    RECTF r9, r1, r10, r13, r5
    LDI r20, TXT_BUF
    LDI r1, 46
    STORE r20, r1
    LDI r1, 0
    ADD r20, r9
    STORE r20, r1
    LDI r9, 144
    LDI r1, 242
    LDI r10, TXT_BUF
    TEXT r9, r1, r10

    ; ── Title ──
    LDI r20, TXT_BUF
    LDI r1, 71
    STORE r20, r1
    LDI r1, 85
    ADD r20, r9
    STORE r20, r1
    LDI r1, 73
    ADD r20, r9
    STORE r20, r1
    LDI r1, 32
    ADD r20, r9
    STORE r20, r1
    LDI r1, 67
    ADD r20, r9
    STORE r20, r1
    LDI r1, 65
    ADD r20, r9
    STORE r20, r1
    LDI r1, 76
    ADD r20, r9
    STORE r20, r1
    LDI r1, 0
    ADD r20, r9
    STORE r20, r1
    LDI r9, 80
    LDI r1, 5
    LDI r10, TXT_BUF
    TEXT r9, r1, r10

do_frame:
    FRAME
    JMP main_loop

; ── num_to_str subroutine ──────────────────────────
; Input:  r5 = number, r20 = buffer address
; Output: null-terminated string at r20, r20 advanced
; Clobbers: r3, r1, r10, r13, r21, r22
; Uses RAM: DIG_BUF(0x600), DIG_COUNT(0x620), DIG_QUOT(0x624), DIG_PTR(0x628)
num_to_str:
    LDI r9, 1
    CMPI r5, 0
    JNZ r3, nts_loop1

    ; Handle zero
    LDI r1, 48
    STORE r20, r1
    ADD r20, r9
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
    JZ r3, nts_rev1

    ; r10 = r5 / 10
    LDI r10, 0
    ADD r10, r5
    LDI r13, 10
    DIV r10, r13
    LDI r1, DIG_QUOT
    STORE r1, r10

    ; r5 = r5 - r10*10 (remainder)
    LDI r1, 0
    ADD r1, r10
    MUL r1, r13
    SUB r5, r1
    ; Convert to ASCII
    LDI r1, 48
    ADD r5, r1

    ; Store in reversed buffer
    LDI r1, DIG_PTR
    LOAD r22, r1
    STORE r22, r5
    ADD r22, r9
    LDI r1, DIG_PTR
    STORE r1, r22

    ; Increment count
    LDI r1, DIG_COUNT
    LOAD r21, r1
    ADD r21, r9
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
    JZ r3, nts_end
    SUB r21, r9
    ; Load digit from reversed buffer
    LDI r1, 0
    ADD r1, r22
    ADD r1, r21
    LOAD r1, r1
    ; Store to output buffer
    STORE r20, r1
    ADD r20, r9
    JMP nts_rev2

nts_end:
    LDI r1, 0
    STORE r20, r1
    LDI r9, 1
    RET
