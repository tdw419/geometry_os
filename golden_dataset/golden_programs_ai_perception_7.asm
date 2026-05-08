; DESCRIPTION: This GeOS assembly code draws three colored squares on the screen and uses the AI_AGENT with op=4 to count the distinct objects (the squares). The result is stored in register R0, or set to 0xFFFFFFFF if the vision model is unavailable.

; ai_perception.asm -- Test AI_AGENT op=4 (perception) and op=3 (real VLM)
;
; Draws three colored squares, calls the vision model to count objects.
; Stores the count in R0. If vision model is unavailable, R0 = 0xFFFFFFFF.
;
; Usage: cargo run --release -- ai_perception.asm

; ── Draw white square (top-left) ──
LDI r1, 1              ; increment
LDI r8, 0xFFFFFF       ; white
LDI r13, 20             ; x start
LDI r10, 60             ; x end
LDI r2, 20             ; y start
LDI r3, 60             ; y end

draw_white_y:
  MOV r7, r13           ; x = x_start
  draw_white_x:
    PSET r7, r2, r8
    ADD r7, r1
    CMP r7, r10
    BLT r4, draw_white_x
  ADD r2, r1
  CMP r2, r3
  BLT r4, draw_white_y

; ── Draw red square (middle) ──
LDI r8, 0xFF0000       ; red
LDI r13, 100
LDI r10, 140
LDI r2, 100
LDI r3, 140

draw_red_y:
  MOV r7, r13
  draw_red_x:
    PSET r7, r2, r8
    ADD r7, r1
    CMP r7, r10
    BLT r4, draw_red_x
  ADD r2, r1
  CMP r2, r3
  BLT r4, draw_red_y

; ── Draw green square (bottom-right) ──
LDI r8, 0x00FF00       ; green
LDI r13, 180
LDI r10, 220
LDI r2, 180
LDI r3, 220

draw_green_y:
  MOV r7, r13
  draw_green_x:
    PSET r7, r2, r8
    ADD r7, r1
    CMP r7, r10
    BLT r4, draw_green_x
  ADD r2, r1
  CMP r2, r3
  BLT r4, draw_green_y

; ── Call AI_AGENT op=4 (count objects) ──
LDI r9, 4             ; op=4: specialized perception
LDI r5, 0             ; mode=0: full screen
AI_AGENT r9           ; R0 = count of distinct objects

; ── Display result: draw R0 as digits on screen using simple pixel font ──
; Just halt -- check R0 in registers
HALT
