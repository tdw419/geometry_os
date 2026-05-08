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
;   r2  - constant 1
;   r3  - scratch
;   r15  - scratch
;   r5  - color
;   r0 - mouse X from MOUSEQ
;   r4 - mouse Y from MOUSEQ
;   r10 - hit query result
;   r20 - RAM pointer
;   r21 - scratch for color index
;
; NOTE: Avoid colons in comments (assembler pitfall)

#define COLOR   0x400
#define PREV_X  0x404
#define PREV_Y  0x408
#define PAINT   0x40C

; ── INIT ──────────────────────────────────────
LDI r2, 1

; Default color = red
LDI r20, COLOR
LDI r3, 0xFF0000
STORE r20, r3

; Paint flag = 0
LDI r20, PAINT
LDI r3, 0
STORE r20, r3

; Fill screen dark (near-black)
LDI r3, 0x111111
FILL r3

; ── Register hit regions for palette buttons ──
; Palette is at bottom: y=240, 8 colors, each 30x14
; Color 0: Red at x=2
LDI r2, 2
LDI r3, 240
LDI r15, 30
LDI r12, 14
HITSET r2, r3, r15, r12, 1

; Color 1: Green at x=34
LDI r2, 34
LDI r3, 240
LDI r15, 30
LDI r12, 14
HITSET r2, r3, r15, r12, 2

; Color 2: Blue at x=66
LDI r2, 66
LDI r3, 240
LDI r15, 30
LDI r12, 14
HITSET r2, r3, r15, r12, 3

; Color 3: Yellow at x=98
LDI r2, 98
LDI r3, 240
LDI r15, 30
LDI r12, 14
HITSET r2, r3, r15, r12, 4

; Color 4: Cyan at x=130
LDI r2, 130
LDI r3, 240
LDI r15, 30
LDI r12, 14
HITSET r2, r3, r15, r12, 5

; Color 5: Magenta at x=162
LDI r2, 162
LDI r3, 240
LDI r15, 30
LDI r12, 14
HITSET r2, r3, r15, r12, 6

; Color 6: White at x=194
LDI r2, 194
LDI r3, 240
LDI r15, 30
LDI r12, 14
HITSET r2, r3, r15, r12, 7

; Color 7: Orange at x=226
LDI r2, 226
LDI r3, 240
LDI r15, 26
LDI r12, 14
HITSET r2, r3, r15, r12, 8

; Clear button at x=2, y=220, 40x16, id=99
LDI r2, 2
LDI r3, 220
LDI r15, 40
LDI r12, 16
HITSET r2, r3, r15, r12, 99

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r2, 1

    ; ── Read mouse position ──
    MOUSEQ r0
    ; r0 = mouse_x, r4 = mouse_y

    ; ── Check palette hit regions ──
    HITQ r10
    JZ r10, check_paint

    ; r10 = hit region id
    CMPI r10, 1
    JZ r13, set_red
    CMPI r10, 2
    JZ r13, set_green
    CMPI r10, 3
    JZ r13, set_blue
    CMPI r10, 4
    JZ r13, set_yellow
    CMPI r10, 5
    JZ r13, set_cyan
    CMPI r10, 6
    JZ r13, set_magenta
    CMPI r10, 7
    JZ r13, set_white
    CMPI r10, 8
    JZ r13, set_orange
    CMPI r10, 99
    JZ r13, do_clear
    JMP check_paint

set_red:
    LDI r20, COLOR
    LDI r3, 0xFF0000
    STORE r20, r3
    JMP draw_frame

set_green:
    LDI r20, COLOR
    LDI r3, 0x00FF00
    STORE r20, r3
    JMP draw_frame

set_blue:
    LDI r20, COLOR
    LDI r3, 0x0000FF
    STORE r20, r3
    JMP draw_frame

set_yellow:
    LDI r20, COLOR
    LDI r3, 0xFFFF00
    STORE r20, r3
    JMP draw_frame

set_cyan:
    LDI r20, COLOR
    LDI r3, 0x00FFFF
    STORE r20, r3
    JMP draw_frame

set_magenta:
    LDI r20, COLOR
    LDI r3, 0xFF00FF
    STORE r20, r3
    JMP draw_frame

set_white:
    LDI r20, COLOR
    LDI r3, 0xFFFFFF
    STORE r20, r3
    JMP draw_frame

set_orange:
    LDI r20, COLOR
    LDI r3, 0xFF8800
    STORE r20, r3
    JMP draw_frame

do_clear:
    ; Clear canvas area (keep palette)
    LDI r3, 0x111111
    FILL r3
    LDI r20, PAINT
    LDI r3, 0
    STORE r20, r3
    LDI r20, PREV_X
    LDI r3, 0
    STORE r20, r3
    LDI r20, PREV_Y
    LDI r3, 0
    STORE r20, r3
    JMP draw_frame

check_paint:
    LDI r2, 1
    ; Check if mouse is in paint area (y < 220)
    CMPI r4, 220
    BGE r13, draw_frame

    ; Mouse is in paint area -- draw pixel at mouse pos
    LDI r20, COLOR
    LOAD r5, r20

    ; Paint pixel at current mouse position
    PSET r0, r4, r5

    ; Also paint pixels between previous and current pos (line fill)
    ; Simple approach -- just paint prev pos too for continuity
    LDI r20, PREV_X
    LOAD r3, r20
    CMPI r3, 0
    JZ r13, save_pos

    LDI r20, PREV_Y
    LOAD r15, r20
    PSET r3, r15, r5

save_pos:
    LDI r20, PREV_X
    STORE r20, r0
    LDI r20, PREV_Y
    STORE r20, r4

    ; Set paint flag
    LDI r20, PAINT
    LDI r3, 1
    STORE r20, r3

    JMP draw_frame

