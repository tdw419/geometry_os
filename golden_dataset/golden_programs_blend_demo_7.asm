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
; r11 = x, r3 = y, r6 = color, r1 = alpha
; r2 = loop counter, r9 = increment
; r16 = temp

; ── Build a gradient background (blue to purple) ──
    LDI r11, 0           ; x
    LDI r3, 0           ; y
    LDI r9, 1           ; increment

bg_y_loop:
    LDI r11, 0           ; reset x each row

bg_x_loop:
    ; Color = x*4 in R channel, y in B channel
    MOV r6, r11
    LDI r16, 4
    MUL r6, r16         ; R = x * 4
    SHL r6, r16         ; shift left 4 more (R = x * 64)
    MOV r16, r3
    SHL r16, r16         ; B = y * 256
    OR r6, r16          ; pack R + B

    PSET r11, r3, r6
    ADD r11, r9
    LDI r16, 256
    CMP r11, r16
    BLT r7, bg_x_loop

    ADD r3, r9
    LDI r16, 256
    CMP r3, r16
    BLT r7, bg_y_loop

; ── Draw translucent red circle using BLENDR + BLEND ──
; Center at (100, 128), radius 50
; We'll compute the circle color per-pixel with BLENDR

    LDI r3, 78          ; y = 128 - 50 (top of circle)
    LDI r9, 1

circle_y_loop:
    LDI r11, 50          ; x = 100 - 50 (left of circle)

circle_x_loop:
    ; Distance from center (100, 128)
    MOV r6, r11
    LDI r16, 100
    SUB r6, r16         ; dx = x - 100
    ; dx^2 (approximate - just use abs for speed)
    PUSH r31
    LDI r16, 0
    CMP r6, r16
    BGE r7, dx_pos
    NEG r6
dx_pos:
    ; Check if within radius (50)
    LDI r16, 50
    CMP r6, r16
    BGE r7, skip_circle_x

    MOV r1, r3
    LDI r16, 128
    SUB r1, r16         ; dy = y - 128
    LDI r16, 0
    CMP r1, r16
    BGE r7, dy_pos
    NEG r1
dy_pos:
    LDI r16, 50
    CMP r1, r16
    BGE r7, skip_circle_x

    ; Compute alpha based on distance from center
    ; Closer to center = more opaque
    ADD r6, r1         ; manhattan distance
    LDI r16, 80
    CMP r6, r16
    BGE r7, far_from_center
    ; Close to center - high alpha (200)
    LDI r1, 200
    JMP do_blend

far_from_center:
    ; Further out - lower alpha (80)
    LDI r1, 80

do_blend:
    ; BLENDR r0, r12, r8 - blend red (src) with existing pixel (dst)
    ; First read existing pixel via PEEK
    PEEK r11, r3, r0    ; r0 = existing pixel color
    LDI r12, 0xFF0000     ; r12 = red source color
    BLENDR r0, r12, r1   ; r0 = blended result
    ; Now BLEND the result onto screen
    BLEND r11, r3, r0, r1

skip_circle_x:
    ADD r11, r9
    LDI r16, 150
    CMP r11, r16
    BLT r7, circle_x_loop

    ADD r3, r9
    LDI r16, 178
    CMP r3, r16
    BLT r7, circle_y_loop

    POP r31

; ── Draw translucent green circle at (160, 100), radius 40 ──
    LDI r3, 60          ; y = 100 - 40
    LDI r9, 1

circle2_y_loop:
    LDI r11, 120         ; x = 160 - 40

circle2_x_loop:
    MOV r6, r11
    LDI r16, 160
    SUB r6, r16
    LDI r16, 0
    CMP r6, r16
    BGE r7, c2dx_pos
    NEG r6
c2dx_pos:
    LDI r16, 40
    CMP r6, r16
    BGE r7, skip_c2

    MOV r1, r3
    LDI r16, 100
    SUB r1, r16
    LDI r16, 0
    CMP r1, r16
    BGE r7, c2dy_pos
    NEG r1
c2dy_pos:
    LDI r16, 40
    CMP r1, r16
    BGE r7, skip_c2

    ADD r6, r1
    LDI r16, 60
    CMP r6, r16
    BGE r7, c2_far
    LDI r1, 180
    JMP do_blend2

c2_far:
    LDI r1, 60

do_blend2:
    PEEK r11, r3, r0
    LDI r12, 0x00FF00
    BLENDR r0, r12, r1
    BLEND r11, r3, r0, r1

skip_c2:
    ADD r11, r9
    LDI r16, 200
    CMP r11, r16
    BLT r7, circle2_x_loop

    ADD r3, r9
    LDI r16, 140
    CMP r3, r16
    BLT r7, circle2_y_loop

; ── Animate: slowly rotate alpha on the red circle ──
    LDI r2, 0           ; frame counter

anim_loop:
    FRAME
    ADD r2, r9
    LDI r16, 0xFF
    AND r2, r16         ; wrap frame counter

    ; Only redraw every 30 frames for performance
    LDI r16, 30
    AND r2, r16
    JNZ r2, anim_loop

    LDI r3, 78
    LDI r9, 1

anim_y_loop:
    LDI r11, 50

anim_x_loop:
    MOV r6, r11
    LDI r16, 100
    SUB r6, r16
    LDI r16, 0
    CMP r6, r16
    BGE r7, adx_pos
    NEG r6
adx_pos:
    LDI r16, 50
    CMP r6, r16
    BGE r7, skip_anim

    MOV r1, r3
    LDI r16, 128
    SUB r1, r16
    LDI r16, 0
    CMP r1, r16
    BGE r7, ady_pos
    NEG r1
ady_pos:
    LDI r16, 50
    CMP r1, r16
    BGE r7, skip_anim

    ; Pulsing alpha based on frame counter
    MOV r1, r2
    LDI r16, 128
    ADD r1, r16
    LDI r16, 0xFF
    AND r1, r16

    PEEK r11, r3, r0
    LDI r12, 0xFF0000
    BLENDR r0, r12, r1
    BLEND r11, r3, r0, r1

skip_anim:
    ADD r11, r9
    LDI r16, 150
    CMP r11, r16
    BLT r7, anim_x_loop

    ADD r3, r9
    LDI r16, 178
    CMP r3, r16
    BLT r7, anim_y_loop

    JMP anim_loop
