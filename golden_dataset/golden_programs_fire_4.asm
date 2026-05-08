; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

; fire.asm -- scrolling fire animation using SCROLL + FRAME
;
; Each frame:
;   1. SCROLL screen up 1 pixel
;   2. Draw a new ember row at y=254 with position-varied orange/red
;   3. FRAME -- display this state and continue
;
; r11 = x counter  r6 = y (254)  r15 = frame counter
; r7 = scroll amt  r9 = 256

LDI r6, 254
LDI r7, 1
LDI r9, 256

frame_loop:
  SCROLL r7

  LDI r11, 0

ember_loop:
  ; brightness = (x * 7 + frame) & 0xFF
  LDI r12, 7
  MUL r12, r11
  ADD r12, r15
  LDI r3, 0xFF
  AND r12, r3

  ; threshold: skip if brightness < 64
  LDI r3, 64
  CMP r12, r3
  BLT r0, next_x

  ; green = brightness >> 1, red = 0xFF
  LDI r3, 2
  DIV r12, r3
  LDI r3, 8
  SHL r12, r3
  LDI r3, 0xFF0000
  OR r12, r3

  PSET r11, r6, r12

next_x:
  LDI r3, 1
  ADD r11, r3
  CMP r11, r9
  JZ r0, end_row
  JMP ember_loop

end_row:
  LDI r3, 1
  ADD r15, r3
  FRAME
  JMP frame_loop
