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
;   r5  - constant 1
;   r0  - scratch
;   r13  - scratch
;   r9  - color
;   r6 - mouse X from MOUSEQ
;   r4 - mouse Y from MOUSEQ
;   r8 - hit query result
;   r20 - RAM pointer
;   r21 - scratch for color index
;
; NOTE: Avoid colons in comments (assembler pitfall)

#define COLOR   0x400
#define PREV_X  0x404
#define PREV_Y  0x408
#define PAINT   0x40C

; ── INIT ──────────────────────────────────────
LDI r5, 1

; Default color = red
LDI r20, COLOR
LDI r0, 0xFF0000
STORE r20, r0

; Paint flag = 0
LDI r20, PAINT
LDI r0, 0
STORE r20, r0

; Fill screen dark (near-black)
LDI r0, 0x111111
FILL r0

; ── Register hit regions for palette buttons ──
; Palette is at bottom: y=240, 8 colors, each 30x14
; Color 0: Red at x=2
LDI r5, 2
LDI r0, 240
LDI r13, 30
LDI r1, 14
HITSET r5, r0, r13, r1, 1

; Color 1: Green at x=34
LDI r5, 34
LDI r0, 240
LDI r13, 30
LDI r1, 14
HITSET r5, r0, r13, r1, 2

; Color 2: Blue at x=66
LDI r5, 66
LDI r0, 240
LDI r13, 30
LDI r1, 14
HITSET r5, r0, r13, r1, 3

; Color 3: Yellow at x=98
LDI r5, 98
LDI r0, 240
LDI r13, 30
LDI r1, 14
HITSET r5, r0, r13, r1, 4

; Color 4: Cyan at x=130
LDI r5, 130
LDI r0, 240
LDI r13, 30
LDI r1, 14
HITSET r5, r0, r13, r1, 5

; Color 5: Magenta at x=162
LDI r5, 162
LDI r0, 240
LDI r13, 30
LDI r1, 14
HITSET r5, r0, r13, r1, 6

; Color 6: White at x=194
LDI r5, 194
LDI r0, 240
LDI r13, 30
LDI r1, 14
HITSET r5, r0, r13, r1, 7

; Color 7: Orange at x=226
LDI r5, 226
LDI r0, 240
LDI r13, 26
LDI r1, 14
HITSET r5, r0, r13, r1, 8

; Clear button at x=2, y=220, 40x16, id=99
LDI r5, 2
LDI r0, 220
LDI r13, 40
LDI r1, 16
HITSET r5, r0, r13, r1, 99

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r5, 1

    ; ── Read mouse position ──
    MOUSEQ r6
    ; r6 = mouse_x, r4 = mouse_y

    ; ── Check palette hit regions ──
    HITQ r8
    JZ r8, check_paint

    ; r8 = hit region id
    CMPI r8, 1
    JZ r12, set_red
    CMPI r8, 2
    JZ r12, set_green
    CMPI r8, 3
    JZ r12, set_blue
    CMPI r8, 4
    JZ r12, set_yellow
    CMPI r8, 5
    JZ r12, set_cyan
    CMPI r8, 6
    JZ r12, set_magenta
    CMPI r8, 7
    JZ r12, set_white
    CMPI r8, 8
    JZ r12, set_orange
    CMPI r8, 99
    JZ r12, do_clear
    JMP check_paint

set_red:
    LDI r20, COLOR
    LDI r0, 0xFF0000
    STORE r20, r0
    JMP draw_frame

set_green:
    LDI r20, COLOR
    LDI r0, 0x00FF00
    STORE r20, r0
    JMP draw_frame

set_blue:
    LDI r20, COLOR
    LDI r0, 0x0000FF
    STORE r20, r0
    JMP draw_frame

set_yellow:
    LDI r20, COLOR
    LDI r0, 0xFFFF00
    STORE r20, r0
    JMP draw_frame

set_cyan:
    LDI r20, COLOR
    LDI r0, 0x00FFFF
    STORE r20, r0
    JMP draw_frame

set_magenta:
    LDI r20, COLOR
    LDI r0, 0xFF00FF
    STORE r20, r0
    JMP draw_frame

set_white:
    LDI r20, COLOR
    LDI r0, 0xFFFFFF
    STORE r20, r0
    JMP draw_frame

set_orange:
    LDI r20, COLOR
    LDI r0, 0xFF8800
    STORE r20, r0
    JMP draw_frame

do_clear:
    ; Clear canvas area (keep palette)
    LDI r0, 0x111111
    FILL r0
    LDI r20, PAINT
    LDI r0, 0
    STORE r20, r0
    LDI r20, PREV_X
    LDI r0, 0
    STORE r20, r0
    LDI r20, PREV_Y
    LDI r0, 0
    STORE r20, r0
    JMP draw_frame

check_paint:
    LDI r5, 1
    ; Check if mouse is in paint area (y < 220)
    CMPI r4, 220
    BGE r12, draw_frame

    ; Mouse is in paint area -- draw pixel at mouse pos
    LDI r20, COLOR
    LOAD r9, r20

    ; Paint pixel at current mouse position
    PSET r6, r4, r9

    ; Also paint pixels between previous and current pos (line fill)
    ; Simple approach -- just paint prev pos too for continuity
    LDI r20, PREV_X
    LOAD r0, r20
    CMPI r0, 0
    JZ r12, save_pos

    LDI r20, PREV_Y
    LOAD r13, r20
    PSET r0, r13, r9

save_pos:
    LDI r20, PREV_X
    STORE r20, r6
    LDI r20, PREV_Y
    STORE r20, r4

    ; Set paint flag
    LDI r20, PAINT
    LDI r0, 1
    STORE r20, r0

    JMP draw_frame

