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
;   r8  = scratch
;   r1  = scratch
;   r4  = scratch (tolerance, always 0 for exact match)
;   r9  = current color (starts red)
;   r7  = key value
;   r0 = cursor X (starts at 128)
;   r2 = cursor Y (starts at 128)
;   r10 = zero constant
;   r5 = one constant
;   r16 = step size (3)

; ── INIT ──────────────────────────────────────────────
    LDI r10, 0
    LDI r5, 1
    LDI r16, 3
    LDI r0, 128          ; cursor X
    LDI r2, 128          ; cursor Y
    LDI r4, 0             ; tolerance = 0 (exact match)
    LDI r9, 0xFF0000      ; start with red

; ── Draw canvas background ────────────────────────────
    LDI r8, 0x111111
    FILL r8               ; dark background

; ── Draw bordered shapes ──────────────────────────────
; ── Draw bordered shapes using RECTF (outer fill + inner fill) ──

; Shape 1: White-bordered rectangle at (20,20) size 80x60
    LDI r9, 0xFFFFFF      ; white
    LDI r8, 20            ; x
    LDI r1, 20            ; y
    LDI r3, 2             ; w reg
    LDI r13, 80            ; w
    LDI r12, 60            ; h
    RECTF r8, r1, r13, r12, r9

; Inner of shape 1: black fill at (22,22) size 76x56
    LDI r9, 0x000000      ; black
    LDI r8, 22
    LDI r1, 22
    LDI r13, 76
    LDI r12, 56
    RECTF r8, r1, r13, r12, r9

; Shape 2: Circle approximation using concentric rects at (130,20) size 80x60
    LDI r9, 0x00FF00      ; green border
    LDI r8, 130
    LDI r1, 20
    LDI r13, 80
    LDI r12, 60
    RECTF r8, r1, r13, r12, r9

    LDI r9, 0x000000      ; black interior
    LDI r8, 132
    LDI r1, 22
    LDI r13, 76
    LDI r12, 56
    RECTF r8, r1, r13, r12, r9

; Shape 3: Small square at (20,100) size 40x40
    LDI r9, 0x0000FF      ; blue border
    LDI r8, 20
    LDI r1, 100
    LDI r13, 40
    LDI r12, 40
    RECTF r8, r1, r13, r12, r9

    LDI r9, 0x000000
    LDI r8, 22
    LDI r1, 102
    LDI r13, 36
    LDI r12, 36
    RECTF r8, r1, r13, r12, r9

; Shape 4: Tall rectangle at (80,100) size 30x80
    LDI r9, 0xFFFF00      ; yellow border
    LDI r8, 80
    LDI r1, 100
    LDI r13, 30
    LDI r12, 80
    RECTF r8, r1, r13, r12, r9

    LDI r9, 0x000000
    LDI r8, 82
    LDI r1, 102
    LDI r13, 26
    LDI r12, 76
    RECTF r8, r1, r13, r12, r9

; Shape 5: L-shaped region (two overlapping rects)
    LDI r9, 0xFF00FF      ; magenta border
    LDI r8, 140
    LDI r1, 100
    LDI r13, 60
    LDI r12, 30
    RECTF r8, r1, r13, r12, r9

    LDI r8, 140
    LDI r1, 120
    LDI r13, 30
    LDI r12, 50
    RECTF r8, r1, r13, r12, r9

; Inner L-shape (black)
    LDI r9, 0x000000
    LDI r8, 142
    LDI r1, 102
    LDI r13, 56
    LDI r12, 26
    RECTF r8, r1, r13, r12, r9

    LDI r8, 142
    LDI r1, 122
    LDI r13, 26
    LDI r12, 46
    RECTF r8, r1, r13, r12, r9

; Reset color to red
    LDI r9, 0xFF0000

