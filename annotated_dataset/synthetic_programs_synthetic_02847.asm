; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, sets up a color palette by storing RGB values into memory locations calculated using pointer arithmetic, and performs bitwise operations on registers before halting the program.

; mixed program
; initialization
  LDI r0, 10
  LDI r2, 1112
  LDI r10, 256
  LDI r5, 0xB18FE6
  LDI r7, 128
; palette
  LDI r8, 0x7029
  LDI r7, 1
  LDI r4, 0xAA00AA
  STORE r8, r4
  ADD r8, r8, r7
  LDI r4, 0x444444
  STORE r8, r4
  ADD r8, r8, r7
  LDI r4, 0x880088
  STORE r8, r4
  ADD r8, r8, r7
  LDI r4, 0x00FFFF
  STORE r8, r4
  ADD r8, r8, r7
  LDI r4, 0x00FFFF
  STORE r8, r4
  ADD r8, r8, r7
  LDI r4, 0x008888
  STORE r8, r4
  ADD r8, r8, r7
  LDI r4, 0x44FF00
  STORE r8, r4
  ADD r8, r8, r7
  SHL r14, r13, r0
  SHR r5, r14, r11
  SHL r5, r10, r9
  LDI r13, 0
  STORE r13, r6
  LOAD r15, r13
  LDI r2, 2090
  STORE r2, r8
  LOAD r11, r2
  LDI r5, 9
  STORE r5, r2
  LOAD r13, r5
  HALT
