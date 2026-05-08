; DESCRIPTION: Display a object using color colored at the screen.

; fire.asm -- scrolling fire animation using SCROLL + FRAME
;
; Each frame:
;   1. SCROLL screen up 1 pixel
;   2. Draw a new ember row at y=254 with position-varied orange/red
;   3. FRAME -- display this state and continue
;
; r2 = x counter  r0 = y (254)  r9 = frame counter
; r13 = scroll amt  r3 = 256

LDI r0, 254
LDI r13, 1
LDI r3, 256

frame_loop:
  SCROLL r13

  LDI r2, 0

ember_loop:
  ; brightness = (x * 7 + frame) & 0xFF
  LDI r8, 7
  MUL r8, r2
  ADD r8, r9
  LDI r14, 0xFF
  AND r8, r14

  ; threshold: skip if brightness < 64
  LDI r14, 64
  CMP r8, r14
  BLT r12, next_x

  ; green = brightness >> 1, red = 0xFF
  LDI r14, 2
  DIV r8, r14
  LDI r14, 8
  SHL r8, r14
  LDI r14, 0xFF0000
  OR r8, r14

  PSET r2, r0, r8

next_x:
  LDI r14, 1
  ADD r2, r14
  CMP r2, r3
  JZ r12, end_row
  JMP ember_loop

end_row:
  LDI r14, 1
  ADD r9, r14
  FRAME
  JMP frame_loop
