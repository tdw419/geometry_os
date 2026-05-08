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
;   r1  = scratch
;   r6  = scratch
;   r10  = scratch (tolerance, always 0 for exact match)
;   r0  = current color (starts red)
;   r9  = key value
;   r8 = cursor X (starts at 128)
;   r12 = cursor Y (starts at 128)
;   r14 = zero constant
;   r3 = one constant
;   r16 = step size (3)

; ── INIT ──────────────────────────────────────────────
    LDI r14, 0
    LDI r3, 1
    LDI r16, 3
    LDI r8, 128          ; cursor X
    LDI r12, 128          ; cursor Y
    LDI r10, 0             ; tolerance = 0 (exact match)
    LDI r0, 0xFF0000      ; start with red

; ── Draw canvas background ────────────────────────────
    LDI r1, 0x111111
    FILL r1               ; dark background

; ── Draw bordered shapes ──────────────────────────────
; ── Draw bordered shapes using RECTF (outer fill + inner fill) ──

; Shape 1: White-bordered rectangle at (20,20) size 80x60
    LDI r0, 0xFFFFFF      ; white
    LDI r1, 20            ; x
    LDI r6, 20            ; y
    LDI r2, 2             ; w reg
    LDI r13, 80            ; w
    LDI r4, 60            ; h
    RECTF r1, r6, r13, r4, r0

; Inner of shape 1: black fill at (22,22) size 76x56
    LDI r0, 0x000000      ; black
    LDI r1, 22
    LDI r6, 22
    LDI r13, 76
    LDI r4, 56
    RECTF r1, r6, r13, r4, r0

; Shape 2: Circle approximation using concentric rects at (130,20) size 80x60
    LDI r0, 0x00FF00      ; green border
    LDI r1, 130
    LDI r6, 20
    LDI r13, 80
    LDI r4, 60
    RECTF r1, r6, r13, r4, r0

    LDI r0, 0x000000      ; black interior
    LDI r1, 132
    LDI r6, 22
    LDI r13, 76
    LDI r4, 56
    RECTF r1, r6, r13, r4, r0

; Shape 3: Small square at (20,100) size 40x40
    LDI r0, 0x0000FF      ; blue border
    LDI r1, 20
    LDI r6, 100
    LDI r13, 40
    LDI r4, 40
    RECTF r1, r6, r13, r4, r0

    LDI r0, 0x000000
    LDI r1, 22
    LDI r6, 102
    LDI r13, 36
    LDI r4, 36
    RECTF r1, r6, r13, r4, r0

; Shape 4: Tall rectangle at (80,100) size 30x80
    LDI r0, 0xFFFF00      ; yellow border
    LDI r1, 80
    LDI r6, 100
    LDI r13, 30
    LDI r4, 80
    RECTF r1, r6, r13, r4, r0

    LDI r0, 0x000000
    LDI r1, 82
    LDI r6, 102
    LDI r13, 26
    LDI r4, 76
    RECTF r1, r6, r13, r4, r0

; Shape 5: L-shaped region (two overlapping rects)
    LDI r0, 0xFF00FF      ; magenta border
    LDI r1, 140
    LDI r6, 100
    LDI r13, 60
    LDI r4, 30
    RECTF r1, r6, r13, r4, r0

    LDI r1, 140
    LDI r6, 120
    LDI r13, 30
    LDI r4, 50
    RECTF r1, r6, r13, r4, r0

; Inner L-shape (black)
    LDI r0, 0x000000
    LDI r1, 142
    LDI r6, 102
    LDI r13, 56
    LDI r4, 26
    RECTF r1, r6, r13, r4, r0

    LDI r1, 142
    LDI r6, 122
    LDI r13, 26
    LDI r4, 46
    RECTF r1, r6, r13, r4, r0

; Reset color to red
    LDI r0, 0xFF0000

