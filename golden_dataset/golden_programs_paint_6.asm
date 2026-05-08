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
;   r4  - constant 1
;   r11  - scratch
;   r0  - scratch
;   r8  - color
;   r6 - mouse X from MOUSEQ
;   r7 - mouse Y from MOUSEQ
;   r2 - hit query result
;   r20 - RAM pointer
;   r21 - scratch for color index
;
; NOTE: Avoid colons in comments (assembler pitfall)

#define COLOR   0x400
#define PREV_X  0x404
#define PREV_Y  0x408
#define PAINT   0x40C

; ── INIT ──────────────────────────────────────
LDI r4, 1

; Default color = red
LDI r20, COLOR
LDI r11, 0xFF0000
STORE r20, r11

; Paint flag = 0
LDI r20, PAINT
LDI r11, 0
STORE r20, r11

; Fill screen dark (near-black)
LDI r11, 0x111111
FILL r11

; ── Register hit regions for palette buttons ──
; Palette is at bottom: y=240, 8 colors, each 30x14
; Color 0: Red at x=2
LDI r4, 2
LDI r11, 240
LDI r0, 30
LDI r1, 14
HITSET r4, r11, r0, r1, 1

; Color 1: Green at x=34
LDI r4, 34
LDI r11, 240
LDI r0, 30
LDI r1, 14
HITSET r4, r11, r0, r1, 2

; Color 2: Blue at x=66
LDI r4, 66
LDI r11, 240
LDI r0, 30
LDI r1, 14
HITSET r4, r11, r0, r1, 3

; Color 3: Yellow at x=98
LDI r4, 98
LDI r11, 240
LDI r0, 30
LDI r1, 14
HITSET r4, r11, r0, r1, 4

; Color 4: Cyan at x=130
LDI r4, 130
LDI r11, 240
LDI r0, 30
LDI r1, 14
HITSET r4, r11, r0, r1, 5

; Color 5: Magenta at x=162
LDI r4, 162
LDI r11, 240
LDI r0, 30
LDI r1, 14
HITSET r4, r11, r0, r1, 6

; Color 6: White at x=194
LDI r4, 194
LDI r11, 240
LDI r0, 30
LDI r1, 14
HITSET r4, r11, r0, r1, 7

; Color 7: Orange at x=226
LDI r4, 226
LDI r11, 240
LDI r0, 26
LDI r1, 14
HITSET r4, r11, r0, r1, 8

; Clear button at x=2, y=220, 40x16, id=99
LDI r4, 2
LDI r11, 220
LDI r0, 40
LDI r1, 16
HITSET r4, r11, r0, r1, 99

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r4, 1

    ; ── Read mouse position ──
    MOUSEQ r6
    ; r6 = mouse_x, r7 = mouse_y

    ; ── Check palette hit regions ──
    HITQ r2
    JZ r2, check_paint

    ; r2 = hit region id
    CMPI r2, 1
    JZ r15, set_red
    CMPI r2, 2
    JZ r15, set_green
    CMPI r2, 3
    JZ r15, set_blue
    CMPI r2, 4
    JZ r15, set_yellow
    CMPI r2, 5
    JZ r15, set_cyan
    CMPI r2, 6
    JZ r15, set_magenta
    CMPI r2, 7
    JZ r15, set_white
    CMPI r2, 8
    JZ r15, set_orange
    CMPI r2, 99
    JZ r15, do_clear
    JMP check_paint

set_red:
    LDI r20, COLOR
    LDI r11, 0xFF0000
    STORE r20, r11
    JMP draw_frame

set_green:
    LDI r20, COLOR
    LDI r11, 0x00FF00
    STORE r20, r11
    JMP draw_frame

set_blue:
    LDI r20, COLOR
    LDI r11, 0x0000FF
    STORE r20, r11
    JMP draw_frame

set_yellow:
    LDI r20, COLOR
    LDI r11, 0xFFFF00
    STORE r20, r11
    JMP draw_frame

set_cyan:
    LDI r20, COLOR
    LDI r11, 0x00FFFF
    STORE r20, r11
    JMP draw_frame

set_magenta:
    LDI r20, COLOR
    LDI r11, 0xFF00FF
    STORE r20, r11
    JMP draw_frame

set_white:
    LDI r20, COLOR
    LDI r11, 0xFFFFFF
    STORE r20, r11
    JMP draw_frame

set_orange:
    LDI r20, COLOR
    LDI r11, 0xFF8800
    STORE r20, r11
    JMP draw_frame

do_clear:
    ; Clear canvas area (keep palette)
    LDI r11, 0x111111
    FILL r11
    LDI r20, PAINT
    LDI r11, 0
    STORE r20, r11
    LDI r20, PREV_X
    LDI r11, 0
    STORE r20, r11
    LDI r20, PREV_Y
    LDI r11, 0
    STORE r20, r11
    JMP draw_frame

check_paint:
    LDI r4, 1
    ; Check if mouse is in paint area (y < 220)
    CMPI r7, 220
    BGE r15, draw_frame

    ; Mouse is in paint area -- draw pixel at mouse pos
    LDI r20, COLOR
    LOAD r8, r20

    ; Paint pixel at current mouse position
    PSET r6, r7, r8

    ; Also paint pixels between previous and current pos (line fill)
    ; Simple approach -- just paint prev pos too for continuity
    LDI r20, PREV_X
    LOAD r11, r20
    CMPI r11, 0
    JZ r15, save_pos

    LDI r20, PREV_Y
    LOAD r0, r20
    PSET r11, r0, r8

save_pos:
    LDI r20, PREV_X
    STORE r20, r6
    LDI r20, PREV_Y
    STORE r20, r7

    ; Set paint flag
    LDI r20, PAINT
    LDI r11, 1
    STORE r20, r11

    JMP draw_frame

