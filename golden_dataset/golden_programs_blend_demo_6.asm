; DESCRIPTION: Render a red circle at the screen.

; blend_demo.asm - Phase 234: Alpha blending demo
; Demonstrates BLEND and BLENDR opcodes for sprite compositing
;
; BLEND xr, yr, color_r, alpha_r  - blend color onto screen pixel
; BLENDR dst_r, src_r, alpha_r     - blend two register colors
;
; The demo draws a gradient background, then overlays translucent colored
; circles using BLEND to create a smooth alpha-blended composition.

; Registers:
; r4 = x, r14 = y, r7 = color, r11 = alpha
; r9 = loop counter, r5 = increment
; r16 = temp

; ── Build a gradient background (blue to purple) ──
    LDI r4, 0           ; x
    LDI r14, 0           ; y
    LDI r5, 1           ; increment

bg_y_loop:
    LDI r4, 0           ; reset x each row

bg_x_loop:
    ; Color = x*4 in R channel, y in B channel
    MOV r7, r4
    LDI r16, 4
    MUL r7, r16         ; R = x * 4
    SHL r7, r16         ; shift left 4 more (R = x * 64)
    MOV r16, r14
    SHL r16, r16         ; B = y * 256
    OR r7, r16          ; pack R + B

    PSET r4, r14, r7
    ADD r4, r5
    LDI r16, 256
    CMP r4, r16
    BLT r8, bg_x_loop

    ADD r14, r5
    LDI r16, 256
    CMP r14, r16
    BLT r8, bg_y_loop

; ── Draw translucent red circle using BLENDR + BLEND ──
; Center at (100, 128), radius 50
; We'll compute the circle color per-pixel with BLENDR

    LDI r14, 78          ; y = 128 - 50 (top of circle)
    LDI r5, 1

circle_y_loop:
    LDI r4, 50          ; x = 100 - 50 (left of circle)

circle_x_loop:
    ; Distance from center (100, 128)
    MOV r7, r4
    LDI r16, 100
    SUB r7, r16         ; dx = x - 100
    ; dx^2 (approximate - just use abs for speed)
    PUSH r31
    LDI r16, 0
    CMP r7, r16
    BGE r8, dx_pos
    NEG r7
dx_pos:
    ; Check if within radius (50)
    LDI r16, 50
    CMP r7, r16
    BGE r8, skip_circle_x

    MOV r11, r14
    LDI r16, 128
    SUB r11, r16         ; dy = y - 128
    LDI r16, 0
    CMP r11, r16
    BGE r8, dy_pos
    NEG r11
dy_pos:
    LDI r16, 50
    CMP r11, r16
    BGE r8, skip_circle_x

    ; Compute alpha based on distance from center
    ; Closer to center = more opaque
    ADD r7, r11         ; manhattan distance
    LDI r16, 80
    CMP r7, r16
    BGE r8, far_from_center
    ; Close to center - high alpha (200)
    LDI r11, 200
    JMP do_blend

far_from_center:
    ; Further out - lower alpha (80)
    LDI r11, 80

do_blend:
    ; BLENDR r13, r0, r6 - blend red (src) with existing pixel (dst)
    ; First read existing pixel via PEEK
    PEEK r4, r14, r13    ; r13 = existing pixel color
    LDI r0, 0xFF0000     ; r0 = red source color
    BLENDR r13, r0, r11   ; r13 = blended result
    ; Now BLEND the result onto screen
    BLEND r4, r14, r13, r11

skip_circle_x:
    ADD r4, r5
    LDI r16, 150
    CMP r4, r16
    BLT r8, circle_x_loop

    ADD r14, r5
    LDI r16, 178
    CMP r14, r16
    BLT r8, circle_y_loop

    POP r31

; ── Draw translucent green circle at (160, 100), radius 40 ──
    LDI r14, 60          ; y = 100 - 40
    LDI r5, 1

circle2_y_loop:
    LDI r4, 120         ; x = 160 - 40

circle2_x_loop:
    MOV r7, r4
    LDI r16, 160
    SUB r7, r16
    LDI r16, 0
    CMP r7, r16
    BGE r8, c2dx_pos
    NEG r7
c2dx_pos:
    LDI r16, 40
    CMP r7, r16
    BGE r8, skip_c2

    MOV r11, r14
    LDI r16, 100
    SUB r11, r16
    LDI r16, 0
    CMP r11, r16
    BGE r8, c2dy_pos
    NEG r11
c2dy_pos:
    LDI r16, 40
    CMP r11, r16
    BGE r8, skip_c2

    ADD r7, r11
    LDI r16, 60
    CMP r7, r16
    BGE r8, c2_far
    LDI r11, 180
    JMP do_blend2

c2_far:
    LDI r11, 60

do_blend2:
    PEEK r4, r14, r13
    LDI r0, 0x00FF00
    BLENDR r13, r0, r11
    BLEND r4, r14, r13, r11

skip_c2:
    ADD r4, r5
    LDI r16, 200
    CMP r4, r16
    BLT r8, circle2_x_loop

    ADD r14, r5
    LDI r16, 140
    CMP r14, r16
    BLT r8, circle2_y_loop

; ── Animate: slowly rotate alpha on the red circle ──
    LDI r9, 0           ; frame counter

anim_loop:
    FRAME
    ADD r9, r5
    LDI r16, 0xFF
    AND r9, r16         ; wrap frame counter

    ; Only redraw every 30 frames for performance
    LDI r16, 30
    AND r9, r16
    JNZ r9, anim_loop

    LDI r14, 78
    LDI r5, 1

anim_y_loop:
    LDI r4, 50

anim_x_loop:
    MOV r7, r4
    LDI r16, 100
    SUB r7, r16
    LDI r16, 0
    CMP r7, r16
    BGE r8, adx_pos
    NEG r7
adx_pos:
    LDI r16, 50
    CMP r7, r16
    BGE r8, skip_anim

    MOV r11, r14
    LDI r16, 128
    SUB r11, r16
    LDI r16, 0
    CMP r11, r16
    BGE r8, ady_pos
    NEG r11
ady_pos:
    LDI r16, 50
    CMP r11, r16
    BGE r8, skip_anim

    ; Pulsing alpha based on frame counter
    MOV r11, r9
    LDI r16, 128
    ADD r11, r16
    LDI r16, 0xFF
    AND r11, r16

    PEEK r4, r14, r13
    LDI r0, 0xFF0000
    BLENDR r13, r0, r11
    BLEND r4, r14, r13, r11

skip_anim:
    ADD r4, r5
    LDI r16, 150
    CMP r4, r16
    BLT r8, anim_x_loop

    ADD r14, r5
    LDI r16, 178
    CMP r14, r16
    BLT r8, anim_y_loop

    JMP anim_loop
