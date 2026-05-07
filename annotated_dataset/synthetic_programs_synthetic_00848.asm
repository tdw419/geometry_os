; DESCRIPTION: This GeOS assembly code initializes two registers with specific values and calls `func_0`. Within `func_0`, it performs a series of bitwise shift, addition, modulo, multiplication, and return operations. After returning from `func_0`, it attempts to call `func_1` but the instruction sequence is malformed, leading to undefined behavior.

; mixed program
; initialization
  LDI r11, 0x454DD5
  LDI r7, 0x21BE51
  CALL func_0
func_0:
  SHR r5, r2, r3
  SHR r1, r9, r5
  ADD r3, r8, r14
  MOD r10, r8, r15
  SHR r13, r12, r7
  MUL r12, r11, r28
  RET
  CALL func_1
func_1:
  SHR r5, r10, r6
  SHR r10, r0, r12
  RET
  PUSH r22
  PUSH r2
  PUSH r0
  PUSH r2
  SUB r0, r15, r9
  OR r0, r6, r9
  SUB r2, r8, r12
  MUL r1, r23, r4
  SHR r15, r8, r5
  POP r2
  POP r0
  POP r2
  POP r22
  HALT
