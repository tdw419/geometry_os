; DESCRIPTION: This GeOS assembly code implements a paint bucket demo that demonstrates flood fill functionality using the FLOOD opcode. The program initializes a canvas with various bordered shapes and allows users to navigate with WASD keys, paint pixels with spacebar, flood fill enclosed regions with 'F', select colors 1-5, clear the canvas with 'C', and quit with 'Q'.

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
;   r3  = constant 1
;   r6  = scratch
;   r13  = scratch
;   r0  = scratch (tolerance, always 0 for exact match)
;   r4  = current color (starts red)
;   r1  = key value
;   r9 = cursor X (starts at 128)
;   r8 = cursor Y (starts at 128)
;   r2 = zero constant
;   r11 = one constant
;   r16 = step size (3)

; ── INIT ──────────────────────────────────────────────
    LDI r2, 0
    LDI r11, 1
    LDI r16, 3
    LDI r9, 128          ; cursor X
    LDI r8, 128          ; cursor Y
    LDI r0, 0             ; tolerance = 0 (exact match)
    LDI r4, 0xFF0000      ; start with red

; ── Draw canvas background ────────────────────────────
    LDI r6, 0x111111
    FILL r6               ; dark background

; ── Draw bordered shapes ──────────────────────────────
; ── Draw bordered shapes using RECTF (outer fill + inner fill) ──

; Shape 1: White-bordered rectangle at (20,20) size 80x60
    LDI r4, 0xFFFFFF      ; white
    LDI r6, 20            ; x
    LDI r13, 20            ; y
    LDI r3, 2             ; w reg
    LDI r5, 80            ; w
    LDI r14, 60            ; h
    RECTF r6, r13, r5, r14, r4

; Inner of shape 1: black fill at (22,22) size 76x56
    LDI r4, 0x000000      ; black
    LDI r6, 22
    LDI r13, 22
    LDI r5, 76
    LDI r14, 56
    RECTF r6, r13, r5, r14, r4

; Shape 2: Circle approximation using concentric rects at (130,20) size 80x60
    LDI r4, 0x00FF00      ; green border
    LDI r6, 130
    LDI r13, 20
    LDI r5, 80
    LDI r14, 60
    RECTF r6, r13, r5, r14, r4

    LDI r4, 0x000000      ; black interior
    LDI r6, 132
    LDI r13, 22
    LDI r5, 76
    LDI r14, 56
    RECTF r6, r13, r5, r14, r4

; Shape 3: Small square at (20,100) size 40x40
    LDI r4, 0x0000FF      ; blue border
    LDI r6, 20
    LDI r13, 100
    LDI r5, 40
    LDI r14, 40
    RECTF r6, r13, r5, r14, r4

    LDI r4, 0x000000
    LDI r6, 22
    LDI r13, 102
    LDI r5, 36
    LDI r14, 36
    RECTF r6, r13, r5, r14, r4

; Shape 4: Tall rectangle at (80,100) size 30x80
    LDI r4, 0xFFFF00      ; yellow border
    LDI r6, 80
    LDI r13, 100
    LDI r5, 30
    LDI r14, 80
    RECTF r6, r13, r5, r14, r4

    LDI r4, 0x000000
    LDI r6, 82
    LDI r13, 102
    LDI r5, 26
    LDI r14, 76
    RECTF r6, r13, r5, r14, r4

; Shape 5: L-shaped region (two overlapping rects)
    LDI r4, 0xFF00FF      ; magenta border
    LDI r6, 140
    LDI r13, 100
    LDI r5, 60
    LDI r14, 30
    RECTF r6, r13, r5, r14, r4

    LDI r6, 140
    LDI r13, 120
    LDI r5, 30
    LDI r14, 50
    RECTF r6, r13, r5, r14, r4

; Inner L-shape (black)
    LDI r4, 0x000000
    LDI r6, 142
    LDI r13, 102
    LDI r5, 56
    LDI r14, 26
    RECTF r6, r13, r5, r14, r4

    LDI r6, 142
    LDI r13, 122
    LDI r5, 26
    LDI r14, 46
    RECTF r6, r13, r5, r14, r4

; Reset color to red
    LDI r4, 0xFF0000

