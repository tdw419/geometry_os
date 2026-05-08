; DESCRIPTION: This GeOS assembly code implements a scrolling fire animation by repeatedly scrolling the screen up by one pixel and drawing a new row of embers at y=254 with varying brightness and color. The ember's brightness is calculated based on its x-position and a frame counter, and it skips drawing if below a certain threshold, creating a dynamic and flickering flame effect.

; fire.asm -- scrolling fire animation using SCROLL + FRAME
;
; Each frame:
;   1. SCROLL screen up 1 pixel
;   2. Draw a new ember row at y=254 with position-varied orange/red
;   3. FRAME -- display this state and continue
;
; r9 = x counter  r1 = y (254)  r0 = frame counter
; r6 = scroll amt  r7 = 256

LDI r1, 254
LDI r6, 1
LDI r7, 256

frame_loop:
  SCROLL r6

  LDI r9, 0

ember_loop:
  ; brightness = (x * 7 + frame) & 0xFF
  LDI r14, 7
  MUL r14, r9
  ADD r14, r0
  LDI r13, 0xFF
  AND r14, r13

  ; threshold: skip if brightness < 64
  LDI r13, 64
  CMP r14, r13
  BLT r8, next_x

  ; green = brightness >> 1, red = 0xFF
  LDI r13, 2
  DIV r14, r13
  LDI r13, 8
  SHL r14, r13
  LDI r13, 0xFF0000
  OR r14, r13

  PSET r9, r1, r14

next_x:
  LDI r13, 1
  ADD r9, r13
  CMP r9, r7
  JZ r8, end_row
  JMP ember_loop

end_row:
  LDI r13, 1
  ADD r0, r13
  FRAME
  JMP frame_loop
