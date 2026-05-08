; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then calls two functions, `func_0` and `func_1`, performing arithmetic operations such as OR, MOD, DIV, AND, SHL, XOR, and SHLI. After these operations, it draws the text "WORLD" at a specified location and halts execution.

; mixed program
; initialization
  LDI r1, 0xBF2A03
  LDI r0, 256
  LDI r8, 3527
  LDI r7, 0xBF1C25
  LDI r15, 0xB91F00
  LDI r12, 1321
  LDI r4, 1019
  LDI r6, 2
  CALL func_0
func_0:
  OR r4, r11, r7
  MOD r13, r12, r8
  DIV r12, r14, r15
  AND r5, r29, r10
  SHL r6, r5, r8
  XOR r1, r2, r24
  RET
  CALL func_1
func_1:
  MOD r9, r13, r8
  MOD r4, r23, r13
  DIV r8, r0, r1
  MOD r4, r6, r1
  DIV r21, r3, r10
  ADD r12, r0, r14
  RET
  LDI r3, 0
  LDI r18, 16
  LDI r3, 1031
  DRAWTEXT r3, r18, r3, "WORLD"
  SHLI r0, r13, 32
  SHLI r15, r11, 0
  SHL r12, r14, r11
  SHL r14, r0, r4
  CMP r3, r0
  HALT
