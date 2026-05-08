; DESCRIPTION: This GeOS assembly code initializes registers and sets up a palette for colors. It then enters a loop where it performs bitwise operations on registers, draws the text "WORLD" at specific coordinates, and updates the frame.

; drawing loop program
; initialization
  LDI r0, 1811
  LDI r4, 16
  LDI r6, 3081
; palette
  LDI r3, 0x21A4
  LDI r21, 1
  LDI r15, 0x44FF00
  STORE r3, r15
  ADD r3, r3, r21
  LDI r15, 0x880088
  STORE r3, r15
  ADD r3, r3, r21
  LDI r15, 0x00FF00
  STORE r3, r15
  ADD r3, r3, r21
  LDI r15, 0x0000CC
  STORE r3, r15
  ADD r3, r3, r21
main_0:
  ADDI r13, r4, 198
  OR r6, r14, r8
  OR r3, r2, r9
  XOR r5, r14, r11
  OR r14, r8, r7
  AND r2, r14, r11
  LDI r2, 2
  LDI r15, 4012
  LDI r11, 581
  DRAWTEXT r2, r15, r11, "WORLD"
  FRAME
  JMP main_0
