; DESCRIPTION: This GeOS assembly code initializes registers with specific values, sets up a color palette, and then draws a rectangle and a circle on the screen. The code uses various arithmetic operations and bit manipulations to perform these tasks.

; mixed program
; initialization
  LDI r1, 3664
  LDI r15, 0x767C08
  LDI r0, 1765
; palette
  LDI r4, 0x205F
  LDI r3, 1
  LDI r11, 0xAA00AA
  STORE r4, r11
  ADD r4, r4, r3
  LDI r11, 0xFF00FF
  STORE r4, r11
  ADD r4, r4, r3
  LDI r11, 0x8800FF
  STORE r4, r11
  ADD r4, r4, r3
  LDI r11, 0x0000CC
  STORE r4, r11
  ADD r4, r4, r3
  LDI r11, 0x0044FF
  STORE r4, r11
  ADD r4, r4, r3
  LDI r11, 0xAAAAAA
  STORE r4, r11
  ADD r4, r4, r3
  PUSH r11
  XOR r4, r9, r1
  AND r7, r4, r14
  OR r4, r6, r8
  SHL r12, r14, r6
  SHR r4, r13, r3
  POP r11
  LDI r4, 0x1917E2
  LDI r9, 16
  LDI r6, 0x6CCEEE
  LDI r14, 64
  LDI r12, 702
  RECTF r4, r9, r6, r14, r12
  PUSH r10
  PUSH r8
  SHR r4, r11, r8
  XOR r1, r6, r11
  SUB r6, r0, r10
  MOD r15, r1, r2
  POP r8
  POP r10
  MOD r7, r12, r10
  LDI r10, 0x34C010
  LDI r6, 10
  LDI r6, 0x0627C7
  PSETI
  LDI r10, 32
  LDI r14, 128
  LDI r14, 3316
  LDI r6, 1
  CIRCLE r10, r14, r14, r6
  LDI r12, 3460
  LDI r15, 10
  LDI r6, 1
  PSET r12, r15, r6
  HALT
