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
;   r3  - constant 1
;   r15  - scratch
;   r0  - scratch
;   r14  - color
;   r4 - mouse X from MOUSEQ
;   r10 - mouse Y from MOUSEQ
;   r9 - hit query result
;   r20 - RAM pointer
;   r21 - scratch for color index
;
; NOTE: Avoid colons in comments (assembler pitfall)

#define COLOR   0x400
#define PREV_X  0x404
#define PREV_Y  0x408
#define PAINT   0x40C

; ── INIT ──────────────────────────────────────
LDI r3, 1

; Default color = red
LDI r20, COLOR
LDI r15, 0xFF0000
STORE r20, r15

; Paint flag = 0
LDI r20, PAINT
LDI r15, 0
STORE r20, r15

; Fill screen dark (near-black)
LDI r15, 0x111111
FILL r15

; ── Register hit regions for palette buttons ──
; Palette is at bottom: y=240, 8 colors, each 30x14
; Color 0: Red at x=2
LDI r3, 2
LDI r15, 240
LDI r0, 30
LDI r13, 14
HITSET r3, r15, r0, r13, 1

; Color 1: Green at x=34
LDI r3, 34
LDI r15, 240
LDI r0, 30
LDI r13, 14
HITSET r3, r15, r0, r13, 2

; Color 2: Blue at x=66
LDI r3, 66
LDI r15, 240
LDI r0, 30
LDI r13, 14
HITSET r3, r15, r0, r13, 3

; Color 3: Yellow at x=98
LDI r3, 98
LDI r15, 240
LDI r0, 30
LDI r13, 14
HITSET r3, r15, r0, r13, 4

; Color 4: Cyan at x=130
LDI r3, 130
LDI r15, 240
LDI r0, 30
LDI r13, 14
HITSET r3, r15, r0, r13, 5

; Color 5: Magenta at x=162
LDI r3, 162
LDI r15, 240
LDI r0, 30
LDI r13, 14
HITSET r3, r15, r0, r13, 6

; Color 6: White at x=194
LDI r3, 194
LDI r15, 240
LDI r0, 30
LDI r13, 14
HITSET r3, r15, r0, r13, 7

; Color 7: Orange at x=226
LDI r3, 226
LDI r15, 240
LDI r0, 26
LDI r13, 14
HITSET r3, r15, r0, r13, 8

; Clear button at x=2, y=220, 40x16, id=99
LDI r3, 2
LDI r15, 220
LDI r0, 40
LDI r13, 16
HITSET r3, r15, r0, r13, 99

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r3, 1

    ; ── Read mouse position ──
    MOUSEQ r4
    ; r4 = mouse_x, r10 = mouse_y

    ; ── Check palette hit regions ──
    HITQ r9
    JZ r9, check_paint

    ; r9 = hit region id
    CMPI r9, 1
    JZ r2, set_red
    CMPI r9, 2
    JZ r2, set_green
    CMPI r9, 3
    JZ r2, set_blue
    CMPI r9, 4
    JZ r2, set_yellow
    CMPI r9, 5
    JZ r2, set_cyan
    CMPI r9, 6
    JZ r2, set_magenta
    CMPI r9, 7
    JZ r2, set_white
    CMPI r9, 8
    JZ r2, set_orange
    CMPI r9, 99
    JZ r2, do_clear
    JMP check_paint

set_red:
    LDI r20, COLOR
    LDI r15, 0xFF0000
    STORE r20, r15
    JMP draw_frame

set_green:
    LDI r20, COLOR
    LDI r15, 0x00FF00
    STORE r20, r15
    JMP draw_frame

set_blue:
    LDI r20, COLOR
    LDI r15, 0x0000FF
    STORE r20, r15
    JMP draw_frame

set_yellow:
    LDI r20, COLOR
    LDI r15, 0xFFFF00
    STORE r20, r15
    JMP draw_frame

set_cyan:
    LDI r20, COLOR
    LDI r15, 0x00FFFF
    STORE r20, r15
    JMP draw_frame

set_magenta:
    LDI r20, COLOR
    LDI r15, 0xFF00FF
    STORE r20, r15
    JMP draw_frame

set_white:
    LDI r20, COLOR
    LDI r15, 0xFFFFFF
    STORE r20, r15
    JMP draw_frame

set_orange:
    LDI r20, COLOR
    LDI r15, 0xFF8800
    STORE r20, r15
    JMP draw_frame

do_clear:
    ; Clear canvas area (keep palette)
    LDI r15, 0x111111
    FILL r15
    LDI r20, PAINT
    LDI r15, 0
    STORE r20, r15
    LDI r20, PREV_X
    LDI r15, 0
    STORE r20, r15
    LDI r20, PREV_Y
    LDI r15, 0
    STORE r20, r15
    JMP draw_frame

check_paint:
    LDI r3, 1
    ; Check if mouse is in paint area (y < 220)
    CMPI r10, 220
    BGE r2, draw_frame

    ; Mouse is in paint area -- draw pixel at mouse pos
    LDI r20, COLOR
    LOAD r14, r20

    ; Paint pixel at current mouse position
    PSET r4, r10, r14

    ; Also paint pixels between previous and current pos (line fill)
    ; Simple approach -- just paint prev pos too for continuity
    LDI r20, PREV_X
    LOAD r15, r20
    CMPI r15, 0
    JZ r2, save_pos

    LDI r20, PREV_Y
    LOAD r0, r20
    PSET r15, r0, r14

save_pos:
    LDI r20, PREV_X
    STORE r20, r4
    LDI r20, PREV_Y
    STORE r20, r10

    ; Set paint flag
    LDI r20, PAINT
    LDI r15, 1
    STORE r20, r15

    JMP draw_frame

