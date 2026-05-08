; DESCRIPTION: This GeOS assembly code initializes graphics parameters and a color palette. It then enters a loop where it waits for a key press (specifically the 'y' key), draws a pixel with a defined color at a specified position, updates the frame, and repeats.

; drawing loop program
; initialization
  LDI r4, 4087
  LDI r9, 256
  LDI r11, 32
  LDI r5, 3465
  LDI r13, 2
; palette
  LDI r8, 0x4026
  LDI r13, 1
  LDI r2, 0xFFEE00
  STORE r8, r2
  ADD r8, r8, r13
  LDI r2, 0x000066
  STORE r8, r2
  ADD r8, r8, r13
  LDI r2, 0xFFFF00
  STORE r8, r2
  ADD r8, r8, r13
  LDI r2, 0x008888
  STORE r8, r2
  ADD r8, r8, r13
  LDI r2, 0xAA00AA
  STORE r8, r2
  ADD r8, r8, r13
  LDI r2, 0x000066
  STORE r8, r2
  ADD r8, r8, r13
  LDI r2, 0x0044FF
  STORE r8, r2
  ADD r8, r8, r13
main_0:
  IKEY r7
  CMPI r7, 121
  JNZ r7, key_1
  LDI r12, 256
  LDI r6, 0xD4CB82
  LDI r3, 10
  WPIXEL
  FRAME
  JMP main_0
