; DESCRIPTION: This GeOS assembly code initializes a drawing loop with specific color palette settings. It waits for user input to draw lines and pixels on the screen based on key presses, using the `LINE` and `WPIXEL` instructions respectively.

; drawing loop program
; initialization
  LDI r9, 381
  LDI r7, 2204
  LDI r6, 3352
; palette
  LDI r15, 0x24C3
  LDI r13, 1
  LDI r9, 0x000066
  STORE r15, r9
  ADD r15, r15, r13
  LDI r9, 0xFFAA00
  STORE r15, r9
  ADD r15, r15, r13
  LDI r9, 0xFF0000
  STORE r15, r9
  ADD r15, r15, r13
  LDI r9, 0xDD0044
  STORE r15, r9
  ADD r15, r15, r13
  LDI r9, 0xAAAAAA
  STORE r15, r9
  ADD r15, r15, r13
main_0:
  IKEY r14
  CMPI r14, 0x01290D
  JNZ r14, key_1
  LDI r9, 919
  LDI r2, 255
  LDI r9, 256
  LDI r1, 0x5562B9
  LDI r1, 0xF69655
  LINE r9, r2, r9, r1, r1
  IKEY r10
  CMPI r10, 0xDF336F
  JNZ r10, key_2
  LDI r6, 8
  LDI r6, 1
  LDI r3, 1103
  WPIXEL
  SHLI r6, r13, 0
  SHR r5, r10, r7
  FRAME
  JMP main_0
