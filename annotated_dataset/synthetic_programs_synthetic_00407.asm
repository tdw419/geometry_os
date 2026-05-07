; DESCRIPTION: This GeOS assembly code initializes registers and sets up a color palette. It then enters a loop where it draws the text "WORLD" at two different positions with varying colors, continuously updating the frame until the program is terminated.

; drawing loop program
; initialization
  LDI r9, 128
  LDI r13, 3545
  LDI r8, 1789
; palette
  LDI r8, 0x604C
  LDI r12, 1
  LDI r6, 0xFFEE00
  STORE r8, r6
  ADD r8, r8, r12
  LDI r6, 0xFFFF00
  STORE r8, r6
  ADD r8, r8, r12
  LDI r6, 0x000066
  STORE r8, r6
  ADD r8, r8, r12
  LDI r6, 0x44FF00
  STORE r8, r6
  ADD r8, r8, r12
  LDI r6, 0x00FF00
  STORE r8, r6
  ADD r8, r8, r12
  LDI r6, 0xAA00AA
  STORE r8, r6
  ADD r8, r8, r12
  LDI r6, 0x8800FF
  STORE r8, r6
  ADD r8, r8, r12
  LDI r6, 0xAAFF00
  STORE r8, r6
  ADD r8, r8, r12
  LDI r6, 0x44FF00
  STORE r8, r6
  ADD r8, r8, r12
main_0:
  LDI r26, 390
  LDI r7, 0x2918B6
  LDI r13, 8
  DRAWTEXT r26, r7, r13, "WORLD"
  LDI r13, 1633
  LDI r14, 0x2C5EB3
  LDI r28, 1
  DRAWTEXT r13, r14, r28, "WORLD"
  CMP r2, r14
  FRAME
  JMP main_0
