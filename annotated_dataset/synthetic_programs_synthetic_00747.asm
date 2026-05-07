; DESCRIPTION: The GeOS assembly code initializes registers and sets up a color palette. It then enters a loop where it draws circles with varying sizes and colors, updating the frame and jumping back to the start of the loop.

; drawing loop program
; initialization
  LDI r5, 0x85D2B8
  LDI r3, 0xC4EA97
  LDI r15, 255
  LDI r7, 64
; palette
  LDI r9, 0x5004
  LDI r4, 1
  LDI r13, 0xFFFF00
  STORE r9, r13
  ADD r9, r9, r4
  LDI r13, 0x00FF00
  STORE r9, r13
  ADD r9, r9, r4
  LDI r13, 0xFF0000
  STORE r9, r13
  ADD r9, r9, r4
  LDI r13, 0xFFFF00
  STORE r9, r13
  ADD r9, r9, r4
  LDI r13, 0xAAAAAA
  STORE r9, r13
  ADD r9, r9, r4
  LDI r13, 0x0000FF
  STORE r9, r13
  ADD r9, r9, r4
  LDI r13, 0x00FF44
  STORE r9, r13
  ADD r9, r9, r4
  LDI r13, 0xFF00FF
  STORE r9, r13
  ADD r9, r9, r4
  LDI r13, 0x00FF44
  STORE r9, r13
  ADD r9, r9, r4
  LDI r13, 0xFF8800
  STORE r9, r13
  ADD r9, r9, r4
  LDI r13, 0x00FF00
  STORE r9, r13
  ADD r9, r9, r4
  LDI r13, 0x0000CC
  STORE r9, r13
  ADD r9, r9, r4
main_0:
  SUBI r1, r0, 256
  LDI r7, 32
  LDI r15, 764
  LDI r11, 255
  LDI r2, 255
  CIRCLE r7, r15, r11, r2
  CMPI r7, r11, 85
  CMPI r4, 0xF83CED
  FRAME
  JMP main_0
