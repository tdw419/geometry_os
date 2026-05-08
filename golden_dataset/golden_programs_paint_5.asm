; DESCRIPTION: This GeOS assembly code implements a mouse-driven paint application with basic functionality including painting on the canvas using different colors selected from a palette, clearing the canvas, and displaying a title. The program uses registers to manage state information such as the current color and previous mouse position, and it employs loops and conditional checks to handle user interactions and update the display accordingly.

; paint.asm -- Mouse-Driven Paint App for Geometry OS
;
; Proves: MOUSEQ opcode (0x85), PSET pixel drawing, HITSET/HITQ buttons,
;         FRAME loop, color palette selection, clear canvas.
;
; Controls:
;   Mouse movement + left-click area = paint
;   Bottom palette = click to select color (8 colors)
;   [X] button = clear canvas
;
; RAM Layout:
;   0x400        current color (u32, starts red 0xFF0000)
;   0x404        previous mouse X (for line drawing between frames)
;   0x408        previous mouse Y
;   0x40C        paint flag (0=not painting, 1=painting)
;
; String buffers for TEXT opcode:
;   0x500        "CLR" string (4 chars: C, L, R, null)
;   0x520        "PAINT" string (6 chars: P, A, I, N, T, null)
;
; Register allocation:
;   r12  - constant 1
;   r14  - scratch
;   r2  - scratch
;   r10  - color
;   r9 - mouse X from MOUSEQ
;   r5 - mouse Y from MOUSEQ
;   r11 - hit query result
;   r20 - RAM pointer
;   r21 - scratch for color index
;
; NOTE: Avoid colons in comments (assembler pitfall)

#define COLOR   0x400
#define PREV_X  0x404
#define PREV_Y  0x408
#define PAINT   0x40C

; ── INIT ──────────────────────────────────────
LDI r12, 1

; Default color = red
LDI r20, COLOR
LDI r14, 0xFF0000
STORE r20, r14

; Paint flag = 0
LDI r20, PAINT
LDI r14, 0
STORE r20, r14

; Fill screen dark (near-black)
LDI r14, 0x111111
FILL r14

; ── Register hit regions for palette buttons ──
; Palette is at bottom: y=240, 8 colors, each 30x14
; Color 0: Red at x=2
LDI r12, 2
LDI r14, 240
LDI r2, 30
LDI r3, 14
HITSET r12, r14, r2, r3, 1

; Color 1: Green at x=34
LDI r12, 34
LDI r14, 240
LDI r2, 30
LDI r3, 14
HITSET r12, r14, r2, r3, 2

; Color 2: Blue at x=66
LDI r12, 66
LDI r14, 240
LDI r2, 30
LDI r3, 14
HITSET r12, r14, r2, r3, 3

; Color 3: Yellow at x=98
LDI r12, 98
LDI r14, 240
LDI r2, 30
LDI r3, 14
HITSET r12, r14, r2, r3, 4

; Color 4: Cyan at x=130
LDI r12, 130
LDI r14, 240
LDI r2, 30
LDI r3, 14
HITSET r12, r14, r2, r3, 5

; Color 5: Magenta at x=162
LDI r12, 162
LDI r14, 240
LDI r2, 30
LDI r3, 14
HITSET r12, r14, r2, r3, 6

; Color 6: White at x=194
LDI r12, 194
LDI r14, 240
LDI r2, 30
LDI r3, 14
HITSET r12, r14, r2, r3, 7

; Color 7: Orange at x=226
LDI r12, 226
LDI r14, 240
LDI r2, 26
LDI r3, 14
HITSET r12, r14, r2, r3, 8

; Clear button at x=2, y=220, 40x16, id=99
LDI r12, 2
LDI r14, 220
LDI r2, 40
LDI r3, 16
HITSET r12, r14, r2, r3, 99

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r12, 1

    ; ── Read mouse position ──
    MOUSEQ r9
    ; r9 = mouse_x, r5 = mouse_y

    ; ── Check palette hit regions ──
    HITQ r11
    JZ r11, check_paint

    ; r11 = hit region id
    CMPI r11, 1
    JZ r13, set_red
    CMPI r11, 2
    JZ r13, set_green
    CMPI r11, 3
    JZ r13, set_blue
    CMPI r11, 4
    JZ r13, set_yellow
    CMPI r11, 5
    JZ r13, set_cyan
    CMPI r11, 6
    JZ r13, set_magenta
    CMPI r11, 7
    JZ r13, set_white
    CMPI r11, 8
    JZ r13, set_orange
    CMPI r11, 99
    JZ r13, do_clear
    JMP check_paint

