; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

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
;   r5  - scratch
;   r0  - scratch
;   r10  - color
;   r14 - mouse X from MOUSEQ
;   r2 - mouse Y from MOUSEQ
;   r6 - hit query result
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
LDI r11, 2
LDI r5, 240
LDI r0, 30
LDI r1, 14
HITSET r11, r5, r0, r1, 1

; Color 1: Green at x=34
LDI r11, 34
LDI r5, 240
LDI r0, 30
LDI r1, 14
HITSET r11, r5, r0, r1, 2

; Color 2: Blue at x=66
LDI r11, 66
LDI r5, 240
LDI r0, 30
LDI r1, 14
HITSET r11, r5, r0, r1, 3

; Color 3: Yellow at x=98
LDI r11, 98
LDI r5, 240
LDI r0, 30
LDI r1, 14
HITSET r11, r5, r0, r1, 4

; Color 4: Cyan at x=130
LDI r11, 130
LDI r5, 240
LDI r0, 30
LDI r1, 14
HITSET r11, r5, r0, r1, 5

; Color 5: Magenta at x=162
LDI r11, 162
LDI r5, 240
LDI r0, 30
LDI r1, 14
HITSET r11, r5, r0, r1, 6

; Color 6: White at x=194
LDI r11, 194
LDI r5, 240
LDI r0, 30
LDI r1, 14
HITSET r11, r5, r0, r1, 7

; Color 7: Orange at x=226
LDI r11, 226
LDI r5, 240
LDI r0, 26
LDI r1, 14
HITSET r11, r5, r0, r1, 8

; Clear button at x=2, y=220, 40x16, id=99
LDI r11, 2
LDI r5, 220
LDI r0, 40
LDI r1, 16
HITSET r11, r5, r0, r1, 99

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r11, 1

    ; ── Read mouse position ──
    MOUSEQ r14
    ; r14 = mouse_x, r2 = mouse_y

    ; ── Check palette hit regions ──
    HITQ r6
    JZ r6, check_paint

    ; r6 = hit region id
    CMPI r6, 1
    JZ r9, set_red
    CMPI r6, 2
    JZ r9, set_green
    CMPI r6, 3
    JZ r9, set_blue
    CMPI r6, 4
    JZ r9, set_yellow
    CMPI r6, 5
    JZ r9, set_cyan
    CMPI r6, 6
    JZ r9, set_magenta
    CMPI r6, 7
    JZ r9, set_white
    CMPI r6, 8
    JZ r9, set_orange
    CMPI r6, 99
    JZ r9, do_clear
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
    LDI r11, 1
    ; Check if mouse is in paint area (y < 220)
    CMPI r2, 220
    BGE r9, draw_frame

    ; Mouse is in paint area -- draw pixel at mouse pos
    LDI r20, COLOR
    LOAD r10, r20

    ; Paint pixel at current mouse position
    PSET r14, r2, r10

    ; Also paint pixels between previous and current pos (line fill)
    ; Simple approach -- just paint prev pos too for continuity
    LDI r20, PREV_X
    LOAD r5, r20
    CMPI r5, 0
    JZ r9, save_pos

    LDI r20, PREV_Y
    LOAD r0, r20
    PSET r5, r0, r10

save_pos:
    LDI r20, PREV_X
    STORE r20, r14
    LDI r20, PREV_Y
    STORE r20, r2

    ; Set paint flag
    LDI r20, PAINT
    LDI r5, 1
    STORE r20, r5

    JMP draw_frame

draw_frame:
    LDI r11, 1

    ; ── Draw palette background bar ──
    LDI r11, 0
    LDI r5, 238
    LDI r0, 256
    LDI r1, 18
    LDI r10, 0x222222
    RECTF r11, r5, r0, r1, r10

    ; ── Highlight selected color (drawn BEFORE swatches so they appear on top) ──
    LDI r20, COLOR
    LOAD r10, r20
    CMPI r10, 0xFF0000
    JNZ r9, chk_grn
    LDI r11, 1
    LDI r5, 239
    LDI r0, 32
    LDI r1, 16
    LDI r8, 0xFFFFFF
    RECTF r11, r5, r0, r1, r8
    JMP draw_swatches

chk_grn:
    CMPI r10, 0x00FF00
    JNZ r9, chk_blu
    LDI r11, 33
    LDI r5, 239
    LDI r0, 32
    LDI r1, 16
    LDI r8, 0xFFFFFF
    RECTF r11, r5, r0, r1, r8
    JMP draw_swatches

