; DESCRIPTION: A red square centered at the screen with fixed size.

; ai_perception.asm -- Test AI_AGENT op=4 (perception) and op=3 (real VLM)
;
; Draws three colored squares, calls the vision model to count objects.
; Stores the count in R0. If vision model is unavailable, R0 = 0xFFFFFFFF.
;
; Usage: cargo run --release -- ai_perception.asm

; ── Draw white square (top-left) ──
LDI r11, 1              ; increment
LDI r2, 0xFFFFFF       ; white
LDI r12, 20             ; x start
LDI r4, 60             ; x end
LDI r10, 20             ; y start
LDI r14, 60             ; y end

draw_white_y:
  MOV r5, r12           ; x = x_start
  draw_white_x:
    PSET r5, r10, r2
    ADD r5, r11
    CMP r5, r4
    BLT r0, draw_white_x
  ADD r10, r11
  CMP r10, r14
  BLT r0, draw_white_y

; ── Draw red square (middle) ──
LDI r2, 0xFF0000       ; red
LDI r12, 100
LDI r4, 140
LDI r10, 100
LDI r14, 140

draw_red_y:
  MOV r5, r12
  draw_red_x:
    PSET r5, r10, r2
    ADD r5, r11
    CMP r5, r4
    BLT r0, draw_red_x
  ADD r10, r11
  CMP r10, r14
  BLT r0, draw_red_y

; ── Draw green square (bottom-right) ──
LDI r2, 0x00FF00       ; green
LDI r12, 180
LDI r4, 220
LDI r10, 180
LDI r14, 220

draw_green_y:
  MOV r5, r12
  draw_green_x:
    PSET r5, r10, r2
    ADD r5, r11
    CMP r5, r4
    BLT r0, draw_green_x
  ADD r10, r11
  CMP r10, r14
  BLT r0, draw_green_y

; ── Call AI_AGENT op=4 (count objects) ──
LDI r13, 4             ; op=4: specialized perception
LDI r8, 0             ; mode=0: full screen
AI_AGENT r13           ; R0 = count of distinct objects

; ── Display result: draw R0 as digits on screen using simple pixel font ──
; Just halt -- check R0 in registers
HALT
