; DESCRIPTION: This GeOS assembly code initializes a drawing loop with specific register values and sets up a color palette. The `main_0` loop continuously draws pixels at specified coordinates until the condition is met to trigger a frame update.

; drawing loop program
; initialization
  LDI r12, 0xAA2D0C
  LDI r7, 8
  LDI r1, 0xB2AC85
  LDI r3, 0x9AF998
  LDI r10, 32
  LDI r24, 1040
; palette
  LDI r8, 0x705D
  LDI r11, 1
  LDI r5, 0x888800
  STORE r8, r5
  ADD r8, r8, r11
  LDI r5, 0x550077
  STORE r8, r5
  ADD r8, r8, r11
  LDI r5, 0x00AAFF
  STORE r8, r5
  ADD r8, r8, r11
  LDI r5, 0xFF4400
  STORE r8, r5
  ADD r8, r8, r11
  LDI r5, 0xFFEE00
  STORE r8, r5
  ADD r8, r8, r11
  LDI r5, 0xFFFF00
  STORE r8, r5
  ADD r8, r8, r11
  LDI r5, 0xFF4400
  STORE r8, r5
  ADD r8, r8, r11
  LDI r5, 0x000000
  STORE r8, r5
  ADD r8, r8, r11
  LDI r5, 0x0000FF
  STORE r8, r5
  ADD r8, r8, r11
  LDI r5, 0x8800FF
  STORE r8, r5
  ADD r8, r8, r11
  LDI r5, 0x00FF00
  STORE r8, r5
  ADD r8, r8, r11
main_0:
  LDI r7, 255
  LDI r9, 255
  LDI r7, 10
  WPIXEL
  CMPI r9, 32
  FRAME
  JMP main_0