set_red:
    LDI r20, COLOR
    LDI r14, 0xFF0000
    STORE r20, r14
    JMP draw_frame

set_green:
    LDI r20, COLOR
    LDI r14, 0x00FF00
    STORE r20, r14
    JMP draw_frame

set_blue:
    LDI r20, COLOR
    LDI r14, 0x0000FF
    STORE r20, r14
    JMP draw_frame

set_yellow:
    LDI r20, COLOR
    LDI r14, 0xFFFF00
    STORE r20, r14
    JMP draw_frame

set_cyan:
    LDI r20, COLOR
    LDI r14, 0x00FFFF
    STORE r20, r14
    JMP draw_frame

set_magenta:
    LDI r20, COLOR
    LDI r14, 0xFF00FF
    STORE r20, r14
    JMP draw_frame

set_white:
    LDI r20, COLOR
    LDI r14, 0xFFFFFF
    STORE r20, r14
    JMP draw_frame

set_orange:
    LDI r20, COLOR
    LDI r14, 0xFF8800
    STORE r20, r14
    JMP draw_frame

do_clear:
    ; Clear canvas area (keep palette)
    LDI r14, 0x111111
    FILL r14
    LDI r20, PAINT
    LDI r14, 0
    STORE r20, r14
    LDI r20, PREV_X
    LDI r14, 0
    STORE r20, r14
    LDI r20, PREV_Y
    LDI r14, 0
    STORE r20, r14
    JMP draw_frame

check_paint:
    LDI r12, 1
    ; Check if mouse is in paint area (y < 220)
    CMPI r5, 220
    BGE r13, draw_frame

    ; Mouse is in paint area -- draw pixel at mouse pos
    LDI r20, COLOR
    LOAD r10, r20

    ; Paint pixel at current mouse position
    PSET r9, r5, r10

    ; Also paint pixels between previous and current pos (line fill)
    ; Simple approach -- just paint prev pos too for continuity
    LDI r20, PREV_X
    LOAD r14, r20
    CMPI r14, 0
    JZ r13, save_pos

    LDI r20, PREV_Y
    LOAD r2, r20
    PSET r14, r2, r10

save_pos:
    LDI r20, PREV_X
    STORE r20, r9
    LDI r20, PREV_Y
    STORE r20, r5

    ; Set paint flag
    LDI r20, PAINT
    LDI r14, 1
    STORE r20, r14

    JMP draw_frame

draw_frame:
    LDI r12, 1

    ; ── Draw palette background bar ──
    LDI r12, 0
    LDI r14, 238
    LDI r2, 256
    LDI r3, 18
    LDI r10, 0x222222
    RECTF r12, r14, r2, r3, r10

    ; ── Highlight selected color (drawn BEFORE swatches so they appear on top) ──
    LDI r20, COLOR
    LOAD r10, r20
    CMPI r10, 0xFF0000
    JNZ r13, chk_grn
    LDI r12, 1
    LDI r14, 239
    LDI r2, 32
    LDI r3, 16
    LDI r1, 0xFFFFFF
    RECTF r12, r14, r2, r3, r1
    JMP draw_swatches

chk_grn:
    CMPI r10, 0x00FF00
    JNZ r13, chk_blu
    LDI r12, 33
    LDI r14, 239
    LDI r2, 32
    LDI r3, 16
    LDI r1, 0xFFFFFF
    RECTF r12, r14, r2, r3, r1
    JMP draw_swatches

chk_blu:
    CMPI r10, 0x0000FF
    JNZ r13, chk_yel
    LDI r12, 65
    LDI r14, 239
    LDI r2, 32
    LDI r3, 16
    LDI r1, 0xFFFFFF
    RECTF r12, r14, r2, r3, r1
    JMP draw_swatches

