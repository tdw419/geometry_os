; DESCRIPTION: Draw circle: pos=the screen, color=red, size=fixed size.

; blend_demo.asm - Phase 234: Alpha blending demo
; Demonstrates BLEND and BLENDR opcodes for sprite compositing
;
; BLEND xr, yr, color_r, alpha_r  - blend color onto screen pixel
; BLENDR dst_r, src_r, alpha_r     - blend two register colors
;
; The demo draws a gradient background, then overlays translucent colored
; circles using BLEND to create a smooth alpha-blended composition.

; Registers:
; r3 = x, r9 = y, r6 = color, r7 = alpha
; r1 = loop counter, r12 = increment
; r16 = temp

; ── Build a gradient background (blue to purple) ──
    LDI r3, 0           ; x
    LDI r9, 0           ; y
    LDI r12, 1           ; increment

bg_y_loop:
    LDI r3, 0           ; reset x each row

bg_x_loop:
    ; Color = x*4 in R channel, y in B channel
    MOV r6, r3
    LDI r16, 4
    MUL r6, r16         ; R = x * 4
    SHL r6, r16         ; shift left 4 more (R = x * 64)
    MOV r16, r9
    SHL r16, r16         ; B = y * 256
    OR r6, r16          ; pack R + B

    PSET r3, r9, r6
    ADD r3, r12
    LDI r16, 256
    CMP r3, r16
    BLT r2, bg_x_loop

    ADD r9, r12
    LDI r16, 256
    CMP r9, r16
    BLT r2, bg_y_loop

; ── Draw translucent red circle using BLENDR + BLEND ──
; Center at (100, 128), radius 50
; We'll compute the circle color per-pixel with BLENDR

    LDI r9, 78          ; y = 128 - 50 (top of circle)
    LDI r12, 1

circle_y_loop:
    LDI r3, 50          ; x = 100 - 50 (left of circle)

circle_x_loop:
    ; Distance from center (100, 128)
    MOV r6, r3
    LDI r16, 100
    SUB r6, r16         ; dx = x - 100
    ; dx^2 (approximate - just use abs for speed)
    PUSH r31
    LDI r16, 0
    CMP r6, r16
    BGE r2, dx_pos
    NEG r6
dx_pos:
    ; Check if within radius (50)
    LDI r16, 50
    CMP r6, r16
    BGE r2, skip_circle_x

    MOV r7, r9
    LDI r16, 128
    SUB r7, r16         ; dy = y - 128
    LDI r16, 0
    CMP r7, r16
    BGE r2, dy_pos
    NEG r7
dy_pos:
    LDI r16, 50
    CMP r7, r16
    BGE r2, skip_circle_x

    ; Compute alpha based on distance from center
    ; Closer to center = more opaque
    ADD r6, r7         ; manhattan distance
    LDI r16, 80
    CMP r6, r16
    BGE r2, far_from_center
    ; Close to center - high alpha (200)
    LDI r7, 200
    JMP do_blend

far_from_center:
    ; Further out - lower alpha (80)
    LDI r7, 80

do_blend:
    ; BLENDR r4, r10, r11 - blend red (src) with existing pixel (dst)
    ; First read existing pixel via PEEK
    PEEK r3, r9, r4    ; r4 = existing pixel color
    LDI r10, 0xFF0000     ; r10 = red source color
    BLENDR r4, r10, r7   ; r4 = blended result
    ; Now BLEND the result onto screen
    BLEND r3, r9, r4, r7

skip_circle_x:
    ADD r3, r12
    LDI r16, 150
    CMP r3, r16
    BLT r2, circle_x_loop

    ADD r9, r12
    LDI r16, 178
    CMP r9, r16
    BLT r2, circle_y_loop

    POP r31

; ── Draw translucent green circle at (160, 100), radius 40 ──
    LDI r9, 60          ; y = 100 - 40
    LDI r12, 1

circle2_y_loop:
    LDI r3, 120         ; x = 160 - 40

circle2_x_loop:
    MOV r6, r3
    LDI r16, 160
    SUB r6, r16
    LDI r16, 0
    CMP r6, r16
    BGE r2, c2dx_pos
    NEG r6
c2dx_pos:
    LDI r16, 40
    CMP r6, r16
    BGE r2, skip_c2

    MOV r7, r9
    LDI r16, 100
    SUB r7, r16
    LDI r16, 0
    CMP r7, r16
    BGE r2, c2dy_pos
    NEG r7
c2dy_pos:
    LDI r16, 40
    CMP r7, r16
    BGE r2, skip_c2

    ADD r6, r7
    LDI r16, 60
    CMP r6, r16
    BGE r2, c2_far
    LDI r7, 180
    JMP do_blend2

c2_far:
    LDI r7, 60

do_blend2:
    PEEK r3, r9, r4
    LDI r10, 0x00FF00
    BLENDR r4, r10, r7
    BLEND r3, r9, r4, r7

skip_c2:
    ADD r3, r12
    LDI r16, 200
    CMP r3, r16
    BLT r2, circle2_x_loop

    ADD r9, r12
    LDI r16, 140
    CMP r9, r16
    BLT r2, circle2_y_loop

; ── Animate: slowly rotate alpha on the red circle ──
    LDI r1, 0           ; frame counter

anim_loop:
    FRAME
    ADD r1, r12
    LDI r16, 0xFF
    AND r1, r16         ; wrap frame counter

    ; Only redraw every 30 frames for performance
    LDI r16, 30
    AND r1, r16
    JNZ r1, anim_loop

    LDI r9, 78
    LDI r12, 1

anim_y_loop:
    LDI r3, 50

anim_x_loop:
    MOV r6, r3
    LDI r16, 100
    SUB r6, r16
    LDI r16, 0
    CMP r6, r16
    BGE r2, adx_pos
    NEG r6
adx_pos:
    LDI r16, 50
    CMP r6, r16
    BGE r2, skip_anim

    MOV r7, r9
    LDI r16, 128
    SUB r7, r16
    LDI r16, 0
    CMP r7, r16
    BGE r2, ady_pos
    NEG r7
ady_pos:
    LDI r16, 50
    CMP r7, r16
    BGE r2, skip_anim

    ; Pulsing alpha based on frame counter
    MOV r7, r1
    LDI r16, 128
    ADD r7, r16
    LDI r16, 0xFF
    AND r7, r16

    PEEK r3, r9, r4
    LDI r10, 0xFF0000
    BLENDR r4, r10, r7
    BLEND r3, r9, r4, r7

skip_anim:
    ADD r3, r12
    LDI r16, 150
    CMP r3, r16
    BLT r2, anim_x_loop

    ADD r9, r12
    LDI r16, 178
    CMP r9, r16
    BLT r2, anim_y_loop

    JMP anim_loop
