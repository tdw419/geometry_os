; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and sets up a color palette. It then performs various bitwise operations and memory manipulations before halting execution.

; mixed program
; initialization
  LDI r4, 3879
  LDI r13, 0xF39DE9
  LDI r3, 64
  LDI r8, 0xDB6E8E
  LDI r1, 0x2BB231
  LDI r11, 32
  LDI r2, 0
; palette
  LDI r14, 0x803D
  LDI r13, 1
  LDI r4, 0xAA00AA
  STORE r14, r4
  ADD r14, r14, r13
  LDI r4, 0x44FF00
  STORE r14, r4
  ADD r14, r14, r13
  LDI r4, 0x880088
  STORE r14, r4
  ADD r14, r14, r13
  LDI r4, 0xAAAAAA
  STORE r14, r4
  ADD r14, r14, r13
  LDI r4, 0x550077
  STORE r14, r4
  ADD r14, r14, r13
  LDI r4, 0x0000CC
  STORE r14, r4
  ADD r14, r14, r13
  LDI r4, 0x00FF44
  STORE r14, r4
  ADD r14, r14, r13
  LDI r4, 0x0000CC
  STORE r14, r4
  ADD r14, r14, r13
  LDI r4, 0x00FFFF
  STORE r14, r4
  ADD r14, r14, r13
  LDI r4, 0x00FF00
  STORE r14, r4
  ADD r14, r14, r13
  LDI r1, 128
  FILL r1
  SHR r9, r6, r8
  SHL r2, r15, r0
  SHLI r14, r13, 7
  SAR r2, r11, r15
  LDI r3, 16
  STORE r3, r10
  LOAD r9, r3
  LDI r9, 0xF2B249
  STORE r9, r9
  LOAD r1, r9
  LDI r10, 0x4E0F81
  STORE r10, r29
  LOAD r14, r10
  LDI r12, 16
  STORE r12, r15
  LOAD r11, r12
  LDI r9, 3010
  STORE r9, r0
  LOAD r14, r9
  PUSH r11
  AND r21, r31, r9
  AND r2, r14, r11
  POP r11
  HALT
