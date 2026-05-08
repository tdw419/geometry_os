; DESCRIPTION: This GeOS assembly code draws three colored squares on the screen and uses the AI_AGENT with op=4 to count the distinct objects (the squares). The result is stored in register R0, or set to 0xFFFFFFFF if the vision model is unavailable.

; ai_perception.asm -- Test AI_AGENT op=4 (perception) and op=3 (real VLM)
;
; Draws three colored squares, calls the vision model to count objects.
; Stores the count in R0. If vision model is unavailable, R0 = 0xFFFFFFFF.
;
; Usage: cargo run --release -- ai_perception.asm

; ── Draw white square (top-left) ──
LDI r0, 1              ; increment
LDI r5, 0xFFFFFF       ; white
LDI r2, 20             ; x start
LDI r15, 60             ; x end
LDI r4, 20             ; y start
LDI r6, 60             ; y end

draw_white_y:
  MOV r12, r2           ; x = x_start
  draw_white_x:
    PSET r12, r4, r5
    ADD r12, r0
    CMP r12, r15
    BLT r14, draw_white_x
  ADD r4, r0
  CMP r4, r6
  BLT r14, draw_white_y

; ── Draw red square (middle) ──
LDI r5, 0xFF0000       ; red
LDI r2, 100
LDI r15, 140
LDI r4, 100
LDI r6, 140

draw_red_y:
  MOV r12, r2
  draw_red_x:
    PSET r12, r4, r5
    ADD r12, r0
    CMP r12, r15
    BLT r14, draw_red_x
  ADD r4, r0
  CMP r4, r6
  BLT r14, draw_red_y

; ── Draw green square (bottom-right) ──
LDI r5, 0x00FF00       ; green
LDI r2, 180
LDI r15, 220
LDI r4, 180
LDI r6, 220

draw_green_y:
  MOV r12, r2
  draw_green_x:
    PSET r12, r4, r5
    ADD r12, r0
    CMP r12, r15
    BLT r14, draw_green_x
  ADD r4, r0
  CMP r4, r6
  BLT r14, draw_green_y

; ── Call AI_AGENT op=4 (count objects) ──
LDI r13, 4             ; op=4: specialized perception
LDI r9, 0             ; mode=0: full screen
AI_AGENT r13           ; R0 = count of distinct objects

; ── Display result: draw R0 as digits on screen using simple pixel font ──
; Just halt -- check R0 in registers
HALT
