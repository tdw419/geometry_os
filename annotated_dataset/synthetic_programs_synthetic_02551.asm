; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and sets up a color palette. It then calls a function `func_0` which performs bitwise operations, arithmetic calculations, and register manipulations before halting the system.

; mixed program
; initialization
  LDI r13, 0x0F4F2A
  LDI r15, 3158
  LDI r11, 2
  LDI r31, 1503
  LDI r14, 0
  LDI r9, 3299
  LDI r0, 4
  LDI r6, 256
; palette
  LDI r12, 0x4037
  LDI r6, 1
  LDI r20, 0x0044FF
  STORE r12, r20
  ADD r12, r12, r6
  LDI r20, 0x008888
  STORE r12, r20
  ADD r12, r12, r6
  LDI r20, 0xFF00FF
  STORE r12, r20
  ADD r12, r12, r6
  LDI r20, 0x00FFFF
  STORE r12, r20
  ADD r12, r12, r6
  LDI r20, 0xFFAA00
  STORE r12, r20
  ADD r12, r12, r6
  LDI r20, 0x000066
  STORE r12, r20
  ADD r12, r12, r6
  CMP r11, r6
  CALL func_0
func_0:
  SHR r1, r10, r7
  MUL r7, r14, r9
  AND r2, r5, r27
  MUL r6, r8, r23
  RET
  PUSH r3
  PUSH r11
  PUSH r18
  PUSH r0
  MUL r2, r6, r14
  MUL r5, r14, r6
  SHR r2, r9, r6
  SHL r5, r14, r16
  POP r0
  POP r18
  POP r11
  POP r3
  HALT
