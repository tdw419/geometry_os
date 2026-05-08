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
;   r4  = constant 1
;   r13  = scratch
;   r14  = scratch
;   r8  = scratch (tolerance, always 0 for exact match)
;   r3  = current color (starts red)
;   r15  = key value
;   r10 = cursor X (starts at 128)
;   r12 = cursor Y (starts at 128)
;   r9 = zero constant
;   r6 = one constant
;   r16 = step size (3)

; ── INIT ──────────────────────────────────────────────
    LDI r9, 0
    LDI r6, 1
    LDI r16, 3
    LDI r10, 128          ; cursor X
    LDI r12, 128          ; cursor Y
    LDI r8, 0             ; tolerance = 0 (exact match)
    LDI r3, 0xFF0000      ; start with red

; ── Draw canvas background ────────────────────────────
    LDI r13, 0x111111
    FILL r13               ; dark background

; ── Draw bordered shapes ──────────────────────────────
; ── Draw bordered shapes using RECTF (outer fill + inner fill) ──

; Shape 1: White-bordered rectangle at (20,20) size 80x60
    LDI r3, 0xFFFFFF      ; white
    LDI r13, 20            ; x
    LDI r14, 20            ; y
    LDI r4, 2             ; w reg
    LDI r11, 80            ; w
    LDI r0, 60            ; h
    RECTF r13, r14, r11, r0, r3

; Inner of shape 1: black fill at (22,22) size 76x56
    LDI r3, 0x000000      ; black
    LDI r13, 22
    LDI r14, 22
    LDI r11, 76
    LDI r0, 56
    RECTF r13, r14, r11, r0, r3

; Shape 2: Circle approximation using concentric rects at (130,20) size 80x60
    LDI r3, 0x00FF00      ; green border
    LDI r13, 130
    LDI r14, 20
    LDI r11, 80
    LDI r0, 60
    RECTF r13, r14, r11, r0, r3

    LDI r3, 0x000000      ; black interior
    LDI r13, 132
    LDI r14, 22
    LDI r11, 76
    LDI r0, 56
    RECTF r13, r14, r11, r0, r3

; Shape 3: Small square at (20,100) size 40x40
    LDI r3, 0x0000FF      ; blue border
    LDI r13, 20
    LDI r14, 100
    LDI r11, 40
    LDI r0, 40
    RECTF r13, r14, r11, r0, r3

    LDI r3, 0x000000
    LDI r13, 22
    LDI r14, 102
    LDI r11, 36
    LDI r0, 36
    RECTF r13, r14, r11, r0, r3

; Shape 4: Tall rectangle at (80,100) size 30x80
    LDI r3, 0xFFFF00      ; yellow border
    LDI r13, 80
    LDI r14, 100
    LDI r11, 30
    LDI r0, 80
    RECTF r13, r14, r11, r0, r3

    LDI r3, 0x000000
    LDI r13, 82
    LDI r14, 102
    LDI r11, 26
    LDI r0, 76
    RECTF r13, r14, r11, r0, r3

; Shape 5: L-shaped region (two overlapping rects)
    LDI r3, 0xFF00FF      ; magenta border
    LDI r13, 140
    LDI r14, 100
    LDI r11, 60
    LDI r0, 30
    RECTF r13, r14, r11, r0, r3

    LDI r13, 140
    LDI r14, 120
    LDI r11, 30
    LDI r0, 50
    RECTF r13, r14, r11, r0, r3

; Inner L-shape (black)
    LDI r3, 0x000000
    LDI r13, 142
    LDI r14, 102
    LDI r11, 56
    LDI r0, 26
    RECTF r13, r14, r11, r0, r3

    LDI r13, 142
    LDI r14, 122
    LDI r11, 26
    LDI r0, 46
    RECTF r13, r14, r11, r0, r3

; Reset color to red
    LDI r3, 0xFF0000

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
    LDI r14, 200
    LDI r20, 0x500
    TEXT r13, r14, r20

    ; Draw "SP=PAINT" at bottom
    LDI r13, 2
    LDI r14, 212
    LDI r20, 0x520
    TEXT r13, r14, r20

    ; Draw "F=FILL" at bottom
    LDI r13, 2
    LDI r14, 224
    LDI r20, 0x560
    TEXT r13, r14, r20

; ── MAIN LOOP ────────────────────────────────────────
main_loop:
    FRAME

    ; Erase old cursor (draw dark pixel)
    LDI r13, 0x111111
    PSET r10, r12, r13

    ; Read keyboard
    IKEY r15

    ; Process movement
    ; W = move up
    LDI r13, 87
    CMP r15, r13
    JNZ r6, not_w
    SUB r12, r16
not_w:
    ; S = move down
    LDI r13, 83
    CMP r15, r13
    JNZ r6, not_s
    ADD r12, r16
not_s:
    ; A = move left
    LDI r13, 65
    CMP r15, r13
    JNZ r6, not_a
    SUB r10, r16
not_a:
    ; D = move right
    LDI r13, 68
    CMP r15, r13
    JNZ r6, not_d
    ADD r10, r16
not_d:

    ; Space = paint pixel
    LDI r13, 32
    CMP r15, r13
    JNZ r6, not_space
    PSET r10, r12, r3
not_space:

    ; F = flood fill from cursor
    LDI r13, 70
    CMP r15, r13
    JNZ r6, not_f
    FLOOD r10, r12, r3, r8    ; x, y, fill_color, tolerance=0
not_f:

    ; 1 = red
    LDI r13, 49
    CMP r15, r13
    JNZ r6, not_1
    LDI r3, 0xFF0000
not_1:
    ; 2 = green
    LDI r13, 50
    CMP r15, r13
    JNZ r6, not_2
    LDI r3, 0x00FF00
not_2:
    ; 3 = blue
    LDI r13, 51
    CMP r15, r13
    JNZ r6, not_3
    LDI r3, 0x0000FF
not_3:
    ; 4 = yellow
    LDI r13, 52
    CMP r15, r13
    JNZ r6, not_4
    LDI r3, 0xFFFF00
not_4:
    ; 5 = white
    LDI r13, 53
    CMP r15, r13
    JNZ r6, not_5
    LDI r3, 0xFFFFFF
not_5:

    ; C = clear canvas
    LDI r13, 67
    CMP r15, r13
    JNZ r6, not_c
    LDI r13, 0x111111
    FILL r13
not_c:

    ; Q = quit
    LDI r13, 81
    CMP r15, r13
    JNZ r6, not_q
    HALT
not_q:

    ; Draw cursor (current color with white center indicator)
    PSET r10, r12, r3

    JMP main_loop