draw_frame:
    LDI r5, 1

    ; ── Draw palette background bar ──
    LDI r5, 0
    LDI r0, 238
    LDI r13, 256
    LDI r1, 18
    LDI r9, 0x222222
    RECTF r5, r0, r13, r1, r9

    ; ── Highlight selected color (drawn BEFORE swatches so they appear on top) ──
    LDI r20, COLOR
    LOAD r9, r20
    CMPI r9, 0xFF0000
    JNZ r12, chk_grn
    LDI r5, 1
    LDI r0, 239
    LDI r13, 32
    LDI r1, 16
    LDI r14, 0xFFFFFF
    RECTF r5, r0, r13, r1, r14
    JMP draw_swatches

chk_grn:
    CMPI r9, 0x00FF00
    JNZ r12, chk_blu
    LDI r5, 33
    LDI r0, 239
    LDI r13, 32
    LDI r1, 16
    LDI r14, 0xFFFFFF
    RECTF r5, r0, r13, r1, r14
    JMP draw_swatches

chk_blu:
    CMPI r9, 0x0000FF
    JNZ r12, chk_yel
    LDI r5, 65
    LDI r0, 239
    LDI r13, 32
    LDI r1, 16
    LDI r14, 0xFFFFFF
    RECTF r5, r0, r13, r1, r14
    JMP draw_swatches

chk_yel:
    CMPI r9, 0xFFFF00
    JNZ r12, chk_cya
    LDI r5, 97
    LDI r0, 239
    LDI r13, 32
    LDI r1, 16
    LDI r14, 0xFFFFFF
    RECTF r5, r0, r13, r1, r14
    JMP draw_swatches

chk_cya:
    CMPI r9, 0x00FFFF
    JNZ r12, chk_mag
    LDI r5, 129
    LDI r0, 239
    LDI r13, 32
    LDI r1, 16
    LDI r14, 0xFFFFFF
    RECTF r5, r0, r13, r1, r14
    JMP draw_swatches

chk_mag:
    CMPI r9, 0xFF00FF
    JNZ r12, chk_wht
    LDI r5, 161
    LDI r0, 239
    LDI r13, 32
    LDI r1, 16
    LDI r14, 0xFFFFFF
    RECTF r5, r0, r13, r1, r14
    JMP draw_swatches

chk_wht:
    CMPI r9, 0xFFFFFF
    JNZ r12, chk_org
    LDI r5, 193
    LDI r0, 239
    LDI r13, 32
    LDI r1, 16
    LDI r14, 0x888888
    RECTF r5, r0, r13, r1, r14
    JMP draw_swatches

chk_org:
    CMPI r9, 0xFF8800
    JNZ r12, draw_swatches
    LDI r5, 225
    LDI r0, 239
    LDI r13, 28
    LDI r1, 16
    LDI r14, 0xFFFFFF
    RECTF r5, r0, r13, r1, r14

draw_swatches:
    ; ── Draw color swatches (on top of highlight) ──
    ; Red (id=1)
    LDI r5, 2
    LDI r0, 240
    LDI r13, 30
    LDI r1, 14
    LDI r9, 0xFF0000
    RECTF r5, r0, r13, r1, r9

    ; Green (id=2)
    LDI r5, 34
    LDI r9, 0x00FF00
    RECTF r5, r0, r13, r1, r9

    ; Blue (id=3)
    LDI r5, 66
    LDI r9, 0x0000FF
    RECTF r5, r0, r13, r1, r9

    ; Yellow (id=4)
    LDI r5, 98
    LDI r9, 0xFFFF00
    RECTF r5, r0, r13, r1, r9

    ; Cyan (id=5)
    LDI r5, 130
    LDI r9, 0x00FFFF
    RECTF r5, r0, r13, r1, r9

    ; Magenta (id=6)
    LDI r5, 162
    LDI r9, 0xFF00FF
    RECTF r5, r0, r13, r1, r9

    ; White (id=7)
    LDI r5, 194
    LDI r9, 0xFFFFFF
    RECTF r5, r0, r13, r1, r9

    ; Orange (id=8)
    LDI r5, 226
    LDI r13, 26
    LDI r9, 0xFF8800
    RECTF r5, r0, r13, r1, r9

    ; ── Draw Clear button ──
    LDI r5, 2
    LDI r0, 220
    LDI r13, 40
    LDI r1, 16
    LDI r9, 0x555555
    RECTF r5, r0, r13, r1, r9

    ; "CLR" label on clear button
    LDI r20, 0x500
    LDI r0, 67
    STORE r20, r0
    LDI r0, 76
    ADD r20, r5
    STORE r20, r0
    LDI r0, 82
    ADD r20, r5
    STORE r20, r0
    LDI r0, 0
    ADD r20, r5
    STORE r20, r0
    LDI r5, 10
    LDI r0, 224
    LDI r13, 0x500
    TEXT r5, r0, r13

    ; ── Draw title ──
    LDI r5, 1
    LDI r20, 0x520
    LDI r0, 80
    STORE r20, r0
    LDI r0, 65
    ADD r20, r5
    STORE r20, r0
    LDI r0, 73
    ADD r20, r5
    STORE r20, r0
    LDI r0, 78
    ADD r20, r5
    STORE r20, r0
    LDI r0, 84
    ADD r20, r5
    STORE r20, r0
    LDI r0, 0
    ADD r20, r5
    STORE r20, r0
    LDI r5, 2
    LDI r0, 2
    LDI r13, 0x520
    TEXT r5, r0, r13

do_frame:
    FRAME
    JMP main_loop
