; ai_perception.asm -- Test AI_AGENT op=4 (perception) and op=3 (real VLM)
;
; Draws three colored squares, calls the vision model to count objects.
; Stores the count in R0. If vision model is unavailable, R0 = 0xFFFFFFFF.
;
; Usage: cargo run --release -- ai_perception.asm

; ── Draw white square (top-left) ──
LDI r1, 1              ; increment
LDI r3, 0xFFFFFF       ; white
LDI r4, 20             ; x start
LDI r5, 60             ; x end
LDI r6, 20             ; y start
LDI r7, 60             ; y end

draw_white_y:
  MOV r2, r4           ; x = x_start
  draw_white_x:
    PSET r2, r6, r3
    ADD r2, r1
    CMP r2, r5
    BLT r0, draw_white_x
  ADD r6, r1
  CMP r6, r7
  BLT r0, draw_white_y

; ── Draw red square (middle) ──
LDI r3, 0xFF0000       ; red
LDI r4, 100
LDI r5, 140
LDI r6, 100
LDI r7, 140

draw_red_y:
  MOV r2, r4
  draw_red_x:
    PSET r2, r6, r3
    ADD r2, r1
    CMP r2, r5
    BLT r0, draw_red_x
  ADD r6, r1
  CMP r6, r7
  BLT r0, draw_red_y

; ── Draw green square (bottom-right) ──
LDI r3, 0x00FF00       ; green
LDI r4, 180
LDI r5, 220
LDI r6, 180
LDI r7, 220

draw_green_y:
  MOV r2, r4
  draw_green_x:
    PSET r2, r6, r3
    ADD r2, r1
    CMP r2, r5
    BLT r0, draw_green_x
  ADD r6, r1
  CMP r6, r7
  BLT r0, draw_green_y

; ── Call AI_AGENT op=4 (count objects) ──
LDI r10, 4             ; op=4: specialized perception
LDI r11, 0             ; mode=0: full screen
AI_AGENT r10           ; R0 = count of distinct objects

; ── Display result: draw R0 as digits on screen using simple pixel font ──
; Just halt -- check R0 in registers
HALT
