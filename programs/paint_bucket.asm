; paint_bucket.asm -- Paint Bucket Demo for Geometry OS
;
; Proves: FLOOD opcode (0xCE) for scanline flood fill
;         PSET for cursor, RECTF for shapes, IKEY for keyboard input
;
; Controls:
;   W/A/S/D  = move cursor
;   Space    = paint pixel at cursor (draw mode)
;   F        = flood fill from cursor position with current color
;   1-5      = select color (red, green, blue, yellow, white)
;   C        = clear canvas
;   Q        = quit
;
; The demo draws several bordered shapes on startup.
; Use F to flood-fill enclosed regions with the selected color.
;
; Register allocation:
;   r1  = constant 1
;   r2  = scratch
;   r3  = scratch
;   r4  = scratch (tolerance, always 0 for exact match)
;   r5  = current color (starts red)
;   r6  = key value
;   r10 = cursor X (starts at 128)
;   r11 = cursor Y (starts at 128)
;   r14 = zero constant
;   r15 = one constant
;   r16 = step size (3)

; ── INIT ──────────────────────────────────────────────
    LDI r14, 0
    LDI r15, 1
    LDI r16, 3
    LDI r10, 128          ; cursor X
    LDI r11, 128          ; cursor Y
    LDI r4, 0             ; tolerance = 0 (exact match)
    LDI r5, 0xFF0000      ; start with red

; ── Draw canvas background ────────────────────────────
    LDI r2, 0x111111
    FILL r2               ; dark background

; ── Draw bordered shapes ──────────────────────────────
; Shape 1: Large rectangle border (white outline, black interior)
; Outer: (20,20) to (100,80)
    LDI r2, 20
    LDI r3, 20
    LDI r5, 0xFFFFFF      ; white
draw_rect_outline:
    ; Top edge
    LDI r2, 20
top_loop:
    CMP r2, r14
    JZ r15, skip_top
    PSETI 20, r2, r5      ; actually we need a different approach
    ; Let's use a simpler method - draw the outline manually
skip_top:

; Actually, let me draw filled rectangles to make borders
; Approach: draw outer filled rect in white, then inner filled rect in black

; Shape 1: White-bordered rectangle at (20,20) size 80x60
    LDI r5, 0xFFFFFF      ; white
    LDI r2, 20            ; x
    LDI r3, 20            ; y
    LDI r1, 2             ; w reg
    LDI r8, 80            ; w
    LDI r9, 60            ; h
    RECTF r2, r3, r8, r9, r5

; Inner of shape 1: black fill at (22,22) size 76x56
    LDI r5, 0x000000      ; black
    LDI r2, 22
    LDI r3, 22
    LDI r8, 76
    LDI r9, 56
    RECTF r2, r3, r8, r9, r5

; Shape 2: Circle approximation using concentric rects at (130,20) size 80x60
    LDI r5, 0x00FF00      ; green border
    LDI r2, 130
    LDI r3, 20
    LDI r8, 80
    LDI r9, 60
    RECTF r2, r3, r8, r9, r5

    LDI r5, 0x000000      ; black interior
    LDI r2, 132
    LDI r3, 22
    LDI r8, 76
    LDI r9, 56
    RECTF r2, r3, r8, r9, r5

; Shape 3: Small square at (20,100) size 40x40
    LDI r5, 0x0000FF      ; blue border
    LDI r2, 20
    LDI r3, 100
    LDI r8, 40
    LDI r9, 40
    RECTF r2, r3, r8, r9, r5

    LDI r5, 0x000000
    LDI r2, 22
    LDI r3, 102
    LDI r8, 36
    LDI r9, 36
    RECTF r2, r3, r8, r9, r5

; Shape 4: Tall rectangle at (80,100) size 30x80
    LDI r5, 0xFFFF00      ; yellow border
    LDI r2, 80
    LDI r3, 100
    LDI r8, 30
    LDI r9, 80
    RECTF r2, r3, r8, r9, r5

    LDI r5, 0x000000
    LDI r2, 82
    LDI r3, 102
    LDI r8, 26
    LDI r9, 76
    RECTF r2, r3, r8, r9, r5

; Shape 5: L-shaped region (two overlapping rects)
    LDI r5, 0xFF00FF      ; magenta border
    LDI r2, 140
    LDI r3, 100
    LDI r8, 60
    LDI r9, 30
    RECTF r2, r3, r8, r9, r5

    LDI r2, 140
    LDI r3, 120
    LDI r8, 30
    LDI r9, 50
    RECTF r2, r3, r8, r9, r5

; Inner L-shape (black)
    LDI r5, 0x000000
    LDI r2, 142
    LDI r3, 102
    LDI r8, 56
    LDI r9, 26
    RECTF r2, r3, r8, r9, r5

    LDI r2, 142
    LDI r3, 122
    LDI r8, 26
    LDI r9, 46
    RECTF r2, r3, r8, r9, r5

