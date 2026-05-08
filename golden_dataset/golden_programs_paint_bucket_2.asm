; DESCRIPTION: Render a red object at the screen.

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
;   r10  = constant 1
;   r13  = scratch
;   r4  = scratch
;   r11  = scratch (tolerance, always 0 for exact match)
;   r7  = current color (starts red)
;   r2  = key value
;   r6 = cursor X (starts at 128)
;   r8 = cursor Y (starts at 128)
;   r15 = zero constant
;   r9 = one constant
;   r16 = step size (3)

; ── INIT ──────────────────────────────────────────────
    LDI r15, 0
    LDI r9, 1
    LDI r16, 3
    LDI r6, 128          ; cursor X
    LDI r8, 128          ; cursor Y
    LDI r11, 0             ; tolerance = 0 (exact match)
    LDI r7, 0xFF0000      ; start with red

; ── Draw canvas background ────────────────────────────
    LDI r13, 0x111111
    FILL r13               ; dark background

; ── Draw bordered shapes ──────────────────────────────
; ── Draw bordered shapes using RECTF (outer fill + inner fill) ──

; Shape 1: White-bordered rectangle at (20,20) size 80x60
    LDI r7, 0xFFFFFF      ; white
    LDI r13, 20            ; x
    LDI r4, 20            ; y
    LDI r10, 2             ; w reg
    LDI r12, 80            ; w
    LDI r1, 60            ; h
    RECTF r13, r4, r12, r1, r7

; Inner of shape 1: black fill at (22,22) size 76x56
    LDI r7, 0x000000      ; black
    LDI r13, 22
    LDI r4, 22
    LDI r12, 76
    LDI r1, 56
    RECTF r13, r4, r12, r1, r7

; Shape 2: Circle approximation using concentric rects at (130,20) size 80x60
    LDI r7, 0x00FF00      ; green border
    LDI r13, 130
    LDI r4, 20
    LDI r12, 80
    LDI r1, 60
    RECTF r13, r4, r12, r1, r7

    LDI r7, 0x000000      ; black interior
    LDI r13, 132
    LDI r4, 22
    LDI r12, 76
    LDI r1, 56
    RECTF r13, r4, r12, r1, r7

; Shape 3: Small square at (20,100) size 40x40
    LDI r7, 0x0000FF      ; blue border
    LDI r13, 20
    LDI r4, 100
    LDI r12, 40
    LDI r1, 40
    RECTF r13, r4, r12, r1, r7

    LDI r7, 0x000000
    LDI r13, 22
    LDI r4, 102
    LDI r12, 36
    LDI r1, 36
    RECTF r13, r4, r12, r1, r7

; Shape 4: Tall rectangle at (80,100) size 30x80
    LDI r7, 0xFFFF00      ; yellow border
    LDI r13, 80
    LDI r4, 100
    LDI r12, 30
    LDI r1, 80
    RECTF r13, r4, r12, r1, r7

    LDI r7, 0x000000
    LDI r13, 82
    LDI r4, 102
    LDI r12, 26
    LDI r1, 76
    RECTF r13, r4, r12, r1, r7

; Shape 5: L-shaped region (two overlapping rects)
    LDI r7, 0xFF00FF      ; magenta border
    LDI r13, 140
    LDI r4, 100
    LDI r12, 60
    LDI r1, 30
    RECTF r13, r4, r12, r1, r7

    LDI r13, 140
    LDI r4, 120
    LDI r12, 30
    LDI r1, 50
    RECTF r13, r4, r12, r1, r7

; Inner L-shape (black)
    LDI r7, 0x000000
    LDI r13, 142
    LDI r4, 102
    LDI r12, 56
    LDI r1, 26
    RECTF r13, r4, r12, r1, r7

    LDI r13, 142
    LDI r4, 122
    LDI r12, 26
    LDI r1, 46
    RECTF r13, r4, r12, r1, r7

; Reset color to red
    LDI r7, 0xFF0000

