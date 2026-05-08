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
;   r14  = constant 1
;   r5  = scratch
;   r2  = scratch
;   r9  = scratch (tolerance, always 0 for exact match)
;   r6  = current color (starts red)
;   r1  = key value
;   r3 = cursor X (starts at 128)
;   r15 = cursor Y (starts at 128)
;   r4 = zero constant
;   r8 = one constant
;   r16 = step size (3)

; ── INIT ──────────────────────────────────────────────
    LDI r4, 0
    LDI r8, 1
    LDI r16, 3
    LDI r3, 128          ; cursor X
    LDI r15, 128          ; cursor Y
    LDI r9, 0             ; tolerance = 0 (exact match)
    LDI r6, 0xFF0000      ; start with red

; ── Draw canvas background ────────────────────────────
    LDI r5, 0x111111
    FILL r5               ; dark background

; ── Draw bordered shapes ──────────────────────────────
; ── Draw bordered shapes using RECTF (outer fill + inner fill) ──

; Shape 1: White-bordered rectangle at (20,20) size 80x60
    LDI r6, 0xFFFFFF      ; white
    LDI r5, 20            ; x
    LDI r2, 20            ; y
    LDI r14, 2             ; w reg
    LDI r10, 80            ; w
    LDI r13, 60            ; h
    RECTF r5, r2, r10, r13, r6

; Inner of shape 1: black fill at (22,22) size 76x56
    LDI r6, 0x000000      ; black
    LDI r5, 22
    LDI r2, 22
    LDI r10, 76
    LDI r13, 56
    RECTF r5, r2, r10, r13, r6

; Shape 2: Circle approximation using concentric rects at (130,20) size 80x60
    LDI r6, 0x00FF00      ; green border
    LDI r5, 130
    LDI r2, 20
    LDI r10, 80
    LDI r13, 60
    RECTF r5, r2, r10, r13, r6

    LDI r6, 0x000000      ; black interior
    LDI r5, 132
    LDI r2, 22
    LDI r10, 76
    LDI r13, 56
    RECTF r5, r2, r10, r13, r6

; Shape 3: Small square at (20,100) size 40x40
    LDI r6, 0x0000FF      ; blue border
    LDI r5, 20
    LDI r2, 100
    LDI r10, 40
    LDI r13, 40
    RECTF r5, r2, r10, r13, r6

    LDI r6, 0x000000
    LDI r5, 22
    LDI r2, 102
    LDI r10, 36
    LDI r13, 36
    RECTF r5, r2, r10, r13, r6

; Shape 4: Tall rectangle at (80,100) size 30x80
    LDI r6, 0xFFFF00      ; yellow border
    LDI r5, 80
    LDI r2, 100
    LDI r10, 30
    LDI r13, 80
    RECTF r5, r2, r10, r13, r6

    LDI r6, 0x000000
    LDI r5, 82
    LDI r2, 102
    LDI r10, 26
    LDI r13, 76
    RECTF r5, r2, r10, r13, r6

; Shape 5: L-shaped region (two overlapping rects)
    LDI r6, 0xFF00FF      ; magenta border
    LDI r5, 140
    LDI r2, 100
    LDI r10, 60
    LDI r13, 30
    RECTF r5, r2, r10, r13, r6

    LDI r5, 140
    LDI r2, 120
    LDI r10, 30
    LDI r13, 50
    RECTF r5, r2, r10, r13, r6

; Inner L-shape (black)
    LDI r6, 0x000000
    LDI r5, 142
    LDI r2, 102
    LDI r10, 56
    LDI r13, 26
    RECTF r5, r2, r10, r13, r6

    LDI r5, 142
    LDI r2, 122
    LDI r10, 26
    LDI r13, 46
    RECTF r5, r2, r10, r13, r6

; Reset color to red
    LDI r6, 0xFF0000

