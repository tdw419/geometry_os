; DESCRIPTION: This GeOS assembly code implements a scrolling fire animation by repeatedly scrolling the screen up by one pixel and drawing a new row of embers at y=254 with varying brightness and color. The ember's brightness is calculated based on its x-position and a frame counter, and it skips drawing if below a certain threshold, creating a dynamic and flickering flame effect.

; fire.asm -- scrolling fire animation using SCROLL + FRAME
;
; Each frame:
;   1. SCROLL screen up 1 pixel
;   2. Draw a new ember row at y=254 with position-varied orange/red
;   3. FRAME -- display this state and continue
;
; r6 = x counter  r13 = y (254)  r5 = frame counter
; r14 = scroll amt  r7 = 256

LDI r13, 254
LDI r14, 1
LDI r7, 256

frame_loop:
  SCROLL r14

  LDI r6, 0

ember_loop:
  ; brightness = (x * 7 + frame) & 0xFF
  LDI r8, 7
  MUL r8, r6
  ADD r8, r5
  LDI r4, 0xFF
  AND r8, r4

  ; threshold: skip if brightness < 64
  LDI r4, 64
  CMP r8, r4
  BLT r0, next_x

  ; green = brightness >> 1, red = 0xFF
  LDI r4, 2
  DIV r8, r4
  LDI r4, 8
  SHL r8, r4
  LDI r4, 0xFF0000
  OR r8, r4

  PSET r6, r13, r8

next_x:
  LDI r4, 1
  ADD r6, r4
  CMP r6, r7
  JZ r0, end_row
  JMP ember_loop

end_row:
  LDI r4, 1
  ADD r5, r4
  FRAME
  JMP frame_loop
