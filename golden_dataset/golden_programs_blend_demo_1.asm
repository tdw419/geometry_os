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
; r4 = x, r15 = y, r5 = color, r12 = alpha
; r11 = loop counter, r1 = increment
; r16 = temp

; ── Build a gradient background (blue to purple) ──
    LDI r4, 0           ; x
    LDI r15, 0           ; y
    LDI r1, 1           ; increment

bg_y_loop:
    LDI r4, 0           ; reset x each row

bg_x_loop:
    ; Color = x*4 in R channel, y in B channel
    MOV r5, r4
    LDI r16, 4
    MUL r5, r16         ; R = x * 4
    SHL r5, r16         ; shift left 4 more (R = x * 64)
    MOV r16, r15
    SHL r16, r16         ; B = y * 256
    OR r5, r16          ; pack R + B

    PSET r4, r15, r5
    ADD r4, r1
    LDI r16, 256
    CMP r4, r16
    BLT r9, bg_x_loop

    ADD r15, r1
    LDI r16, 256
    CMP r15, r16
    BLT r9, bg_y_loop

; ── Draw translucent red circle using BLENDR + BLEND ──
; Center at (100, 128), radius 50
; We'll compute the circle color per-pixel with BLENDR

    LDI r15, 78          ; y = 128 - 50 (top of circle)
    LDI r1, 1

circle_y_loop:
    LDI r4, 50          ; x = 100 - 50 (left of circle)

circle_x_loop:
    ; Distance from center (100, 128)
    MOV r5, r4
    LDI r16, 100
    SUB r5, r16         ; dx = x - 100
    ; dx^2 (approximate - just use abs for speed)
    PUSH r31
    LDI r16, 0
    CMP r5, r16
    BGE r9, dx_pos
    NEG r5
dx_pos:
    ; Check if within radius (50)
    LDI r16, 50
    CMP r5, r16
    BGE r9, skip_circle_x

    MOV r12, r15
    LDI r16, 128
    SUB r12, r16         ; dy = y - 128
    LDI r16, 0
    CMP r12, r16
    BGE r9, dy_pos
    NEG r12
dy_pos:
    LDI r16, 50
    CMP r12, r16
    BGE r9, skip_circle_x

    ; Compute alpha based on distance from center
    ; Closer to center = more opaque
    ADD r5, r12         ; manhattan distance
    LDI r16, 80
    CMP r5, r16
    BGE r9, far_from_center
    ; Close to center - high alpha (200)
    LDI r12, 200
    JMP do_blend

far_from_center:
    ; Further out - lower alpha (80)
    LDI r12, 80

do_blend:
    ; BLENDR r6, r3, r8 - blend red (src) with existing pixel (dst)
    ; First read existing pixel via PEEK
    PEEK r4, r15, r6    ; r6 = existing pixel color
    LDI r3, 0xFF0000     ; r3 = red source color
    BLENDR r6, r3, r12   ; r6 = blended result
    ; Now BLEND the result onto screen
    BLEND r4, r15, r6, r12

skip_circle_x:
    ADD r4, r1
    LDI r16, 150
    CMP r4, r16
    BLT r9, circle_x_loop

    ADD r15, r1
    LDI r16, 178
    CMP r15, r16
    BLT r9, circle_y_loop

    POP r31

; ── Draw translucent green circle at (160, 100), radius 40 ──
    LDI r15, 60          ; y = 100 - 40
    LDI r1, 1

circle2_y_loop:
    LDI r4, 120         ; x = 160 - 40

circle2_x_loop:
    MOV r5, r4
    LDI r16, 160
    SUB r5, r16
    LDI r16, 0
    CMP r5, r16
    BGE r9, c2dx_pos
    NEG r5
c2dx_pos:
    LDI r16, 40
    CMP r5, r16
    BGE r9, skip_c2

    MOV r12, r15
    LDI r16, 100
    SUB r12, r16
    LDI r16, 0
    CMP r12, r16
    BGE r9, c2dy_pos
    NEG r12
c2dy_pos:
    LDI r16, 40
    CMP r12, r16
    BGE r9, skip_c2

    ADD r5, r12
    LDI r16, 60
    CMP r5, r16
    BGE r9, c2_far
    LDI r12, 180
    JMP do_blend2

c2_far:
    LDI r12, 60

do_blend2:
    PEEK r4, r15, r6
    LDI r3, 0x00FF00
    BLENDR r6, r3, r12
    BLEND r4, r15, r6, r12

skip_c2:
    ADD r4, r1
    LDI r16, 200
    CMP r4, r16
    BLT r9, circle2_x_loop

    ADD r15, r1
    LDI r16, 140
    CMP r15, r16
    BLT r9, circle2_y_loop

; ── Animate: slowly rotate alpha on the red circle ──
    LDI r11, 0           ; frame counter

anim_loop:
    FRAME
    ADD r11, r1
    LDI r16, 0xFF
    AND r11, r16         ; wrap frame counter

    ; Only redraw every 30 frames for performance
    LDI r16, 30
    AND r11, r16
    JNZ r11, anim_loop

    LDI r15, 78
    LDI r1, 1

anim_y_loop:
    LDI r4, 50

anim_x_loop:
    MOV r5, r4
    LDI r16, 100
    SUB r5, r16
    LDI r16, 0
    CMP r5, r16
    BGE r9, adx_pos
    NEG r5
adx_pos:
    LDI r16, 50
    CMP r5, r16
    BGE r9, skip_anim

    MOV r12, r15
    LDI r16, 128
    SUB r12, r16
    LDI r16, 0
    CMP r12, r16
    BGE r9, ady_pos
    NEG r12
ady_pos:
    LDI r16, 50
    CMP r12, r16
    BGE r9, skip_anim

    ; Pulsing alpha based on frame counter
    MOV r12, r11
    LDI r16, 128
    ADD r12, r16
    LDI r16, 0xFF
    AND r12, r16

    PEEK r4, r15, r6
    LDI r3, 0xFF0000
    BLENDR r6, r3, r12
    BLEND r4, r15, r6, r12

skip_anim:
    ADD r4, r1
    LDI r16, 150
    CMP r4, r16
    BLT r9, anim_x_loop

    ADD r15, r1
    LDI r16, 178
    CMP r15, r16
    BLT r9, anim_y_loop

    JMP anim_loop
