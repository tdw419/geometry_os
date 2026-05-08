; DESCRIPTION: A red square centered at the screen with fixed size.

; ai_perception.asm -- Test AI_AGENT op=4 (perception) and op=3 (real VLM)
;
; Draws three colored squares, calls the vision model to count objects.
; Stores the count in R0. If vision model is unavailable, R0 = 0xFFFFFFFF.
;
; Usage: cargo run --release -- ai_perception.asm

; ── Draw white square (top-left) ──
LDI r7, 1              ; increment
LDI r13, 0xFFFFFF       ; white
LDI r15, 20             ; x start
LDI r11, 60             ; x end
LDI r14, 20             ; y start
LDI r2, 60             ; y end

draw_white_y:
  MOV r0, r15           ; x = x_start
  draw_white_x:
    PSET r0, r14, r13
    ADD r0, r7
    CMP r0, r11
    BLT r4, draw_white_x
  ADD r14, r7
  CMP r14, r2
  BLT r4, draw_white_y

; ── Draw red square (middle) ──
LDI r13, 0xFF0000       ; red
LDI r15, 100
LDI r11, 140
LDI r14, 100
LDI r2, 140

draw_red_y:
  MOV r0, r15
  draw_red_x:
    PSET r0, r14, r13
    ADD r0, r7
    CMP r0, r11
    BLT r4, draw_red_x
  ADD r14, r7
  CMP r14, r2
  BLT r4, draw_red_y

; ── Draw green square (bottom-right) ──
LDI r13, 0x00FF00       ; green
LDI r15, 180
LDI r11, 220
LDI r14, 180
LDI r2, 220

draw_green_y:
  MOV r0, r15
  draw_green_x:
    PSET r0, r14, r13
    ADD r0, r7
    CMP r0, r11
    BLT r4, draw_green_x
  ADD r14, r7
  CMP r14, r2
  BLT r4, draw_green_y

; ── Call AI_AGENT op=4 (count objects) ──
LDI r12, 4             ; op=4: specialized perception
LDI r6, 0             ; mode=0: full screen
AI_AGENT r12           ; R0 = count of distinct objects

; ── Display result: draw R0 as digits on screen using simple pixel font ──
; Just halt -- check R0 in registers
HALT
