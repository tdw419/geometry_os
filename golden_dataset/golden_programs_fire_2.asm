; DESCRIPTION: This GeOS assembly code implements a scrolling fire animation by repeatedly scrolling the screen up by one pixel and drawing a new row of embers at y=254 with varying brightness and color. The ember's brightness is calculated based on its x-position and a frame counter, and it skips drawing if below a certain threshold, creating a dynamic and flickering flame effect.

; fire.asm -- scrolling fire animation using SCROLL + FRAME
;
; Each frame:
;   1. SCROLL screen up 1 pixel
;   2. Draw a new ember row at y=254 with position-varied orange/red
;   3. FRAME -- display this state and continue
;
; r14 = x counter  r2 = y (254)  r1 = frame counter
; r5 = scroll amt  r15 = 256

LDI r2, 254
LDI r5, 1
LDI r15, 256

frame_loop:
  SCROLL r5

  LDI r14, 0

ember_loop:
  ; brightness = (x * 7 + frame) & 0xFF
  LDI r3, 7
  MUL r3, r14
  ADD r3, r1
  LDI r11, 0xFF
  AND r3, r11

  ; threshold: skip if brightness < 64
  LDI r11, 64
  CMP r3, r11
  BLT r0, next_x

  ; green = brightness >> 1, red = 0xFF
  LDI r11, 2
  DIV r3, r11
  LDI r11, 8
  SHL r3, r11
  LDI r11, 0xFF0000
  OR r3, r11

  PSET r14, r2, r3

next_x:
  LDI r11, 1
  ADD r14, r11
  CMP r14, r15
  JZ r0, end_row
  JMP ember_loop

end_row:
  LDI r11, 1
  ADD r1, r11
  FRAME
  JMP frame_loop
