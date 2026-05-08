; DESCRIPTION: Draws a red circle at the screen with fixed size.

; blend_demo.asm - Phase 234: Alpha blending demo
; Demonstrates BLEND and BLENDR opcodes for sprite compositing
;
; BLEND xr, yr, color_r, alpha_r  - blend color onto screen pixel
; BLENDR dst_r, src_r, alpha_r     - blend two register colors
;
; The demo draws a gradient background, then overlays translucent colored
; circles using BLEND to create a smooth alpha-blended composition.

; Registers:
; r4 = x, r9 = y, r3 = color, r14 = alpha
; r1 = loop counter, r12 = increment
; r16 = temp

; ── Build a gradient background (blue to purple) ──
    LDI r4, 0           ; x
    LDI r9, 0           ; y
    LDI r12, 1           ; increment

bg_y_loop:
    LDI r4, 0           ; reset x each row

bg_x_loop:
    ; Color = x*4 in R channel, y in B channel
    MOV r3, r4
    LDI r16, 4
    MUL r3, r16         ; R = x * 4
    SHL r3, r16         ; shift left 4 more (R = x * 64)
    MOV r16, r9
    SHL r16, r16         ; B = y * 256
    OR r3, r16          ; pack R + B

    PSET r4, r9, r3
    ADD r4, r12
    LDI r16, 256
    CMP r4, r16
    BLT r11, bg_x_loop

    ADD r9, r12
    LDI r16, 256
    CMP r9, r16
    BLT r11, bg_y_loop

; ── Draw translucent red circle using BLENDR + BLEND ──
; Center at (100, 128), radius 50
; We'll compute the circle color per-pixel with BLENDR

    LDI r9, 78          ; y = 128 - 50 (top of circle)
    LDI r12, 1

circle_y_loop:
    LDI r4, 50          ; x = 100 - 50 (left of circle)

circle_x_loop:
    ; Distance from center (100, 128)
    MOV r3, r4
    LDI r16, 100
    SUB r3, r16         ; dx = x - 100
    ; dx^2 (approximate - just use abs for speed)
    PUSH r31
    LDI r16, 0
    CMP r3, r16
    BGE r11, dx_pos
    NEG r3
dx_pos:
    ; Check if within radius (50)
    LDI r16, 50
    CMP r3, r16
    BGE r11, skip_circle_x

    MOV r14, r9
    LDI r16, 128
    SUB r14, r16         ; dy = y - 128
    LDI r16, 0
    CMP r14, r16
    BGE r11, dy_pos
    NEG r14
dy_pos:
    LDI r16, 50
    CMP r14, r16
    BGE r11, skip_circle_x

    ; Compute alpha based on distance from center
    ; Closer to center = more opaque
    ADD r3, r14         ; manhattan distance
    LDI r16, 80
    CMP r3, r16
    BGE r11, far_from_center
    ; Close to center - high alpha (200)
    LDI r14, 200
    JMP do_blend

far_from_center:
    ; Further out - lower alpha (80)
    LDI r14, 80

do_blend:
    ; BLENDR r2, r0, r13 - blend red (src) with existing pixel (dst)
    ; First read existing pixel via PEEK
    PEEK r4, r9, r2    ; r2 = existing pixel color
    LDI r0, 0xFF0000     ; r0 = red source color
    BLENDR r2, r0, r14   ; r2 = blended result
    ; Now BLEND the result onto screen
    BLEND r4, r9, r2, r14

skip_circle_x:
    ADD r4, r12
    LDI r16, 150
    CMP r4, r16
    BLT r11, circle_x_loop

    ADD r9, r12
    LDI r16, 178
    CMP r9, r16
    BLT r11, circle_y_loop

    POP r31

; ── Draw translucent green circle at (160, 100), radius 40 ──
    LDI r9, 60          ; y = 100 - 40
    LDI r12, 1

circle2_y_loop:
    LDI r4, 120         ; x = 160 - 40

circle2_x_loop:
    MOV r3, r4
    LDI r16, 160
    SUB r3, r16
    LDI r16, 0
    CMP r3, r16
    BGE r11, c2dx_pos
    NEG r3
c2dx_pos:
    LDI r16, 40
    CMP r3, r16
    BGE r11, skip_c2

    MOV r14, r9
    LDI r16, 100
    SUB r14, r16
    LDI r16, 0
    CMP r14, r16
    BGE r11, c2dy_pos
    NEG r14
c2dy_pos:
    LDI r16, 40
    CMP r14, r16
    BGE r11, skip_c2

    ADD r3, r14
    LDI r16, 60
    CMP r3, r16
    BGE r11, c2_far
    LDI r14, 180
    JMP do_blend2

c2_far:
    LDI r14, 60

do_blend2:
    PEEK r4, r9, r2
    LDI r0, 0x00FF00
    BLENDR r2, r0, r14
    BLEND r4, r9, r2, r14

skip_c2:
    ADD r4, r12
    LDI r16, 200
    CMP r4, r16
    BLT r11, circle2_x_loop

    ADD r9, r12
    LDI r16, 140
    CMP r9, r16
    BLT r11, circle2_y_loop

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
    LDI r4, 50

anim_x_loop:
    MOV r3, r4
    LDI r16, 100
    SUB r3, r16
    LDI r16, 0
    CMP r3, r16
    BGE r11, adx_pos
    NEG r3
adx_pos:
    LDI r16, 50
    CMP r3, r16
    BGE r11, skip_anim

    MOV r14, r9
    LDI r16, 128
    SUB r14, r16
    LDI r16, 0
    CMP r14, r16
    BGE r11, ady_pos
    NEG r14
ady_pos:
    LDI r16, 50
    CMP r14, r16
    BGE r11, skip_anim

    ; Pulsing alpha based on frame counter
    MOV r14, r1
    LDI r16, 128
    ADD r14, r16
    LDI r16, 0xFF
    AND r14, r16

    PEEK r4, r9, r2
    LDI r0, 0xFF0000
    BLENDR r2, r0, r14
    BLEND r4, r9, r2, r14

skip_anim:
    ADD r4, r12
    LDI r16, 150
    CMP r4, r16
    BLT r11, anim_x_loop

    ADD r9, r12
    LDI r16, 178
    CMP r9, r16
    BLT r11, anim_y_loop

    JMP anim_loop
