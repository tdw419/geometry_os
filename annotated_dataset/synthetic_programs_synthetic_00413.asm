; DESCRIPTION: This GeOS assembly code initializes a drawing loop with specific registers set for colors and addresses. It defines a palette of 8 colors in memory and continuously checks input keys to manipulate the frame display based on key presses.

; drawing loop program
; initialization
  LDI r20, 3077
  LDI r5, 0
  LDI r1, 0xA02589
  LDI r15, 64
  LDI r7, 1515
; palette
  LDI r8, 0x2275
  LDI r15, 1
  LDI r24, 0xFF0000
  STORE r8, r24
  ADD r8, r8, r15
  LDI r24, 0xAAFF00
  STORE r8, r24
  ADD r8, r8, r15
  LDI r24, 0x00FFAA
  STORE r8, r24
  ADD r8, r8, r15
  LDI r24, 0x0044FF
  STORE r8, r24
  ADD r8, r8, r15
  LDI r24, 0xFFEE00
  STORE r8, r24
  ADD r8, r8, r15
  LDI r24, 0xFFFFFF
  STORE r8, r24
  ADD r8, r8, r15
  LDI r24, 0xFFAA00
  STORE r8, r24
  ADD r8, r8, r15
  LDI r24, 0x550077
  STORE r8, r24
  ADD r8, r8, r15
  LDI r24, 0xFFFF00
  STORE r8, r24
  ADD r8, r8, r15
main_0:
  SHL r4, r9, r7
  SAR r15, r5, r13
  IKEY r4
  CMPI r4, 0xBCC633
  JNZ r4, key_1
  SHL r14, r8, r6
  IKEY r7
  CMPI r7, 0x8B7EB2
  JNZ r7, key_2
  SHL r4, r15, r7
  FRAME
  JMP main_0