chk_blu:
    CMPI r10, 0x0000FF
    JNZ r9, chk_yel
    LDI r11, 65
    LDI r5, 239
    LDI r0, 32
    LDI r1, 16
    LDI r8, 0xFFFFFF
    RECTF r11, r5, r0, r1, r8
    JMP draw_swatches

chk_yel:
    CMPI r10, 0xFFFF00
    JNZ r9, chk_cya
    LDI r11, 97
    LDI r5, 239
    LDI r0, 32
    LDI r1, 16
    LDI r8, 0xFFFFFF
    RECTF r11, r5, r0, r1, r8
    JMP draw_swatches

chk_cya:
    CMPI r10, 0x00FFFF
    JNZ r9, chk_mag
    LDI r11, 129
    LDI r5, 239
    LDI r0, 32
    LDI r1, 16
    LDI r8, 0xFFFFFF
    RECTF r11, r5, r0, r1, r8
    JMP draw_swatches

chk_mag:
    CMPI r10, 0xFF00FF
    JNZ r9, chk_wht
    LDI r11, 161
    LDI r5, 239
    LDI r0, 32
    LDI r1, 16
    LDI r8, 0xFFFFFF
    RECTF r11, r5, r0, r1, r8
    JMP draw_swatches

chk_wht:
    CMPI r10, 0xFFFFFF
    JNZ r9, chk_org
    LDI r11, 193
    LDI r5, 239
    LDI r0, 32
    LDI r1, 16
    LDI r8, 0x888888
    RECTF r11, r5, r0, r1, r8
    JMP draw_swatches

chk_org:
    CMPI r10, 0xFF8800
    JNZ r9, draw_swatches
    LDI r11, 225
    LDI r5, 239
    LDI r0, 28
    LDI r1, 16
    LDI r8, 0xFFFFFF
    RECTF r11, r5, r0, r1, r8

draw_swatches:
    ; ── Draw color swatches (on top of highlight) ──
    ; Red (id=1)
    LDI r11, 2
    LDI r5, 240
    LDI r0, 30
    LDI r1, 14
    LDI r10, 0xFF0000
    RECTF r11, r5, r0, r1, r10

    ; Green (id=2)
    LDI r11, 34
    LDI r10, 0x00FF00
    RECTF r11, r5, r0, r1, r10

    ; Blue (id=3)
    LDI r11, 66
    LDI r10, 0x0000FF
    RECTF r11, r5, r0, r1, r10

    ; Yellow (id=4)
    LDI r11, 98
    LDI r10, 0xFFFF00
    RECTF r11, r5, r0, r1, r10

    ; Cyan (id=5)
    LDI r11, 130
    LDI r10, 0x00FFFF
    RECTF r11, r5, r0, r1, r10

    ; Magenta (id=6)
    LDI r11, 162
    LDI r10, 0xFF00FF
    RECTF r11, r5, r0, r1, r10

    ; White (id=7)
    LDI r11, 194
    LDI r10, 0xFFFFFF
    RECTF r11, r5, r0, r1, r10

    ; Orange (id=8)
    LDI r11, 226
    LDI r0, 26
    LDI r10, 0xFF8800
    RECTF r11, r5, r0, r1, r10

    ; ── Draw Clear button ──
    LDI r11, 2
    LDI r5, 220
    LDI r0, 40
    LDI r1, 16
    LDI r10, 0x555555
    RECTF r11, r5, r0, r1, r10

    ; "CLR" label on clear button
    LDI r20, 0x500
    LDI r5, 67
    STORE r20, r5
    LDI r5, 76
    ADD r20, r11
    STORE r20, r5
    LDI r5, 82
    ADD r20, r11
    STORE r20, r5
    LDI r5, 0
    ADD r20, r11
    STORE r20, r5
    LDI r11, 10
    LDI r5, 224
    LDI r0, 0x500
    TEXT r11, r5, r0

    ; ── Draw title ──
    LDI r11, 1
    LDI r20, 0x520
    LDI r5, 80
    STORE r20, r5
    LDI r5, 65
    ADD r20, r11
    STORE r20, r5
    LDI r5, 73
    ADD r20, r11
    STORE r20, r5
    LDI r5, 78
    ADD r20, r11
    STORE r20, r5
    LDI r5, 84
    ADD r20, r11
    STORE r20, r5
    LDI r5, 0
    ADD r20, r11
    STORE r20, r5
    LDI r11, 2
    LDI r5, 2
    LDI r0, 0x520
    TEXT r11, r5, r0

do_frame:
    FRAME
    JMP main_loop
