; DESCRIPTION: Draws a red object at the screen with fixed size.

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
;   r11  = constant 1
;   r15  = scratch
;   r7  = scratch
;   r9  = scratch (tolerance, always 0 for exact match)
;   r8  = current color (starts red)
;   r0  = key value
;   r13 = cursor X (starts at 128)
;   r10 = cursor Y (starts at 128)
;   r4 = zero constant
;   r2 = one constant
;   r16 = step size (3)

; ── INIT ──────────────────────────────────────────────
    LDI r4, 0
    LDI r2, 1
    LDI r16, 3
    LDI r13, 128          ; cursor X
    LDI r10, 128          ; cursor Y
    LDI r9, 0             ; tolerance = 0 (exact match)
    LDI r8, 0xFF0000      ; start with red

; ── Draw canvas background ────────────────────────────
    LDI r15, 0x111111
    FILL r15               ; dark background

; ── Draw bordered shapes ──────────────────────────────
; ── Draw bordered shapes using RECTF (outer fill + inner fill) ──

; Shape 1: White-bordered rectangle at (20,20) size 80x60
    LDI r8, 0xFFFFFF      ; white
    LDI r15, 20            ; x
    LDI r7, 20            ; y
    LDI r11, 2             ; w reg
    LDI r14, 80            ; w
    LDI r5, 60            ; h
    RECTF r15, r7, r14, r5, r8

; Inner of shape 1: black fill at (22,22) size 76x56
    LDI r8, 0x000000      ; black
    LDI r15, 22
    LDI r7, 22
    LDI r14, 76
    LDI r5, 56
    RECTF r15, r7, r14, r5, r8

; Shape 2: Circle approximation using concentric rects at (130,20) size 80x60
    LDI r8, 0x00FF00      ; green border
    LDI r15, 130
    LDI r7, 20
    LDI r14, 80
    LDI r5, 60
    RECTF r15, r7, r14, r5, r8

    LDI r8, 0x000000      ; black interior
    LDI r15, 132
    LDI r7, 22
    LDI r14, 76
    LDI r5, 56
    RECTF r15, r7, r14, r5, r8

; Shape 3: Small square at (20,100) size 40x40
    LDI r8, 0x0000FF      ; blue border
    LDI r15, 20
    LDI r7, 100
    LDI r14, 40
    LDI r5, 40
    RECTF r15, r7, r14, r5, r8

    LDI r8, 0x000000
    LDI r15, 22
    LDI r7, 102
    LDI r14, 36
    LDI r5, 36
    RECTF r15, r7, r14, r5, r8

; Shape 4: Tall rectangle at (80,100) size 30x80
    LDI r8, 0xFFFF00      ; yellow border
    LDI r15, 80
    LDI r7, 100
    LDI r14, 30
    LDI r5, 80
    RECTF r15, r7, r14, r5, r8

    LDI r8, 0x000000
    LDI r15, 82
    LDI r7, 102
    LDI r14, 26
    LDI r5, 76
    RECTF r15, r7, r14, r5, r8

; Shape 5: L-shaped region (two overlapping rects)
    LDI r8, 0xFF00FF      ; magenta border
    LDI r15, 140
    LDI r7, 100
    LDI r14, 60
    LDI r5, 30
    RECTF r15, r7, r14, r5, r8

    LDI r15, 140
    LDI r7, 120
    LDI r14, 30
    LDI r5, 50
    RECTF r15, r7, r14, r5, r8

; Inner L-shape (black)
    LDI r8, 0x000000
    LDI r15, 142
    LDI r7, 102
    LDI r14, 56
    LDI r5, 26
    RECTF r15, r7, r14, r5, r8

    LDI r15, 142
    LDI r7, 122
    LDI r14, 26
    LDI r5, 46
    RECTF r15, r7, r14, r5, r8

; Reset color to red
    LDI r8, 0xFF0000

