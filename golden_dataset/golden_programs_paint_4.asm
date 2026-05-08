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
;   r14  - constant 1
;   r4  - scratch
;   r8  - scratch
;   r9  - color
;   r1 - mouse X from MOUSEQ
;   r0 - mouse Y from MOUSEQ
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
LDI r14, 1

; Default color = red
LDI r20, COLOR
LDI r4, 0xFF0000
STORE r20, r4

; Paint flag = 0
LDI r20, PAINT
LDI r4, 0
STORE r20, r4

; Fill screen dark (near-black)
LDI r4, 0x111111
FILL r4

; ── Register hit regions for palette buttons ──
; Palette is at bottom: y=240, 8 colors, each 30x14
; Color 0: Red at x=2
LDI r14, 2
LDI r4, 240
LDI r8, 30
LDI r6, 14
HITSET r14, r4, r8, r6, 1

; Color 1: Green at x=34
LDI r14, 34
LDI r4, 240
LDI r8, 30
LDI r6, 14
HITSET r14, r4, r8, r6, 2

; Color 2: Blue at x=66
LDI r14, 66
LDI r4, 240
LDI r8, 30
LDI r6, 14
HITSET r14, r4, r8, r6, 3

; Color 3: Yellow at x=98
LDI r14, 98
LDI r4, 240
LDI r8, 30
LDI r6, 14
HITSET r14, r4, r8, r6, 4

; Color 4: Cyan at x=130
LDI r14, 130
LDI r4, 240
LDI r8, 30
LDI r6, 14
HITSET r14, r4, r8, r6, 5

; Color 5: Magenta at x=162
LDI r14, 162
LDI r4, 240
LDI r8, 30
LDI r6, 14
HITSET r14, r4, r8, r6, 6

; Color 6: White at x=194
LDI r14, 194
LDI r4, 240
LDI r8, 30
LDI r6, 14
HITSET r14, r4, r8, r6, 7

; Color 7: Orange at x=226
LDI r14, 226
LDI r4, 240
LDI r8, 26
LDI r6, 14
HITSET r14, r4, r8, r6, 8

; Clear button at x=2, y=220, 40x16, id=99
LDI r14, 2
LDI r4, 220
LDI r8, 40
LDI r6, 16
HITSET r14, r4, r8, r6, 99

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r14, 1

    ; ── Read mouse position ──
    MOUSEQ r1
    ; r1 = mouse_x, r0 = mouse_y

    ; ── Check palette hit regions ──
    HITQ r11
    JZ r11, check_paint

    ; r11 = hit region id
    CMPI r11, 1
    JZ r3, set_red
    CMPI r11, 2
    JZ r3, set_green
    CMPI r11, 3
    JZ r3, set_blue
    CMPI r11, 4
    JZ r3, set_yellow
    CMPI r11, 5
    JZ r3, set_cyan
    CMPI r11, 6
    JZ r3, set_magenta
    CMPI r11, 7
    JZ r3, set_white
    CMPI r11, 8
    JZ r3, set_orange
    CMPI r11, 99
    JZ r3, do_clear
    JMP check_paint

set_red:
    LDI r20, COLOR
    LDI r4, 0xFF0000
    STORE r20, r4
    JMP draw_frame

set_green:
    LDI r20, COLOR
    LDI r4, 0x00FF00
    STORE r20, r4
    JMP draw_frame

set_blue:
    LDI r20, COLOR
    LDI r4, 0x0000FF
    STORE r20, r4
    JMP draw_frame

set_yellow:
    LDI r20, COLOR
    LDI r4, 0xFFFF00
    STORE r20, r4
    JMP draw_frame

set_cyan:
    LDI r20, COLOR
    LDI r4, 0x00FFFF
    STORE r20, r4
    JMP draw_frame

set_magenta:
    LDI r20, COLOR
    LDI r4, 0xFF00FF
    STORE r20, r4
    JMP draw_frame

set_white:
    LDI r20, COLOR
    LDI r4, 0xFFFFFF
    STORE r20, r4
    JMP draw_frame

set_orange:
    LDI r20, COLOR
    LDI r4, 0xFF8800
    STORE r20, r4
    JMP draw_frame

do_clear:
    ; Clear canvas area (keep palette)
    LDI r4, 0x111111
    FILL r4
    LDI r20, PAINT
    LDI r4, 0
    STORE r20, r4
    LDI r20, PREV_X
    LDI r4, 0
    STORE r20, r4
    LDI r20, PREV_Y
    LDI r4, 0
    STORE r20, r4
    JMP draw_frame

check_paint:
    LDI r14, 1
    ; Check if mouse is in paint area (y < 220)
    CMPI r0, 220
    BGE r3, draw_frame

    ; Mouse is in paint area -- draw pixel at mouse pos
    LDI r20, COLOR
    LOAD r9, r20

    ; Paint pixel at current mouse position
    PSET r1, r0, r9

    ; Also paint pixels between previous and current pos (line fill)
    ; Simple approach -- just paint prev pos too for continuity
    LDI r20, PREV_X
    LOAD r4, r20
    CMPI r4, 0
    JZ r3, save_pos

    LDI r20, PREV_Y
    LOAD r8, r20
    PSET r4, r8, r9

save_pos:
    LDI r20, PREV_X
    STORE r20, r1
    LDI r20, PREV_Y
    STORE r20, r0

    ; Set paint flag
    LDI r20, PAINT
    LDI r4, 1
    STORE r20, r4

    JMP draw_frame