draw_frame:
    LDI r4, 1

    ; ── Draw palette background bar ──
    LDI r4, 0
    LDI r11, 238
    LDI r0, 256
    LDI r1, 18
    LDI r8, 0x222222
    RECTF r4, r11, r0, r1, r8

    ; ── Highlight selected color (drawn BEFORE swatches so they appear on top) ──
    LDI r20, COLOR
    LOAD r8, r20
    CMPI r8, 0xFF0000
    JNZ r15, chk_grn
    LDI r4, 1
    LDI r11, 239
    LDI r0, 32
    LDI r1, 16
    LDI r12, 0xFFFFFF
    RECTF r4, r11, r0, r1, r12
    JMP draw_swatches

chk_grn:
    CMPI r8, 0x00FF00
    JNZ r15, chk_blu
    LDI r4, 33
    LDI r11, 239
    LDI r0, 32
    LDI r1, 16
    LDI r12, 0xFFFFFF
    RECTF r4, r11, r0, r1, r12
    JMP draw_swatches

chk_blu:
    CMPI r8, 0x0000FF
    JNZ r15, chk_yel
    LDI r4, 65
    LDI r11, 239
    LDI r0, 32
    LDI r1, 16
    LDI r12, 0xFFFFFF
    RECTF r4, r11, r0, r1, r12
    JMP draw_swatches

chk_yel:
    CMPI r8, 0xFFFF00
    JNZ r15, chk_cya
    LDI r4, 97
    LDI r11, 239
    LDI r0, 32
    LDI r1, 16
    LDI r12, 0xFFFFFF
    RECTF r4, r11, r0, r1, r12
    JMP draw_swatches

chk_cya:
    CMPI r8, 0x00FFFF
    JNZ r15, chk_mag
    LDI r4, 129
    LDI r11, 239
    LDI r0, 32
    LDI r1, 16
    LDI r12, 0xFFFFFF
    RECTF r4, r11, r0, r1, r12
    JMP draw_swatches

chk_mag:
    CMPI r8, 0xFF00FF
    JNZ r15, chk_wht
    LDI r4, 161
    LDI r11, 239
    LDI r0, 32
    LDI r1, 16
    LDI r12, 0xFFFFFF
    RECTF r4, r11, r0, r1, r12
    JMP draw_swatches

chk_wht:
    CMPI r8, 0xFFFFFF
    JNZ r15, chk_org
    LDI r4, 193
    LDI r11, 239
    LDI r0, 32
    LDI r1, 16
    LDI r12, 0x888888
    RECTF r4, r11, r0, r1, r12
    JMP draw_swatches

chk_org:
    CMPI r8, 0xFF8800
    JNZ r15, draw_swatches
    LDI r4, 225
    LDI r11, 239
    LDI r0, 28
    LDI r1, 16
    LDI r12, 0xFFFFFF
    RECTF r4, r11, r0, r1, r12

draw_swatches:
    ; ── Draw color swatches (on top of highlight) ──
    ; Red (id=1)
    LDI r4, 2
    LDI r11, 240
    LDI r0, 30
    LDI r1, 14
    LDI r8, 0xFF0000
    RECTF r4, r11, r0, r1, r8

    ; Green (id=2)
    LDI r4, 34
    LDI r8, 0x00FF00
    RECTF r4, r11, r0, r1, r8

    ; Blue (id=3)
    LDI r4, 66
    LDI r8, 0x0000FF
    RECTF r4, r11, r0, r1, r8

    ; Yellow (id=4)
    LDI r4, 98
    LDI r8, 0xFFFF00
    RECTF r4, r11, r0, r1, r8

    ; Cyan (id=5)
    LDI r4, 130
    LDI r8, 0x00FFFF
    RECTF r4, r11, r0, r1, r8

    ; Magenta (id=6)
    LDI r4, 162
    LDI r8, 0xFF00FF
    RECTF r4, r11, r0, r1, r8

    ; White (id=7)
    LDI r4, 194
    LDI r8, 0xFFFFFF
    RECTF r4, r11, r0, r1, r8

    ; Orange (id=8)
    LDI r4, 226
    LDI r0, 26
    LDI r8, 0xFF8800
    RECTF r4, r11, r0, r1, r8

    ; ── Draw Clear button ──
    LDI r4, 2
    LDI r11, 220
    LDI r0, 40
    LDI r1, 16
    LDI r8, 0x555555
    RECTF r4, r11, r0, r1, r8

    ; "CLR" label on clear button
    LDI r20, 0x500
    LDI r11, 67
    STORE r20, r11
    LDI r11, 76
    ADD r20, r4
    STORE r20, r11
    LDI r11, 82
    ADD r20, r4
    STORE r20, r11
    LDI r11, 0
    ADD r20, r4
    STORE r20, r11
    LDI r4, 10
    LDI r11, 224
    LDI r0, 0x500
    TEXT r4, r11, r0

    ; ── Draw title ──
    LDI r4, 1
    LDI r20, 0x520
    LDI r11, 80
    STORE r20, r11
    LDI r11, 65
    ADD r20, r4
    STORE r20, r11
    LDI r11, 73
    ADD r20, r4
    STORE r20, r11
    LDI r11, 78
    ADD r20, r4
    STORE r20, r11
    LDI r11, 84
    ADD r20, r4
    STORE r20, r11
    LDI r11, 0
    ADD r20, r4
    STORE r20, r11
    LDI r4, 2
    LDI r11, 2
    LDI r0, 0x520
    TEXT r4, r11, r0

do_frame:
    FRAME
    JMP main_loop
