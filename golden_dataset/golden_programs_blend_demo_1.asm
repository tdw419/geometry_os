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
; r10 = x, r5 = y, r4 = color, r6 = alpha
; r12 = loop counter, r7 = increment
; r16 = temp

; ── Build a gradient background (blue to purple) ──
    LDI r10, 0           ; x
    LDI r5, 0           ; y
    LDI r7, 1           ; increment

bg_y_loop:
    LDI r10, 0           ; reset x each row

bg_x_loop:
    ; Color = x*4 in R channel, y in B channel
    MOV r4, r10
    LDI r16, 4
    MUL r4, r16         ; R = x * 4
    SHL r4, r16         ; shift left 4 more (R = x * 64)
    MOV r16, r5
    SHL r16, r16         ; B = y * 256
    OR r4, r16          ; pack R + B

    PSET r10, r5, r4
    ADD r10, r7
    LDI r16, 256
    CMP r10, r16
    BLT r3, bg_x_loop

    ADD r5, r7
    LDI r16, 256
    CMP r5, r16
    BLT r3, bg_y_loop

; ── Draw translucent red circle using BLENDR + BLEND ──
; Center at (100, 128), radius 50
; We'll compute the circle color per-pixel with BLENDR

    LDI r5, 78          ; y = 128 - 50 (top of circle)
    LDI r7, 1

circle_y_loop:
    LDI r10, 50          ; x = 100 - 50 (left of circle)

circle_x_loop:
    ; Distance from center (100, 128)
    MOV r4, r10
    LDI r16, 100
    SUB r4, r16         ; dx = x - 100
    ; dx^2 (approximate - just use abs for speed)
    PUSH r31
    LDI r16, 0
    CMP r4, r16
    BGE r3, dx_pos
    NEG r4
dx_pos:
    ; Check if within radius (50)
    LDI r16, 50
    CMP r4, r16
    BGE r3, skip_circle_x

    MOV r6, r5
    LDI r16, 128
    SUB r6, r16         ; dy = y - 128
    LDI r16, 0
    CMP r6, r16
    BGE r3, dy_pos
    NEG r6
dy_pos:
    LDI r16, 50
    CMP r6, r16
    BGE r3, skip_circle_x

    ; Compute alpha based on distance from center
    ; Closer to center = more opaque
    ADD r4, r6         ; manhattan distance
    LDI r16, 80
    CMP r4, r16
    BGE r3, far_from_center
    ; Close to center - high alpha (200)
    LDI r6, 200
    JMP do_blend

far_from_center:
    ; Further out - lower alpha (80)
    LDI r6, 80

do_blend:
    ; BLENDR r1, r13, r11 - blend red (src) with existing pixel (dst)
    ; First read existing pixel via PEEK
    PEEK r10, r5, r1    ; r1 = existing pixel color
    LDI r13, 0xFF0000     ; r13 = red source color
    BLENDR r1, r13, r6   ; r1 = blended result
    ; Now BLEND the result onto screen
    BLEND r10, r5, r1, r6

skip_circle_x:
    ADD r10, r7
    LDI r16, 150
    CMP r10, r16
    BLT r3, circle_x_loop

    ADD r5, r7
    LDI r16, 178
    CMP r5, r16
    BLT r3, circle_y_loop

    POP r31

; ── Draw translucent green circle at (160, 100), radius 40 ──
    LDI r5, 60          ; y = 100 - 40
    LDI r7, 1

circle2_y_loop:
    LDI r10, 120         ; x = 160 - 40

circle2_x_loop:
    MOV r4, r10
    LDI r16, 160
    SUB r4, r16
    LDI r16, 0
    CMP r4, r16
    BGE r3, c2dx_pos
    NEG r4
c2dx_pos:
    LDI r16, 40
    CMP r4, r16
    BGE r3, skip_c2

    MOV r6, r5
    LDI r16, 100
    SUB r6, r16
    LDI r16, 0
    CMP r6, r16
    BGE r3, c2dy_pos
    NEG r6
c2dy_pos:
    LDI r16, 40
    CMP r6, r16
    BGE r3, skip_c2

    ADD r4, r6
    LDI r16, 60
    CMP r4, r16
    BGE r3, c2_far
    LDI r6, 180
    JMP do_blend2

c2_far:
    LDI r6, 60

do_blend2:
    PEEK r10, r5, r1
    LDI r13, 0x00FF00
    BLENDR r1, r13, r6
    BLEND r10, r5, r1, r6

skip_c2:
    ADD r10, r7
    LDI r16, 200
    CMP r10, r16
    BLT r3, circle2_x_loop

    ADD r5, r7
    LDI r16, 140
    CMP r5, r16
    BLT r3, circle2_y_loop

; ── Animate: slowly rotate alpha on the red circle ──
    LDI r12, 0           ; frame counter

anim_loop:
    FRAME
    ADD r12, r7
    LDI r16, 0xFF
    AND r12, r16         ; wrap frame counter

    ; Only redraw every 30 frames for performance
    LDI r16, 30
    AND r12, r16
    JNZ r12, anim_loop

    LDI r5, 78
    LDI r7, 1

anim_y_loop:
    LDI r10, 50

anim_x_loop:
    MOV r4, r10
    LDI r16, 100
    SUB r4, r16
    LDI r16, 0
    CMP r4, r16
    BGE r3, adx_pos
    NEG r4
adx_pos:
    LDI r16, 50
    CMP r4, r16
    BGE r3, skip_anim

    MOV r6, r5
    LDI r16, 128
    SUB r6, r16
    LDI r16, 0
    CMP r6, r16
    BGE r3, ady_pos
    NEG r6
ady_pos:
    LDI r16, 50
    CMP r6, r16
    BGE r3, skip_anim

    ; Pulsing alpha based on frame counter
    MOV r6, r12
    LDI r16, 128
    ADD r6, r16
    LDI r16, 0xFF
    AND r6, r16

    PEEK r10, r5, r1
    LDI r13, 0xFF0000
    BLENDR r1, r13, r6
    BLEND r10, r5, r1, r6

skip_anim:
    ADD r10, r7
    LDI r16, 150
    CMP r10, r16
    BLT r3, anim_x_loop

    ADD r5, r7
    LDI r16, 178
    CMP r5, r16
    BLT r3, anim_y_loop

    JMP anim_loop
