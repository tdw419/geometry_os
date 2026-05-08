; DESCRIPTION: This GeOS assembly code draws three colored squares on the screen and uses the AI_AGENT with op=4 to count the distinct objects (the squares). The result is stored in register R0, or set to 0xFFFFFFFF if the vision model is unavailable.

; ai_perception.asm -- Test AI_AGENT op=4 (perception) and op=3 (real VLM)
;
; Draws three colored squares, calls the vision model to count objects.
; Stores the count in R0. If vision model is unavailable, R0 = 0xFFFFFFFF.
;
; Usage: cargo run --release -- ai_perception.asm

; ── Draw white square (top-left) ──
LDI r10, 1              ; increment
LDI r15, 0xFFFFFF       ; white
LDI r9, 20             ; x start
LDI r7, 60             ; x end
LDI r13, 20             ; y start
LDI r0, 60             ; y end

draw_white_y:
  MOV r1, r9           ; x = x_start
  draw_white_x:
    PSET r1, r13, r15
    ADD r1, r10
    CMP r1, r7
    BLT r8, draw_white_x
  ADD r13, r10
  CMP r13, r0
  BLT r8, draw_white_y

; ── Draw red square (middle) ──
LDI r15, 0xFF0000       ; red
LDI r9, 100
LDI r7, 140
LDI r13, 100
LDI r0, 140

draw_red_y:
  MOV r1, r9
  draw_red_x:
    PSET r1, r13, r15
    ADD r1, r10
    CMP r1, r7
    BLT r8, draw_red_x
  ADD r13, r10
  CMP r13, r0
  BLT r8, draw_red_y

; ── Draw green square (bottom-right) ──
LDI r15, 0x00FF00       ; green
LDI r9, 180
LDI r7, 220
LDI r13, 180
LDI r0, 220

draw_green_y:
  MOV r1, r9
  draw_green_x:
    PSET r1, r13, r15
    ADD r1, r10
    CMP r1, r7
    BLT r8, draw_green_x
  ADD r13, r10
  CMP r13, r0
  BLT r8, draw_green_y

; ── Call AI_AGENT op=4 (count objects) ──
LDI r4, 4             ; op=4: specialized perception
LDI r3, 0             ; mode=0: full screen
AI_AGENT r4           ; R0 = count of distinct objects

; ── Display result: draw R0 as digits on screen using simple pixel font ──
; Just halt -- check R0 in registers
HALT
