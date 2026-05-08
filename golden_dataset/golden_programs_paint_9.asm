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
;   r4  - constant 1
;   r10  - scratch
;   r0  - scratch
;   r2  - color
;   r8 - mouse X from MOUSEQ
;   r9 - mouse Y from MOUSEQ
;   r1 - hit query result
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
LDI r4, 2
LDI r10, 240
LDI r0, 30
LDI r15, 14
HITSET r4, r10, r0, r15, 1

; Color 1: Green at x=34
LDI r4, 34
LDI r10, 240
LDI r0, 30
LDI r15, 14
HITSET r4, r10, r0, r15, 2

; Color 2: Blue at x=66
LDI r4, 66
LDI r10, 240
LDI r0, 30
LDI r15, 14
HITSET r4, r10, r0, r15, 3

; Color 3: Yellow at x=98
LDI r4, 98
LDI r10, 240
LDI r0, 30
LDI r15, 14
HITSET r4, r10, r0, r15, 4

; Color 4: Cyan at x=130
LDI r4, 130
LDI r10, 240
LDI r0, 30
LDI r15, 14
HITSET r4, r10, r0, r15, 5

; Color 5: Magenta at x=162
LDI r4, 162
LDI r10, 240
LDI r0, 30
LDI r15, 14
HITSET r4, r10, r0, r15, 6

; Color 6: White at x=194
LDI r4, 194
LDI r10, 240
LDI r0, 30
LDI r15, 14
HITSET r4, r10, r0, r15, 7

; Color 7: Orange at x=226
LDI r4, 226
LDI r10, 240
LDI r0, 26
LDI r15, 14
HITSET r4, r10, r0, r15, 8

; Clear button at x=2, y=220, 40x16, id=99
LDI r4, 2
LDI r10, 220
LDI r0, 40
LDI r15, 16
HITSET r4, r10, r0, r15, 99

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r4, 1

    ; ── Read mouse position ──
    MOUSEQ r8
    ; r8 = mouse_x, r9 = mouse_y

    ; ── Check palette hit regions ──
    HITQ r1
    JZ r1, check_paint

    ; r1 = hit region id
    CMPI r1, 1
    JZ r14, set_red
    CMPI r1, 2
    JZ r14, set_green
    CMPI r1, 3
    JZ r14, set_blue
    CMPI r1, 4
    JZ r14, set_yellow
    CMPI r1, 5
    JZ r14, set_cyan
    CMPI r1, 6
    JZ r14, set_magenta
    CMPI r1, 7
    JZ r14, set_white
    CMPI r1, 8
    JZ r14, set_orange
    CMPI r1, 99
    JZ r14, do_clear
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
    LDI r4, 1
    ; Check if mouse is in paint area (y < 220)
    CMPI r9, 220
    BGE r14, draw_frame

    ; Mouse is in paint area -- draw pixel at mouse pos
    LDI r20, COLOR
    LOAD r2, r20

    ; Paint pixel at current mouse position
    PSET r8, r9, r2

    ; Also paint pixels between previous and current pos (line fill)
    ; Simple approach -- just paint prev pos too for continuity
    LDI r20, PREV_X
    LOAD r10, r20
    CMPI r10, 0
    JZ r14, save_pos

    LDI r20, PREV_Y
    LOAD r0, r20
    PSET r10, r0, r2

save_pos:
    LDI r20, PREV_X
    STORE r20, r8
    LDI r20, PREV_Y
    STORE r20, r9

    ; Set paint flag
    LDI r20, PAINT
    LDI r10, 1
    STORE r20, r10

    JMP draw_frame

draw_frame:
    LDI r4, 1

    ; ── Draw palette background bar ──
    LDI r4, 0
    LDI r10, 238
    LDI r0, 256
    LDI r15, 18
    LDI r2, 0x222222
    RECTF r4, r10, r0, r15, r2

    ; ── Highlight selected color (drawn BEFORE swatches so they appear on top) ──
    LDI r20, COLOR
    LOAD r2, r20
    CMPI r2, 0xFF0000
    JNZ r14, chk_grn
    LDI r4, 1
    LDI r10, 239
    LDI r0, 32
    LDI r15, 16
    LDI r13, 0xFFFFFF
    RECTF r4, r10, r0, r15, r13
    JMP draw_swatches

chk_grn:
    CMPI r2, 0x00FF00
    JNZ r14, chk_blu
    LDI r4, 33
    LDI r10, 239
    LDI r0, 32
    LDI r15, 16
    LDI r13, 0xFFFFFF
    RECTF r4, r10, r0, r15, r13
    JMP draw_swatches