; ── Draw UI text at bottom ────────────────────────────
; Store strings in RAM
    LDI r20, 0x500
    LDI r8, 0x57           ; 'W'
    STORE r20, r8
    LDI r20, 0x504
    LDI r8, 0x41           ; 'A'
    STORE r20, r8
    LDI r20, 0x508
    LDI r8, 0x53           ; 'S'
    STORE r20, r8
    LDI r20, 0x50C
    LDI r8, 0x44           ; 'D'
    STORE r20, r8
    LDI r20, 0x510
    LDI r8, 0
    STORE r20, r8

    LDI r20, 0x520
    LDI r8, 0x53           ; 'S'
    STORE r20, r8
    LDI r20, 0x524
    LDI r8, 0x50           ; 'P'
    STORE r20, r8
    LDI r20, 0x528
    LDI r8, 0x3D           ; '='
    STORE r20, r8
    LDI r20, 0x52C
    LDI r8, 0x50           ; 'P'
    STORE r20, r8
    LDI r20, 0x530
    LDI r8, 0x41           ; 'A'
    STORE r20, r8
    LDI r20, 0x534
    LDI r8, 0x49           ; 'I'
    STORE r20, r8
    LDI r20, 0x538
    LDI r8, 0x4E           ; 'N'
    STORE r20, r8
    LDI r20, 0x53C
    LDI r8, 0x54           ; 'T'
    STORE r20, r8
    LDI r20, 0x540
    LDI r8, 0
    STORE r20, r8

    LDI r20, 0x560
    LDI r8, 0x46           ; 'F'
    STORE r20, r8
    LDI r20, 0x564
    LDI r8, 0x3D           ; '='
    STORE r20, r8
    LDI r20, 0x568
    LDI r8, 0x46           ; 'F'
    STORE r20, r8
    LDI r20, 0x56C
    LDI r8, 0x49           ; 'I'
    STORE r20, r8
    LDI r20, 0x570
    LDI r8, 0x4C           ; 'L'
    STORE r20, r8
    LDI r20, 0x574
    LDI r8, 0x4C           ; 'L'
    STORE r20, r8
    LDI r20, 0x578
    LDI r8, 0
    STORE r20, r8

    ; Draw "WASD=MOVE" at bottom
    LDI r8, 2
    LDI r1, 200
    LDI r20, 0x500
    TEXT r8, r1, r20

    ; Draw "SP=PAINT" at bottom
    LDI r8, 2
    LDI r1, 212
    LDI r20, 0x520
    TEXT r8, r1, r20

    ; Draw "F=FILL" at bottom
    LDI r8, 2
    LDI r1, 224
    LDI r20, 0x560
    TEXT r8, r1, r20

; ── MAIN LOOP ────────────────────────────────────────
main_loop:
    FRAME

    ; Erase old cursor (draw dark pixel)
    LDI r8, 0x111111
    PSET r0, r2, r8

    ; Read keyboard
    IKEY r7

    ; Process movement
    ; W = move up
    LDI r8, 87
    CMP r7, r8
    JNZ r5, not_w
    SUB r2, r16
not_w:
    ; S = move down
    LDI r8, 83
    CMP r7, r8
    JNZ r5, not_s
    ADD r2, r16
not_s:
    ; A = move left
    LDI r8, 65
    CMP r7, r8
    JNZ r5, not_a
    SUB r0, r16
not_a:
    ; D = move right
    LDI r8, 68
    CMP r7, r8
    JNZ r5, not_d
    ADD r0, r16
not_d:

    ; Space = paint pixel
    LDI r8, 32
    CMP r7, r8
    JNZ r5, not_space
    PSET r0, r2, r9
not_space:

    ; F = flood fill from cursor
    LDI r8, 70
    CMP r7, r8
    JNZ r5, not_f
    FLOOD r0, r2, r9, r4    ; x, y, fill_color, tolerance=0
not_f:

    ; 1 = red
    LDI r8, 49
    CMP r7, r8
    JNZ r5, not_1
    LDI r9, 0xFF0000
not_1:
    ; 2 = green
    LDI r8, 50
    CMP r7, r8
    JNZ r5, not_2
    LDI r9, 0x00FF00
not_2:
    ; 3 = blue
    LDI r8, 51
    CMP r7, r8
    JNZ r5, not_3
    LDI r9, 0x0000FF
not_3:
    ; 4 = yellow
    LDI r8, 52
    CMP r7, r8
    JNZ r5, not_4
    LDI r9, 0xFFFF00
not_4:
    ; 5 = white
    LDI r8, 53
    CMP r7, r8
    JNZ r5, not_5
    LDI r9, 0xFFFFFF
not_5:

    ; C = clear canvas
    LDI r8, 67
    CMP r7, r8
    JNZ r5, not_c
    LDI r8, 0x111111
    FILL r8
not_c:

    ; Q = quit
    LDI r8, 81
    CMP r7, r8
    JNZ r5, not_q
    HALT
not_q:

    ; Draw cursor (current color with white center indicator)
    PSET r0, r2, r9

    JMP main_loop
