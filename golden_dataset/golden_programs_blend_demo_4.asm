; DESCRIPTION: Display a circle using color red at the screen.

; blend_demo.asm - Phase 234: Alpha blending demo
; Demonstrates BLEND and BLENDR opcodes for sprite compositing
;
; BLEND xr, yr, color_r, alpha_r  - blend color onto screen pixel
; BLENDR dst_r, src_r, alpha_r     - blend two register colors
;
; The demo draws a gradient background, then overlays translucent colored
; circles using BLEND to create a smooth alpha-blended composition.

; Registers:
; r3 = x, r1 = y, r5 = color, r10 = alpha
; r4 = loop counter, r7 = increment
; r16 = temp

; ── Build a gradient background (blue to purple) ──
    LDI r3, 0           ; x
    LDI r1, 0           ; y
    LDI r7, 1           ; increment

bg_y_loop:
    LDI r3, 0           ; reset x each row

bg_x_loop:
    ; Color = x*4 in R channel, y in B channel
    MOV r5, r3
    LDI r16, 4
    MUL r5, r16         ; R = x * 4
    SHL r5, r16         ; shift left 4 more (R = x * 64)
    MOV r16, r1
    SHL r16, r16         ; B = y * 256
    OR r5, r16          ; pack R + B

    PSET r3, r1, r5
    ADD r3, r7
    LDI r16, 256
    CMP r3, r16
    BLT r6, bg_x_loop

    ADD r1, r7
    LDI r16, 256
    CMP r1, r16
    BLT r6, bg_y_loop

; ── Draw translucent red circle using BLENDR + BLEND ──
; Center at (100, 128), radius 50
; We'll compute the circle color per-pixel with BLENDR

    LDI r1, 78          ; y = 128 - 50 (top of circle)
    LDI r7, 1

circle_y_loop:
    LDI r3, 50          ; x = 100 - 50 (left of circle)

circle_x_loop:
    ; Distance from center (100, 128)
    MOV r5, r3
    LDI r16, 100
    SUB r5, r16         ; dx = x - 100
    ; dx^2 (approximate - just use abs for speed)
    PUSH r31
    LDI r16, 0
    CMP r5, r16
    BGE r6, dx_pos
    NEG r5
dx_pos:
    ; Check if within radius (50)
    LDI r16, 50
    CMP r5, r16
    BGE r6, skip_circle_x

    MOV r10, r1
    LDI r16, 128
    SUB r10, r16         ; dy = y - 128
    LDI r16, 0
    CMP r10, r16
    BGE r6, dy_pos
    NEG r10
dy_pos:
    LDI r16, 50
    CMP r10, r16
    BGE r6, skip_circle_x

    ; Compute alpha based on distance from center
    ; Closer to center = more opaque
    ADD r5, r10         ; manhattan distance
    LDI r16, 80
    CMP r5, r16
    BGE r6, far_from_center
    ; Close to center - high alpha (200)
    LDI r10, 200
    JMP do_blend

far_from_center:
    ; Further out - lower alpha (80)
    LDI r10, 80

do_blend:
    ; BLENDR r14, r0, r8 - blend red (src) with existing pixel (dst)
    ; First read existing pixel via PEEK
    PEEK r3, r1, r14    ; r14 = existing pixel color
    LDI r0, 0xFF0000     ; r0 = red source color
    BLENDR r14, r0, r10   ; r14 = blended result
    ; Now BLEND the result onto screen
    BLEND r3, r1, r14, r10

skip_circle_x:
    ADD r3, r7
    LDI r16, 150
    CMP r3, r16
    BLT r6, circle_x_loop

    ADD r1, r7
    LDI r16, 178
    CMP r1, r16
    BLT r6, circle_y_loop

    POP r31

; ── Draw translucent green circle at (160, 100), radius 40 ──
    LDI r1, 60          ; y = 100 - 40
    LDI r7, 1

circle2_y_loop:
    LDI r3, 120         ; x = 160 - 40

circle2_x_loop:
    MOV r5, r3
    LDI r16, 160
    SUB r5, r16
    LDI r16, 0
    CMP r5, r16
    BGE r6, c2dx_pos
    NEG r5
c2dx_pos:
    LDI r16, 40
    CMP r5, r16
    BGE r6, skip_c2

    MOV r10, r1
    LDI r16, 100
    SUB r10, r16
    LDI r16, 0
    CMP r10, r16
    BGE r6, c2dy_pos
    NEG r10
c2dy_pos:
    LDI r16, 40
    CMP r10, r16
    BGE r6, skip_c2

    ADD r5, r10
    LDI r16, 60
    CMP r5, r16
    BGE r6, c2_far
    LDI r10, 180
    JMP do_blend2

c2_far:
    LDI r10, 60

do_blend2:
    PEEK r3, r1, r14
    LDI r0, 0x00FF00
    BLENDR r14, r0, r10
    BLEND r3, r1, r14, r10

skip_c2:
    ADD r3, r7
    LDI r16, 200
    CMP r3, r16
    BLT r6, circle2_x_loop

    ADD r1, r7
    LDI r16, 140
    CMP r1, r16
    BLT r6, circle2_y_loop

; ── Animate: slowly rotate alpha on the red circle ──
    LDI r4, 0           ; frame counter

anim_loop:
    FRAME
    ADD r4, r7
    LDI r16, 0xFF
    AND r4, r16         ; wrap frame counter

    ; Only redraw every 30 frames for performance
    LDI r16, 30
    AND r4, r16
    JNZ r4, anim_loop

    LDI r1, 78
    LDI r7, 1

anim_y_loop:
    LDI r3, 50

anim_x_loop:
    MOV r5, r3
    LDI r16, 100
    SUB r5, r16
    LDI r16, 0
    CMP r5, r16
    BGE r6, adx_pos
    NEG r5
adx_pos:
    LDI r16, 50
    CMP r5, r16
    BGE r6, skip_anim

    MOV r10, r1
    LDI r16, 128
    SUB r10, r16
    LDI r16, 0
    CMP r10, r16
    BGE r6, ady_pos
    NEG r10
ady_pos:
    LDI r16, 50
    CMP r10, r16
    BGE r6, skip_anim

    ; Pulsing alpha based on frame counter
    MOV r10, r4
    LDI r16, 128
    ADD r10, r16
    LDI r16, 0xFF
    AND r10, r16

    PEEK r3, r1, r14
    LDI r0, 0xFF0000
    BLENDR r14, r0, r10
    BLEND r3, r1, r14, r10

skip_anim:
    ADD r3, r7
    LDI r16, 150
    CMP r3, r16
    BLT r6, anim_x_loop

    ADD r1, r7
    LDI r16, 178
    CMP r1, r16
    BLT r6, anim_y_loop

    JMP anim_loop
