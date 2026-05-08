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
;   r11  - constant 1
;   r12  - scratch
;   r9  - scratch
;   r0  - color
;   r6 - mouse X from MOUSEQ
;   r4 - mouse Y from MOUSEQ
;   r3 - hit query result
;   r20 - RAM pointer
;   r21 - scratch for color index
;
; NOTE: Avoid colons in comments (assembler pitfall)

#define COLOR   0x400
#define PREV_X  0x404
#define PREV_Y  0x408
#define PAINT   0x40C

; ── INIT ──────────────────────────────────────
LDI r11, 1

; Default color = red
LDI r20, COLOR
LDI r12, 0xFF0000
STORE r20, r12

; Paint flag = 0
LDI r20, PAINT
LDI r12, 0
STORE r20, r12

; Fill screen dark (near-black)
LDI r12, 0x111111
FILL r12

; ── Register hit regions for palette buttons ──
; Palette is at bottom: y=240, 8 colors, each 30x14
; Color 0: Red at x=2
LDI r11, 2
LDI r12, 240
LDI r9, 30
LDI r10, 14
HITSET r11, r12, r9, r10, 1

; Color 1: Green at x=34
LDI r11, 34
LDI r12, 240
LDI r9, 30
LDI r10, 14
HITSET r11, r12, r9, r10, 2

; Color 2: Blue at x=66
LDI r11, 66
LDI r12, 240
LDI r9, 30
LDI r10, 14
HITSET r11, r12, r9, r10, 3

; Color 3: Yellow at x=98
LDI r11, 98
LDI r12, 240
LDI r9, 30
LDI r10, 14
HITSET r11, r12, r9, r10, 4

; Color 4: Cyan at x=130
LDI r11, 130
LDI r12, 240
LDI r9, 30
LDI r10, 14
HITSET r11, r12, r9, r10, 5

; Color 5: Magenta at x=162
LDI r11, 162
LDI r12, 240
LDI r9, 30
LDI r10, 14
HITSET r11, r12, r9, r10, 6

; Color 6: White at x=194
LDI r11, 194
LDI r12, 240
LDI r9, 30
LDI r10, 14
HITSET r11, r12, r9, r10, 7

; Color 7: Orange at x=226
LDI r11, 226
LDI r12, 240
LDI r9, 26
LDI r10, 14
HITSET r11, r12, r9, r10, 8

; Clear button at x=2, y=220, 40x16, id=99
LDI r11, 2
LDI r12, 220
LDI r9, 40
LDI r10, 16
HITSET r11, r12, r9, r10, 99

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r11, 1

    ; ── Read mouse position ──
    MOUSEQ r6
    ; r6 = mouse_x, r4 = mouse_y

    ; ── Check palette hit regions ──
    HITQ r3
    JZ r3, check_paint

    ; r3 = hit region id
    CMPI r3, 1
    JZ r2, set_red
    CMPI r3, 2
    JZ r2, set_green
    CMPI r3, 3
    JZ r2, set_blue
    CMPI r3, 4
    JZ r2, set_yellow
    CMPI r3, 5
    JZ r2, set_cyan
    CMPI r3, 6
    JZ r2, set_magenta
    CMPI r3, 7
    JZ r2, set_white
    CMPI r3, 8
    JZ r2, set_orange
    CMPI r3, 99
    JZ r2, do_clear
    JMP check_paint

set_red:
    LDI r20, COLOR
    LDI r12, 0xFF0000
    STORE r20, r12
    JMP draw_frame

set_green:
    LDI r20, COLOR
    LDI r12, 0x00FF00
    STORE r20, r12
    JMP draw_frame

set_blue:
    LDI r20, COLOR
    LDI r12, 0x0000FF
    STORE r20, r12
    JMP draw_frame

set_yellow:
    LDI r20, COLOR
    LDI r12, 0xFFFF00
    STORE r20, r12
    JMP draw_frame

set_cyan:
    LDI r20, COLOR
    LDI r12, 0x00FFFF
    STORE r20, r12
    JMP draw_frame

set_magenta:
    LDI r20, COLOR
    LDI r12, 0xFF00FF
    STORE r20, r12
    JMP draw_frame

set_white:
    LDI r20, COLOR
    LDI r12, 0xFFFFFF
    STORE r20, r12
    JMP draw_frame

set_orange:
    LDI r20, COLOR
    LDI r12, 0xFF8800
    STORE r20, r12
    JMP draw_frame

do_clear:
    ; Clear canvas area (keep palette)
    LDI r12, 0x111111
    FILL r12
    LDI r20, PAINT
    LDI r12, 0
    STORE r20, r12
    LDI r20, PREV_X
    LDI r12, 0
    STORE r20, r12
    LDI r20, PREV_Y
    LDI r12, 0
    STORE r20, r12
    JMP draw_frame

check_paint:
    LDI r11, 1
    ; Check if mouse is in paint area (y < 220)
    CMPI r4, 220
    BGE r2, draw_frame

    ; Mouse is in paint area -- draw pixel at mouse pos
    LDI r20, COLOR
    LOAD r0, r20

    ; Paint pixel at current mouse position
    PSET r6, r4, r0

    ; Also paint pixels between previous and current pos (line fill)
    ; Simple approach -- just paint prev pos too for continuity
    LDI r20, PREV_X
    LOAD r12, r20
    CMPI r12, 0
    JZ r2, save_pos

    LDI r20, PREV_Y
    LOAD r9, r20
    PSET r12, r9, r0

save_pos:
    LDI r20, PREV_X
    STORE r20, r6
    LDI r20, PREV_Y
    STORE r20, r4

    ; Set paint flag
    LDI r20, PAINT
    LDI r12, 1
    STORE r20, r12

    JMP draw_frame

