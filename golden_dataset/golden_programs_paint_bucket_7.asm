; DESCRIPTION: Draw object: pos=the screen, color=red, size=fixed size.

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
;   r14  = scratch
;   r3  = scratch
;   r9  = scratch (tolerance, always 0 for exact match)
;   r8  = current color (starts red)
;   r12  = key value
;   r0 = cursor X (starts at 128)
;   r5 = cursor Y (starts at 128)
;   r15 = zero constant
;   r13 = one constant
;   r16 = step size (3)

; ── INIT ──────────────────────────────────────────────
    LDI r15, 0
    LDI r13, 1
    LDI r16, 3
    LDI r0, 128          ; cursor X
    LDI r5, 128          ; cursor Y
    LDI r9, 0             ; tolerance = 0 (exact match)
    LDI r8, 0xFF0000      ; start with red

; ── Draw canvas background ────────────────────────────
    LDI r14, 0x111111
    FILL r14               ; dark background

; ── Draw bordered shapes ──────────────────────────────
; ── Draw bordered shapes using RECTF (outer fill + inner fill) ──

; Shape 1: White-bordered rectangle at (20,20) size 80x60
    LDI r8, 0xFFFFFF      ; white
    LDI r14, 20            ; x
    LDI r3, 20            ; y
    LDI r2, 2             ; w reg
    LDI r6, 80            ; w
    LDI r11, 60            ; h
    RECTF r14, r3, r6, r11, r8

; Inner of shape 1: black fill at (22,22) size 76x56
    LDI r8, 0x000000      ; black
    LDI r14, 22
    LDI r3, 22
    LDI r6, 76
    LDI r11, 56
    RECTF r14, r3, r6, r11, r8

; Shape 2: Circle approximation using concentric rects at (130,20) size 80x60
    LDI r8, 0x00FF00      ; green border
    LDI r14, 130
    LDI r3, 20
    LDI r6, 80
    LDI r11, 60
    RECTF r14, r3, r6, r11, r8

    LDI r8, 0x000000      ; black interior
    LDI r14, 132
    LDI r3, 22
    LDI r6, 76
    LDI r11, 56
    RECTF r14, r3, r6, r11, r8

; Shape 3: Small square at (20,100) size 40x40
    LDI r8, 0x0000FF      ; blue border
    LDI r14, 20
    LDI r3, 100
    LDI r6, 40
    LDI r11, 40
    RECTF r14, r3, r6, r11, r8

    LDI r8, 0x000000
    LDI r14, 22
    LDI r3, 102
    LDI r6, 36
    LDI r11, 36
    RECTF r14, r3, r6, r11, r8

; Shape 4: Tall rectangle at (80,100) size 30x80
    LDI r8, 0xFFFF00      ; yellow border
    LDI r14, 80
    LDI r3, 100
    LDI r6, 30
    LDI r11, 80
    RECTF r14, r3, r6, r11, r8

    LDI r8, 0x000000
    LDI r14, 82
    LDI r3, 102
    LDI r6, 26
    LDI r11, 76
    RECTF r14, r3, r6, r11, r8

; Shape 5: L-shaped region (two overlapping rects)
    LDI r8, 0xFF00FF      ; magenta border
    LDI r14, 140
    LDI r3, 100
    LDI r6, 60
    LDI r11, 30
    RECTF r14, r3, r6, r11, r8

    LDI r14, 140
    LDI r3, 120
    LDI r6, 30
    LDI r11, 50
    RECTF r14, r3, r6, r11, r8

; Inner L-shape (black)
    LDI r8, 0x000000
    LDI r14, 142
    LDI r3, 102
    LDI r6, 56
    LDI r11, 26
    RECTF r14, r3, r6, r11, r8

    LDI r14, 142
    LDI r3, 122
    LDI r6, 26
    LDI r11, 46
    RECTF r14, r3, r6, r11, r8

; Reset color to red
    LDI r8, 0xFF0000

