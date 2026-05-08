; DESCRIPTION: This GeOS assembly code initializes a drawing environment with a specific color palette and enters a loop where it continuously draws circles on the screen. The code checks for user input to modify circle properties and refreshes the frame accordingly.

; drawing loop program
; initialization
  LDI r7, 255
  LDI r8, 16
; palette
  LDI r4, 0x24EB
  LDI r8, 1
  LDI r14, 0x444444
  STORE r4, r14
  ADD r4, r4, r8
  LDI r14, 0xFFFFFF
  STORE r4, r14
  ADD r4, r4, r8
  LDI r14, 0xFF8800
  STORE r4, r14
  ADD r4, r4, r8
  LDI r14, 0xAA00AA
  STORE r4, r14
  ADD r4, r4, r8
  LDI r14, 0xDD0044
  STORE r4, r14
  ADD r4, r4, r8
  LDI r14, 0xFFFFFF
  STORE r4, r14
  ADD r4, r4, r8
  LDI r14, 0x00FFFF
  STORE r4, r14
  ADD r4, r4, r8
  LDI r14, 0xFFFFFF
  STORE r4, r14
  ADD r4, r4, r8
  LDI r14, 0xAAAAAA
  STORE r4, r14
  ADD r4, r4, r8
main_0:
  LDI r13, 2
  LDI r12, 2045
  LDI r3, 8
  LDI r6, 950
  CIRCLE r13, r12, r3, r6
  IKEY r18
  CMPI r18, 125
  JNZ r18, key_1
  IKEY r9
  CMPI r9, 0x29FA9F
  JNZ r9, key_2
  IKEY r5
  CMPI r5, 239
  JNZ r5, key_3
  CMP r13, r21
  IKEY r3
  CMPI r3, 32
  JNZ r3, key_4
  FRAME
  JMP main_0
