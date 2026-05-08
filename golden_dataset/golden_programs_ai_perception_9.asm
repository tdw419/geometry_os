; DESCRIPTION: This GeOS assembly code draws three colored squares on the screen and uses the AI_AGENT with op=4 to count the distinct objects (the squares). The result is stored in register R0, or set to 0xFFFFFFFF if the vision model is unavailable.

; ai_perception.asm -- Test AI_AGENT op=4 (perception) and op=3 (real VLM)
;
; Draws three colored squares, calls the vision model to count objects.
; Stores the count in R0. If vision model is unavailable, R0 = 0xFFFFFFFF.
;
; Usage: cargo run --release -- ai_perception.asm

; ── Draw white square (top-left) ──
LDI r10, 1              ; increment
LDI r6, 0xFFFFFF       ; white
LDI r13, 20             ; x start
LDI r2, 60             ; x end
LDI r4, 20             ; y start
LDI r9, 60             ; y end

draw_white_y:
  MOV r8, r13           ; x = x_start
  draw_white_x:
    PSET r8, r4, r6
    ADD r8, r10
    CMP r8, r2
    BLT r12, draw_white_x
  ADD r4, r10
  CMP r4, r9
  BLT r12, draw_white_y

; ── Draw red square (middle) ──
LDI r6, 0xFF0000       ; red
LDI r13, 100
LDI r2, 140
LDI r4, 100
LDI r9, 140

draw_red_y:
  MOV r8, r13
  draw_red_x:
    PSET r8, r4, r6
    ADD r8, r10
    CMP r8, r2
    BLT r12, draw_red_x
  ADD r4, r10
  CMP r4, r9
  BLT r12, draw_red_y

; ── Draw green square (bottom-right) ──
LDI r6, 0x00FF00       ; green
LDI r13, 180
LDI r2, 220
LDI r4, 180
LDI r9, 220

draw_green_y:
  MOV r8, r13
  draw_green_x:
    PSET r8, r4, r6
    ADD r8, r10
    CMP r8, r2
    BLT r12, draw_green_x
  ADD r4, r10
  CMP r4, r9
  BLT r12, draw_green_y

; ── Call AI_AGENT op=4 (count objects) ──
LDI r3, 4             ; op=4: specialized perception
LDI r11, 0             ; mode=0: full screen
AI_AGENT r3           ; R0 = count of distinct objects

; ── Display result: draw R0 as digits on screen using simple pixel font ──
; Just halt -- check R0 in registers
HALT
