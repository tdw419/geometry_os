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
;   r2  = constant 1
;   r7  = scratch
;   r9  = scratch
;   r0  = scratch (tolerance, always 0 for exact match)
;   r10  = current color (starts red)
;   r15  = key value
;   r14 = cursor X (starts at 128)
;   r3 = cursor Y (starts at 128)
;   r12 = zero constant
;   r13 = one constant
;   r16 = step size (3)

; ── INIT ──────────────────────────────────────────────
    LDI r12, 0
    LDI r13, 1
    LDI r16, 3
    LDI r14, 128          ; cursor X
    LDI r3, 128          ; cursor Y
    LDI r0, 0             ; tolerance = 0 (exact match)
    LDI r10, 0xFF0000      ; start with red

; ── Draw canvas background ────────────────────────────
    LDI r7, 0x111111
    FILL r7               ; dark background

; ── Draw bordered shapes ──────────────────────────────
; ── Draw bordered shapes using RECTF (outer fill + inner fill) ──

; Shape 1: White-bordered rectangle at (20,20) size 80x60
    LDI r10, 0xFFFFFF      ; white
    LDI r7, 20            ; x
    LDI r9, 20            ; y
    LDI r2, 2             ; w reg
    LDI r5, 80            ; w
    LDI r4, 60            ; h
    RECTF r7, r9, r5, r4, r10

; Inner of shape 1: black fill at (22,22) size 76x56
    LDI r10, 0x000000      ; black
    LDI r7, 22
    LDI r9, 22
    LDI r5, 76
    LDI r4, 56
    RECTF r7, r9, r5, r4, r10

; Shape 2: Circle approximation using concentric rects at (130,20) size 80x60
    LDI r10, 0x00FF00      ; green border
    LDI r7, 130
    LDI r9, 20
    LDI r5, 80
    LDI r4, 60
    RECTF r7, r9, r5, r4, r10

    LDI r10, 0x000000      ; black interior
    LDI r7, 132
    LDI r9, 22
    LDI r5, 76
    LDI r4, 56
    RECTF r7, r9, r5, r4, r10

; Shape 3: Small square at (20,100) size 40x40
    LDI r10, 0x0000FF      ; blue border
    LDI r7, 20
    LDI r9, 100
    LDI r5, 40
    LDI r4, 40
    RECTF r7, r9, r5, r4, r10

    LDI r10, 0x000000
    LDI r7, 22
    LDI r9, 102
    LDI r5, 36
    LDI r4, 36
    RECTF r7, r9, r5, r4, r10

; Shape 4: Tall rectangle at (80,100) size 30x80
    LDI r10, 0xFFFF00      ; yellow border
    LDI r7, 80
    LDI r9, 100
    LDI r5, 30
    LDI r4, 80
    RECTF r7, r9, r5, r4, r10

    LDI r10, 0x000000
    LDI r7, 82
    LDI r9, 102
    LDI r5, 26
    LDI r4, 76
    RECTF r7, r9, r5, r4, r10

; Shape 5: L-shaped region (two overlapping rects)
    LDI r10, 0xFF00FF      ; magenta border
    LDI r7, 140
    LDI r9, 100
    LDI r5, 60
    LDI r4, 30
    RECTF r7, r9, r5, r4, r10

    LDI r7, 140
    LDI r9, 120
    LDI r5, 30
    LDI r4, 50
    RECTF r7, r9, r5, r4, r10

; Inner L-shape (black)
    LDI r10, 0x000000
    LDI r7, 142
    LDI r9, 102
    LDI r5, 56
    LDI r4, 26
    RECTF r7, r9, r5, r4, r10

    LDI r7, 142
    LDI r9, 122
    LDI r5, 26
    LDI r4, 46
    RECTF r7, r9, r5, r4, r10

; Reset color to red
    LDI r10, 0xFF0000

