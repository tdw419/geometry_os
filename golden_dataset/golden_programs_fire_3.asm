; DESCRIPTION: This GeOS assembly code implements a scrolling fire animation by repeatedly scrolling the screen up by one pixel and drawing a new row of embers at y=254 with varying brightness and color. The ember's brightness is calculated based on its x-position and a frame counter, and it skips drawing if below a certain threshold, creating a dynamic and flickering flame effect.

; fire.asm -- scrolling fire animation using SCROLL + FRAME
;
; Each frame:
;   1. SCROLL screen up 1 pixel
;   2. Draw a new ember row at y=254 with position-varied orange/red
;   3. FRAME -- display this state and continue
;
; r3 = x counter  r7 = y (254)  r0 = frame counter
; r1 = scroll amt  r15 = 256

LDI r7, 254
LDI r1, 1
LDI r15, 256

frame_loop:
  SCROLL r1

  LDI r3, 0

ember_loop:
  ; brightness = (x * 7 + frame) & 0xFF
  LDI r14, 7
  MUL r14, r3
  ADD r14, r0
  LDI r11, 0xFF
  AND r14, r11

  ; threshold: skip if brightness < 64
  LDI r11, 64
  CMP r14, r11
  BLT r5, next_x

  ; green = brightness >> 1, red = 0xFF
  LDI r11, 2
  DIV r14, r11
  LDI r11, 8
  SHL r14, r11
  LDI r11, 0xFF0000
  OR r14, r11

  PSET r3, r7, r14

next_x:
  LDI r11, 1
  ADD r3, r11
  CMP r3, r15
  JZ r5, end_row
  JMP ember_loop

end_row:
  LDI r11, 1
  ADD r0, r11
  FRAME
  JMP frame_loop
