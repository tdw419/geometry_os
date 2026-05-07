; DESCRIPTION: This GeOS assembly code initializes a drawing loop program by setting up screen dimensions and a color palette. It then enters a main loop where it waits for user input to draw shapes based on specific key presses, using the initialized parameters and frame rendering commands.

; drawing loop program
; initialization
  LDI r11, 128
  LDI r14, 64
; palette
  LDI r1, 0x4067
  LDI r15, 1
  LDI r13, 0xFFFFFF
  STORE r1, r13
  ADD r1, r1, r15
  LDI r13, 0x00FFFF
  STORE r1, r13
  ADD r1, r1, r15
  LDI r13, 0xFFFF00
  STORE r1, r13
  ADD r1, r1, r15
  LDI r13, 0xAA00AA
  STORE r1, r13
  ADD r1, r1, r15
  LDI r13, 0x000066
  STORE r1, r13
  ADD r1, r1, r15
  LDI r13, 0xFF0000
  STORE r1, r13
  ADD r1, r1, r15
  LDI r13, 0xFF8800
  STORE r1, r13
  ADD r1, r1, r15
  LDI r13, 0x00FFFF
  STORE r1, r13
  ADD r1, r1, r15
  LDI r13, 0xFFFFFF
  STORE r1, r13
  ADD r1, r1, r15
  LDI r13, 0xFF00FF
  STORE r1, r13
  ADD r1, r1, r15
  LDI r13, 0xFF0000
  STORE r1, r13
  ADD r1, r1, r15
  LDI r13, 0x00FFAA
  STORE r1, r13
  ADD r1, r1, r15
  LDI r13, 0xFFAA00
  STORE r1, r13
  ADD r1, r1, r15
main_0:
  IKEY r0
  CMPI r0, 1
  JNZ r0, key_1
  SHL r8, r10, r15
  SAR r9, r12, r2
  SAR r14, r11, r6
  SAR r14, r22, r2
  IKEY r12
  CMPI r12, 221
  JNZ r12, key_2
  FRAME
  JMP main_0