; ── Draw UI text at bottom ────────────────────────────
; Store strings in RAM
    LDI r20, 0x500
    LDI r5, 0x57           ; 'W'
    STORE r20, r5
    LDI r20, 0x504
    LDI r5, 0x41           ; 'A'
    STORE r20, r5
    LDI r20, 0x508
    LDI r5, 0x53           ; 'S'
    STORE r20, r5
    LDI r20, 0x50C
    LDI r5, 0x44           ; 'D'
    STORE r20, r5
    LDI r20, 0x510
    LDI r5, 0
    STORE r20, r5

    LDI r20, 0x520
    LDI r5, 0x53           ; 'S'
    STORE r20, r5
    LDI r20, 0x524
    LDI r5, 0x50           ; 'P'
    STORE r20, r5
    LDI r20, 0x528
    LDI r5, 0x3D           ; '='
    STORE r20, r5
    LDI r20, 0x52C
    LDI r5, 0x50           ; 'P'
    STORE r20, r5
    LDI r20, 0x530
    LDI r5, 0x41           ; 'A'
    STORE r20, r5
    LDI r20, 0x534
    LDI r5, 0x49           ; 'I'
    STORE r20, r5
    LDI r20, 0x538
    LDI r5, 0x4E           ; 'N'
    STORE r20, r5
    LDI r20, 0x53C
    LDI r5, 0x54           ; 'T'
    STORE r20, r5
    LDI r20, 0x540
    LDI r5, 0
    STORE r20, r5

    LDI r20, 0x560
    LDI r5, 0x46           ; 'F'
    STORE r20, r5
    LDI r20, 0x564
    LDI r5, 0x3D           ; '='
    STORE r20, r5
    LDI r20, 0x568
    LDI r5, 0x46           ; 'F'
    STORE r20, r5
    LDI r20, 0x56C
    LDI r5, 0x49           ; 'I'
    STORE r20, r5
    LDI r20, 0x570
    LDI r5, 0x4C           ; 'L'
    STORE r20, r5
    LDI r20, 0x574
    LDI r5, 0x4C           ; 'L'
    STORE r20, r5
    LDI r20, 0x578
    LDI r5, 0
    STORE r20, r5

    ; Draw "WASD=MOVE" at bottom
    LDI r5, 2
    LDI r2, 200
    LDI r20, 0x500
    TEXT r5, r2, r20

    ; Draw "SP=PAINT" at bottom
    LDI r5, 2
    LDI r2, 212
    LDI r20, 0x520
    TEXT r5, r2, r20

    ; Draw "F=FILL" at bottom
    LDI r5, 2
    LDI r2, 224
    LDI r20, 0x560
    TEXT r5, r2, r20

; ── MAIN LOOP ────────────────────────────────────────
main_loop:
    FRAME

    ; Erase old cursor (draw dark pixel)
    LDI r5, 0x111111
    PSET r3, r15, r5

    ; Read keyboard
    IKEY r1

    ; Process movement
    ; W = move up
    LDI r5, 87
    CMP r1, r5
    JNZ r8, not_w
    SUB r15, r16
not_w:
    ; S = move down
    LDI r5, 83
    CMP r1, r5
    JNZ r8, not_s
    ADD r15, r16
not_s:
    ; A = move left
    LDI r5, 65
    CMP r1, r5
    JNZ r8, not_a
    SUB r3, r16
not_a:
    ; D = move right
    LDI r5, 68
    CMP r1, r5
    JNZ r8, not_d
    ADD r3, r16
not_d:

    ; Space = paint pixel
    LDI r5, 32
    CMP r1, r5
    JNZ r8, not_space
    PSET r3, r15, r6
not_space:

    ; F = flood fill from cursor
    LDI r5, 70
    CMP r1, r5
    JNZ r8, not_f
    FLOOD r3, r15, r6, r9    ; x, y, fill_color, tolerance=0
not_f:

    ; 1 = red
    LDI r5, 49
    CMP r1, r5
    JNZ r8, not_1
    LDI r6, 0xFF0000
not_1:
    ; 2 = green
    LDI r5, 50
    CMP r1, r5
    JNZ r8, not_2
    LDI r6, 0x00FF00
not_2:
    ; 3 = blue
    LDI r5, 51
    CMP r1, r5
    JNZ r8, not_3
    LDI r6, 0x0000FF
not_3:
    ; 4 = yellow
    LDI r5, 52
    CMP r1, r5
    JNZ r8, not_4
    LDI r6, 0xFFFF00
not_4:
    ; 5 = white
    LDI r5, 53
    CMP r1, r5
    JNZ r8, not_5
    LDI r6, 0xFFFFFF
not_5:

    ; C = clear canvas
    LDI r5, 67
    CMP r1, r5
    JNZ r8, not_c
    LDI r5, 0x111111
    FILL r5
not_c:

    ; Q = quit
    LDI r5, 81
    CMP r1, r5
    JNZ r8, not_q
    HALT
not_q:

    ; Draw cursor (current color with white center indicator)
    PSET r3, r15, r6

    JMP main_loop
