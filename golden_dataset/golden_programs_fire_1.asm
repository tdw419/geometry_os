; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

; fire.asm -- scrolling fire animation using SCROLL + FRAME
;
; Each frame:
;   1. SCROLL screen up 1 pixel
;   2. Draw a new ember row at y=254 with position-varied orange/red
;   3. FRAME -- display this state and continue
;
; r15 = x counter  r9 = y (254)  r10 = frame counter
; r3 = scroll amt  r5 = 256

LDI r9, 254
LDI r3, 1
LDI r5, 256

frame_loop:
  SCROLL r3

  LDI r15, 0

ember_loop:
  ; brightness = (x * 7 + frame) & 0xFF
  LDI r13, 7
  MUL r13, r15
  ADD r13, r10
  LDI r7, 0xFF
  AND r13, r7

  ; threshold: skip if brightness < 64
  LDI r7, 64
  CMP r13, r7
  BLT r11, next_x

  ; green = brightness >> 1, red = 0xFF
  LDI r7, 2
  DIV r13, r7
  LDI r7, 8
  SHL r13, r7
  LDI r7, 0xFF0000
  OR r13, r7

  PSET r15, r9, r13

next_x:
  LDI r7, 1
  ADD r15, r7
  CMP r15, r5
  JZ r11, end_row
  JMP ember_loop

end_row:
  LDI r7, 1
  ADD r10, r7
  FRAME
  JMP frame_loop
