; DESCRIPTION: This GeOS assembly code initializes registers with specific values and sets up a color palette. It then enters a loop where it draws the text "WORLD" at specified coordinates, performs bitwise operations on registers, and updates the display frame repeatedly.

; drawing loop program
; initialization
  LDI r12, 0xC3AA29
  LDI r11, 0x34343F
  LDI r3, 16
  LDI r6, 10
  LDI r4, 896
; palette
  LDI r6, 0x7024
  LDI r5, 1
  LDI r9, 0xFF0000
  STORE r6, r9
  ADD r6, r6, r5
  LDI r9, 0xFFAA00
  STORE r6, r9
  ADD r6, r6, r5
  LDI r9, 0x008888
  STORE r6, r9
  ADD r6, r6, r5
  LDI r9, 0xFF00FF
  STORE r6, r9
  ADD r6, r6, r5
  LDI r9, 0x44FF00
  STORE r6, r9
  ADD r6, r6, r5
  LDI r9, 0xFFFF00
  STORE r6, r9
  ADD r6, r6, r5
  LDI r9, 0x888800
  STORE r6, r9
  ADD r6, r6, r5
  LDI r9, 0xAA00AA
  STORE r6, r9
  ADD r6, r6, r5
  LDI r9, 0xFFFF00
  STORE r6, r9
  ADD r6, r6, r5
main_0:
  CMPI r0, 10
  LDI r11, 0x768238
  LDI r12, 3654
  LDI r24, 99
  DRAWTEXT r11, r12, r24, "WORLD"
  AND r4, r12, r8
  XOR r13, r2, r9
  XOR r6, r5, r2
  AND r13, r1, r7
  FRAME
  JMP main_0
