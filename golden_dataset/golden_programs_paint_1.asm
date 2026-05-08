; DESCRIPTION: Draws a colored object at the screen with fixed size.

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
;   r7  - constant 1
;   r5  - scratch
;   r15  - scratch
;   r4  - color
;   r6 - mouse X from MOUSEQ
;   r13 - mouse Y from MOUSEQ
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
LDI r7, 1

; Default color = red
LDI r20, COLOR
LDI r5, 0xFF0000
STORE r20, r5

; Paint flag = 0
LDI r20, PAINT
LDI r5, 0
STORE r20, r5

; Fill screen dark (near-black)
LDI r5, 0x111111
FILL r5

; ── Register hit regions for palette buttons ──
; Palette is at bottom: y=240, 8 colors, each 30x14
; Color 0: Red at x=2
LDI r7, 2
LDI r5, 240
LDI r15, 30
LDI r9, 14
HITSET r7, r5, r15, r9, 1

; Color 1: Green at x=34
LDI r7, 34
LDI r5, 240
LDI r15, 30
LDI r9, 14
HITSET r7, r5, r15, r9, 2

; Color 2: Blue at x=66
LDI r7, 66
LDI r5, 240
LDI r15, 30
LDI r9, 14
HITSET r7, r5, r15, r9, 3

; Color 3: Yellow at x=98
LDI r7, 98
LDI r5, 240
LDI r15, 30
LDI r9, 14
HITSET r7, r5, r15, r9, 4

; Color 4: Cyan at x=130
LDI r7, 130
LDI r5, 240
LDI r15, 30
LDI r9, 14
HITSET r7, r5, r15, r9, 5

; Color 5: Magenta at x=162
LDI r7, 162
LDI r5, 240
LDI r15, 30
LDI r9, 14
HITSET r7, r5, r15, r9, 6

; Color 6: White at x=194
LDI r7, 194
LDI r5, 240
LDI r15, 30
LDI r9, 14
HITSET r7, r5, r15, r9, 7

; Color 7: Orange at x=226
LDI r7, 226
LDI r5, 240
LDI r15, 26
LDI r9, 14
HITSET r7, r5, r15, r9, 8

; Clear button at x=2, y=220, 40x16, id=99
LDI r7, 2
LDI r5, 220
LDI r15, 40
LDI r9, 16
HITSET r7, r5, r15, r9, 99

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r7, 1

    ; ── Read mouse position ──
    MOUSEQ r6
    ; r6 = mouse_x, r13 = mouse_y

    ; ── Check palette hit regions ──
    HITQ r11
    JZ r11, check_paint

    ; r11 = hit region id
    CMPI r11, 1
    JZ r14, set_red
    CMPI r11, 2
    JZ r14, set_green
    CMPI r11, 3
    JZ r14, set_blue
    CMPI r11, 4
    JZ r14, set_yellow
    CMPI r11, 5
    JZ r14, set_cyan
    CMPI r11, 6
    JZ r14, set_magenta
    CMPI r11, 7
    JZ r14, set_white
    CMPI r11, 8
    JZ r14, set_orange
    CMPI r11, 99
    JZ r14, do_clear
    JMP check_paint

set_red:
    LDI r20, COLOR
    LDI r5, 0xFF0000
    STORE r20, r5
    JMP draw_frame

set_green:
    LDI r20, COLOR
    LDI r5, 0x00FF00
    STORE r20, r5
    JMP draw_frame

set_blue:
    LDI r20, COLOR
    LDI r5, 0x0000FF
    STORE r20, r5
    JMP draw_frame

set_yellow:
    LDI r20, COLOR
    LDI r5, 0xFFFF00
    STORE r20, r5
    JMP draw_frame

set_cyan:
    LDI r20, COLOR
    LDI r5, 0x00FFFF
    STORE r20, r5
    JMP draw_frame

set_magenta:
    LDI r20, COLOR
    LDI r5, 0xFF00FF
    STORE r20, r5
    JMP draw_frame

set_white:
    LDI r20, COLOR
    LDI r5, 0xFFFFFF
    STORE r20, r5
    JMP draw_frame

set_orange:
    LDI r20, COLOR
    LDI r5, 0xFF8800
    STORE r20, r5
    JMP draw_frame

do_clear:
    ; Clear canvas area (keep palette)
    LDI r5, 0x111111
    FILL r5
    LDI r20, PAINT
    LDI r5, 0
    STORE r20, r5
    LDI r20, PREV_X
    LDI r5, 0
    STORE r20, r5
    LDI r20, PREV_Y
    LDI r5, 0
    STORE r20, r5
    JMP draw_frame

check_paint:
    LDI r7, 1
    ; Check if mouse is in paint area (y < 220)
    CMPI r13, 220
    BGE r14, draw_frame

    ; Mouse is in paint area -- draw pixel at mouse pos
    LDI r20, COLOR
    LOAD r4, r20

    ; Paint pixel at current mouse position
    PSET r6, r13, r4

    ; Also paint pixels between previous and current pos (line fill)
    ; Simple approach -- just paint prev pos too for continuity
    LDI r20, PREV_X
    LOAD r5, r20
    CMPI r5, 0
    JZ r14, save_pos

    LDI r20, PREV_Y
    LOAD r15, r20
    PSET r5, r15, r4

save_pos:
    LDI r20, PREV_X
    STORE r20, r6
    LDI r20, PREV_Y
    STORE r20, r13

    ; Set paint flag
    LDI r20, PAINT
    LDI r5, 1
    STORE r20, r5

    JMP draw_frame

