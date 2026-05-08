; DESCRIPTION: Render a colored object at the screen.

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
;   r1  - constant 1
;   r10  - scratch
;   r8  - scratch
;   r13  - color
;   r5 - mouse X from MOUSEQ
;   r11 - mouse Y from MOUSEQ
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
LDI r1, 1

; Default color = red
LDI r20, COLOR
LDI r10, 0xFF0000
STORE r20, r10

; Paint flag = 0
LDI r20, PAINT
LDI r10, 0
STORE r20, r10

; Fill screen dark (near-black)
LDI r10, 0x111111
FILL r10

; ── Register hit regions for palette buttons ──
; Palette is at bottom: y=240, 8 colors, each 30x14
; Color 0: Red at x=2
LDI r1, 2
LDI r10, 240
LDI r8, 30
LDI r3, 14
HITSET r1, r10, r8, r3, 1

; Color 1: Green at x=34
LDI r1, 34
LDI r10, 240
LDI r8, 30
LDI r3, 14
HITSET r1, r10, r8, r3, 2

; Color 2: Blue at x=66
LDI r1, 66
LDI r10, 240
LDI r8, 30
LDI r3, 14
HITSET r1, r10, r8, r3, 3

; Color 3: Yellow at x=98
LDI r1, 98
LDI r10, 240
LDI r8, 30
LDI r3, 14
HITSET r1, r10, r8, r3, 4

; Color 4: Cyan at x=130
LDI r1, 130
LDI r10, 240
LDI r8, 30
LDI r3, 14
HITSET r1, r10, r8, r3, 5

; Color 5: Magenta at x=162
LDI r1, 162
LDI r10, 240
LDI r8, 30
LDI r3, 14
HITSET r1, r10, r8, r3, 6

; Color 6: White at x=194
LDI r1, 194
LDI r10, 240
LDI r8, 30
LDI r3, 14
HITSET r1, r10, r8, r3, 7

; Color 7: Orange at x=226
LDI r1, 226
LDI r10, 240
LDI r8, 26
LDI r3, 14
HITSET r1, r10, r8, r3, 8

; Clear button at x=2, y=220, 40x16, id=99
LDI r1, 2
LDI r10, 220
LDI r8, 40
LDI r3, 16
HITSET r1, r10, r8, r3, 99

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r1, 1

    ; ── Read mouse position ──
    MOUSEQ r5
    ; r5 = mouse_x, r11 = mouse_y

    ; ── Check palette hit regions ──
    HITQ r4
    JZ r4, check_paint

    ; r4 = hit region id
    CMPI r4, 1
    JZ r12, set_red
    CMPI r4, 2
    JZ r12, set_green
    CMPI r4, 3
    JZ r12, set_blue
    CMPI r4, 4
    JZ r12, set_yellow
    CMPI r4, 5
    JZ r12, set_cyan
    CMPI r4, 6
    JZ r12, set_magenta
    CMPI r4, 7
    JZ r12, set_white
    CMPI r4, 8
    JZ r12, set_orange
    CMPI r4, 99
    JZ r12, do_clear
    JMP check_paint

set_red:
    LDI r20, COLOR
    LDI r10, 0xFF0000
    STORE r20, r10
    JMP draw_frame

set_green:
    LDI r20, COLOR
    LDI r10, 0x00FF00
    STORE r20, r10
    JMP draw_frame

set_blue:
    LDI r20, COLOR
    LDI r10, 0x0000FF
    STORE r20, r10
    JMP draw_frame

set_yellow:
    LDI r20, COLOR
    LDI r10, 0xFFFF00
    STORE r20, r10
    JMP draw_frame

set_cyan:
    LDI r20, COLOR
    LDI r10, 0x00FFFF
    STORE r20, r10
    JMP draw_frame

set_magenta:
    LDI r20, COLOR
    LDI r10, 0xFF00FF
    STORE r20, r10
    JMP draw_frame

set_white:
    LDI r20, COLOR
    LDI r10, 0xFFFFFF
    STORE r20, r10
    JMP draw_frame

set_orange:
    LDI r20, COLOR
    LDI r10, 0xFF8800
    STORE r20, r10
    JMP draw_frame

do_clear:
    ; Clear canvas area (keep palette)
    LDI r10, 0x111111
    FILL r10
    LDI r20, PAINT
    LDI r10, 0
    STORE r20, r10
    LDI r20, PREV_X
    LDI r10, 0
    STORE r20, r10
    LDI r20, PREV_Y
    LDI r10, 0
    STORE r20, r10
    JMP draw_frame

check_paint:
    LDI r1, 1
    ; Check if mouse is in paint area (y < 220)
    CMPI r11, 220
    BGE r12, draw_frame

    ; Mouse is in paint area -- draw pixel at mouse pos
    LDI r20, COLOR
    LOAD r13, r20

    ; Paint pixel at current mouse position
    PSET r5, r11, r13

    ; Also paint pixels between previous and current pos (line fill)
    ; Simple approach -- just paint prev pos too for continuity
    LDI r20, PREV_X
    LOAD r10, r20
    CMPI r10, 0
    JZ r12, save_pos

    LDI r20, PREV_Y
    LOAD r8, r20
    PSET r10, r8, r13

save_pos:
    LDI r20, PREV_X
    STORE r20, r5
    LDI r20, PREV_Y
    STORE r20, r11

    ; Set paint flag
    LDI r20, PAINT
    LDI r10, 1
    STORE r20, r10

    JMP draw_frame

