; DESCRIPTION: This GeOS assembly code initializes a drawing loop with a predefined set of colors stored in the palette. It repeatedly sets a pixel at coordinates (1337, 1337) with color 0x44D4A7, checks a condition involving register r30, fills an area starting from coordinate 1406, draws the text "HELLO" at coordinates (250, 468), and refreshes the frame before repeating the loop.

; drawing loop program
; initialization
  LDI r3, 1604
  LDI r7, 128
; palette
  LDI r5, 0x806E
  LDI r9, 1
  LDI r8, 0x880088
  STORE r5, r8
  ADD r5, r5, r9
  LDI r8, 0xDD0044
  STORE r5, r8
  ADD r5, r5, r9
  LDI r8, 0x0000FF
  STORE r5, r8
  ADD r5, r5, r9
  LDI r8, 0xFFFF00
  STORE r5, r8
  ADD r5, r5, r9
  LDI r8, 0x880088
  STORE r5, r8
  ADD r5, r5, r9
  LDI r8, 0x44FF00
  STORE r5, r8
  ADD r5, r5, r9
  LDI r8, 0x888800
  STORE r5, r8
  ADD r5, r5, r9
  LDI r8, 0x0044FF
  STORE r5, r8
  ADD r5, r5, r9
  LDI r8, 0x00FFAA
  STORE r5, r8
  ADD r5, r5, r9
  LDI r8, 0x00AAFF
  STORE r5, r8
  ADD r5, r5, r9
  LDI r8, 0xFF8800
  STORE r5, r8
  ADD r5, r5, r9
  LDI r8, 0xAAFF00
  STORE r5, r8
  ADD r5, r5, r9
  LDI r8, 0x008888
  STORE r5, r8
  ADD r5, r5, r9
  LDI r8, 0x0044FF
  STORE r5, r8
  ADD r5, r5, r9
  LDI r8, 0xAAAAAA
  STORE r5, r8
  ADD r5, r5, r9
  LDI r8, 0xFFFF00
  STORE r5, r8
  ADD r5, r5, r9
main_0:
  LDI r11, 0x14C72D
  LDI r11, 1337
  LDI r3, 0x44D4A7
  PSET r11, r11, r3
  ANDI r7, r30, 16
  LDI r15, 1406
  FILL r15
  LDI r8, 128
  LDI r11, 250
  LDI r12, 468
  TEXT r8, r11, r12, "HELLO"
  FRAME
  JMP main_0
