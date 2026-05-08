; DESCRIPTION: Display a object using color colored at the screen.

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
;   r6  - constant 1
;   r14  - scratch
;   r2  - scratch
;   r11  - color
;   r4 - mouse X from MOUSEQ
;   r9 - mouse Y from MOUSEQ
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
LDI r6, 1

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
LDI r6, 2
LDI r14, 240
LDI r2, 30
LDI r3, 14
HITSET r6, r14, r2, r3, 1

; Color 1: Green at x=34
LDI r6, 34
LDI r14, 240
LDI r2, 30
LDI r3, 14
HITSET r6, r14, r2, r3, 2

; Color 2: Blue at x=66
LDI r6, 66
LDI r14, 240
LDI r2, 30
LDI r3, 14
HITSET r6, r14, r2, r3, 3

; Color 3: Yellow at x=98
LDI r6, 98
LDI r14, 240
LDI r2, 30
LDI r3, 14
HITSET r6, r14, r2, r3, 4

; Color 4: Cyan at x=130
LDI r6, 130
LDI r14, 240
LDI r2, 30
LDI r3, 14
HITSET r6, r14, r2, r3, 5

; Color 5: Magenta at x=162
LDI r6, 162
LDI r14, 240
LDI r2, 30
LDI r3, 14
HITSET r6, r14, r2, r3, 6

; Color 6: White at x=194
LDI r6, 194
LDI r14, 240
LDI r2, 30
LDI r3, 14
HITSET r6, r14, r2, r3, 7

; Color 7: Orange at x=226
LDI r6, 226
LDI r14, 240
LDI r2, 26
LDI r3, 14
HITSET r6, r14, r2, r3, 8

; Clear button at x=2, y=220, 40x16, id=99
LDI r6, 2
LDI r14, 220
LDI r2, 40
LDI r3, 16
HITSET r6, r14, r2, r3, 99

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r6, 1

    ; ── Read mouse position ──
    MOUSEQ r4
    ; r4 = mouse_x, r9 = mouse_y

    ; ── Check palette hit regions ──
    HITQ r8
    JZ r8, check_paint

    ; r8 = hit region id
    CMPI r8, 1
    JZ r13, set_red
    CMPI r8, 2
    JZ r13, set_green
    CMPI r8, 3
    JZ r13, set_blue
    CMPI r8, 4
    JZ r13, set_yellow
    CMPI r8, 5
    JZ r13, set_cyan
    CMPI r8, 6
    JZ r13, set_magenta
    CMPI r8, 7
    JZ r13, set_white
    CMPI r8, 8
    JZ r13, set_orange
    CMPI r8, 99
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
    LDI r6, 1
    ; Check if mouse is in paint area (y < 220)
    CMPI r9, 220
    BGE r13, draw_frame

    ; Mouse is in paint area -- draw pixel at mouse pos
    LDI r20, COLOR
    LOAD r11, r20

    ; Paint pixel at current mouse position
    PSET r4, r9, r11

    ; Also paint pixels between previous and current pos (line fill)
    ; Simple approach -- just paint prev pos too for continuity
    LDI r20, PREV_X
    LOAD r14, r20
    CMPI r14, 0
    JZ r13, save_pos

    LDI r20, PREV_Y
    LOAD r2, r20
    PSET r14, r2, r11

save_pos:
    LDI r20, PREV_X
    STORE r20, r4
    LDI r20, PREV_Y
    STORE r20, r9

    ; Set paint flag
    LDI r20, PAINT
    LDI r14, 1
    STORE r20, r14

    JMP draw_frame

draw_frame:
    LDI r6, 1

    ; ── Draw palette background bar ──
    LDI r6, 0
    LDI r14, 238
    LDI r2, 256
    LDI r3, 18
    LDI r11, 0x222222
    RECTF r6, r14, r2, r3, r11

    ; ── Highlight selected color (drawn BEFORE swatches so they appear on top) ──
    LDI r20, COLOR
    LOAD r11, r20
    CMPI r11, 0xFF0000
    JNZ r13, chk_grn
    LDI r6, 1
    LDI r14, 239
    LDI r2, 32
    LDI r3, 16
    LDI r7, 0xFFFFFF
    RECTF r6, r14, r2, r3, r7
    JMP draw_swatches

chk_grn:
    CMPI r11, 0x00FF00
    JNZ r13, chk_blu
    LDI r6, 33
    LDI r14, 239
    LDI r2, 32
    LDI r3, 16
    LDI r7, 0xFFFFFF
    RECTF r6, r14, r2, r3, r7
    JMP draw_swatches