; ── Draw UI text at bottom ────────────────────────────
; Store strings in RAM
    LDI r20, 0x500
    LDI r15, 0x57           ; 'W'
    STORE r20, r15
    LDI r20, 0x504
    LDI r15, 0x41           ; 'A'
    STORE r20, r15
    LDI r20, 0x508
    LDI r15, 0x53           ; 'S'
    STORE r20, r15
    LDI r20, 0x50C
    LDI r15, 0x44           ; 'D'
    STORE r20, r15
    LDI r20, 0x510
    LDI r15, 0
    STORE r20, r15

    LDI r20, 0x520
    LDI r15, 0x53           ; 'S'
    STORE r20, r15
    LDI r20, 0x524
    LDI r15, 0x50           ; 'P'
    STORE r20, r15
    LDI r20, 0x528
    LDI r15, 0x3D           ; '='
    STORE r20, r15
    LDI r20, 0x52C
    LDI r15, 0x50           ; 'P'
    STORE r20, r15
    LDI r20, 0x530
    LDI r15, 0x41           ; 'A'
    STORE r20, r15
    LDI r20, 0x534
    LDI r15, 0x49           ; 'I'
    STORE r20, r15
    LDI r20, 0x538
    LDI r15, 0x4E           ; 'N'
    STORE r20, r15
    LDI r20, 0x53C
    LDI r15, 0x54           ; 'T'
    STORE r20, r15
    LDI r20, 0x540
    LDI r15, 0
    STORE r20, r15

    LDI r20, 0x560
    LDI r15, 0x46           ; 'F'
    STORE r20, r15
    LDI r20, 0x564
    LDI r15, 0x3D           ; '='
    STORE r20, r15
    LDI r20, 0x568
    LDI r15, 0x46           ; 'F'
    STORE r20, r15
    LDI r20, 0x56C
    LDI r15, 0x49           ; 'I'
    STORE r20, r15
    LDI r20, 0x570
    LDI r15, 0x4C           ; 'L'
    STORE r20, r15
    LDI r20, 0x574
    LDI r15, 0x4C           ; 'L'
    STORE r20, r15
    LDI r20, 0x578
    LDI r15, 0
    STORE r20, r15

    ; Draw "WASD=MOVE" at bottom
    LDI r15, 2
    LDI r7, 200
    LDI r20, 0x500
    TEXT r15, r7, r20

    ; Draw "SP=PAINT" at bottom
    LDI r15, 2
    LDI r7, 212
    LDI r20, 0x520
    TEXT r15, r7, r20

    ; Draw "F=FILL" at bottom
    LDI r15, 2
    LDI r7, 224
    LDI r20, 0x560
    TEXT r15, r7, r20

; ── MAIN LOOP ────────────────────────────────────────
main_loop:
    FRAME

    ; Erase old cursor (draw dark pixel)
    LDI r15, 0x111111
    PSET r13, r10, r15

    ; Read keyboard
    IKEY r0

    ; Process movement
    ; W = move up
    LDI r15, 87
    CMP r0, r15
    JNZ r2, not_w
    SUB r10, r16
not_w:
    ; S = move down
    LDI r15, 83
    CMP r0, r15
    JNZ r2, not_s
    ADD r10, r16
not_s:
    ; A = move left
    LDI r15, 65
    CMP r0, r15
    JNZ r2, not_a
    SUB r13, r16
not_a:
    ; D = move right
    LDI r15, 68
    CMP r0, r15
    JNZ r2, not_d
    ADD r13, r16
not_d:

    ; Space = paint pixel
    LDI r15, 32
    CMP r0, r15
    JNZ r2, not_space
    PSET r13, r10, r8
not_space:

    ; F = flood fill from cursor
    LDI r15, 70
    CMP r0, r15
    JNZ r2, not_f
    FLOOD r13, r10, r8, r9    ; x, y, fill_color, tolerance=0
not_f:

    ; 1 = red
    LDI r15, 49
    CMP r0, r15
    JNZ r2, not_1
    LDI r8, 0xFF0000
not_1:
    ; 2 = green
    LDI r15, 50
    CMP r0, r15
    JNZ r2, not_2
    LDI r8, 0x00FF00
not_2:
    ; 3 = blue
    LDI r15, 51
    CMP r0, r15
    JNZ r2, not_3
    LDI r8, 0x0000FF
not_3:
    ; 4 = yellow
    LDI r15, 52
    CMP r0, r15
    JNZ r2, not_4
    LDI r8, 0xFFFF00
not_4:
    ; 5 = white
    LDI r15, 53
    CMP r0, r15
    JNZ r2, not_5
    LDI r8, 0xFFFFFF
not_5:

    ; C = clear canvas
    LDI r15, 67
    CMP r0, r15
    JNZ r2, not_c
    LDI r15, 0x111111
    FILL r15
not_c:

    ; Q = quit
    LDI r15, 81
    CMP r0, r15
    JNZ r2, not_q
    HALT
not_q:

    ; Draw cursor (current color with white center indicator)
    PSET r13, r10, r8

    JMP main_loop
