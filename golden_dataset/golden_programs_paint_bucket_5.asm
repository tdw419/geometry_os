; DESCRIPTION: Geometry OS program to draw a red object.

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
;   r2  = constant 1
;   r9  = scratch
;   r3  = scratch
;   r12  = scratch (tolerance, always 0 for exact match)
;   r4  = current color (starts red)
;   r8  = key value
;   r14 = cursor X (starts at 128)
;   r11 = cursor Y (starts at 128)
;   r1 = zero constant
;   r10 = one constant
;   r16 = step size (3)

; ── INIT ──────────────────────────────────────────────
    LDI r1, 0
    LDI r10, 1
    LDI r16, 3
    LDI r14, 128          ; cursor X
    LDI r11, 128          ; cursor Y
    LDI r12, 0             ; tolerance = 0 (exact match)
    LDI r4, 0xFF0000      ; start with red

; ── Draw canvas background ────────────────────────────
    LDI r9, 0x111111
    FILL r9               ; dark background

; ── Draw bordered shapes ──────────────────────────────
; ── Draw bordered shapes using RECTF (outer fill + inner fill) ──

; Shape 1: White-bordered rectangle at (20,20) size 80x60
    LDI r4, 0xFFFFFF      ; white
    LDI r9, 20            ; x
    LDI r3, 20            ; y
    LDI r2, 2             ; w reg
    LDI r0, 80            ; w
    LDI r6, 60            ; h
    RECTF r9, r3, r0, r6, r4

; Inner of shape 1: black fill at (22,22) size 76x56
    LDI r4, 0x000000      ; black
    LDI r9, 22
    LDI r3, 22
    LDI r0, 76
    LDI r6, 56
    RECTF r9, r3, r0, r6, r4

; Shape 2: Circle approximation using concentric rects at (130,20) size 80x60
    LDI r4, 0x00FF00      ; green border
    LDI r9, 130
    LDI r3, 20
    LDI r0, 80
    LDI r6, 60
    RECTF r9, r3, r0, r6, r4

    LDI r4, 0x000000      ; black interior
    LDI r9, 132
    LDI r3, 22
    LDI r0, 76
    LDI r6, 56
    RECTF r9, r3, r0, r6, r4

; Shape 3: Small square at (20,100) size 40x40
    LDI r4, 0x0000FF      ; blue border
    LDI r9, 20
    LDI r3, 100
    LDI r0, 40
    LDI r6, 40
    RECTF r9, r3, r0, r6, r4

    LDI r4, 0x000000
    LDI r9, 22
    LDI r3, 102
    LDI r0, 36
    LDI r6, 36
    RECTF r9, r3, r0, r6, r4

; Shape 4: Tall rectangle at (80,100) size 30x80
    LDI r4, 0xFFFF00      ; yellow border
    LDI r9, 80
    LDI r3, 100
    LDI r0, 30
    LDI r6, 80
    RECTF r9, r3, r0, r6, r4

    LDI r4, 0x000000
    LDI r9, 82
    LDI r3, 102
    LDI r0, 26
    LDI r6, 76
    RECTF r9, r3, r0, r6, r4

; Shape 5: L-shaped region (two overlapping rects)
    LDI r4, 0xFF00FF      ; magenta border
    LDI r9, 140
    LDI r3, 100
    LDI r0, 60
    LDI r6, 30
    RECTF r9, r3, r0, r6, r4

    LDI r9, 140
    LDI r3, 120
    LDI r0, 30
    LDI r6, 50
    RECTF r9, r3, r0, r6, r4

; Inner L-shape (black)
    LDI r4, 0x000000
    LDI r9, 142
    LDI r3, 102
    LDI r0, 56
    LDI r6, 26
    RECTF r9, r3, r0, r6, r4

    LDI r9, 142
    LDI r3, 122
    LDI r0, 26
    LDI r6, 46
    RECTF r9, r3, r0, r6, r4

; Reset color to red
    LDI r4, 0xFF0000

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
    LDI r3, 200
    LDI r20, 0x500
    TEXT r9, r3, r20

    ; Draw "SP=PAINT" at bottom
    LDI r9, 2
    LDI r3, 212
    LDI r20, 0x520
    TEXT r9, r3, r20

    ; Draw "F=FILL" at bottom
    LDI r9, 2
    LDI r3, 224
    LDI r20, 0x560
    TEXT r9, r3, r20

; ── MAIN LOOP ────────────────────────────────────────
main_loop:
    FRAME

    ; Erase old cursor (draw dark pixel)
    LDI r9, 0x111111
    PSET r14, r11, r9

    ; Read keyboard
    IKEY r8

    ; Process movement
    ; W = move up
    LDI r9, 87
    CMP r8, r9
    JNZ r10, not_w
    SUB r11, r16
not_w:
    ; S = move down
    LDI r9, 83
    CMP r8, r9
    JNZ r10, not_s
    ADD r11, r16
not_s:
    ; A = move left
    LDI r9, 65
    CMP r8, r9
    JNZ r10, not_a
    SUB r14, r16
not_a:
    ; D = move right
    LDI r9, 68
    CMP r8, r9
    JNZ r10, not_d
    ADD r14, r16
not_d:

    ; Space = paint pixel
    LDI r9, 32
    CMP r8, r9
    JNZ r10, not_space
    PSET r14, r11, r4
not_space:

    ; F = flood fill from cursor
    LDI r9, 70
    CMP r8, r9
    JNZ r10, not_f
    FLOOD r14, r11, r4, r12    ; x, y, fill_color, tolerance=0
not_f:

    ; 1 = red
    LDI r9, 49
    CMP r8, r9
    JNZ r10, not_1
    LDI r4, 0xFF0000
not_1:
    ; 2 = green
    LDI r9, 50
    CMP r8, r9
    JNZ r10, not_2
    LDI r4, 0x00FF00
not_2:
    ; 3 = blue
    LDI r9, 51
    CMP r8, r9
    JNZ r10, not_3
    LDI r4, 0x0000FF
not_3:
    ; 4 = yellow
    LDI r9, 52
    CMP r8, r9
    JNZ r10, not_4
    LDI r4, 0xFFFF00
not_4:
    ; 5 = white
    LDI r9, 53
    CMP r8, r9
    JNZ r10, not_5
    LDI r4, 0xFFFFFF
not_5:

    ; C = clear canvas
    LDI r9, 67
    CMP r8, r9
    JNZ r10, not_c
    LDI r9, 0x111111
    FILL r9
not_c:

    ; Q = quit
    LDI r9, 81
    CMP r8, r9
    JNZ r10, not_q
    HALT
not_q:

    ; Draw cursor (current color with white center indicator)
    PSET r14, r11, r4

    JMP main_loop
