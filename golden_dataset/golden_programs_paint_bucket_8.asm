; DESCRIPTION: A red object centered at the screen with fixed size.

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
;   r12  = constant 1
;   r9  = scratch
;   r15  = scratch
;   r5  = scratch (tolerance, always 0 for exact match)
;   r3  = current color (starts red)
;   r1  = key value
;   r8 = cursor X (starts at 128)
;   r7 = cursor Y (starts at 128)
;   r4 = zero constant
;   r0 = one constant
;   r16 = step size (3)

; ── INIT ──────────────────────────────────────────────
    LDI r4, 0
    LDI r0, 1
    LDI r16, 3
    LDI r8, 128          ; cursor X
    LDI r7, 128          ; cursor Y
    LDI r5, 0             ; tolerance = 0 (exact match)
    LDI r3, 0xFF0000      ; start with red

; ── Draw canvas background ────────────────────────────
    LDI r9, 0x111111
    FILL r9               ; dark background

; ── Draw bordered shapes ──────────────────────────────
; ── Draw bordered shapes using RECTF (outer fill + inner fill) ──

; Shape 1: White-bordered rectangle at (20,20) size 80x60
    LDI r3, 0xFFFFFF      ; white
    LDI r9, 20            ; x
    LDI r15, 20            ; y
    LDI r12, 2             ; w reg
    LDI r10, 80            ; w
    LDI r2, 60            ; h
    RECTF r9, r15, r10, r2, r3

; Inner of shape 1: black fill at (22,22) size 76x56
    LDI r3, 0x000000      ; black
    LDI r9, 22
    LDI r15, 22
    LDI r10, 76
    LDI r2, 56
    RECTF r9, r15, r10, r2, r3

; Shape 2: Circle approximation using concentric rects at (130,20) size 80x60
    LDI r3, 0x00FF00      ; green border
    LDI r9, 130
    LDI r15, 20
    LDI r10, 80
    LDI r2, 60
    RECTF r9, r15, r10, r2, r3

    LDI r3, 0x000000      ; black interior
    LDI r9, 132
    LDI r15, 22
    LDI r10, 76
    LDI r2, 56
    RECTF r9, r15, r10, r2, r3

; Shape 3: Small square at (20,100) size 40x40
    LDI r3, 0x0000FF      ; blue border
    LDI r9, 20
    LDI r15, 100
    LDI r10, 40
    LDI r2, 40
    RECTF r9, r15, r10, r2, r3

    LDI r3, 0x000000
    LDI r9, 22
    LDI r15, 102
    LDI r10, 36
    LDI r2, 36
    RECTF r9, r15, r10, r2, r3

; Shape 4: Tall rectangle at (80,100) size 30x80
    LDI r3, 0xFFFF00      ; yellow border
    LDI r9, 80
    LDI r15, 100
    LDI r10, 30
    LDI r2, 80
    RECTF r9, r15, r10, r2, r3

    LDI r3, 0x000000
    LDI r9, 82
    LDI r15, 102
    LDI r10, 26
    LDI r2, 76
    RECTF r9, r15, r10, r2, r3

; Shape 5: L-shaped region (two overlapping rects)
    LDI r3, 0xFF00FF      ; magenta border
    LDI r9, 140
    LDI r15, 100
    LDI r10, 60
    LDI r2, 30
    RECTF r9, r15, r10, r2, r3

    LDI r9, 140
    LDI r15, 120
    LDI r10, 30
    LDI r2, 50
    RECTF r9, r15, r10, r2, r3

; Inner L-shape (black)
    LDI r3, 0x000000
    LDI r9, 142
    LDI r15, 102
    LDI r10, 56
    LDI r2, 26
    RECTF r9, r15, r10, r2, r3

    LDI r9, 142
    LDI r15, 122
    LDI r10, 26
    LDI r2, 46
    RECTF r9, r15, r10, r2, r3

; Reset color to red
    LDI r3, 0xFF0000