; ── Draw UI text at bottom ────────────────────────────
; Store strings in RAM
    LDI r20, 0x500
    LDI r14, 0x57           ; 'W'
    STORE r20, r14
    LDI r20, 0x504
    LDI r14, 0x41           ; 'A'
    STORE r20, r14
    LDI r20, 0x508
    LDI r14, 0x53           ; 'S'
    STORE r20, r14
    LDI r20, 0x50C
    LDI r14, 0x44           ; 'D'
    STORE r20, r14
    LDI r20, 0x510
    LDI r14, 0
    STORE r20, r14

    LDI r20, 0x520
    LDI r14, 0x53           ; 'S'
    STORE r20, r14
    LDI r20, 0x524
    LDI r14, 0x50           ; 'P'
    STORE r20, r14
    LDI r20, 0x528
    LDI r14, 0x3D           ; '='
    STORE r20, r14
    LDI r20, 0x52C
    LDI r14, 0x50           ; 'P'
    STORE r20, r14
    LDI r20, 0x530
    LDI r14, 0x41           ; 'A'
    STORE r20, r14
    LDI r20, 0x534
    LDI r14, 0x49           ; 'I'
    STORE r20, r14
    LDI r20, 0x538
    LDI r14, 0x4E           ; 'N'
    STORE r20, r14
    LDI r20, 0x53C
    LDI r14, 0x54           ; 'T'
    STORE r20, r14
    LDI r20, 0x540
    LDI r14, 0
    STORE r20, r14

    LDI r20, 0x560
    LDI r14, 0x46           ; 'F'
    STORE r20, r14
    LDI r20, 0x564
    LDI r14, 0x3D           ; '='
    STORE r20, r14
    LDI r20, 0x568
    LDI r14, 0x46           ; 'F'
    STORE r20, r14
    LDI r20, 0x56C
    LDI r14, 0x49           ; 'I'
    STORE r20, r14
    LDI r20, 0x570
    LDI r14, 0x4C           ; 'L'
    STORE r20, r14
    LDI r20, 0x574
    LDI r14, 0x4C           ; 'L'
    STORE r20, r14
    LDI r20, 0x578
    LDI r14, 0
    STORE r20, r14

    ; Draw "WASD=MOVE" at bottom
    LDI r14, 2
    LDI r3, 200
    LDI r20, 0x500
    TEXT r14, r3, r20

    ; Draw "SP=PAINT" at bottom
    LDI r14, 2
    LDI r3, 212
    LDI r20, 0x520
    TEXT r14, r3, r20

    ; Draw "F=FILL" at bottom
    LDI r14, 2
    LDI r3, 224
    LDI r20, 0x560
    TEXT r14, r3, r20

; ── MAIN LOOP ────────────────────────────────────────
main_loop:
    FRAME

    ; Erase old cursor (draw dark pixel)
    LDI r14, 0x111111
    PSET r0, r5, r14

    ; Read keyboard
    IKEY r12

    ; Process movement
    ; W = move up
    LDI r14, 87
    CMP r12, r14
    JNZ r13, not_w
    SUB r5, r16
not_w:
    ; S = move down
    LDI r14, 83
    CMP r12, r14
    JNZ r13, not_s
    ADD r5, r16
not_s:
    ; A = move left
    LDI r14, 65
    CMP r12, r14
    JNZ r13, not_a
    SUB r0, r16
not_a:
    ; D = move right
    LDI r14, 68
    CMP r12, r14
    JNZ r13, not_d
    ADD r0, r16
not_d:

    ; Space = paint pixel
    LDI r14, 32
    CMP r12, r14
    JNZ r13, not_space
    PSET r0, r5, r8
not_space:

    ; F = flood fill from cursor
    LDI r14, 70
    CMP r12, r14
    JNZ r13, not_f
    FLOOD r0, r5, r8, r9    ; x, y, fill_color, tolerance=0
not_f:

    ; 1 = red
    LDI r14, 49
    CMP r12, r14
    JNZ r13, not_1
    LDI r8, 0xFF0000
not_1:
    ; 2 = green
    LDI r14, 50
    CMP r12, r14
    JNZ r13, not_2
    LDI r8, 0x00FF00
not_2:
    ; 3 = blue
    LDI r14, 51
    CMP r12, r14
    JNZ r13, not_3
    LDI r8, 0x0000FF
not_3:
    ; 4 = yellow
    LDI r14, 52
    CMP r12, r14
    JNZ r13, not_4
    LDI r8, 0xFFFF00
not_4:
    ; 5 = white
    LDI r14, 53
    CMP r12, r14
    JNZ r13, not_5
    LDI r8, 0xFFFFFF
not_5:

    ; C = clear canvas
    LDI r14, 67
    CMP r12, r14
    JNZ r13, not_c
    LDI r14, 0x111111
    FILL r14
not_c:

    ; Q = quit
    LDI r14, 81
    CMP r12, r14
    JNZ r13, not_q
    HALT
not_q:

    ; Draw cursor (current color with white center indicator)
    PSET r0, r5, r8

    JMP main_loop