; ── Draw UI text at bottom ────────────────────────────
; Store strings in RAM
    LDI r20, 0x500
    LDI r7, 0x57           ; 'W'
    STORE r20, r7
    LDI r20, 0x504
    LDI r7, 0x41           ; 'A'
    STORE r20, r7
    LDI r20, 0x508
    LDI r7, 0x53           ; 'S'
    STORE r20, r7
    LDI r20, 0x50C
    LDI r7, 0x44           ; 'D'
    STORE r20, r7
    LDI r20, 0x510
    LDI r7, 0
    STORE r20, r7

    LDI r20, 0x520
    LDI r7, 0x53           ; 'S'
    STORE r20, r7
    LDI r20, 0x524
    LDI r7, 0x50           ; 'P'
    STORE r20, r7
    LDI r20, 0x528
    LDI r7, 0x3D           ; '='
    STORE r20, r7
    LDI r20, 0x52C
    LDI r7, 0x50           ; 'P'
    STORE r20, r7
    LDI r20, 0x530
    LDI r7, 0x41           ; 'A'
    STORE r20, r7
    LDI r20, 0x534
    LDI r7, 0x49           ; 'I'
    STORE r20, r7
    LDI r20, 0x538
    LDI r7, 0x4E           ; 'N'
    STORE r20, r7
    LDI r20, 0x53C
    LDI r7, 0x54           ; 'T'
    STORE r20, r7
    LDI r20, 0x540
    LDI r7, 0
    STORE r20, r7

    LDI r20, 0x560
    LDI r7, 0x46           ; 'F'
    STORE r20, r7
    LDI r20, 0x564
    LDI r7, 0x3D           ; '='
    STORE r20, r7
    LDI r20, 0x568
    LDI r7, 0x46           ; 'F'
    STORE r20, r7
    LDI r20, 0x56C
    LDI r7, 0x49           ; 'I'
    STORE r20, r7
    LDI r20, 0x570
    LDI r7, 0x4C           ; 'L'
    STORE r20, r7
    LDI r20, 0x574
    LDI r7, 0x4C           ; 'L'
    STORE r20, r7
    LDI r20, 0x578
    LDI r7, 0
    STORE r20, r7

    ; Draw "WASD=MOVE" at bottom
    LDI r7, 2
    LDI r9, 200
    LDI r20, 0x500
    TEXT r7, r9, r20

    ; Draw "SP=PAINT" at bottom
    LDI r7, 2
    LDI r9, 212
    LDI r20, 0x520
    TEXT r7, r9, r20

    ; Draw "F=FILL" at bottom
    LDI r7, 2
    LDI r9, 224
    LDI r20, 0x560
    TEXT r7, r9, r20

; ── MAIN LOOP ────────────────────────────────────────
main_loop:
    FRAME

    ; Erase old cursor (draw dark pixel)
    LDI r7, 0x111111
    PSET r14, r3, r7

    ; Read keyboard
    IKEY r15

    ; Process movement
    ; W = move up
    LDI r7, 87
    CMP r15, r7
    JNZ r13, not_w
    SUB r3, r16
not_w:
    ; S = move down
    LDI r7, 83
    CMP r15, r7
    JNZ r13, not_s
    ADD r3, r16
not_s:
    ; A = move left
    LDI r7, 65
    CMP r15, r7
    JNZ r13, not_a
    SUB r14, r16
not_a:
    ; D = move right
    LDI r7, 68
    CMP r15, r7
    JNZ r13, not_d
    ADD r14, r16
not_d:

    ; Space = paint pixel
    LDI r7, 32
    CMP r15, r7
    JNZ r13, not_space
    PSET r14, r3, r10
not_space:

    ; F = flood fill from cursor
    LDI r7, 70
    CMP r15, r7
    JNZ r13, not_f
    FLOOD r14, r3, r10, r0    ; x, y, fill_color, tolerance=0
not_f:

    ; 1 = red
    LDI r7, 49
    CMP r15, r7
    JNZ r13, not_1
    LDI r10, 0xFF0000
not_1:
    ; 2 = green
    LDI r7, 50
    CMP r15, r7
    JNZ r13, not_2
    LDI r10, 0x00FF00
not_2:
    ; 3 = blue
    LDI r7, 51
    CMP r15, r7
    JNZ r13, not_3
    LDI r10, 0x0000FF
not_3:
    ; 4 = yellow
    LDI r7, 52
    CMP r15, r7
    JNZ r13, not_4
    LDI r10, 0xFFFF00
not_4:
    ; 5 = white
    LDI r7, 53
    CMP r15, r7
    JNZ r13, not_5
    LDI r10, 0xFFFFFF
not_5:

    ; C = clear canvas
    LDI r7, 67
    CMP r15, r7
    JNZ r13, not_c
    LDI r7, 0x111111
    FILL r7
not_c:

    ; Q = quit
    LDI r7, 81
    CMP r15, r7
    JNZ r13, not_q
    HALT
not_q:

    ; Draw cursor (current color with white center indicator)
    PSET r14, r3, r10

    JMP main_loop