chk_blu:
    CMPI r11, 0x0000FF
    JNZ r13, chk_yel
    LDI r6, 65
    LDI r14, 239
    LDI r2, 32
    LDI r3, 16
    LDI r7, 0xFFFFFF
    RECTF r6, r14, r2, r3, r7
    JMP draw_swatches

chk_yel:
    CMPI r11, 0xFFFF00
    JNZ r13, chk_cya
    LDI r6, 97
    LDI r14, 239
    LDI r2, 32
    LDI r3, 16
    LDI r7, 0xFFFFFF
    RECTF r6, r14, r2, r3, r7
    JMP draw_swatches

chk_cya:
    CMPI r11, 0x00FFFF
    JNZ r13, chk_mag
    LDI r6, 129
    LDI r14, 239
    LDI r2, 32
    LDI r3, 16
    LDI r7, 0xFFFFFF
    RECTF r6, r14, r2, r3, r7
    JMP draw_swatches

chk_mag:
    CMPI r11, 0xFF00FF
    JNZ r13, chk_wht
    LDI r6, 161
    LDI r14, 239
    LDI r2, 32
    LDI r3, 16
    LDI r7, 0xFFFFFF
    RECTF r6, r14, r2, r3, r7
    JMP draw_swatches

chk_wht:
    CMPI r11, 0xFFFFFF
    JNZ r13, chk_org
    LDI r6, 193
    LDI r14, 239
    LDI r2, 32
    LDI r3, 16
    LDI r7, 0x888888
    RECTF r6, r14, r2, r3, r7
    JMP draw_swatches

chk_org:
    CMPI r11, 0xFF8800
    JNZ r13, draw_swatches
    LDI r6, 225
    LDI r14, 239
    LDI r2, 28
    LDI r3, 16
    LDI r7, 0xFFFFFF
    RECTF r6, r14, r2, r3, r7

draw_swatches:
    ; ── Draw color swatches (on top of highlight) ──
    ; Red (id=1)
    LDI r6, 2
    LDI r14, 240
    LDI r2, 30
    LDI r3, 14
    LDI r11, 0xFF0000
    RECTF r6, r14, r2, r3, r11

    ; Green (id=2)
    LDI r6, 34
    LDI r11, 0x00FF00
    RECTF r6, r14, r2, r3, r11

    ; Blue (id=3)
    LDI r6, 66
    LDI r11, 0x0000FF
    RECTF r6, r14, r2, r3, r11

    ; Yellow (id=4)
    LDI r6, 98
    LDI r11, 0xFFFF00
    RECTF r6, r14, r2, r3, r11

    ; Cyan (id=5)
    LDI r6, 130
    LDI r11, 0x00FFFF
    RECTF r6, r14, r2, r3, r11

    ; Magenta (id=6)
    LDI r6, 162
    LDI r11, 0xFF00FF
    RECTF r6, r14, r2, r3, r11

    ; White (id=7)
    LDI r6, 194
    LDI r11, 0xFFFFFF
    RECTF r6, r14, r2, r3, r11

    ; Orange (id=8)
    LDI r6, 226
    LDI r2, 26
    LDI r11, 0xFF8800
    RECTF r6, r14, r2, r3, r11

    ; ── Draw Clear button ──
    LDI r6, 2
    LDI r14, 220
    LDI r2, 40
    LDI r3, 16
    LDI r11, 0x555555
    RECTF r6, r14, r2, r3, r11

    ; "CLR" label on clear button
    LDI r20, 0x500
    LDI r14, 67
    STORE r20, r14
    LDI r14, 76
    ADD r20, r6
    STORE r20, r14
    LDI r14, 82
    ADD r20, r6
    STORE r20, r14
    LDI r14, 0
    ADD r20, r6
    STORE r20, r14
    LDI r6, 10
    LDI r14, 224
    LDI r2, 0x500
    TEXT r6, r14, r2

    ; ── Draw title ──
    LDI r6, 1
    LDI r20, 0x520
    LDI r14, 80
    STORE r20, r14
    LDI r14, 65
    ADD r20, r6
    STORE r20, r14
    LDI r14, 73
    ADD r20, r6
    STORE r20, r14
    LDI r14, 78
    ADD r20, r6
    STORE r20, r14
    LDI r14, 84
    ADD r20, r6
    STORE r20, r14
    LDI r14, 0
    ADD r20, r6
    STORE r20, r14
    LDI r6, 2
    LDI r14, 2
    LDI r2, 0x520
    TEXT r6, r14, r2

do_frame:
    FRAME
    JMP main_loop
