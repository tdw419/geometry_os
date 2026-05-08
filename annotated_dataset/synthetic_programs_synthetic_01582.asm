; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, performs a series of arithmetic and logical operations including addition, OR, shift left (SHLI), and shift right (SHR) on these registers, calls a function `func_0` which further manipulates the registers, and finally draws a rectangle using the `RECTF` instruction before halting.

; mixed program
; initialization
  LDI r7, 0x6B58EA
  LDI r14, 0x9B0BD4
  LDI r4, 128
  LDI r9, 3684
  LDI r1, 0xA0F396
  LDI r10, 128
  LDI r5, 53
  LDI r12, 0xDCE735
  LDI r13, 1692
  STORE r13, r11
  LOAD r0, r13
  LDI r11, 0
  STORE r11, r3
  LOAD r0, r11
  LDI r6, 1529
  STORE r6, r8
  LOAD r10, r6
  LDI r12, 2342
  STORE r12, r9
  LOAD r3, r12
  CALL func_0
func_0:
  ADD r12, r6, r10
  ADD r6, r8, r3
  OR r6, r7, r8
  RET
  ADD r14, r9, r13
  SHLI r8, r15, 0x335029
  SHR r1, r3, r14
  SHLI r12, r10, 0x5110B1
  SHL r14, r0, r15
  LDI r7, 670
  LDI r14, 0x14BB35
  LDI r5, 786
  LDI r1, 0x7BECFE
  LDI r23, 426
  RECTF r7, r14, r5, r1, r23
  HALT