draw_frame:
    LDI r14, 1

    ; ── Draw palette background bar ──
    LDI r14, 0
    LDI r4, 238
    LDI r8, 256
    LDI r6, 18
    LDI r9, 0x222222
    RECTF r14, r4, r8, r6, r9

    ; ── Highlight selected color (drawn BEFORE swatches so they appear on top) ──
    LDI r20, COLOR
    LOAD r9, r20
    CMPI r9, 0xFF0000
    JNZ r3, chk_grn
    LDI r14, 1
    LDI r4, 239
    LDI r8, 32
    LDI r6, 16
    LDI r12, 0xFFFFFF
    RECTF r14, r4, r8, r6, r12
    JMP draw_swatches

chk_grn:
    CMPI r9, 0x00FF00
    JNZ r3, chk_blu
    LDI r14, 33
    LDI r4, 239
    LDI r8, 32
    LDI r6, 16
    LDI r12, 0xFFFFFF
    RECTF r14, r4, r8, r6, r12
    JMP draw_swatches

chk_blu:
    CMPI r9, 0x0000FF
    JNZ r3, chk_yel
    LDI r14, 65
    LDI r4, 239
    LDI r8, 32
    LDI r6, 16
    LDI r12, 0xFFFFFF
    RECTF r14, r4, r8, r6, r12
    JMP draw_swatches

chk_yel:
    CMPI r9, 0xFFFF00
    JNZ r3, chk_cya
    LDI r14, 97
    LDI r4, 239
    LDI r8, 32
    LDI r6, 16
    LDI r12, 0xFFFFFF
    RECTF r14, r4, r8, r6, r12
    JMP draw_swatches

chk_cya:
    CMPI r9, 0x00FFFF
    JNZ r3, chk_mag
    LDI r14, 129
    LDI r4, 239
    LDI r8, 32
    LDI r6, 16
    LDI r12, 0xFFFFFF
    RECTF r14, r4, r8, r6, r12
    JMP draw_swatches

chk_mag:
    CMPI r9, 0xFF00FF
    JNZ r3, chk_wht
    LDI r14, 161
    LDI r4, 239
    LDI r8, 32
    LDI r6, 16
    LDI r12, 0xFFFFFF
    RECTF r14, r4, r8, r6, r12
    JMP draw_swatches

chk_wht:
    CMPI r9, 0xFFFFFF
    JNZ r3, chk_org
    LDI r14, 193
    LDI r4, 239
    LDI r8, 32
    LDI r6, 16
    LDI r12, 0x888888
    RECTF r14, r4, r8, r6, r12
    JMP draw_swatches

chk_org:
    CMPI r9, 0xFF8800
    JNZ r3, draw_swatches
    LDI r14, 225
    LDI r4, 239
    LDI r8, 28
    LDI r6, 16
    LDI r12, 0xFFFFFF
    RECTF r14, r4, r8, r6, r12

draw_swatches:
    ; ── Draw color swatches (on top of highlight) ──
    ; Red (id=1)
    LDI r14, 2
    LDI r4, 240
    LDI r8, 30
    LDI r6, 14
    LDI r9, 0xFF0000
    RECTF r14, r4, r8, r6, r9

    ; Green (id=2)
    LDI r14, 34
    LDI r9, 0x00FF00
    RECTF r14, r4, r8, r6, r9

    ; Blue (id=3)
    LDI r14, 66
    LDI r9, 0x0000FF
    RECTF r14, r4, r8, r6, r9

    ; Yellow (id=4)
    LDI r14, 98
    LDI r9, 0xFFFF00
    RECTF r14, r4, r8, r6, r9

    ; Cyan (id=5)
    LDI r14, 130
    LDI r9, 0x00FFFF
    RECTF r14, r4, r8, r6, r9

    ; Magenta (id=6)
    LDI r14, 162
    LDI r9, 0xFF00FF
    RECTF r14, r4, r8, r6, r9

    ; White (id=7)
    LDI r14, 194
    LDI r9, 0xFFFFFF
    RECTF r14, r4, r8, r6, r9

    ; Orange (id=8)
    LDI r14, 226
    LDI r8, 26
    LDI r9, 0xFF8800
    RECTF r14, r4, r8, r6, r9

    ; ── Draw Clear button ──
    LDI r14, 2
    LDI r4, 220
    LDI r8, 40
    LDI r6, 16
    LDI r9, 0x555555
    RECTF r14, r4, r8, r6, r9

    ; "CLR" label on clear button
    LDI r20, 0x500
    LDI r4, 67
    STORE r20, r4
    LDI r4, 76
    ADD r20, r14
    STORE r20, r4
    LDI r4, 82
    ADD r20, r14
    STORE r20, r4
    LDI r4, 0
    ADD r20, r14
    STORE r20, r4
    LDI r14, 10
    LDI r4, 224
    LDI r8, 0x500
    TEXT r14, r4, r8

    ; ── Draw title ──
    LDI r14, 1
    LDI r20, 0x520
    LDI r4, 80
    STORE r20, r4
    LDI r4, 65
    ADD r20, r14
    STORE r20, r4
    LDI r4, 73
    ADD r20, r14
    STORE r20, r4
    LDI r4, 78
    ADD r20, r14
    STORE r20, r4
    LDI r4, 84
    ADD r20, r14
    STORE r20, r4
    LDI r4, 0
    ADD r20, r14
    STORE r20, r4
    LDI r14, 2
    LDI r4, 2
    LDI r8, 0x520
    TEXT r14, r4, r8

do_frame:
    FRAME
    JMP main_loop
