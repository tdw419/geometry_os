; DESCRIPTION: Display a square using color red at the screen.

; ai_perception.asm -- Test AI_AGENT op=4 (perception) and op=3 (real VLM)
;
; Draws three colored squares, calls the vision model to count objects.
; Stores the count in R0. If vision model is unavailable, R0 = 0xFFFFFFFF.
;
; Usage: cargo run --release -- ai_perception.asm

; ── Draw white square (top-left) ──
LDI r11, 1              ; increment
LDI r1, 0xFFFFFF       ; white
LDI r12, 20             ; x start
LDI r0, 60             ; x end
LDI r8, 20             ; y start
LDI r10, 60             ; y end

draw_white_y:
  MOV r2, r12           ; x = x_start
  draw_white_x:
    PSET r2, r8, r1
    ADD r2, r11
    CMP r2, r0
    BLT r15, draw_white_x
  ADD r8, r11
  CMP r8, r10
  BLT r15, draw_white_y

; ── Draw red square (middle) ──
LDI r1, 0xFF0000       ; red
LDI r12, 100
LDI r0, 140
LDI r8, 100
LDI r10, 140

draw_red_y:
  MOV r2, r12
  draw_red_x:
    PSET r2, r8, r1
    ADD r2, r11
    CMP r2, r0
    BLT r15, draw_red_x
  ADD r8, r11
  CMP r8, r10
  BLT r15, draw_red_y

; ── Draw green square (bottom-right) ──
LDI r1, 0x00FF00       ; green
LDI r12, 180
LDI r0, 220
LDI r8, 180
LDI r10, 220

draw_green_y:
  MOV r2, r12
  draw_green_x:
    PSET r2, r8, r1
    ADD r2, r11
    CMP r2, r0
    BLT r15, draw_green_x
  ADD r8, r11
  CMP r8, r10
  BLT r15, draw_green_y

; ── Call AI_AGENT op=4 (count objects) ──
LDI r5, 4             ; op=4: specialized perception
LDI r13, 0             ; mode=0: full screen
AI_AGENT r5           ; R0 = count of distinct objects

; ── Display result: draw R0 as digits on screen using simple pixel font ──
; Just halt -- check R0 in registers
HALT
