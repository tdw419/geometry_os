; DESCRIPTION: This GeOS assembly code initializes a drawing environment, sets up a color palette, and enters an infinite loop where it repeatedly draws text "WORLD" and "HELLO" on the screen with specific colors and positions. The code manipulates registers to control text rendering and updates the display frame continuously.

; drawing loop program
; initialization
  LDI r7, 256
  LDI r14, 16
  LDI r8, 442
  LDI r1, 2890
; palette
  LDI r12, 0x40E6
  LDI r7, 1
  LDI r5, 0xAA00AA
  STORE r12, r5
  ADD r12, r12, r7
  LDI r5, 0x000000
  STORE r12, r5
  ADD r12, r12, r7
  LDI r5, 0x000066
  STORE r12, r5
  ADD r12, r12, r7
  LDI r5, 0x00FF44
  STORE r12, r5
  ADD r12, r12, r7
  LDI r5, 0x000066
  STORE r12, r5
  ADD r12, r12, r7
  LDI r5, 0x00FFFF
  STORE r12, r5
  ADD r12, r12, r7
  LDI r5, 0xFF8800
  STORE r12, r5
  ADD r12, r12, r7
  LDI r5, 0xFFAA00
  STORE r12, r5
  ADD r12, r12, r7
  LDI r5, 0x880088
  STORE r12, r5
  ADD r12, r12, r7
  LDI r5, 0x00FFFF
  STORE r12, r5
  ADD r12, r12, r7
  LDI r5, 0xFF0000
  STORE r12, r5
  ADD r12, r12, r7
  LDI r5, 0xFF8800
  STORE r12, r5
  ADD r12, r12, r7
  LDI r5, 0x00FF44
  STORE r12, r5
  ADD r12, r12, r7
  LDI r5, 0xFF8800
  STORE r12, r5
  ADD r12, r12, r7
main_0:
  LDI r6, 255
  LDI r10, 3186
  LDI r8, 0
  DRAWTEXT r6, r10, r8, "WORLD"
  SUBI r11, r7, 187
  ADD r10, r9, r0
  SUB r0, r9, r1
  LDI r0, 32
  LDI r14, 579
  LDI r11, 0xDDABE2
  TEXT r0, r14, r11, "HELLO"
  OR r15, r4, r2
  XOR r14, r10, r18
  FRAME
  JMP main_0
