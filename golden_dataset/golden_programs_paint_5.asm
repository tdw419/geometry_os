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
;   r9  - scratch
;   r13  - scratch
;   r1  - color
;   r0 - mouse X from MOUSEQ
;   r4 - mouse Y from MOUSEQ
;   r15 - hit query result
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
LDI r9, 0xFF0000
STORE r20, r9

; Paint flag = 0
LDI r20, PAINT
LDI r9, 0
STORE r20, r9

; Fill screen dark (near-black)
LDI r9, 0x111111
FILL r9

; ── Register hit regions for palette buttons ──
; Palette is at bottom: y=240, 8 colors, each 30x14
; Color 0: Red at x=2
LDI r6, 2
LDI r9, 240
LDI r13, 30
LDI r11, 14
HITSET r6, r9, r13, r11, 1

; Color 1: Green at x=34
LDI r6, 34
LDI r9, 240
LDI r13, 30
LDI r11, 14
HITSET r6, r9, r13, r11, 2

; Color 2: Blue at x=66
LDI r6, 66
LDI r9, 240
LDI r13, 30
LDI r11, 14
HITSET r6, r9, r13, r11, 3

; Color 3: Yellow at x=98
LDI r6, 98
LDI r9, 240
LDI r13, 30
LDI r11, 14
HITSET r6, r9, r13, r11, 4

; Color 4: Cyan at x=130
LDI r6, 130
LDI r9, 240
LDI r13, 30
LDI r11, 14
HITSET r6, r9, r13, r11, 5

; Color 5: Magenta at x=162
LDI r6, 162
LDI r9, 240
LDI r13, 30
LDI r11, 14
HITSET r6, r9, r13, r11, 6

; Color 6: White at x=194
LDI r6, 194
LDI r9, 240
LDI r13, 30
LDI r11, 14
HITSET r6, r9, r13, r11, 7

; Color 7: Orange at x=226
LDI r6, 226
LDI r9, 240
LDI r13, 26
LDI r11, 14
HITSET r6, r9, r13, r11, 8

; Clear button at x=2, y=220, 40x16, id=99
LDI r6, 2
LDI r9, 220
LDI r13, 40
LDI r11, 16
HITSET r6, r9, r13, r11, 99

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r6, 1

    ; ── Read mouse position ──
    MOUSEQ r0
    ; r0 = mouse_x, r4 = mouse_y

    ; ── Check palette hit regions ──
    HITQ r15
    JZ r15, check_paint

    ; r15 = hit region id
    CMPI r15, 1
    JZ r3, set_red
    CMPI r15, 2
    JZ r3, set_green
    CMPI r15, 3
    JZ r3, set_blue
    CMPI r15, 4
    JZ r3, set_yellow
    CMPI r15, 5
    JZ r3, set_cyan
    CMPI r15, 6
    JZ r3, set_magenta
    CMPI r15, 7
    JZ r3, set_white
    CMPI r15, 8
    JZ r3, set_orange
    CMPI r15, 99
    JZ r3, do_clear
    JMP check_paint

set_red:
    LDI r20, COLOR
    LDI r9, 0xFF0000
    STORE r20, r9
    JMP draw_frame

set_green:
    LDI r20, COLOR
    LDI r9, 0x00FF00
    STORE r20, r9
    JMP draw_frame

set_blue:
    LDI r20, COLOR
    LDI r9, 0x0000FF
    STORE r20, r9
    JMP draw_frame

set_yellow:
    LDI r20, COLOR
    LDI r9, 0xFFFF00
    STORE r20, r9
    JMP draw_frame

set_cyan:
    LDI r20, COLOR
    LDI r9, 0x00FFFF
    STORE r20, r9
    JMP draw_frame

set_magenta:
    LDI r20, COLOR
    LDI r9, 0xFF00FF
    STORE r20, r9
    JMP draw_frame

set_white:
    LDI r20, COLOR
    LDI r9, 0xFFFFFF
    STORE r20, r9
    JMP draw_frame

set_orange:
    LDI r20, COLOR
    LDI r9, 0xFF8800
    STORE r20, r9
    JMP draw_frame

do_clear:
    ; Clear canvas area (keep palette)
    LDI r9, 0x111111
    FILL r9
    LDI r20, PAINT
    LDI r9, 0
    STORE r20, r9
    LDI r20, PREV_X
    LDI r9, 0
    STORE r20, r9
    LDI r20, PREV_Y
    LDI r9, 0
    STORE r20, r9
    JMP draw_frame

check_paint:
    LDI r6, 1
    ; Check if mouse is in paint area (y < 220)
    CMPI r4, 220
    BGE r3, draw_frame

    ; Mouse is in paint area -- draw pixel at mouse pos
    LDI r20, COLOR
    LOAD r1, r20

    ; Paint pixel at current mouse position
    PSET r0, r4, r1

    ; Also paint pixels between previous and current pos (line fill)
    ; Simple approach -- just paint prev pos too for continuity
    LDI r20, PREV_X
    LOAD r9, r20
    CMPI r9, 0
    JZ r3, save_pos

    LDI r20, PREV_Y
    LOAD r13, r20
    PSET r9, r13, r1

save_pos:
    LDI r20, PREV_X
    STORE r20, r0
    LDI r20, PREV_Y
    STORE r20, r4

    ; Set paint flag
    LDI r20, PAINT
    LDI r9, 1
    STORE r20, r9

    JMP draw_frame