chk_yel:
    CMPI r10, 0xFFFF00
    JNZ r13, chk_cya
    LDI r12, 97
    LDI r14, 239
    LDI r2, 32
    LDI r3, 16
    LDI r1, 0xFFFFFF
    RECTF r12, r14, r2, r3, r1
    JMP draw_swatches

chk_cya:
    CMPI r10, 0x00FFFF
    JNZ r13, chk_mag
    LDI r12, 129
    LDI r14, 239
    LDI r2, 32
    LDI r3, 16
    LDI r1, 0xFFFFFF
    RECTF r12, r14, r2, r3, r1
    JMP draw_swatches

chk_mag:
    CMPI r10, 0xFF00FF
    JNZ r13, chk_wht
    LDI r12, 161
    LDI r14, 239
    LDI r2, 32
    LDI r3, 16
    LDI r1, 0xFFFFFF
    RECTF r12, r14, r2, r3, r1
    JMP draw_swatches

chk_wht:
    CMPI r10, 0xFFFFFF
    JNZ r13, chk_org
    LDI r12, 193
    LDI r14, 239
    LDI r2, 32
    LDI r3, 16
    LDI r1, 0x888888
    RECTF r12, r14, r2, r3, r1
    JMP draw_swatches

chk_org:
    CMPI r10, 0xFF8800
    JNZ r13, draw_swatches
    LDI r12, 225
    LDI r14, 239
    LDI r2, 28
    LDI r3, 16
    LDI r1, 0xFFFFFF
    RECTF r12, r14, r2, r3, r1

draw_swatches:
    ; ── Draw color swatches (on top of highlight) ──
    ; Red (id=1)
    LDI r12, 2
    LDI r14, 240
    LDI r2, 30
    LDI r3, 14
    LDI r10, 0xFF0000
    RECTF r12, r14, r2, r3, r10

    ; Green (id=2)
    LDI r12, 34
    LDI r10, 0x00FF00
    RECTF r12, r14, r2, r3, r10

    ; Blue (id=3)
    LDI r12, 66
    LDI r10, 0x0000FF
    RECTF r12, r14, r2, r3, r10

    ; Yellow (id=4)
    LDI r12, 98
    LDI r10, 0xFFFF00
    RECTF r12, r14, r2, r3, r10

    ; Cyan (id=5)
    LDI r12, 130
    LDI r10, 0x00FFFF
    RECTF r12, r14, r2, r3, r10

    ; Magenta (id=6)
    LDI r12, 162
    LDI r10, 0xFF00FF
    RECTF r12, r14, r2, r3, r10

    ; White (id=7)
    LDI r12, 194
    LDI r10, 0xFFFFFF
    RECTF r12, r14, r2, r3, r10

    ; Orange (id=8)
    LDI r12, 226
    LDI r2, 26
    LDI r10, 0xFF8800
    RECTF r12, r14, r2, r3, r10

    ; ── Draw Clear button ──
    LDI r12, 2
    LDI r14, 220
    LDI r2, 40
    LDI r3, 16
    LDI r10, 0x555555
    RECTF r12, r14, r2, r3, r10

    ; "CLR" label on clear button
    LDI r20, 0x500
    LDI r14, 67
    STORE r20, r14
    LDI r14, 76
    ADD r20, r12
    STORE r20, r14
    LDI r14, 82
    ADD r20, r12
    STORE r20, r14
    LDI r14, 0
    ADD r20, r12
    STORE r20, r14
    LDI r12, 10
    LDI r14, 224
    LDI r2, 0x500
    TEXT r12, r14, r2

    ; ── Draw title ──
    LDI r12, 1
    LDI r20, 0x520
    LDI r14, 80
    STORE r20, r14
    LDI r14, 65
    ADD r20, r12
    STORE r20, r14
    LDI r14, 73
    ADD r20, r12
    STORE r20, r14
    LDI r14, 78
    ADD r20, r12
    STORE r20, r14
    LDI r14, 84
    ADD r20, r12
    STORE r20, r14
    LDI r14, 0
    ADD r20, r12
    STORE r20, r14
    LDI r12, 2
    LDI r14, 2
    LDI r2, 0x520
    TEXT r12, r14, r2

do_frame:
    FRAME
    JMP main_loop