; ── Draw UI text at bottom ────────────────────────────
; Store strings in RAM
    LDI r20, 0x500
    LDI r6, 0x57           ; 'W'
    STORE r20, r6
    LDI r20, 0x504
    LDI r6, 0x41           ; 'A'
    STORE r20, r6
    LDI r20, 0x508
    LDI r6, 0x53           ; 'S'
    STORE r20, r6
    LDI r20, 0x50C
    LDI r6, 0x44           ; 'D'
    STORE r20, r6
    LDI r20, 0x510
    LDI r6, 0
    STORE r20, r6

    LDI r20, 0x520
    LDI r6, 0x53           ; 'S'
    STORE r20, r6
    LDI r20, 0x524
    LDI r6, 0x50           ; 'P'
    STORE r20, r6
    LDI r20, 0x528
    LDI r6, 0x3D           ; '='
    STORE r20, r6
    LDI r20, 0x52C
    LDI r6, 0x50           ; 'P'
    STORE r20, r6
    LDI r20, 0x530
    LDI r6, 0x41           ; 'A'
    STORE r20, r6
    LDI r20, 0x534
    LDI r6, 0x49           ; 'I'
    STORE r20, r6
    LDI r20, 0x538
    LDI r6, 0x4E           ; 'N'
    STORE r20, r6
    LDI r20, 0x53C
    LDI r6, 0x54           ; 'T'
    STORE r20, r6
    LDI r20, 0x540
    LDI r6, 0
    STORE r20, r6

    LDI r20, 0x560
    LDI r6, 0x46           ; 'F'
    STORE r20, r6
    LDI r20, 0x564
    LDI r6, 0x3D           ; '='
    STORE r20, r6
    LDI r20, 0x568
    LDI r6, 0x46           ; 'F'
    STORE r20, r6
    LDI r20, 0x56C
    LDI r6, 0x49           ; 'I'
    STORE r20, r6
    LDI r20, 0x570
    LDI r6, 0x4C           ; 'L'
    STORE r20, r6
    LDI r20, 0x574
    LDI r6, 0x4C           ; 'L'
    STORE r20, r6
    LDI r20, 0x578
    LDI r6, 0
    STORE r20, r6

    ; Draw "WASD=MOVE" at bottom
    LDI r6, 2
    LDI r13, 200
    LDI r20, 0x500
    TEXT r6, r13, r20

    ; Draw "SP=PAINT" at bottom
    LDI r6, 2
    LDI r13, 212
    LDI r20, 0x520
    TEXT r6, r13, r20

    ; Draw "F=FILL" at bottom
    LDI r6, 2
    LDI r13, 224
    LDI r20, 0x560
    TEXT r6, r13, r20

; ── MAIN LOOP ────────────────────────────────────────
main_loop:
    FRAME

    ; Erase old cursor (draw dark pixel)
    LDI r6, 0x111111
    PSET r9, r8, r6

    ; Read keyboard
    IKEY r1

    ; Process movement
    ; W = move up
    LDI r6, 87
    CMP r1, r6
    JNZ r11, not_w
    SUB r8, r16
not_w:
    ; S = move down
    LDI r6, 83
    CMP r1, r6
    JNZ r11, not_s
    ADD r8, r16
not_s:
    ; A = move left
    LDI r6, 65
    CMP r1, r6
    JNZ r11, not_a
    SUB r9, r16
not_a:
    ; D = move right
    LDI r6, 68
    CMP r1, r6
    JNZ r11, not_d
    ADD r9, r16
not_d:

    ; Space = paint pixel
    LDI r6, 32
    CMP r1, r6
    JNZ r11, not_space
    PSET r9, r8, r4
not_space:

    ; F = flood fill from cursor
    LDI r6, 70
    CMP r1, r6
    JNZ r11, not_f
    FLOOD r9, r8, r4, r0    ; x, y, fill_color, tolerance=0
not_f:

    ; 1 = red
    LDI r6, 49
    CMP r1, r6
    JNZ r11, not_1
    LDI r4, 0xFF0000
not_1:
    ; 2 = green
    LDI r6, 50
    CMP r1, r6
    JNZ r11, not_2
    LDI r4, 0x00FF00
not_2:
    ; 3 = blue
    LDI r6, 51
    CMP r1, r6
    JNZ r11, not_3
    LDI r4, 0x0000FF
not_3:
    ; 4 = yellow
    LDI r6, 52
    CMP r1, r6
    JNZ r11, not_4
    LDI r4, 0xFFFF00
not_4:
    ; 5 = white
    LDI r6, 53
    CMP r1, r6
    JNZ r11, not_5
    LDI r4, 0xFFFFFF
not_5:

    ; C = clear canvas
    LDI r6, 67
    CMP r1, r6
    JNZ r11, not_c
    LDI r6, 0x111111
    FILL r6
not_c:

    ; Q = quit
    LDI r6, 81
    CMP r1, r6
    JNZ r11, not_q
    HALT
not_q:

    ; Draw cursor (current color with white center indicator)
    PSET r9, r8, r4

    JMP main_loop
