; DESCRIPTION: Display a object using color red at the screen.

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
;   r4  = constant 1
;   r3  = scratch
;   r9  = scratch
;   r13  = scratch (tolerance, always 0 for exact match)
;   r1  = current color (starts red)
;   r0  = key value
;   r12 = cursor X (starts at 128)
;   r8 = cursor Y (starts at 128)
;   r2 = zero constant
;   r11 = one constant
;   r16 = step size (3)

; ── INIT ──────────────────────────────────────────────
    LDI r2, 0
    LDI r11, 1
    LDI r16, 3
    LDI r12, 128          ; cursor X
    LDI r8, 128          ; cursor Y
    LDI r13, 0             ; tolerance = 0 (exact match)
    LDI r1, 0xFF0000      ; start with red

; ── Draw canvas background ────────────────────────────
    LDI r3, 0x111111
    FILL r3               ; dark background

; ── Draw bordered shapes ──────────────────────────────
; ── Draw bordered shapes using RECTF (outer fill + inner fill) ──

; Shape 1: White-bordered rectangle at (20,20) size 80x60
    LDI r1, 0xFFFFFF      ; white
    LDI r3, 20            ; x
    LDI r9, 20            ; y
    LDI r4, 2             ; w reg
    LDI r6, 80            ; w
    LDI r5, 60            ; h
    RECTF r3, r9, r6, r5, r1

; Inner of shape 1: black fill at (22,22) size 76x56
    LDI r1, 0x000000      ; black
    LDI r3, 22
    LDI r9, 22
    LDI r6, 76
    LDI r5, 56
    RECTF r3, r9, r6, r5, r1

; Shape 2: Circle approximation using concentric rects at (130,20) size 80x60
    LDI r1, 0x00FF00      ; green border
    LDI r3, 130
    LDI r9, 20
    LDI r6, 80
    LDI r5, 60
    RECTF r3, r9, r6, r5, r1

    LDI r1, 0x000000      ; black interior
    LDI r3, 132
    LDI r9, 22
    LDI r6, 76
    LDI r5, 56
    RECTF r3, r9, r6, r5, r1

; Shape 3: Small square at (20,100) size 40x40
    LDI r1, 0x0000FF      ; blue border
    LDI r3, 20
    LDI r9, 100
    LDI r6, 40
    LDI r5, 40
    RECTF r3, r9, r6, r5, r1

    LDI r1, 0x000000
    LDI r3, 22
    LDI r9, 102
    LDI r6, 36
    LDI r5, 36
    RECTF r3, r9, r6, r5, r1

; Shape 4: Tall rectangle at (80,100) size 30x80
    LDI r1, 0xFFFF00      ; yellow border
    LDI r3, 80
    LDI r9, 100
    LDI r6, 30
    LDI r5, 80
    RECTF r3, r9, r6, r5, r1

    LDI r1, 0x000000
    LDI r3, 82
    LDI r9, 102
    LDI r6, 26
    LDI r5, 76
    RECTF r3, r9, r6, r5, r1

; Shape 5: L-shaped region (two overlapping rects)
    LDI r1, 0xFF00FF      ; magenta border
    LDI r3, 140
    LDI r9, 100
    LDI r6, 60
    LDI r5, 30
    RECTF r3, r9, r6, r5, r1

    LDI r3, 140
    LDI r9, 120
    LDI r6, 30
    LDI r5, 50
    RECTF r3, r9, r6, r5, r1

; Inner L-shape (black)
    LDI r1, 0x000000
    LDI r3, 142
    LDI r9, 102
    LDI r6, 56
    LDI r5, 26
    RECTF r3, r9, r6, r5, r1

    LDI r3, 142
    LDI r9, 122
    LDI r6, 26
    LDI r5, 46
    RECTF r3, r9, r6, r5, r1

; Reset color to red
    LDI r1, 0xFF0000

