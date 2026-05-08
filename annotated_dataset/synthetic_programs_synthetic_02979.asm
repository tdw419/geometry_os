; DESCRIPTION: This GeOS assembly code initializes a drawing loop with specific palette colors and enters a loop where it checks for key input. If the key '21' is pressed, it performs XOR operations on registers to manipulate values and then calls a frame update function before repeating the loop.

; drawing loop program
; initialization
  LDI r12, 0x538FD0
  LDI r15, 669
; palette
  LDI r11, 0x23EF
  LDI r12, 1
  LDI r7, 0xDD0044
  STORE r11, r7
  ADD r11, r11, r12
  LDI r7, 0x000066
  STORE r11, r7
  ADD r11, r11, r12
  LDI r7, 0x000066
  STORE r11, r7
  ADD r11, r11, r12
  LDI r7, 0xDD0044
  STORE r11, r7
  ADD r11, r11, r12
  LDI r7, 0xFFAA00
  STORE r11, r7
  ADD r11, r11, r12
  LDI r7, 0x0044FF
  STORE r11, r7
  ADD r11, r11, r12
main_0:
  IKEY r7
  CMPI r7, 21
  JNZ r7, key_1
  XOR r15, r9, r14
  XOR r4, r3, r13
  FRAME
  JMP main_0
