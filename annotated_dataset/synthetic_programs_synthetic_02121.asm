; DESCRIPTION: This GeOS assembly code initializes registers with specific values and sets up a color palette by storing RGB color codes into memory locations. It then calls a function `func_0` which performs arithmetic operations on registers and modifies their values before halting the system.

; mixed program
; initialization
  LDI r4, 0xF70CED
  LDI r13, 8
  LDI r2, 2723
; palette
  LDI r15, 0x249C
  LDI r10, 1
  LDI r12, 0xFF4400
  STORE r15, r12
  ADD r15, r15, r10
  LDI r12, 0xFFFFFF
  STORE r15, r12
  ADD r15, r15, r10
  LDI r12, 0x00FFFF
  STORE r15, r12
  ADD r15, r15, r10
  LDI r12, 0x00FF00
  STORE r15, r12
  ADD r15, r15, r10
  LDI r12, 0x00FFFF
  STORE r15, r12
  ADD r15, r15, r10
  LDI r12, 0x0000CC
  STORE r15, r12
  ADD r15, r15, r10
  LDI r12, 0xFFFFFF
  STORE r15, r12
  ADD r15, r15, r10
  LDI r12, 0x00FF00
  STORE r15, r12
  ADD r15, r15, r10
  LDI r12, 0x8800FF
  STORE r15, r12
  ADD r15, r15, r10
  LDI r12, 0xAAAAAA
  STORE r15, r12
  ADD r15, r15, r10
  LDI r12, 0xAA00AA
  STORE r15, r12
  ADD r15, r15, r10
  CALL func_0
func_0:
  ADD r6, r7, r13
  SHL r13, r9, r3
  AND r11, r10, r9
  RET
  PUSH r14
  PUSH r8
  PUSH r15
  SUB r9, r3, r15
  AND r7, r0, r3
  ADD r4, r11, r0
  MOD r10, r15, r4
  MUL r2, r5, r1
  POP r15
  POP r8
  POP r14
  XOR r6, r3, r10
  HALT
