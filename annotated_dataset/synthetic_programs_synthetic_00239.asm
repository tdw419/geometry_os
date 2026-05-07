; DESCRIPTION: This GeOS assembly code initializes registers and sets up a color palette for drawing. It then enters a loop (`main_0`) where it checks for key input, performs various bitwise operations, updates frame data, and refreshes the display.

; drawing loop program
; initialization
  LDI r10, 904
  LDI r4, 255
  LDI r1, 128
  LDI r9, 4
  LDI r13, 0x79EA58
  LDI r15, 8
  LDI r8, 0xE5DFD4
; palette
  LDI r3, 0x501F
  LDI r0, 1
  LDI r8, 0x550077
  STORE r3, r8
  ADD r3, r3, r0
  LDI r8, 0xFFFF00
  STORE r3, r8
  ADD r3, r3, r0
  LDI r8, 0x008888
  STORE r3, r8
  ADD r3, r3, r0
  LDI r8, 0xFFAA00
  STORE r3, r8
  ADD r3, r3, r0
  LDI r8, 0xFFAA00
  STORE r3, r8
  ADD r3, r3, r0
main_0:
  CMPI r7, 240
  AND r11, r3, r14
  OR r15, r23, r2
  AND r11, r2, r6
  IKEY r2
  CMPI r2, 16
  JNZ r2, key_1
  SHLI r8, r1, 4
  SAR r10, r11, r15
  SHLI r0, r12, 0x0652BC
  SHLI r10, r5, 2
  ADDI r12, r2, 0xDF49CF
  FRAME
  JMP main_0