chk_blu:
    CMPI r2, 0x0000FF
    JNZ r14, chk_yel
    LDI r4, 65
    LDI r10, 239
    LDI r0, 32
    LDI r15, 16
    LDI r13, 0xFFFFFF
    RECTF r4, r10, r0, r15, r13
    JMP draw_swatches

chk_yel:
    CMPI r2, 0xFFFF00
    JNZ r14, chk_cya
    LDI r4, 97
    LDI r10, 239
    LDI r0, 32
    LDI r15, 16
    LDI r13, 0xFFFFFF
    RECTF r4, r10, r0, r15, r13
    JMP draw_swatches

chk_cya:
    CMPI r2, 0x00FFFF
    JNZ r14, chk_mag
    LDI r4, 129
    LDI r10, 239
    LDI r0, 32
    LDI r15, 16
    LDI r13, 0xFFFFFF
    RECTF r4, r10, r0, r15, r13
    JMP draw_swatches

chk_mag:
    CMPI r2, 0xFF00FF
    JNZ r14, chk_wht
    LDI r4, 161
    LDI r10, 239
    LDI r0, 32
    LDI r15, 16
    LDI r13, 0xFFFFFF
    RECTF r4, r10, r0, r15, r13
    JMP draw_swatches

chk_wht:
    CMPI r2, 0xFFFFFF
    JNZ r14, chk_org
    LDI r4, 193
    LDI r10, 239
    LDI r0, 32
    LDI r15, 16
    LDI r13, 0x888888
    RECTF r4, r10, r0, r15, r13
    JMP draw_swatches

chk_org:
    CMPI r2, 0xFF8800
    JNZ r14, draw_swatches
    LDI r4, 225
    LDI r10, 239
    LDI r0, 28
    LDI r15, 16
    LDI r13, 0xFFFFFF
    RECTF r4, r10, r0, r15, r13

draw_swatches:
    ; ── Draw color swatches (on top of highlight) ──
    ; Red (id=1)
    LDI r4, 2
    LDI r10, 240
    LDI r0, 30
    LDI r15, 14
    LDI r2, 0xFF0000
    RECTF r4, r10, r0, r15, r2

    ; Green (id=2)
    LDI r4, 34
    LDI r2, 0x00FF00
    RECTF r4, r10, r0, r15, r2

    ; Blue (id=3)
    LDI r4, 66
    LDI r2, 0x0000FF
    RECTF r4, r10, r0, r15, r2

    ; Yellow (id=4)
    LDI r4, 98
    LDI r2, 0xFFFF00
    RECTF r4, r10, r0, r15, r2

    ; Cyan (id=5)
    LDI r4, 130
    LDI r2, 0x00FFFF
    RECTF r4, r10, r0, r15, r2

    ; Magenta (id=6)
    LDI r4, 162
    LDI r2, 0xFF00FF
    RECTF r4, r10, r0, r15, r2

    ; White (id=7)
    LDI r4, 194
    LDI r2, 0xFFFFFF
    RECTF r4, r10, r0, r15, r2

    ; Orange (id=8)
    LDI r4, 226
    LDI r0, 26
    LDI r2, 0xFF8800
    RECTF r4, r10, r0, r15, r2

    ; ── Draw Clear button ──
    LDI r4, 2
    LDI r10, 220
    LDI r0, 40
    LDI r15, 16
    LDI r2, 0x555555
    RECTF r4, r10, r0, r15, r2

    ; "CLR" label on clear button
    LDI r20, 0x500
    LDI r10, 67
    STORE r20, r10
    LDI r10, 76
    ADD r20, r4
    STORE r20, r10
    LDI r10, 82
    ADD r20, r4
    STORE r20, r10
    LDI r10, 0
    ADD r20, r4
    STORE r20, r10
    LDI r4, 10
    LDI r10, 224
    LDI r0, 0x500
    TEXT r4, r10, r0

    ; ── Draw title ──
    LDI r4, 1
    LDI r20, 0x520
    LDI r10, 80
    STORE r20, r10
    LDI r10, 65
    ADD r20, r4
    STORE r20, r10
    LDI r10, 73
    ADD r20, r4
    STORE r20, r10
    LDI r10, 78
    ADD r20, r4
    STORE r20, r10
    LDI r10, 84
    ADD r20, r4
    STORE r20, r10
    LDI r10, 0
    ADD r20, r4
    STORE r20, r10
    LDI r4, 2
    LDI r10, 2
    LDI r0, 0x520
    TEXT r4, r10, r0

do_frame:
    FRAME
    JMP main_loop
