; DESCRIPTION: This GeOS assembly code initializes a drawing loop with specific parameters and sets up a color palette. It then enters a main loop where it checks for user input to trigger a screen refresh, using instructions to handle frame updates and conditional jumps based on key presses.

; drawing loop program
; initialization
  LDI r5, 1533
  LDI r13, 255
  LDI r11, 0x7056D7
  LDI r7, 4
  LDI r6, 2
  LDI r12, 4
; palette
  LDI r6, 0x23A9
  LDI r9, 1
  LDI r12, 0xAAAAAA
  STORE r6, r12
  ADD r6, r6, r9
  LDI r12, 0xFF8800
  STORE r6, r12
  ADD r6, r6, r9
  LDI r12, 0x0044FF
  STORE r6, r12
  ADD r6, r6, r9
  LDI r12, 0x444444
  STORE r6, r12
  ADD r6, r6, r9
  LDI r12, 0xFFFF00
  STORE r6, r12
  ADD r6, r6, r9
  LDI r12, 0x00FF44
  STORE r6, r12
  ADD r6, r6, r9
  LDI r12, 0x00AAFF
  STORE r6, r12
  ADD r6, r6, r9
  LDI r12, 0xFFFFFF
  STORE r6, r12
  ADD r6, r6, r9
  LDI r12, 0x880088
  STORE r6, r12
  ADD r6, r6, r9
  LDI r12, 0xFF4400
  STORE r6, r12
  ADD r6, r6, r9
  LDI r12, 0x0000CC
  STORE r6, r12
  ADD r6, r6, r9
  LDI r12, 0x0000FF
  STORE r6, r12
  ADD r6, r6, r9
  LDI r12, 0x888800
  STORE r6, r12
  ADD r6, r6, r9
  LDI r12, 0x550077
  STORE r6, r12
  ADD r6, r6, r9
  LDI r12, 0x8800FF
  STORE r6, r12
  ADD r6, r6, r9
main_0:
  ADDI r10, r9, 110
  ADDI r6, r11, 32
  CMP r6, r9
  SHR r3, r7, r13
  IKEY r15
  CMPI r15, 16
  JNZ r15, key_1
  FRAME
  JMP main_0
