; DESCRIPTION: This GeOS assembly code initializes various registers with specific values and sets up a color palette. It then enters a loop where it waits for key inputs to perform operations involving division, addition, shifting, and drawing frames based on the input conditions.

; drawing loop program
; initialization
  LDI r6, 3206
  LDI r8, 0x25E385
  LDI r12, 0x8D8F2D
  LDI r3, 0xB49098
  LDI r11, 255
  LDI r0, 2
  LDI r14, 256
  LDI r15, 3068
; palette
  LDI r1, 0x2231
  LDI r2, 1
  LDI r7, 0x0044FF
  STORE r1, r7
  ADD r1, r1, r2
  LDI r7, 0xFF8800
  STORE r1, r7
  ADD r1, r1, r2
  LDI r7, 0x44FF00
  STORE r1, r7
  ADD r1, r1, r2
  LDI r7, 0x44FF00
  STORE r1, r7
  ADD r1, r1, r2
  LDI r7, 0x8800FF
  STORE r1, r7
  ADD r1, r1, r2
  LDI r7, 0x000000
  STORE r1, r7
  ADD r1, r1, r2
  LDI r7, 0x000066
  STORE r1, r7
  ADD r1, r1, r2
  LDI r7, 0x00FF44
  STORE r1, r7
  ADD r1, r1, r2
  LDI r7, 0xFFFF00
  STORE r1, r7
  ADD r1, r1, r2
  LDI r7, 0x550077
  STORE r1, r7
  ADD r1, r1, r2
  LDI r7, 0x880088
  STORE r1, r7
  ADD r1, r1, r2
  LDI r7, 0xAA00AA
  STORE r1, r7
  ADD r1, r1, r2
main_0:
  IKEY r4
  CMPI r4, 229
  JNZ r4, key_1
  DIV r4, r13, r1
  IKEY r3
  CMPI r3, 249
  JNZ r3, key_2
  ADDI r1, r13, 177
  SHR r9, r10, r1
  SAR r12, r13, r10
  SHR r15, r4, r12
  FRAME
  JMP main_0