draw_frame:
    LDI r3, 1

    ; ── Draw palette background bar ──
    LDI r3, 0
    LDI r15, 238
    LDI r0, 256
    LDI r13, 18
    LDI r14, 0x222222
    RECTF r3, r15, r0, r13, r14

    ; ── Highlight selected color (drawn BEFORE swatches so they appear on top) ──
    LDI r20, COLOR
    LOAD r14, r20
    CMPI r14, 0xFF0000
    JNZ r2, chk_grn
    LDI r3, 1
    LDI r15, 239
    LDI r0, 32
    LDI r13, 16
    LDI r5, 0xFFFFFF
    RECTF r3, r15, r0, r13, r5
    JMP draw_swatches

chk_grn:
    CMPI r14, 0x00FF00
    JNZ r2, chk_blu
    LDI r3, 33
    LDI r15, 239
    LDI r0, 32
    LDI r13, 16
    LDI r5, 0xFFFFFF
    RECTF r3, r15, r0, r13, r5
    JMP draw_swatches

chk_blu:
    CMPI r14, 0x0000FF
    JNZ r2, chk_yel
    LDI r3, 65
    LDI r15, 239
    LDI r0, 32
    LDI r13, 16
    LDI r5, 0xFFFFFF
    RECTF r3, r15, r0, r13, r5
    JMP draw_swatches

chk_yel:
    CMPI r14, 0xFFFF00
    JNZ r2, chk_cya
    LDI r3, 97
    LDI r15, 239
    LDI r0, 32
    LDI r13, 16
    LDI r5, 0xFFFFFF
    RECTF r3, r15, r0, r13, r5
    JMP draw_swatches

chk_cya:
    CMPI r14, 0x00FFFF
    JNZ r2, chk_mag
    LDI r3, 129
    LDI r15, 239
    LDI r0, 32
    LDI r13, 16
    LDI r5, 0xFFFFFF
    RECTF r3, r15, r0, r13, r5
    JMP draw_swatches

chk_mag:
    CMPI r14, 0xFF00FF
    JNZ r2, chk_wht
    LDI r3, 161
    LDI r15, 239
    LDI r0, 32
    LDI r13, 16
    LDI r5, 0xFFFFFF
    RECTF r3, r15, r0, r13, r5
    JMP draw_swatches

chk_wht:
    CMPI r14, 0xFFFFFF
    JNZ r2, chk_org
    LDI r3, 193
    LDI r15, 239
    LDI r0, 32
    LDI r13, 16
    LDI r5, 0x888888
    RECTF r3, r15, r0, r13, r5
    JMP draw_swatches

chk_org:
    CMPI r14, 0xFF8800
    JNZ r2, draw_swatches
    LDI r3, 225
    LDI r15, 239
    LDI r0, 28
    LDI r13, 16
    LDI r5, 0xFFFFFF
    RECTF r3, r15, r0, r13, r5

draw_swatches:
    ; ── Draw color swatches (on top of highlight) ──
    ; Red (id=1)
    LDI r3, 2
    LDI r15, 240
    LDI r0, 30
    LDI r13, 14
    LDI r14, 0xFF0000
    RECTF r3, r15, r0, r13, r14

    ; Green (id=2)
    LDI r3, 34
    LDI r14, 0x00FF00
    RECTF r3, r15, r0, r13, r14

    ; Blue (id=3)
    LDI r3, 66
    LDI r14, 0x0000FF
    RECTF r3, r15, r0, r13, r14

    ; Yellow (id=4)
    LDI r3, 98
    LDI r14, 0xFFFF00
    RECTF r3, r15, r0, r13, r14

    ; Cyan (id=5)
    LDI r3, 130
    LDI r14, 0x00FFFF
    RECTF r3, r15, r0, r13, r14

    ; Magenta (id=6)
    LDI r3, 162
    LDI r14, 0xFF00FF
    RECTF r3, r15, r0, r13, r14

    ; White (id=7)
    LDI r3, 194
    LDI r14, 0xFFFFFF
    RECTF r3, r15, r0, r13, r14

    ; Orange (id=8)
    LDI r3, 226
    LDI r0, 26
    LDI r14, 0xFF8800
    RECTF r3, r15, r0, r13, r14

    ; ── Draw Clear button ──
    LDI r3, 2
    LDI r15, 220
    LDI r0, 40
    LDI r13, 16
    LDI r14, 0x555555
    RECTF r3, r15, r0, r13, r14

    ; "CLR" label on clear button
    LDI r20, 0x500
    LDI r15, 67
    STORE r20, r15
    LDI r15, 76
    ADD r20, r3
    STORE r20, r15
    LDI r15, 82
    ADD r20, r3
    STORE r20, r15
    LDI r15, 0
    ADD r20, r3
    STORE r20, r15
    LDI r3, 10
    LDI r15, 224
    LDI r0, 0x500
    TEXT r3, r15, r0

    ; ── Draw title ──
    LDI r3, 1
    LDI r20, 0x520
    LDI r15, 80
    STORE r20, r15
    LDI r15, 65
    ADD r20, r3
    STORE r20, r15
    LDI r15, 73
    ADD r20, r3
    STORE r20, r15
    LDI r15, 78
    ADD r20, r3
    STORE r20, r15
    LDI r15, 84
    ADD r20, r3
    STORE r20, r15
    LDI r15, 0
    ADD r20, r3
    STORE r20, r15
    LDI r3, 2
    LDI r15, 2
    LDI r0, 0x520
    TEXT r3, r15, r0

do_frame:
    FRAME
    JMP main_loop