draw_frame:
    LDI r6, 1

    ; ── Draw palette background bar ──
    LDI r6, 0
    LDI r9, 238
    LDI r13, 256
    LDI r11, 18
    LDI r1, 0x222222
    RECTF r6, r9, r13, r11, r1

    ; ── Highlight selected color (drawn BEFORE swatches so they appear on top) ──
    LDI r20, COLOR
    LOAD r1, r20
    CMPI r1, 0xFF0000
    JNZ r3, chk_grn
    LDI r6, 1
    LDI r9, 239
    LDI r13, 32
    LDI r11, 16
    LDI r12, 0xFFFFFF
    RECTF r6, r9, r13, r11, r12
    JMP draw_swatches

chk_grn:
    CMPI r1, 0x00FF00
    JNZ r3, chk_blu
    LDI r6, 33
    LDI r9, 239
    LDI r13, 32
    LDI r11, 16
    LDI r12, 0xFFFFFF
    RECTF r6, r9, r13, r11, r12
    JMP draw_swatches

chk_blu:
    CMPI r1, 0x0000FF
    JNZ r3, chk_yel
    LDI r6, 65
    LDI r9, 239
    LDI r13, 32
    LDI r11, 16
    LDI r12, 0xFFFFFF
    RECTF r6, r9, r13, r11, r12
    JMP draw_swatches

chk_yel:
    CMPI r1, 0xFFFF00
    JNZ r3, chk_cya
    LDI r6, 97
    LDI r9, 239
    LDI r13, 32
    LDI r11, 16
    LDI r12, 0xFFFFFF
    RECTF r6, r9, r13, r11, r12
    JMP draw_swatches

chk_cya:
    CMPI r1, 0x00FFFF
    JNZ r3, chk_mag
    LDI r6, 129
    LDI r9, 239
    LDI r13, 32
    LDI r11, 16
    LDI r12, 0xFFFFFF
    RECTF r6, r9, r13, r11, r12
    JMP draw_swatches

chk_mag:
    CMPI r1, 0xFF00FF
    JNZ r3, chk_wht
    LDI r6, 161
    LDI r9, 239
    LDI r13, 32
    LDI r11, 16
    LDI r12, 0xFFFFFF
    RECTF r6, r9, r13, r11, r12
    JMP draw_swatches

chk_wht:
    CMPI r1, 0xFFFFFF
    JNZ r3, chk_org
    LDI r6, 193
    LDI r9, 239
    LDI r13, 32
    LDI r11, 16
    LDI r12, 0x888888
    RECTF r6, r9, r13, r11, r12
    JMP draw_swatches

chk_org:
    CMPI r1, 0xFF8800
    JNZ r3, draw_swatches
    LDI r6, 225
    LDI r9, 239
    LDI r13, 28
    LDI r11, 16
    LDI r12, 0xFFFFFF
    RECTF r6, r9, r13, r11, r12

draw_swatches:
    ; ── Draw color swatches (on top of highlight) ──
    ; Red (id=1)
    LDI r6, 2
    LDI r9, 240
    LDI r13, 30
    LDI r11, 14
    LDI r1, 0xFF0000
    RECTF r6, r9, r13, r11, r1

    ; Green (id=2)
    LDI r6, 34
    LDI r1, 0x00FF00
    RECTF r6, r9, r13, r11, r1

    ; Blue (id=3)
    LDI r6, 66
    LDI r1, 0x0000FF
    RECTF r6, r9, r13, r11, r1

    ; Yellow (id=4)
    LDI r6, 98
    LDI r1, 0xFFFF00
    RECTF r6, r9, r13, r11, r1

    ; Cyan (id=5)
    LDI r6, 130
    LDI r1, 0x00FFFF
    RECTF r6, r9, r13, r11, r1

    ; Magenta (id=6)
    LDI r6, 162
    LDI r1, 0xFF00FF
    RECTF r6, r9, r13, r11, r1

    ; White (id=7)
    LDI r6, 194
    LDI r1, 0xFFFFFF
    RECTF r6, r9, r13, r11, r1

    ; Orange (id=8)
    LDI r6, 226
    LDI r13, 26
    LDI r1, 0xFF8800
    RECTF r6, r9, r13, r11, r1

    ; ── Draw Clear button ──
    LDI r6, 2
    LDI r9, 220
    LDI r13, 40
    LDI r11, 16
    LDI r1, 0x555555
    RECTF r6, r9, r13, r11, r1

    ; "CLR" label on clear button
    LDI r20, 0x500
    LDI r9, 67
    STORE r20, r9
    LDI r9, 76
    ADD r20, r6
    STORE r20, r9
    LDI r9, 82
    ADD r20, r6
    STORE r20, r9
    LDI r9, 0
    ADD r20, r6
    STORE r20, r9
    LDI r6, 10
    LDI r9, 224
    LDI r13, 0x500
    TEXT r6, r9, r13

    ; ── Draw title ──
    LDI r6, 1
    LDI r20, 0x520
    LDI r9, 80
    STORE r20, r9
    LDI r9, 65
    ADD r20, r6
    STORE r20, r9
    LDI r9, 73
    ADD r20, r6
    STORE r20, r9
    LDI r9, 78
    ADD r20, r6
    STORE r20, r9
    LDI r9, 84
    ADD r20, r6
    STORE r20, r9
    LDI r9, 0
    ADD r20, r6
    STORE r20, r9
    LDI r6, 2
    LDI r9, 2
    LDI r13, 0x520
    TEXT r6, r9, r13

do_frame:
    FRAME
    JMP main_loop
