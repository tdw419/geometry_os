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
;   r4  = constant 1
;   r0  = scratch
;   r15  = scratch
;   r6  = scratch (tolerance, always 0 for exact match)
;   r9  = current color (starts red)
;   r1  = key value
;   r12 = cursor X (starts at 128)
;   r3 = cursor Y (starts at 128)
;   r14 = zero constant
;   r2 = one constant
;   r16 = step size (3)

; ── INIT ──────────────────────────────────────────────
    LDI r14, 0
    LDI r2, 1
    LDI r16, 3
    LDI r12, 128          ; cursor X
    LDI r3, 128          ; cursor Y
    LDI r6, 0             ; tolerance = 0 (exact match)
    LDI r9, 0xFF0000      ; start with red

; ── Draw canvas background ────────────────────────────
    LDI r0, 0x111111
    FILL r0               ; dark background

; ── Draw bordered shapes ──────────────────────────────
; ── Draw bordered shapes using RECTF (outer fill + inner fill) ──

; Shape 1: White-bordered rectangle at (20,20) size 80x60
    LDI r9, 0xFFFFFF      ; white
    LDI r0, 20            ; x
    LDI r15, 20            ; y
    LDI r4, 2             ; w reg
    LDI r7, 80            ; w
    LDI r5, 60            ; h
    RECTF r0, r15, r7, r5, r9

; Inner of shape 1: black fill at (22,22) size 76x56
    LDI r9, 0x000000      ; black
    LDI r0, 22
    LDI r15, 22
    LDI r7, 76
    LDI r5, 56
    RECTF r0, r15, r7, r5, r9

; Shape 2: Circle approximation using concentric rects at (130,20) size 80x60
    LDI r9, 0x00FF00      ; green border
    LDI r0, 130
    LDI r15, 20
    LDI r7, 80
    LDI r5, 60
    RECTF r0, r15, r7, r5, r9

    LDI r9, 0x000000      ; black interior
    LDI r0, 132
    LDI r15, 22
    LDI r7, 76
    LDI r5, 56
    RECTF r0, r15, r7, r5, r9

; Shape 3: Small square at (20,100) size 40x40
    LDI r9, 0x0000FF      ; blue border
    LDI r0, 20
    LDI r15, 100
    LDI r7, 40
    LDI r5, 40
    RECTF r0, r15, r7, r5, r9

    LDI r9, 0x000000
    LDI r0, 22
    LDI r15, 102
    LDI r7, 36
    LDI r5, 36
    RECTF r0, r15, r7, r5, r9

; Shape 4: Tall rectangle at (80,100) size 30x80
    LDI r9, 0xFFFF00      ; yellow border
    LDI r0, 80
    LDI r15, 100
    LDI r7, 30
    LDI r5, 80
    RECTF r0, r15, r7, r5, r9

    LDI r9, 0x000000
    LDI r0, 82
    LDI r15, 102
    LDI r7, 26
    LDI r5, 76
    RECTF r0, r15, r7, r5, r9

; Shape 5: L-shaped region (two overlapping rects)
    LDI r9, 0xFF00FF      ; magenta border
    LDI r0, 140
    LDI r15, 100
    LDI r7, 60
    LDI r5, 30
    RECTF r0, r15, r7, r5, r9

    LDI r0, 140
    LDI r15, 120
    LDI r7, 30
    LDI r5, 50
    RECTF r0, r15, r7, r5, r9

; Inner L-shape (black)
    LDI r9, 0x000000
    LDI r0, 142
    LDI r15, 102
    LDI r7, 56
    LDI r5, 26
    RECTF r0, r15, r7, r5, r9

    LDI r0, 142
    LDI r15, 122
    LDI r7, 26
    LDI r5, 46
    RECTF r0, r15, r7, r5, r9

; Reset color to red
    LDI r9, 0xFF0000