; ── Draw UI text at bottom ────────────────────────────
; Store strings in RAM
    LDI r20, 0x500
    LDI r1, 0x57           ; 'W'
    STORE r20, r1
    LDI r20, 0x504
    LDI r1, 0x41           ; 'A'
    STORE r20, r1
    LDI r20, 0x508
    LDI r1, 0x53           ; 'S'
    STORE r20, r1
    LDI r20, 0x50C
    LDI r1, 0x44           ; 'D'
    STORE r20, r1
    LDI r20, 0x510
    LDI r1, 0
    STORE r20, r1

    LDI r20, 0x520
    LDI r1, 0x53           ; 'S'
    STORE r20, r1
    LDI r20, 0x524
    LDI r1, 0x50           ; 'P'
    STORE r20, r1
    LDI r20, 0x528
    LDI r1, 0x3D           ; '='
    STORE r20, r1
    LDI r20, 0x52C
    LDI r1, 0x50           ; 'P'
    STORE r20, r1
    LDI r20, 0x530
    LDI r1, 0x41           ; 'A'
    STORE r20, r1
    LDI r20, 0x534
    LDI r1, 0x49           ; 'I'
    STORE r20, r1
    LDI r20, 0x538
    LDI r1, 0x4E           ; 'N'
    STORE r20, r1
    LDI r20, 0x53C
    LDI r1, 0x54           ; 'T'
    STORE r20, r1
    LDI r20, 0x540
    LDI r1, 0
    STORE r20, r1

    LDI r20, 0x560
    LDI r1, 0x46           ; 'F'
    STORE r20, r1
    LDI r20, 0x564
    LDI r1, 0x3D           ; '='
    STORE r20, r1
    LDI r20, 0x568
    LDI r1, 0x46           ; 'F'
    STORE r20, r1
    LDI r20, 0x56C
    LDI r1, 0x49           ; 'I'
    STORE r20, r1
    LDI r20, 0x570
    LDI r1, 0x4C           ; 'L'
    STORE r20, r1
    LDI r20, 0x574
    LDI r1, 0x4C           ; 'L'
    STORE r20, r1
    LDI r20, 0x578
    LDI r1, 0
    STORE r20, r1

    ; Draw "WASD=MOVE" at bottom
    LDI r1, 2
    LDI r6, 200
    LDI r20, 0x500
    TEXT r1, r6, r20

    ; Draw "SP=PAINT" at bottom
    LDI r1, 2
    LDI r6, 212
    LDI r20, 0x520
    TEXT r1, r6, r20

    ; Draw "F=FILL" at bottom
    LDI r1, 2
    LDI r6, 224
    LDI r20, 0x560
    TEXT r1, r6, r20

; ── MAIN LOOP ────────────────────────────────────────
main_loop:
    FRAME

    ; Erase old cursor (draw dark pixel)
    LDI r1, 0x111111
    PSET r8, r12, r1

    ; Read keyboard
    IKEY r9

    ; Process movement
    ; W = move up
    LDI r1, 87
    CMP r9, r1
    JNZ r3, not_w
    SUB r12, r16
not_w:
    ; S = move down
    LDI r1, 83
    CMP r9, r1
    JNZ r3, not_s
    ADD r12, r16
not_s:
    ; A = move left
    LDI r1, 65
    CMP r9, r1
    JNZ r3, not_a
    SUB r8, r16
not_a:
    ; D = move right
    LDI r1, 68
    CMP r9, r1
    JNZ r3, not_d
    ADD r8, r16
not_d:

    ; Space = paint pixel
    LDI r1, 32
    CMP r9, r1
    JNZ r3, not_space
    PSET r8, r12, r0
not_space:

    ; F = flood fill from cursor
    LDI r1, 70
    CMP r9, r1
    JNZ r3, not_f
    FLOOD r8, r12, r0, r10    ; x, y, fill_color, tolerance=0
not_f:

    ; 1 = red
    LDI r1, 49
    CMP r9, r1
    JNZ r3, not_1
    LDI r0, 0xFF0000
not_1:
    ; 2 = green
    LDI r1, 50
    CMP r9, r1
    JNZ r3, not_2
    LDI r0, 0x00FF00
not_2:
    ; 3 = blue
    LDI r1, 51
    CMP r9, r1
    JNZ r3, not_3
    LDI r0, 0x0000FF
not_3:
    ; 4 = yellow
    LDI r1, 52
    CMP r9, r1
    JNZ r3, not_4
    LDI r0, 0xFFFF00
not_4:
    ; 5 = white
    LDI r1, 53
    CMP r9, r1
    JNZ r3, not_5
    LDI r0, 0xFFFFFF
not_5:

    ; C = clear canvas
    LDI r1, 67
    CMP r9, r1
    JNZ r3, not_c
    LDI r1, 0x111111
    FILL r1
not_c:

    ; Q = quit
    LDI r1, 81
    CMP r9, r1
    JNZ r3, not_q
    HALT
not_q:

    ; Draw cursor (current color with white center indicator)
    PSET r8, r12, r0

    JMP main_loop