draw_frame:
    LDI r2, 1

    ; ── Draw palette background bar ──
    LDI r2, 0
    LDI r3, 238
    LDI r15, 256
    LDI r12, 18
    LDI r5, 0x222222
    RECTF r2, r3, r15, r12, r5

    ; ── Highlight selected color (drawn BEFORE swatches so they appear on top) ──
    LDI r20, COLOR
    LOAD r5, r20
    CMPI r5, 0xFF0000
    JNZ r13, chk_grn
    LDI r2, 1
    LDI r3, 239
    LDI r15, 32
    LDI r12, 16
    LDI r7, 0xFFFFFF
    RECTF r2, r3, r15, r12, r7
    JMP draw_swatches

chk_grn:
    CMPI r5, 0x00FF00
    JNZ r13, chk_blu
    LDI r2, 33
    LDI r3, 239
    LDI r15, 32
    LDI r12, 16
    LDI r7, 0xFFFFFF
    RECTF r2, r3, r15, r12, r7
    JMP draw_swatches

chk_blu:
    CMPI r5, 0x0000FF
    JNZ r13, chk_yel
    LDI r2, 65
    LDI r3, 239
    LDI r15, 32
    LDI r12, 16
    LDI r7, 0xFFFFFF
    RECTF r2, r3, r15, r12, r7
    JMP draw_swatches

chk_yel:
    CMPI r5, 0xFFFF00
    JNZ r13, chk_cya
    LDI r2, 97
    LDI r3, 239
    LDI r15, 32
    LDI r12, 16
    LDI r7, 0xFFFFFF
    RECTF r2, r3, r15, r12, r7
    JMP draw_swatches

chk_cya:
    CMPI r5, 0x00FFFF
    JNZ r13, chk_mag
    LDI r2, 129
    LDI r3, 239
    LDI r15, 32
    LDI r12, 16
    LDI r7, 0xFFFFFF
    RECTF r2, r3, r15, r12, r7
    JMP draw_swatches

chk_mag:
    CMPI r5, 0xFF00FF
    JNZ r13, chk_wht
    LDI r2, 161
    LDI r3, 239
    LDI r15, 32
    LDI r12, 16
    LDI r7, 0xFFFFFF
    RECTF r2, r3, r15, r12, r7
    JMP draw_swatches

chk_wht:
    CMPI r5, 0xFFFFFF
    JNZ r13, chk_org
    LDI r2, 193
    LDI r3, 239
    LDI r15, 32
    LDI r12, 16
    LDI r7, 0x888888
    RECTF r2, r3, r15, r12, r7
    JMP draw_swatches

chk_org:
    CMPI r5, 0xFF8800
    JNZ r13, draw_swatches
    LDI r2, 225
    LDI r3, 239
    LDI r15, 28
    LDI r12, 16
    LDI r7, 0xFFFFFF
    RECTF r2, r3, r15, r12, r7

draw_swatches:
    ; ── Draw color swatches (on top of highlight) ──
    ; Red (id=1)
    LDI r2, 2
    LDI r3, 240
    LDI r15, 30
    LDI r12, 14
    LDI r5, 0xFF0000
    RECTF r2, r3, r15, r12, r5

    ; Green (id=2)
    LDI r2, 34
    LDI r5, 0x00FF00
    RECTF r2, r3, r15, r12, r5

    ; Blue (id=3)
    LDI r2, 66
    LDI r5, 0x0000FF
    RECTF r2, r3, r15, r12, r5

    ; Yellow (id=4)
    LDI r2, 98
    LDI r5, 0xFFFF00
    RECTF r2, r3, r15, r12, r5

    ; Cyan (id=5)
    LDI r2, 130
    LDI r5, 0x00FFFF
    RECTF r2, r3, r15, r12, r5

    ; Magenta (id=6)
    LDI r2, 162
    LDI r5, 0xFF00FF
    RECTF r2, r3, r15, r12, r5

    ; White (id=7)
    LDI r2, 194
    LDI r5, 0xFFFFFF
    RECTF r2, r3, r15, r12, r5

    ; Orange (id=8)
    LDI r2, 226
    LDI r15, 26
    LDI r5, 0xFF8800
    RECTF r2, r3, r15, r12, r5

    ; ── Draw Clear button ──
    LDI r2, 2
    LDI r3, 220
    LDI r15, 40
    LDI r12, 16
    LDI r5, 0x555555
    RECTF r2, r3, r15, r12, r5

    ; "CLR" label on clear button
    LDI r20, 0x500
    LDI r3, 67
    STORE r20, r3
    LDI r3, 76
    ADD r20, r2
    STORE r20, r3
    LDI r3, 82
    ADD r20, r2
    STORE r20, r3
    LDI r3, 0
    ADD r20, r2
    STORE r20, r3
    LDI r2, 10
    LDI r3, 224
    LDI r15, 0x500
    TEXT r2, r3, r15

    ; ── Draw title ──
    LDI r2, 1
    LDI r20, 0x520
    LDI r3, 80
    STORE r20, r3
    LDI r3, 65
    ADD r20, r2
    STORE r20, r3
    LDI r3, 73
    ADD r20, r2
    STORE r20, r3
    LDI r3, 78
    ADD r20, r2
    STORE r20, r3
    LDI r3, 84
    ADD r20, r2
    STORE r20, r3
    LDI r3, 0
    ADD r20, r2
    STORE r20, r3
    LDI r2, 2
    LDI r3, 2
    LDI r15, 0x520
    TEXT r2, r3, r15

do_frame:
    FRAME
    JMP main_loop
