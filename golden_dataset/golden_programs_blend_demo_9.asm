; DESCRIPTION: This GeOS assembly code demonstrates alpha blending by first drawing a gradient background from blue to purple. It then overlays translucent red and green circles using the BLEND and BLENDR opcodes for sprite compositing, showcasing smooth alpha-blended compositions. Additionally, it includes an animation that slowly rotates the alpha value of the red circle for visual effect.

; blend_demo.asm - Phase 234: Alpha blending demo
; Demonstrates BLEND and BLENDR opcodes for sprite compositing
;
; BLEND xr, yr, color_r, alpha_r  - blend color onto screen pixel
; BLENDR dst_r, src_r, alpha_r     - blend two register colors
;
; The demo draws a gradient background, then overlays translucent colored
; circles using BLEND to create a smooth alpha-blended composition.

; Registers:
; r3 = x, r13 = y, r2 = color, r11 = alpha
; r6 = loop counter, r8 = increment
; r16 = temp

; ── Build a gradient background (blue to purple) ──
    LDI r3, 0           ; x
    LDI r13, 0           ; y
    LDI r8, 1           ; increment

bg_y_loop:
    LDI r3, 0           ; reset x each row

bg_x_loop:
    ; Color = x*4 in R channel, y in B channel
    MOV r2, r3
    LDI r16, 4
    MUL r2, r16         ; R = x * 4
    SHL r2, r16         ; shift left 4 more (R = x * 64)
    MOV r16, r13
    SHL r16, r16         ; B = y * 256
    OR r2, r16          ; pack R + B

    PSET r3, r13, r2
    ADD r3, r8
    LDI r16, 256
    CMP r3, r16
    BLT r5, bg_x_loop

    ADD r13, r8
    LDI r16, 256
    CMP r13, r16
    BLT r5, bg_y_loop

; ── Draw translucent red circle using BLENDR + BLEND ──
; Center at (100, 128), radius 50
; We'll compute the circle color per-pixel with BLENDR

    LDI r13, 78          ; y = 128 - 50 (top of circle)
    LDI r8, 1

circle_y_loop:
    LDI r3, 50          ; x = 100 - 50 (left of circle)

circle_x_loop:
    ; Distance from center (100, 128)
    MOV r2, r3
    LDI r16, 100
    SUB r2, r16         ; dx = x - 100
    ; dx^2 (approximate - just use abs for speed)
    PUSH r31
    LDI r16, 0
    CMP r2, r16
    BGE r5, dx_pos
    NEG r2
dx_pos:
    ; Check if within radius (50)
    LDI r16, 50
    CMP r2, r16
    BGE r5, skip_circle_x

    MOV r11, r13
    LDI r16, 128
    SUB r11, r16         ; dy = y - 128
    LDI r16, 0
    CMP r11, r16
    BGE r5, dy_pos
    NEG r11
dy_pos:
    LDI r16, 50
    CMP r11, r16
    BGE r5, skip_circle_x

    ; Compute alpha based on distance from center
    ; Closer to center = more opaque
    ADD r2, r11         ; manhattan distance
    LDI r16, 80
    CMP r2, r16
    BGE r5, far_from_center
    ; Close to center - high alpha (200)
    LDI r11, 200
    JMP do_blend

far_from_center:
    ; Further out - lower alpha (80)
    LDI r11, 80

do_blend:
    ; BLENDR r15, r1, r0 - blend red (src) with existing pixel (dst)
    ; First read existing pixel via PEEK
    PEEK r3, r13, r15    ; r15 = existing pixel color
    LDI r1, 0xFF0000     ; r1 = red source color
    BLENDR r15, r1, r11   ; r15 = blended result
    ; Now BLEND the result onto screen
    BLEND r3, r13, r15, r11

skip_circle_x:
    ADD r3, r8
    LDI r16, 150
    CMP r3, r16
    BLT r5, circle_x_loop

    ADD r13, r8
    LDI r16, 178
    CMP r13, r16
    BLT r5, circle_y_loop

    POP r31

; ── Draw translucent green circle at (160, 100), radius 40 ──
    LDI r13, 60          ; y = 100 - 40
    LDI r8, 1

circle2_y_loop:
    LDI r3, 120         ; x = 160 - 40

circle2_x_loop:
    MOV r2, r3
    LDI r16, 160
    SUB r2, r16
    LDI r16, 0
    CMP r2, r16
    BGE r5, c2dx_pos
    NEG r2
c2dx_pos:
    LDI r16, 40
    CMP r2, r16
    BGE r5, skip_c2

    MOV r11, r13
    LDI r16, 100
    SUB r11, r16
    LDI r16, 0
    CMP r11, r16
    BGE r5, c2dy_pos
    NEG r11
c2dy_pos:
    LDI r16, 40
    CMP r11, r16
    BGE r5, skip_c2

    ADD r2, r11
    LDI r16, 60
    CMP r2, r16
    BGE r5, c2_far
    LDI r11, 180
    JMP do_blend2

c2_far:
    LDI r11, 60

do_blend2:
    PEEK r3, r13, r15
    LDI r1, 0x00FF00
    BLENDR r15, r1, r11
    BLEND r3, r13, r15, r11

skip_c2:
    ADD r3, r8
    LDI r16, 200
    CMP r3, r16
    BLT r5, circle2_x_loop

    ADD r13, r8
    LDI r16, 140
    CMP r13, r16
    BLT r5, circle2_y_loop

; ── Animate: slowly rotate alpha on the red circle ──
    LDI r6, 0           ; frame counter

anim_loop:
    FRAME
    ADD r6, r8
    LDI r16, 0xFF
    AND r6, r16         ; wrap frame counter

    ; Only redraw every 30 frames for performance
    LDI r16, 30
    AND r6, r16
    JNZ r6, anim_loop

    LDI r13, 78
    LDI r8, 1

anim_y_loop:
    LDI r3, 50

anim_x_loop:
    MOV r2, r3
    LDI r16, 100
    SUB r2, r16
    LDI r16, 0
    CMP r2, r16
    BGE r5, adx_pos
    NEG r2
adx_pos:
    LDI r16, 50
    CMP r2, r16
    BGE r5, skip_anim

    MOV r11, r13
    LDI r16, 128
    SUB r11, r16
    LDI r16, 0
    CMP r11, r16
    BGE r5, ady_pos
    NEG r11
ady_pos:
    LDI r16, 50
    CMP r11, r16
    BGE r5, skip_anim

    ; Pulsing alpha based on frame counter
    MOV r11, r6
    LDI r16, 128
    ADD r11, r16
    LDI r16, 0xFF
    AND r11, r16

    PEEK r3, r13, r15
    LDI r1, 0xFF0000
    BLENDR r15, r1, r11
    BLEND r3, r13, r15, r11

skip_anim:
    ADD r3, r8
    LDI r16, 150
    CMP r3, r16
    BLT r5, anim_x_loop

    ADD r13, r8
    LDI r16, 178
    CMP r13, r16
    BLT r5, anim_y_loop

    JMP anim_loop