draw_frame:
    LDI r1, 1

    ; ── Draw palette background bar ──
    LDI r1, 0
    LDI r10, 238
    LDI r8, 256
    LDI r3, 18
    LDI r13, 0x222222
    RECTF r1, r10, r8, r3, r13

    ; ── Highlight selected color (drawn BEFORE swatches so they appear on top) ──
    LDI r20, COLOR
    LOAD r13, r20
    CMPI r13, 0xFF0000
    JNZ r12, chk_grn
    LDI r1, 1
    LDI r10, 239
    LDI r8, 32
    LDI r3, 16
    LDI r15, 0xFFFFFF
    RECTF r1, r10, r8, r3, r15
    JMP draw_swatches

chk_grn:
    CMPI r13, 0x00FF00
    JNZ r12, chk_blu
    LDI r1, 33
    LDI r10, 239
    LDI r8, 32
    LDI r3, 16
    LDI r15, 0xFFFFFF
    RECTF r1, r10, r8, r3, r15
    JMP draw_swatches

chk_blu:
    CMPI r13, 0x0000FF
    JNZ r12, chk_yel
    LDI r1, 65
    LDI r10, 239
    LDI r8, 32
    LDI r3, 16
    LDI r15, 0xFFFFFF
    RECTF r1, r10, r8, r3, r15
    JMP draw_swatches

chk_yel:
    CMPI r13, 0xFFFF00
    JNZ r12, chk_cya
    LDI r1, 97
    LDI r10, 239
    LDI r8, 32
    LDI r3, 16
    LDI r15, 0xFFFFFF
    RECTF r1, r10, r8, r3, r15
    JMP draw_swatches

chk_cya:
    CMPI r13, 0x00FFFF
    JNZ r12, chk_mag
    LDI r1, 129
    LDI r10, 239
    LDI r8, 32
    LDI r3, 16
    LDI r15, 0xFFFFFF
    RECTF r1, r10, r8, r3, r15
    JMP draw_swatches

chk_mag:
    CMPI r13, 0xFF00FF
    JNZ r12, chk_wht
    LDI r1, 161
    LDI r10, 239
    LDI r8, 32
    LDI r3, 16
    LDI r15, 0xFFFFFF
    RECTF r1, r10, r8, r3, r15
    JMP draw_swatches

chk_wht:
    CMPI r13, 0xFFFFFF
    JNZ r12, chk_org
    LDI r1, 193
    LDI r10, 239
    LDI r8, 32
    LDI r3, 16
    LDI r15, 0x888888
    RECTF r1, r10, r8, r3, r15
    JMP draw_swatches

chk_org:
    CMPI r13, 0xFF8800
    JNZ r12, draw_swatches
    LDI r1, 225
    LDI r10, 239
    LDI r8, 28
    LDI r3, 16
    LDI r15, 0xFFFFFF
    RECTF r1, r10, r8, r3, r15

draw_swatches:
    ; ── Draw color swatches (on top of highlight) ──
    ; Red (id=1)
    LDI r1, 2
    LDI r10, 240
    LDI r8, 30
    LDI r3, 14
    LDI r13, 0xFF0000
    RECTF r1, r10, r8, r3, r13

    ; Green (id=2)
    LDI r1, 34
    LDI r13, 0x00FF00
    RECTF r1, r10, r8, r3, r13

    ; Blue (id=3)
    LDI r1, 66
    LDI r13, 0x0000FF
    RECTF r1, r10, r8, r3, r13

    ; Yellow (id=4)
    LDI r1, 98
    LDI r13, 0xFFFF00
    RECTF r1, r10, r8, r3, r13

    ; Cyan (id=5)
    LDI r1, 130
    LDI r13, 0x00FFFF
    RECTF r1, r10, r8, r3, r13

    ; Magenta (id=6)
    LDI r1, 162
    LDI r13, 0xFF00FF
    RECTF r1, r10, r8, r3, r13

    ; White (id=7)
    LDI r1, 194
    LDI r13, 0xFFFFFF
    RECTF r1, r10, r8, r3, r13

    ; Orange (id=8)
    LDI r1, 226
    LDI r8, 26
    LDI r13, 0xFF8800
    RECTF r1, r10, r8, r3, r13

    ; ── Draw Clear button ──
    LDI r1, 2
    LDI r10, 220
    LDI r8, 40
    LDI r3, 16
    LDI r13, 0x555555
    RECTF r1, r10, r8, r3, r13

    ; "CLR" label on clear button
    LDI r20, 0x500
    LDI r10, 67
    STORE r20, r10
    LDI r10, 76
    ADD r20, r1
    STORE r20, r10
    LDI r10, 82
    ADD r20, r1
    STORE r20, r10
    LDI r10, 0
    ADD r20, r1
    STORE r20, r10
    LDI r1, 10
    LDI r10, 224
    LDI r8, 0x500
    TEXT r1, r10, r8

    ; ── Draw title ──
    LDI r1, 1
    LDI r20, 0x520
    LDI r10, 80
    STORE r20, r10
    LDI r10, 65
    ADD r20, r1
    STORE r20, r10
    LDI r10, 73
    ADD r20, r1
    STORE r20, r10
    LDI r10, 78
    ADD r20, r1
    STORE r20, r10
    LDI r10, 84
    ADD r20, r1
    STORE r20, r10
    LDI r10, 0
    ADD r20, r1
    STORE r20, r10
    LDI r1, 2
    LDI r10, 2
    LDI r8, 0x520
    TEXT r1, r10, r8

do_frame:
    FRAME
    JMP main_loop