draw_frame:
    LDI r11, 1

    ; ── Draw palette background bar ──
    LDI r11, 0
    LDI r12, 238
    LDI r9, 256
    LDI r10, 18
    LDI r0, 0x222222
    RECTF r11, r12, r9, r10, r0

    ; ── Highlight selected color (drawn BEFORE swatches so they appear on top) ──
    LDI r20, COLOR
    LOAD r0, r20
    CMPI r0, 0xFF0000
    JNZ r2, chk_grn
    LDI r11, 1
    LDI r12, 239
    LDI r9, 32
    LDI r10, 16
    LDI r7, 0xFFFFFF
    RECTF r11, r12, r9, r10, r7
    JMP draw_swatches

chk_grn:
    CMPI r0, 0x00FF00
    JNZ r2, chk_blu
    LDI r11, 33
    LDI r12, 239
    LDI r9, 32
    LDI r10, 16
    LDI r7, 0xFFFFFF
    RECTF r11, r12, r9, r10, r7
    JMP draw_swatches

chk_blu:
    CMPI r0, 0x0000FF
    JNZ r2, chk_yel
    LDI r11, 65
    LDI r12, 239
    LDI r9, 32
    LDI r10, 16
    LDI r7, 0xFFFFFF
    RECTF r11, r12, r9, r10, r7
    JMP draw_swatches

chk_yel:
    CMPI r0, 0xFFFF00
    JNZ r2, chk_cya
    LDI r11, 97
    LDI r12, 239
    LDI r9, 32
    LDI r10, 16
    LDI r7, 0xFFFFFF
    RECTF r11, r12, r9, r10, r7
    JMP draw_swatches

chk_cya:
    CMPI r0, 0x00FFFF
    JNZ r2, chk_mag
    LDI r11, 129
    LDI r12, 239
    LDI r9, 32
    LDI r10, 16
    LDI r7, 0xFFFFFF
    RECTF r11, r12, r9, r10, r7
    JMP draw_swatches

chk_mag:
    CMPI r0, 0xFF00FF
    JNZ r2, chk_wht
    LDI r11, 161
    LDI r12, 239
    LDI r9, 32
    LDI r10, 16
    LDI r7, 0xFFFFFF
    RECTF r11, r12, r9, r10, r7
    JMP draw_swatches

chk_wht:
    CMPI r0, 0xFFFFFF
    JNZ r2, chk_org
    LDI r11, 193
    LDI r12, 239
    LDI r9, 32
    LDI r10, 16
    LDI r7, 0x888888
    RECTF r11, r12, r9, r10, r7
    JMP draw_swatches

chk_org:
    CMPI r0, 0xFF8800
    JNZ r2, draw_swatches
    LDI r11, 225
    LDI r12, 239
    LDI r9, 28
    LDI r10, 16
    LDI r7, 0xFFFFFF
    RECTF r11, r12, r9, r10, r7

draw_swatches:
    ; ── Draw color swatches (on top of highlight) ──
    ; Red (id=1)
    LDI r11, 2
    LDI r12, 240
    LDI r9, 30
    LDI r10, 14
    LDI r0, 0xFF0000
    RECTF r11, r12, r9, r10, r0

    ; Green (id=2)
    LDI r11, 34
    LDI r0, 0x00FF00
    RECTF r11, r12, r9, r10, r0

    ; Blue (id=3)
    LDI r11, 66
    LDI r0, 0x0000FF
    RECTF r11, r12, r9, r10, r0

    ; Yellow (id=4)
    LDI r11, 98
    LDI r0, 0xFFFF00
    RECTF r11, r12, r9, r10, r0

    ; Cyan (id=5)
    LDI r11, 130
    LDI r0, 0x00FFFF
    RECTF r11, r12, r9, r10, r0

    ; Magenta (id=6)
    LDI r11, 162
    LDI r0, 0xFF00FF
    RECTF r11, r12, r9, r10, r0

    ; White (id=7)
    LDI r11, 194
    LDI r0, 0xFFFFFF
    RECTF r11, r12, r9, r10, r0

    ; Orange (id=8)
    LDI r11, 226
    LDI r9, 26
    LDI r0, 0xFF8800
    RECTF r11, r12, r9, r10, r0

    ; ── Draw Clear button ──
    LDI r11, 2
    LDI r12, 220
    LDI r9, 40
    LDI r10, 16
    LDI r0, 0x555555
    RECTF r11, r12, r9, r10, r0

    ; "CLR" label on clear button
    LDI r20, 0x500
    LDI r12, 67
    STORE r20, r12
    LDI r12, 76
    ADD r20, r11
    STORE r20, r12
    LDI r12, 82
    ADD r20, r11
    STORE r20, r12
    LDI r12, 0
    ADD r20, r11
    STORE r20, r12
    LDI r11, 10
    LDI r12, 224
    LDI r9, 0x500
    TEXT r11, r12, r9

    ; ── Draw title ──
    LDI r11, 1
    LDI r20, 0x520
    LDI r12, 80
    STORE r20, r12
    LDI r12, 65
    ADD r20, r11
    STORE r20, r12
    LDI r12, 73
    ADD r20, r11
    STORE r20, r12
    LDI r12, 78
    ADD r20, r11
    STORE r20, r12
    LDI r12, 84
    ADD r20, r11
    STORE r20, r12
    LDI r12, 0
    ADD r20, r11
    STORE r20, r12
    LDI r11, 2
    LDI r12, 2
    LDI r9, 0x520
    TEXT r11, r12, r9

do_frame:
    FRAME
    JMP main_loop