; ── Draw UI text at bottom ────────────────────────────
; Store strings in RAM
    LDI r20, 0x500
    LDI r9, 0x57           ; 'W'
    STORE r20, r9
    LDI r20, 0x504
    LDI r9, 0x41           ; 'A'
    STORE r20, r9
    LDI r20, 0x508
    LDI r9, 0x53           ; 'S'
    STORE r20, r9
    LDI r20, 0x50C
    LDI r9, 0x44           ; 'D'
    STORE r20, r9
    LDI r20, 0x510
    LDI r9, 0
    STORE r20, r9

    LDI r20, 0x520
    LDI r9, 0x53           ; 'S'
    STORE r20, r9
    LDI r20, 0x524
    LDI r9, 0x50           ; 'P'
    STORE r20, r9
    LDI r20, 0x528
    LDI r9, 0x3D           ; '='
    STORE r20, r9
    LDI r20, 0x52C
    LDI r9, 0x50           ; 'P'
    STORE r20, r9
    LDI r20, 0x530
    LDI r9, 0x41           ; 'A'
    STORE r20, r9
    LDI r20, 0x534
    LDI r9, 0x49           ; 'I'
    STORE r20, r9
    LDI r20, 0x538
    LDI r9, 0x4E           ; 'N'
    STORE r20, r9
    LDI r20, 0x53C
    LDI r9, 0x54           ; 'T'
    STORE r20, r9
    LDI r20, 0x540
    LDI r9, 0
    STORE r20, r9

    LDI r20, 0x560
    LDI r9, 0x46           ; 'F'
    STORE r20, r9
    LDI r20, 0x564
    LDI r9, 0x3D           ; '='
    STORE r20, r9
    LDI r20, 0x568
    LDI r9, 0x46           ; 'F'
    STORE r20, r9
    LDI r20, 0x56C
    LDI r9, 0x49           ; 'I'
    STORE r20, r9
    LDI r20, 0x570
    LDI r9, 0x4C           ; 'L'
    STORE r20, r9
    LDI r20, 0x574
    LDI r9, 0x4C           ; 'L'
    STORE r20, r9
    LDI r20, 0x578
    LDI r9, 0
    STORE r20, r9

    ; Draw "WASD=MOVE" at bottom
    LDI r9, 2
    LDI r15, 200
    LDI r20, 0x500
    TEXT r9, r15, r20

    ; Draw "SP=PAINT" at bottom
    LDI r9, 2
    LDI r15, 212
    LDI r20, 0x520
    TEXT r9, r15, r20

    ; Draw "F=FILL" at bottom
    LDI r9, 2
    LDI r15, 224
    LDI r20, 0x560
    TEXT r9, r15, r20

; ── MAIN LOOP ────────────────────────────────────────
main_loop:
    FRAME

    ; Erase old cursor (draw dark pixel)
    LDI r9, 0x111111
    PSET r8, r7, r9

    ; Read keyboard
    IKEY r1

    ; Process movement
    ; W = move up
    LDI r9, 87
    CMP r1, r9
    JNZ r0, not_w
    SUB r7, r16
not_w:
    ; S = move down
    LDI r9, 83
    CMP r1, r9
    JNZ r0, not_s
    ADD r7, r16
not_s:
    ; A = move left
    LDI r9, 65
    CMP r1, r9
    JNZ r0, not_a
    SUB r8, r16
not_a:
    ; D = move right
    LDI r9, 68
    CMP r1, r9
    JNZ r0, not_d
    ADD r8, r16
not_d:

    ; Space = paint pixel
    LDI r9, 32
    CMP r1, r9
    JNZ r0, not_space
    PSET r8, r7, r3
not_space:

    ; F = flood fill from cursor
    LDI r9, 70
    CMP r1, r9
    JNZ r0, not_f
    FLOOD r8, r7, r3, r5    ; x, y, fill_color, tolerance=0
not_f:

    ; 1 = red
    LDI r9, 49
    CMP r1, r9
    JNZ r0, not_1
    LDI r3, 0xFF0000
not_1:
    ; 2 = green
    LDI r9, 50
    CMP r1, r9
    JNZ r0, not_2
    LDI r3, 0x00FF00
not_2:
    ; 3 = blue
    LDI r9, 51
    CMP r1, r9
    JNZ r0, not_3
    LDI r3, 0x0000FF
not_3:
    ; 4 = yellow
    LDI r9, 52
    CMP r1, r9
    JNZ r0, not_4
    LDI r3, 0xFFFF00
not_4:
    ; 5 = white
    LDI r9, 53
    CMP r1, r9
    JNZ r0, not_5
    LDI r3, 0xFFFFFF
not_5:

    ; C = clear canvas
    LDI r9, 67
    CMP r1, r9
    JNZ r0, not_c
    LDI r9, 0x111111
    FILL r9
not_c:

    ; Q = quit
    LDI r9, 81
    CMP r1, r9
    JNZ r0, not_q
    HALT
not_q:

    ; Draw cursor (current color with white center indicator)
    PSET r8, r7, r3

    JMP main_loop
