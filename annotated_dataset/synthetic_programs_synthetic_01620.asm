; DESCRIPTION: This GeOS assembly code initializes a drawing loop that sets up a color palette with seven colors and continuously displays the text "HELLO" on the screen using a frame update.

; drawing loop program
; initialization
  LDI r4, 8
  LDI r3, 4002
; palette
  LDI r4, 0x224E
  LDI r3, 1
  LDI r11, 0xFF4400
  STORE r4, r11
  ADD r4, r4, r3
  LDI r11, 0x000066
  STORE r4, r11
  ADD r4, r4, r3
  LDI r11, 0x0000CC
  STORE r4, r11
  ADD r4, r4, r3
  LDI r11, 0xFF00FF
  STORE r4, r11
  ADD r4, r4, r3
  LDI r11, 0x008888
  STORE r4, r11
  ADD r4, r4, r3
  LDI r11, 0x00FF44
  STORE r4, r11
  ADD r4, r4, r3
main_0:
  XOR r10, r26, r9
  OR r0, r1, r9
  LDI r11, 3557
  LDI r14, 32
  LDI r10, 1
  TEXT r11, r14, r10, "HELLO"
  FRAME
  JMP main_0
