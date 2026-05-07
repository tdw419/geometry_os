; DESCRIPTION: The GeOS assembly code initializes registers and sets up a color palette. It then displays the text "HELLO" and "WORLD" at specific coordinates with different colors, performs some arithmetic operations, and enters a loop that checks a condition before halting.

; mixed program
; initialization
  LDI r2, 16
  LDI r3, 533
  LDI r9, 3437
; palette
  LDI r3, 0x3004
  LDI r9, 1
  LDI r1, 0x00AAFF
  STORE r3, r1
  ADD r3, r3, r9
  LDI r1, 0x008888
  STORE r3, r1
  ADD r3, r3, r9
  LDI r1, 0x00FFAA
  STORE r3, r1
  ADD r3, r3, r9
  LDI r1, 0xAAAAAA
  STORE r3, r1
  ADD r3, r3, r9
  LDI r1, 0x0000CC
  STORE r3, r1
  ADD r3, r3, r9
  LDI r1, 0x0044FF
  STORE r3, r1
  ADD r3, r3, r9
  LDI r8, 128
  LDI r15, 0x9CDF7C
  LDI r4, 256
  TEXT r8, r15, r4, "HELLO"
  PUSH r4
  PUSH r15
  MUL r14, r7, r10
  SHL r5, r4, r3
  MUL r8, r5, r15
  POP r15
  POP r4
  LDI r7, 16
  LDI r15, 0x153298
  LDI r14, 0xE74612
  DRAWTEXT r7, r15, r14, "WORLD"
  LDI r2, 0x05C3F4
  STORE r2, r8
  LOAD r10, r2
  LDI r12, 0xB2EA15
  STORE r12, r0
  LOAD r13, r12
  LDI r10, 0x15B490
  STORE r10, r30
  LOAD r14, r10
  LDI r2, 3941
  STORE r2, r14
  LOAD r12, r2
  LDI r14, 32
loop_0:
  AND r2, r0, r12
  LDI r6, 1
  SUB r14, r14, r6
  JNZ r14, loop_0
  HALT