; ── Draw UI text at bottom ────────────────────────────
; Store strings in RAM
    LDI r20, 0x500
    LDI r3, 0x57           ; 'W'
    STORE r20, r3
    LDI r20, 0x504
    LDI r3, 0x41           ; 'A'
    STORE r20, r3
    LDI r20, 0x508
    LDI r3, 0x53           ; 'S'
    STORE r20, r3
    LDI r20, 0x50C
    LDI r3, 0x44           ; 'D'
    STORE r20, r3
    LDI r20, 0x510
    LDI r3, 0
    STORE r20, r3

    LDI r20, 0x520
    LDI r3, 0x53           ; 'S'
    STORE r20, r3
    LDI r20, 0x524
    LDI r3, 0x50           ; 'P'
    STORE r20, r3
    LDI r20, 0x528
    LDI r3, 0x3D           ; '='
    STORE r20, r3
    LDI r20, 0x52C
    LDI r3, 0x50           ; 'P'
    STORE r20, r3
    LDI r20, 0x530
    LDI r3, 0x41           ; 'A'
    STORE r20, r3
    LDI r20, 0x534
    LDI r3, 0x49           ; 'I'
    STORE r20, r3
    LDI r20, 0x538
    LDI r3, 0x4E           ; 'N'
    STORE r20, r3
    LDI r20, 0x53C
    LDI r3, 0x54           ; 'T'
    STORE r20, r3
    LDI r20, 0x540
    LDI r3, 0
    STORE r20, r3

    LDI r20, 0x560
    LDI r3, 0x46           ; 'F'
    STORE r20, r3
    LDI r20, 0x564
    LDI r3, 0x3D           ; '='
    STORE r20, r3
    LDI r20, 0x568
    LDI r3, 0x46           ; 'F'
    STORE r20, r3
    LDI r20, 0x56C
    LDI r3, 0x49           ; 'I'
    STORE r20, r3
    LDI r20, 0x570
    LDI r3, 0x4C           ; 'L'
    STORE r20, r3
    LDI r20, 0x574
    LDI r3, 0x4C           ; 'L'
    STORE r20, r3
    LDI r20, 0x578
    LDI r3, 0
    STORE r20, r3

    ; Draw "WASD=MOVE" at bottom
    LDI r3, 2
    LDI r9, 200
    LDI r20, 0x500
    TEXT r3, r9, r20

    ; Draw "SP=PAINT" at bottom
    LDI r3, 2
    LDI r9, 212
    LDI r20, 0x520
    TEXT r3, r9, r20

    ; Draw "F=FILL" at bottom
    LDI r3, 2
    LDI r9, 224
    LDI r20, 0x560
    TEXT r3, r9, r20

; ── MAIN LOOP ────────────────────────────────────────
main_loop:
    FRAME

    ; Erase old cursor (draw dark pixel)
    LDI r3, 0x111111
    PSET r12, r8, r3

    ; Read keyboard
    IKEY r0

    ; Process movement
    ; W = move up
    LDI r3, 87
    CMP r0, r3
    JNZ r11, not_w
    SUB r8, r16
not_w:
    ; S = move down
    LDI r3, 83
    CMP r0, r3
    JNZ r11, not_s
    ADD r8, r16
not_s:
    ; A = move left
    LDI r3, 65
    CMP r0, r3
    JNZ r11, not_a
    SUB r12, r16
not_a:
    ; D = move right
    LDI r3, 68
    CMP r0, r3
    JNZ r11, not_d
    ADD r12, r16
not_d:

    ; Space = paint pixel
    LDI r3, 32
    CMP r0, r3
    JNZ r11, not_space
    PSET r12, r8, r1
not_space:

    ; F = flood fill from cursor
    LDI r3, 70
    CMP r0, r3
    JNZ r11, not_f
    FLOOD r12, r8, r1, r13    ; x, y, fill_color, tolerance=0
not_f:

    ; 1 = red
    LDI r3, 49
    CMP r0, r3
    JNZ r11, not_1
    LDI r1, 0xFF0000
not_1:
    ; 2 = green
    LDI r3, 50
    CMP r0, r3
    JNZ r11, not_2
    LDI r1, 0x00FF00
not_2:
    ; 3 = blue
    LDI r3, 51
    CMP r0, r3
    JNZ r11, not_3
    LDI r1, 0x0000FF
not_3:
    ; 4 = yellow
    LDI r3, 52
    CMP r0, r3
    JNZ r11, not_4
    LDI r1, 0xFFFF00
not_4:
    ; 5 = white
    LDI r3, 53
    CMP r0, r3
    JNZ r11, not_5
    LDI r1, 0xFFFFFF
not_5:

    ; C = clear canvas
    LDI r3, 67
    CMP r0, r3
    JNZ r11, not_c
    LDI r3, 0x111111
    FILL r3
not_c:

    ; Q = quit
    LDI r3, 81
    CMP r0, r3
    JNZ r11, not_q
    HALT
not_q:

    ; Draw cursor (current color with white center indicator)
    PSET r12, r8, r1

    JMP main_loop
