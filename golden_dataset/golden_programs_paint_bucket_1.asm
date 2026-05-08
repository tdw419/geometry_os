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
;   r8  = constant 1
;   r3  = scratch
;   r2  = scratch
;   r0  = scratch (tolerance, always 0 for exact match)
;   r14  = current color (starts red)
;   r6  = key value
;   r9 = cursor X (starts at 128)
;   r12 = cursor Y (starts at 128)
;   r5 = zero constant
;   r7 = one constant
;   r16 = step size (3)

; ── INIT ──────────────────────────────────────────────
    LDI r5, 0
    LDI r7, 1
    LDI r16, 3
    LDI r9, 128          ; cursor X
    LDI r12, 128          ; cursor Y
    LDI r0, 0             ; tolerance = 0 (exact match)
    LDI r14, 0xFF0000      ; start with red

; ── Draw canvas background ────────────────────────────
    LDI r3, 0x111111
    FILL r3               ; dark background

; ── Draw bordered shapes ──────────────────────────────
; ── Draw bordered shapes using RECTF (outer fill + inner fill) ──

; Shape 1: White-bordered rectangle at (20,20) size 80x60
    LDI r14, 0xFFFFFF      ; white
    LDI r3, 20            ; x
    LDI r2, 20            ; y
    LDI r8, 2             ; w reg
    LDI r4, 80            ; w
    LDI r15, 60            ; h
    RECTF r3, r2, r4, r15, r14

; Inner of shape 1: black fill at (22,22) size 76x56
    LDI r14, 0x000000      ; black
    LDI r3, 22
    LDI r2, 22
    LDI r4, 76
    LDI r15, 56
    RECTF r3, r2, r4, r15, r14

; Shape 2: Circle approximation using concentric rects at (130,20) size 80x60
    LDI r14, 0x00FF00      ; green border
    LDI r3, 130
    LDI r2, 20
    LDI r4, 80
    LDI r15, 60
    RECTF r3, r2, r4, r15, r14

    LDI r14, 0x000000      ; black interior
    LDI r3, 132
    LDI r2, 22
    LDI r4, 76
    LDI r15, 56
    RECTF r3, r2, r4, r15, r14

; Shape 3: Small square at (20,100) size 40x40
    LDI r14, 0x0000FF      ; blue border
    LDI r3, 20
    LDI r2, 100
    LDI r4, 40
    LDI r15, 40
    RECTF r3, r2, r4, r15, r14

    LDI r14, 0x000000
    LDI r3, 22
    LDI r2, 102
    LDI r4, 36
    LDI r15, 36
    RECTF r3, r2, r4, r15, r14

; Shape 4: Tall rectangle at (80,100) size 30x80
    LDI r14, 0xFFFF00      ; yellow border
    LDI r3, 80
    LDI r2, 100
    LDI r4, 30
    LDI r15, 80
    RECTF r3, r2, r4, r15, r14

    LDI r14, 0x000000
    LDI r3, 82
    LDI r2, 102
    LDI r4, 26
    LDI r15, 76
    RECTF r3, r2, r4, r15, r14

; Shape 5: L-shaped region (two overlapping rects)
    LDI r14, 0xFF00FF      ; magenta border
    LDI r3, 140
    LDI r2, 100
    LDI r4, 60
    LDI r15, 30
    RECTF r3, r2, r4, r15, r14

    LDI r3, 140
    LDI r2, 120
    LDI r4, 30
    LDI r15, 50
    RECTF r3, r2, r4, r15, r14

; Inner L-shape (black)
    LDI r14, 0x000000
    LDI r3, 142
    LDI r2, 102
    LDI r4, 56
    LDI r15, 26
    RECTF r3, r2, r4, r15, r14

    LDI r3, 142
    LDI r2, 122
    LDI r4, 26
    LDI r15, 46
    RECTF r3, r2, r4, r15, r14

; Reset color to red
    LDI r14, 0xFF0000

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
    LDI r2, 200
    LDI r20, 0x500
    TEXT r3, r2, r20

    ; Draw "SP=PAINT" at bottom
    LDI r3, 2
    LDI r2, 212
    LDI r20, 0x520
    TEXT r3, r2, r20

    ; Draw "F=FILL" at bottom
    LDI r3, 2
    LDI r2, 224
    LDI r20, 0x560
    TEXT r3, r2, r20

; ── MAIN LOOP ────────────────────────────────────────
main_loop:
    FRAME

    ; Erase old cursor (draw dark pixel)
    LDI r3, 0x111111
    PSET r9, r12, r3

    ; Read keyboard
    IKEY r6

    ; Process movement
    ; W = move up
    LDI r3, 87
    CMP r6, r3
    JNZ r7, not_w
    SUB r12, r16
not_w:
    ; S = move down
    LDI r3, 83
    CMP r6, r3
    JNZ r7, not_s
    ADD r12, r16
not_s:
    ; A = move left
    LDI r3, 65
    CMP r6, r3
    JNZ r7, not_a
    SUB r9, r16
not_a:
    ; D = move right
    LDI r3, 68
    CMP r6, r3
    JNZ r7, not_d
    ADD r9, r16
not_d:

    ; Space = paint pixel
    LDI r3, 32
    CMP r6, r3
    JNZ r7, not_space
    PSET r9, r12, r14
not_space:

    ; F = flood fill from cursor
    LDI r3, 70
    CMP r6, r3
    JNZ r7, not_f
    FLOOD r9, r12, r14, r0    ; x, y, fill_color, tolerance=0
not_f:

    ; 1 = red
    LDI r3, 49
    CMP r6, r3
    JNZ r7, not_1
    LDI r14, 0xFF0000
not_1:
    ; 2 = green
    LDI r3, 50
    CMP r6, r3
    JNZ r7, not_2
    LDI r14, 0x00FF00
not_2:
    ; 3 = blue
    LDI r3, 51
    CMP r6, r3
    JNZ r7, not_3
    LDI r14, 0x0000FF
not_3:
    ; 4 = yellow
    LDI r3, 52
    CMP r6, r3
    JNZ r7, not_4
    LDI r14, 0xFFFF00
not_4:
    ; 5 = white
    LDI r3, 53
    CMP r6, r3
    JNZ r7, not_5
    LDI r14, 0xFFFFFF
not_5:

    ; C = clear canvas
    LDI r3, 67
    CMP r6, r3
    JNZ r7, not_c
    LDI r3, 0x111111
    FILL r3
not_c:

    ; Q = quit
    LDI r3, 81
    CMP r6, r3
    JNZ r7, not_q
    HALT
not_q:

    ; Draw cursor (current color with white center indicator)
    PSET r9, r12, r14

    JMP main_loop