; Reset color to red
    LDI r5, 0xFF0000

; ── Draw UI text at bottom ────────────────────────────
; Store strings in RAM
    LDI r20, 0x500
    LDI r2, 'W'
    STORE r20, r2
    LDI r20, 0x504
    LDI r2, 'A'
    STORE r20, r2
    LDI r20, 0x508
    LDI r2, 'S'
    STORE r20, r2
    LDI r20, 0x50C
    LDI r2, 'D'
    STORE r20, r2
    LDI r20, 0x510
    LDI r2, 0
    STORE r20, r2

    LDI r20, 0x520
    LDI r2, 'S'
    STORE r20, r2
    LDI r20, 0x524
    LDI r2, 'P'
    STORE r20, r2
    LDI r20, 0x528
    LDI r2, '='
    STORE r20, r2
    LDI r20, 0x52C
    LDI r2, 'P'
    STORE r20, r2
    LDI r20, 0x530
    LDI r2, 'A'
    STORE r20, r2
    LDI r20, 0x534
    LDI r2, 'I'
    STORE r20, r2
    LDI r20, 0x538
    LDI r2, 'N'
    STORE r20, r2
    LDI r20, 0x53C
    LDI r2, 'T'
    STORE r20, r2
    LDI r20, 0x540
    LDI r2, 0
    STORE r20, r2

    LDI r20, 0x560
    LDI r2, 'F'
    STORE r20, r2
    LDI r20, 0x564
    LDI r2, '='
    STORE r20, r2
    LDI r20, 0x568
    LDI r2, 'F'
    STORE r20, r2
    LDI r20, 0x56C
    LDI r2, 'I'
    STORE r20, r2
    LDI r20, 0x570
    LDI r2, 'L'
    STORE r20, r2
    LDI r20, 0x574
    LDI r2, 'L'
    STORE r20, r2
    LDI r20, 0x578
    LDI r2, 0
    STORE r20, r2

    ; Draw "WASD=MOVE" at bottom
    LDI r2, 2
    LDI r3, 200
    LDI r20, 0x500
    TEXT r2, r3, r20

    ; Draw "SP=PAINT" at bottom
    LDI r2, 2
    LDI r3, 212
    LDI r20, 0x520
    TEXT r2, r3, r20

    ; Draw "F=FILL" at bottom
    LDI r2, 2
    LDI r3, 224
    LDI r20, 0x560
    TEXT r2, r3, r20

; ── MAIN LOOP ────────────────────────────────────────
main_loop:
    FRAME

    ; Erase old cursor (draw dark pixel)
    LDI r2, 0x111111
    PSET r10, r11, r2

    ; Read keyboard
    IKEY r6

    ; Process movement
    ; W = move up
    LDI r2, 87
    CMP r6, r2
    JNZ r15, not_w
    SUB r11, r16
not_w:
    ; S = move down
    LDI r2, 83
    CMP r6, r2
    JNZ r15, not_s
    ADD r11, r16
not_s:
    ; A = move left
    LDI r2, 65
    CMP r6, r2
    JNZ r15, not_a
    SUB r10, r16
not_a:
    ; D = move right
    LDI r2, 68
    CMP r6, r2
    JNZ r15, not_d
    ADD r10, r16
not_d:

    ; Space = paint pixel
    LDI r2, 32
    CMP r6, r2
    JNZ r15, not_space
    PSET r10, r11, r5
not_space:

    ; F = flood fill from cursor
    LDI r2, 70
    CMP r6, r2
    JNZ r15, not_f
    FLOOD r10, r11, r5, r4    ; x, y, fill_color, tolerance=0
not_f:

    ; 1 = red
    LDI r2, 49
    CMP r6, r2
    JNZ r15, not_1
    LDI r5, 0xFF0000
not_1:
    ; 2 = green
    LDI r2, 50
    CMP r6, r2
    JNZ r15, not_2
    LDI r5, 0x00FF00
not_2:
    ; 3 = blue
    LDI r2, 51
    CMP r6, r2
    JNZ r15, not_3
    LDI r5, 0x0000FF
not_3:
    ; 4 = yellow
    LDI r2, 52
    CMP r6, r2
    JNZ r15, not_4
    LDI r5, 0xFFFF00
not_4:
    ; 5 = white
    LDI r2, 53
    CMP r6, r2
    JNZ r15, not_5
    LDI r5, 0xFFFFFF
not_5:

    ; C = clear canvas
    LDI r2, 67
    CMP r6, r2
    JNZ r15, not_c
    LDI r2, 0x111111
    FILL r2
not_c:

    ; Q = quit
    LDI r2, 81
    CMP r6, r2
    JNZ r15, not_q
    HALT
not_q:

    ; Draw cursor (current color with white center indicator)
    PSET r10, r11, r5

    JMP r14, main_loop