; ── Draw UI text at bottom ────────────────────────────
; Store strings in RAM
    LDI r20, 0x500
    LDI r13, 0x57           ; 'W'
    STORE r20, r13
    LDI r20, 0x504
    LDI r13, 0x41           ; 'A'
    STORE r20, r13
    LDI r20, 0x508
    LDI r13, 0x53           ; 'S'
    STORE r20, r13
    LDI r20, 0x50C
    LDI r13, 0x44           ; 'D'
    STORE r20, r13
    LDI r20, 0x510
    LDI r13, 0
    STORE r20, r13

    LDI r20, 0x520
    LDI r13, 0x53           ; 'S'
    STORE r20, r13
    LDI r20, 0x524
    LDI r13, 0x50           ; 'P'
    STORE r20, r13
    LDI r20, 0x528
    LDI r13, 0x3D           ; '='
    STORE r20, r13
    LDI r20, 0x52C
    LDI r13, 0x50           ; 'P'
    STORE r20, r13
    LDI r20, 0x530
    LDI r13, 0x41           ; 'A'
    STORE r20, r13
    LDI r20, 0x534
    LDI r13, 0x49           ; 'I'
    STORE r20, r13
    LDI r20, 0x538
    LDI r13, 0x4E           ; 'N'
    STORE r20, r13
    LDI r20, 0x53C
    LDI r13, 0x54           ; 'T'
    STORE r20, r13
    LDI r20, 0x540
    LDI r13, 0
    STORE r20, r13

    LDI r20, 0x560
    LDI r13, 0x46           ; 'F'
    STORE r20, r13
    LDI r20, 0x564
    LDI r13, 0x3D           ; '='
    STORE r20, r13
    LDI r20, 0x568
    LDI r13, 0x46           ; 'F'
    STORE r20, r13
    LDI r20, 0x56C
    LDI r13, 0x49           ; 'I'
    STORE r20, r13
    LDI r20, 0x570
    LDI r13, 0x4C           ; 'L'
    STORE r20, r13
    LDI r20, 0x574
    LDI r13, 0x4C           ; 'L'
    STORE r20, r13
    LDI r20, 0x578
    LDI r13, 0
    STORE r20, r13

    ; Draw "WASD=MOVE" at bottom
    LDI r13, 2
    LDI r4, 200
    LDI r20, 0x500
    TEXT r13, r4, r20

    ; Draw "SP=PAINT" at bottom
    LDI r13, 2
    LDI r4, 212
    LDI r20, 0x520
    TEXT r13, r4, r20

    ; Draw "F=FILL" at bottom
    LDI r13, 2
    LDI r4, 224
    LDI r20, 0x560
    TEXT r13, r4, r20

; ── MAIN LOOP ────────────────────────────────────────
main_loop:
    FRAME

    ; Erase old cursor (draw dark pixel)
    LDI r13, 0x111111
    PSET r6, r8, r13

    ; Read keyboard
    IKEY r2

    ; Process movement
    ; W = move up
    LDI r13, 87
    CMP r2, r13
    JNZ r9, not_w
    SUB r8, r16
not_w:
    ; S = move down
    LDI r13, 83
    CMP r2, r13
    JNZ r9, not_s
    ADD r8, r16
not_s:
    ; A = move left
    LDI r13, 65
    CMP r2, r13
    JNZ r9, not_a
    SUB r6, r16
not_a:
    ; D = move right
    LDI r13, 68
    CMP r2, r13
    JNZ r9, not_d
    ADD r6, r16
not_d:

    ; Space = paint pixel
    LDI r13, 32
    CMP r2, r13
    JNZ r9, not_space
    PSET r6, r8, r7
not_space:

    ; F = flood fill from cursor
    LDI r13, 70
    CMP r2, r13
    JNZ r9, not_f
    FLOOD r6, r8, r7, r11    ; x, y, fill_color, tolerance=0
not_f:

    ; 1 = red
    LDI r13, 49
    CMP r2, r13
    JNZ r9, not_1
    LDI r7, 0xFF0000
not_1:
    ; 2 = green
    LDI r13, 50
    CMP r2, r13
    JNZ r9, not_2
    LDI r7, 0x00FF00
not_2:
    ; 3 = blue
    LDI r13, 51
    CMP r2, r13
    JNZ r9, not_3
    LDI r7, 0x0000FF
not_3:
    ; 4 = yellow
    LDI r13, 52
    CMP r2, r13
    JNZ r9, not_4
    LDI r7, 0xFFFF00
not_4:
    ; 5 = white
    LDI r13, 53
    CMP r2, r13
    JNZ r9, not_5
    LDI r7, 0xFFFFFF
not_5:

    ; C = clear canvas
    LDI r13, 67
    CMP r2, r13
    JNZ r9, not_c
    LDI r13, 0x111111
    FILL r13
not_c:

    ; Q = quit
    LDI r13, 81
    CMP r2, r13
    JNZ r9, not_q
    HALT
not_q:

    ; Draw cursor (current color with white center indicator)
    PSET r6, r8, r7

    JMP main_loop
