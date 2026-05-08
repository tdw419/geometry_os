; DESCRIPTION: This GeOS assembly code implements a scrolling fire animation by repeatedly scrolling the screen up by one pixel and drawing a new row of embers at y=254 with varying brightness and color. The ember's brightness is calculated based on its x-position and a frame counter, and it skips drawing if below a certain threshold, creating a dynamic and flickering flame effect.

; fire.asm -- scrolling fire animation using SCROLL + FRAME
;
; Each frame:
;   1. SCROLL screen up 1 pixel
;   2. Draw a new ember row at y=254 with position-varied orange/red
;   3. FRAME -- display this state and continue
;
; r14 = x counter  r0 = y (254)  r4 = frame counter
; r3 = scroll amt  r2 = 256

LDI r0, 254
LDI r3, 1
LDI r2, 256

frame_loop:
  SCROLL r3

  LDI r14, 0

ember_loop:
  ; brightness = (x * 7 + frame) & 0xFF
  LDI r6, 7
  MUL r6, r14
  ADD r6, r4
  LDI r11, 0xFF
  AND r6, r11

  ; threshold: skip if brightness < 64
  LDI r11, 64
  CMP r6, r11
  BLT r9, next_x

  ; green = brightness >> 1, red = 0xFF
  LDI r11, 2
  DIV r6, r11
  LDI r11, 8
  SHL r6, r11
  LDI r11, 0xFF0000
  OR r6, r11

  PSET r14, r0, r6

next_x:
  LDI r11, 1
  ADD r14, r11
  CMP r14, r2
  JZ r9, end_row
  JMP ember_loop

end_row:
  LDI r11, 1
  ADD r4, r11
  FRAME
  JMP frame_loop