draw_frame:
    LDI r7, 1

    ; ── Draw palette background bar ──
    LDI r7, 0
    LDI r5, 238
    LDI r15, 256
    LDI r9, 18
    LDI r4, 0x222222
    RECTF r7, r5, r15, r9, r4

    ; ── Highlight selected color (drawn BEFORE swatches so they appear on top) ──
    LDI r20, COLOR
    LOAD r4, r20
    CMPI r4, 0xFF0000
    JNZ r14, chk_grn
    LDI r7, 1
    LDI r5, 239
    LDI r15, 32
    LDI r9, 16
    LDI r12, 0xFFFFFF
    RECTF r7, r5, r15, r9, r12
    JMP draw_swatches

chk_grn:
    CMPI r4, 0x00FF00
    JNZ r14, chk_blu
    LDI r7, 33
    LDI r5, 239
    LDI r15, 32
    LDI r9, 16
    LDI r12, 0xFFFFFF
    RECTF r7, r5, r15, r9, r12
    JMP draw_swatches

chk_blu:
    CMPI r4, 0x0000FF
    JNZ r14, chk_yel
    LDI r7, 65
    LDI r5, 239
    LDI r15, 32
    LDI r9, 16
    LDI r12, 0xFFFFFF
    RECTF r7, r5, r15, r9, r12
    JMP draw_swatches

chk_yel:
    CMPI r4, 0xFFFF00
    JNZ r14, chk_cya
    LDI r7, 97
    LDI r5, 239
    LDI r15, 32
    LDI r9, 16
    LDI r12, 0xFFFFFF
    RECTF r7, r5, r15, r9, r12
    JMP draw_swatches

chk_cya:
    CMPI r4, 0x00FFFF
    JNZ r14, chk_mag
    LDI r7, 129
    LDI r5, 239
    LDI r15, 32
    LDI r9, 16
    LDI r12, 0xFFFFFF
    RECTF r7, r5, r15, r9, r12
    JMP draw_swatches

chk_mag:
    CMPI r4, 0xFF00FF
    JNZ r14, chk_wht
    LDI r7, 161
    LDI r5, 239
    LDI r15, 32
    LDI r9, 16
    LDI r12, 0xFFFFFF
    RECTF r7, r5, r15, r9, r12
    JMP draw_swatches

chk_wht:
    CMPI r4, 0xFFFFFF
    JNZ r14, chk_org
    LDI r7, 193
    LDI r5, 239
    LDI r15, 32
    LDI r9, 16
    LDI r12, 0x888888
    RECTF r7, r5, r15, r9, r12
    JMP draw_swatches

chk_org:
    CMPI r4, 0xFF8800
    JNZ r14, draw_swatches
    LDI r7, 225
    LDI r5, 239
    LDI r15, 28
    LDI r9, 16
    LDI r12, 0xFFFFFF
    RECTF r7, r5, r15, r9, r12

draw_swatches:
    ; ── Draw color swatches (on top of highlight) ──
    ; Red (id=1)
    LDI r7, 2
    LDI r5, 240
    LDI r15, 30
    LDI r9, 14
    LDI r4, 0xFF0000
    RECTF r7, r5, r15, r9, r4

    ; Green (id=2)
    LDI r7, 34
    LDI r4, 0x00FF00
    RECTF r7, r5, r15, r9, r4

    ; Blue (id=3)
    LDI r7, 66
    LDI r4, 0x0000FF
    RECTF r7, r5, r15, r9, r4

    ; Yellow (id=4)
    LDI r7, 98
    LDI r4, 0xFFFF00
    RECTF r7, r5, r15, r9, r4

    ; Cyan (id=5)
    LDI r7, 130
    LDI r4, 0x00FFFF
    RECTF r7, r5, r15, r9, r4

    ; Magenta (id=6)
    LDI r7, 162
    LDI r4, 0xFF00FF
    RECTF r7, r5, r15, r9, r4

    ; White (id=7)
    LDI r7, 194
    LDI r4, 0xFFFFFF
    RECTF r7, r5, r15, r9, r4

    ; Orange (id=8)
    LDI r7, 226
    LDI r15, 26
    LDI r4, 0xFF8800
    RECTF r7, r5, r15, r9, r4

    ; ── Draw Clear button ──
    LDI r7, 2
    LDI r5, 220
    LDI r15, 40
    LDI r9, 16
    LDI r4, 0x555555
    RECTF r7, r5, r15, r9, r4

    ; "CLR" label on clear button
    LDI r20, 0x500
    LDI r5, 67
    STORE r20, r5
    LDI r5, 76
    ADD r20, r7
    STORE r20, r5
    LDI r5, 82
    ADD r20, r7
    STORE r20, r5
    LDI r5, 0
    ADD r20, r7
    STORE r20, r5
    LDI r7, 10
    LDI r5, 224
    LDI r15, 0x500
    TEXT r7, r5, r15

    ; ── Draw title ──
    LDI r7, 1
    LDI r20, 0x520
    LDI r5, 80
    STORE r20, r5
    LDI r5, 65
    ADD r20, r7
    STORE r20, r5
    LDI r5, 73
    ADD r20, r7
    STORE r20, r5
    LDI r5, 78
    ADD r20, r7
    STORE r20, r5
    LDI r5, 84
    ADD r20, r7
    STORE r20, r5
    LDI r5, 0
    ADD r20, r7
    STORE r20, r5
    LDI r7, 2
    LDI r5, 2
    LDI r15, 0x520
    TEXT r7, r5, r15

do_frame:
    FRAME
    JMP main_loop
