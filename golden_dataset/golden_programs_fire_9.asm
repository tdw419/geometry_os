; DESCRIPTION: This GeOS assembly code implements a scrolling fire animation by repeatedly scrolling the screen up by one pixel and drawing a new row of embers at y=254 with varying brightness and color. The ember's brightness is calculated based on its x-position and a frame counter, and it skips drawing if below a certain threshold, creating a dynamic and flickering flame effect.

; fire.asm -- scrolling fire animation using SCROLL + FRAME
;
; Each frame:
;   1. SCROLL screen up 1 pixel
;   2. Draw a new ember row at y=254 with position-varied orange/red
;   3. FRAME -- display this state and continue
;
; r1 = x counter  r9 = y (254)  r13 = frame counter
; r6 = scroll amt  r11 = 256

LDI r9, 254
LDI r6, 1
LDI r11, 256

frame_loop:
  SCROLL r6

  LDI r1, 0

ember_loop:
  ; brightness = (x * 7 + frame) & 0xFF
  LDI r8, 7
  MUL r8, r1
  ADD r8, r13
  LDI r12, 0xFF
  AND r8, r12

  ; threshold: skip if brightness < 64
  LDI r12, 64
  CMP r8, r12
  BLT r0, next_x

  ; green = brightness >> 1, red = 0xFF
  LDI r12, 2
  DIV r8, r12
  LDI r12, 8
  SHL r8, r12
  LDI r12, 0xFF0000
  OR r8, r12

  PSET r1, r9, r8

next_x:
  LDI r12, 1
  ADD r1, r12
  CMP r1, r11
  JZ r0, end_row
  JMP ember_loop

end_row:
  LDI r12, 1
  ADD r13, r12
  FRAME
  JMP frame_loop
