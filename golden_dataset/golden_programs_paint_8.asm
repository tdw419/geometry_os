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
;   r8  - scratch
;   r15  - scratch
;   r9  - color
;   r0 - mouse X from MOUSEQ
;   r2 - mouse Y from MOUSEQ
;   r4 - hit query result
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
LDI r8, 0xFF0000
STORE r20, r8

; Paint flag = 0
LDI r20, PAINT
LDI r8, 0
STORE r20, r8

; Fill screen dark (near-black)
LDI r8, 0x111111
FILL r8

; ── Register hit regions for palette buttons ──
; Palette is at bottom: y=240, 8 colors, each 30x14
; Color 0: Red at x=2
LDI r12, 2
LDI r8, 240
LDI r15, 30
LDI r7, 14
HITSET r12, r8, r15, r7, 1

; Color 1: Green at x=34
LDI r12, 34
LDI r8, 240
LDI r15, 30
LDI r7, 14
HITSET r12, r8, r15, r7, 2

; Color 2: Blue at x=66
LDI r12, 66
LDI r8, 240
LDI r15, 30
LDI r7, 14
HITSET r12, r8, r15, r7, 3

; Color 3: Yellow at x=98
LDI r12, 98
LDI r8, 240
LDI r15, 30
LDI r7, 14
HITSET r12, r8, r15, r7, 4

; Color 4: Cyan at x=130
LDI r12, 130
LDI r8, 240
LDI r15, 30
LDI r7, 14
HITSET r12, r8, r15, r7, 5

; Color 5: Magenta at x=162
LDI r12, 162
LDI r8, 240
LDI r15, 30
LDI r7, 14
HITSET r12, r8, r15, r7, 6

; Color 6: White at x=194
LDI r12, 194
LDI r8, 240
LDI r15, 30
LDI r7, 14
HITSET r12, r8, r15, r7, 7

; Color 7: Orange at x=226
LDI r12, 226
LDI r8, 240
LDI r15, 26
LDI r7, 14
HITSET r12, r8, r15, r7, 8

; Clear button at x=2, y=220, 40x16, id=99
LDI r12, 2
LDI r8, 220
LDI r15, 40
LDI r7, 16
HITSET r12, r8, r15, r7, 99

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r12, 1

    ; ── Read mouse position ──
    MOUSEQ r0
    ; r0 = mouse_x, r2 = mouse_y

    ; ── Check palette hit regions ──
    HITQ r4
    JZ r4, check_paint

    ; r4 = hit region id
    CMPI r4, 1
    JZ r5, set_red
    CMPI r4, 2
    JZ r5, set_green
    CMPI r4, 3
    JZ r5, set_blue
    CMPI r4, 4
    JZ r5, set_yellow
    CMPI r4, 5
    JZ r5, set_cyan
    CMPI r4, 6
    JZ r5, set_magenta
    CMPI r4, 7
    JZ r5, set_white
    CMPI r4, 8
    JZ r5, set_orange
    CMPI r4, 99
    JZ r5, do_clear
    JMP check_paint

set_red:
    LDI r20, COLOR
    LDI r8, 0xFF0000
    STORE r20, r8
    JMP draw_frame

set_green:
    LDI r20, COLOR
    LDI r8, 0x00FF00
    STORE r20, r8
    JMP draw_frame

set_blue:
    LDI r20, COLOR
    LDI r8, 0x0000FF
    STORE r20, r8
    JMP draw_frame

set_yellow:
    LDI r20, COLOR
    LDI r8, 0xFFFF00
    STORE r20, r8
    JMP draw_frame

set_cyan:
    LDI r20, COLOR
    LDI r8, 0x00FFFF
    STORE r20, r8
    JMP draw_frame

set_magenta:
    LDI r20, COLOR
    LDI r8, 0xFF00FF
    STORE r20, r8
    JMP draw_frame

set_white:
    LDI r20, COLOR
    LDI r8, 0xFFFFFF
    STORE r20, r8
    JMP draw_frame

set_orange:
    LDI r20, COLOR
    LDI r8, 0xFF8800
    STORE r20, r8
    JMP draw_frame

do_clear:
    ; Clear canvas area (keep palette)
    LDI r8, 0x111111
    FILL r8
    LDI r20, PAINT
    LDI r8, 0
    STORE r20, r8
    LDI r20, PREV_X
    LDI r8, 0
    STORE r20, r8
    LDI r20, PREV_Y
    LDI r8, 0
    STORE r20, r8
    JMP draw_frame

check_paint:
    LDI r12, 1
    ; Check if mouse is in paint area (y < 220)
    CMPI r2, 220
    BGE r5, draw_frame

    ; Mouse is in paint area -- draw pixel at mouse pos
    LDI r20, COLOR
    LOAD r9, r20

    ; Paint pixel at current mouse position
    PSET r0, r2, r9

    ; Also paint pixels between previous and current pos (line fill)
    ; Simple approach -- just paint prev pos too for continuity
    LDI r20, PREV_X
    LOAD r8, r20
    CMPI r8, 0
    JZ r5, save_pos

    LDI r20, PREV_Y
    LOAD r15, r20
    PSET r8, r15, r9

save_pos:
    LDI r20, PREV_X
    STORE r20, r0
    LDI r20, PREV_Y
    STORE r20, r2

    ; Set paint flag
    LDI r20, PAINT
    LDI r8, 1
    STORE r20, r8

    JMP draw_frame