; ── Draw UI text at bottom ────────────────────────────
; Store strings in RAM
    LDI r20, 0x500
    LDI r0, 0x57           ; 'W'
    STORE r20, r0
    LDI r20, 0x504
    LDI r0, 0x41           ; 'A'
    STORE r20, r0
    LDI r20, 0x508
    LDI r0, 0x53           ; 'S'
    STORE r20, r0
    LDI r20, 0x50C
    LDI r0, 0x44           ; 'D'
    STORE r20, r0
    LDI r20, 0x510
    LDI r0, 0
    STORE r20, r0

    LDI r20, 0x520
    LDI r0, 0x53           ; 'S'
    STORE r20, r0
    LDI r20, 0x524
    LDI r0, 0x50           ; 'P'
    STORE r20, r0
    LDI r20, 0x528
    LDI r0, 0x3D           ; '='
    STORE r20, r0
    LDI r20, 0x52C
    LDI r0, 0x50           ; 'P'
    STORE r20, r0
    LDI r20, 0x530
    LDI r0, 0x41           ; 'A'
    STORE r20, r0
    LDI r20, 0x534
    LDI r0, 0x49           ; 'I'
    STORE r20, r0
    LDI r20, 0x538
    LDI r0, 0x4E           ; 'N'
    STORE r20, r0
    LDI r20, 0x53C
    LDI r0, 0x54           ; 'T'
    STORE r20, r0
    LDI r20, 0x540
    LDI r0, 0
    STORE r20, r0

    LDI r20, 0x560
    LDI r0, 0x46           ; 'F'
    STORE r20, r0
    LDI r20, 0x564
    LDI r0, 0x3D           ; '='
    STORE r20, r0
    LDI r20, 0x568
    LDI r0, 0x46           ; 'F'
    STORE r20, r0
    LDI r20, 0x56C
    LDI r0, 0x49           ; 'I'
    STORE r20, r0
    LDI r20, 0x570
    LDI r0, 0x4C           ; 'L'
    STORE r20, r0
    LDI r20, 0x574
    LDI r0, 0x4C           ; 'L'
    STORE r20, r0
    LDI r20, 0x578
    LDI r0, 0
    STORE r20, r0

    ; Draw "WASD=MOVE" at bottom
    LDI r0, 2
    LDI r15, 200
    LDI r20, 0x500
    TEXT r0, r15, r20

    ; Draw "SP=PAINT" at bottom
    LDI r0, 2
    LDI r15, 212
    LDI r20, 0x520
    TEXT r0, r15, r20

    ; Draw "F=FILL" at bottom
    LDI r0, 2
    LDI r15, 224
    LDI r20, 0x560
    TEXT r0, r15, r20

; ── MAIN LOOP ────────────────────────────────────────
main_loop:
    FRAME

    ; Erase old cursor (draw dark pixel)
    LDI r0, 0x111111
    PSET r12, r3, r0

    ; Read keyboard
    IKEY r1

    ; Process movement
    ; W = move up
    LDI r0, 87
    CMP r1, r0
    JNZ r2, not_w
    SUB r3, r16
not_w:
    ; S = move down
    LDI r0, 83
    CMP r1, r0
    JNZ r2, not_s
    ADD r3, r16
not_s:
    ; A = move left
    LDI r0, 65
    CMP r1, r0
    JNZ r2, not_a
    SUB r12, r16
not_a:
    ; D = move right
    LDI r0, 68
    CMP r1, r0
    JNZ r2, not_d
    ADD r12, r16
not_d:

    ; Space = paint pixel
    LDI r0, 32
    CMP r1, r0
    JNZ r2, not_space
    PSET r12, r3, r9
not_space:

    ; F = flood fill from cursor
    LDI r0, 70
    CMP r1, r0
    JNZ r2, not_f
    FLOOD r12, r3, r9, r6    ; x, y, fill_color, tolerance=0
not_f:

    ; 1 = red
    LDI r0, 49
    CMP r1, r0
    JNZ r2, not_1
    LDI r9, 0xFF0000
not_1:
    ; 2 = green
    LDI r0, 50
    CMP r1, r0
    JNZ r2, not_2
    LDI r9, 0x00FF00
not_2:
    ; 3 = blue
    LDI r0, 51
    CMP r1, r0
    JNZ r2, not_3
    LDI r9, 0x0000FF
not_3:
    ; 4 = yellow
    LDI r0, 52
    CMP r1, r0
    JNZ r2, not_4
    LDI r9, 0xFFFF00
not_4:
    ; 5 = white
    LDI r0, 53
    CMP r1, r0
    JNZ r2, not_5
    LDI r9, 0xFFFFFF
not_5:

    ; C = clear canvas
    LDI r0, 67
    CMP r1, r0
    JNZ r2, not_c
    LDI r0, 0x111111
    FILL r0
not_c:

    ; Q = quit
    LDI r0, 81
    CMP r1, r0
    JNZ r2, not_q
    HALT
not_q:

    ; Draw cursor (current color with white center indicator)
    PSET r12, r3, r9

    JMP main_loop
