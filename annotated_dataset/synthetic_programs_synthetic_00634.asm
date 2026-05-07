; DESCRIPTION: This GeOS assembly code initializes registers with specific values and sets up a color palette. It then enters an infinite loop where it fills the screen with a specified color and plots a pixel at a given coordinate before updating the frame.

; drawing loop program
; initialization
  LDI r1, 2164
  LDI r2, 0x9465EB
  LDI r13, 477
  LDI r12, 0x88E337
; palette
  LDI r3, 0x24CE
  LDI r5, 1
  LDI r9, 0x008888
  STORE r3, r9
  ADD r3, r3, r5
  LDI r9, 0x00FFAA
  STORE r3, r9
  ADD r3, r3, r5
  LDI r9, 0x008888
  STORE r3, r9
  ADD r3, r3, r5
  LDI r9, 0x0000FF
  STORE r3, r9
  ADD r3, r3, r5
  LDI r9, 0xFF0000
  STORE r3, r9
  ADD r3, r3, r5
  LDI r9, 0xAA00AA
  STORE r3, r9
  ADD r3, r3, r5
  LDI r9, 0x000066
  STORE r3, r9
  ADD r3, r3, r5
main_0:
  LDI r5, 0xF51E95
  FILL r5
  LDI r15, 3844
  LDI r7, 0xA99C19
  LDI r14, 0x4E05B6
  PSET r15, r7, r14
  FRAME
  JMP main_0