draw_frame:
    LDI r12, 1

    ; ── Draw palette background bar ──
    LDI r12, 0
    LDI r8, 238
    LDI r15, 256
    LDI r7, 18
    LDI r9, 0x222222
    RECTF r12, r8, r15, r7, r9

    ; ── Highlight selected color (drawn BEFORE swatches so they appear on top) ──
    LDI r20, COLOR
    LOAD r9, r20
    CMPI r9, 0xFF0000
    JNZ r5, chk_grn
    LDI r12, 1
    LDI r8, 239
    LDI r15, 32
    LDI r7, 16
    LDI r6, 0xFFFFFF
    RECTF r12, r8, r15, r7, r6
    JMP draw_swatches

chk_grn:
    CMPI r9, 0x00FF00
    JNZ r5, chk_blu
    LDI r12, 33
    LDI r8, 239
    LDI r15, 32
    LDI r7, 16
    LDI r6, 0xFFFFFF
    RECTF r12, r8, r15, r7, r6
    JMP draw_swatches

chk_blu:
    CMPI r9, 0x0000FF
    JNZ r5, chk_yel
    LDI r12, 65
    LDI r8, 239
    LDI r15, 32
    LDI r7, 16
    LDI r6, 0xFFFFFF
    RECTF r12, r8, r15, r7, r6
    JMP draw_swatches

chk_yel:
    CMPI r9, 0xFFFF00
    JNZ r5, chk_cya
    LDI r12, 97
    LDI r8, 239
    LDI r15, 32
    LDI r7, 16
    LDI r6, 0xFFFFFF
    RECTF r12, r8, r15, r7, r6
    JMP draw_swatches

chk_cya:
    CMPI r9, 0x00FFFF
    JNZ r5, chk_mag
    LDI r12, 129
    LDI r8, 239
    LDI r15, 32
    LDI r7, 16
    LDI r6, 0xFFFFFF
    RECTF r12, r8, r15, r7, r6
    JMP draw_swatches

chk_mag:
    CMPI r9, 0xFF00FF
    JNZ r5, chk_wht
    LDI r12, 161
    LDI r8, 239
    LDI r15, 32
    LDI r7, 16
    LDI r6, 0xFFFFFF
    RECTF r12, r8, r15, r7, r6
    JMP draw_swatches

chk_wht:
    CMPI r9, 0xFFFFFF
    JNZ r5, chk_org
    LDI r12, 193
    LDI r8, 239
    LDI r15, 32
    LDI r7, 16
    LDI r6, 0x888888
    RECTF r12, r8, r15, r7, r6
    JMP draw_swatches

chk_org:
    CMPI r9, 0xFF8800
    JNZ r5, draw_swatches
    LDI r12, 225
    LDI r8, 239
    LDI r15, 28
    LDI r7, 16
    LDI r6, 0xFFFFFF
    RECTF r12, r8, r15, r7, r6

draw_swatches:
    ; ── Draw color swatches (on top of highlight) ──
    ; Red (id=1)
    LDI r12, 2
    LDI r8, 240
    LDI r15, 30
    LDI r7, 14
    LDI r9, 0xFF0000
    RECTF r12, r8, r15, r7, r9

    ; Green (id=2)
    LDI r12, 34
    LDI r9, 0x00FF00
    RECTF r12, r8, r15, r7, r9

    ; Blue (id=3)
    LDI r12, 66
    LDI r9, 0x0000FF
    RECTF r12, r8, r15, r7, r9

    ; Yellow (id=4)
    LDI r12, 98
    LDI r9, 0xFFFF00
    RECTF r12, r8, r15, r7, r9

    ; Cyan (id=5)
    LDI r12, 130
    LDI r9, 0x00FFFF
    RECTF r12, r8, r15, r7, r9

    ; Magenta (id=6)
    LDI r12, 162
    LDI r9, 0xFF00FF
    RECTF r12, r8, r15, r7, r9

    ; White (id=7)
    LDI r12, 194
    LDI r9, 0xFFFFFF
    RECTF r12, r8, r15, r7, r9

    ; Orange (id=8)
    LDI r12, 226
    LDI r15, 26
    LDI r9, 0xFF8800
    RECTF r12, r8, r15, r7, r9

    ; ── Draw Clear button ──
    LDI r12, 2
    LDI r8, 220
    LDI r15, 40
    LDI r7, 16
    LDI r9, 0x555555
    RECTF r12, r8, r15, r7, r9

    ; "CLR" label on clear button
    LDI r20, 0x500
    LDI r8, 67
    STORE r20, r8
    LDI r8, 76
    ADD r20, r12
    STORE r20, r8
    LDI r8, 82
    ADD r20, r12
    STORE r20, r8
    LDI r8, 0
    ADD r20, r12
    STORE r20, r8
    LDI r12, 10
    LDI r8, 224
    LDI r15, 0x500
    TEXT r12, r8, r15

    ; ── Draw title ──
    LDI r12, 1
    LDI r20, 0x520
    LDI r8, 80
    STORE r20, r8
    LDI r8, 65
    ADD r20, r12
    STORE r20, r8
    LDI r8, 73
    ADD r20, r12
    STORE r20, r8
    LDI r8, 78
    ADD r20, r12
    STORE r20, r8
    LDI r8, 84
    ADD r20, r12
    STORE r20, r8
    LDI r8, 0
    ADD r20, r12
    STORE r20, r8
    LDI r12, 2
    LDI r8, 2
    LDI r15, 0x520
    TEXT r12, r8, r15

do_frame:
    FRAME
    JMP main_loop
