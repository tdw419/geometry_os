; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and sequentially calls four functions (`func_0`, `func_1`, `func_2`, `func_3`), performing a series of arithmetic operations including XOR, OR, SHR, SUB, AND, DIV, MUL, SHL, MOD, and ADD. The operations manipulate the register values for various calculations before halting execution.

; subroutine calls
; initialization
  LDI r9, 8
  LDI r6, 32
  LDI r10, 256
  LDI r3, 0
  LDI r4, 32
  CALL func_0
func_0:
  XOR r13, r4, r15
  OR r8, r5, r9
  SHR r6, r1, r15
  SUB r11, r12, r10
  RET
  CALL func_1
func_1:
  SUB r8, r5, r4
  AND r13, r6, r8
  XOR r4, r3, r21
  ADD r8, r14, r7
  XOR r12, r11, r15
  OR r14, r6, r12
  RET
  CALL func_2
func_2:
  OR r1, r7, r4
  DIV r14, r5, r3
  DIV r0, r9, r7
  MUL r19, r0, r13
  ADD r14, r11, r2
  RET
  CALL func_3
func_3:
  SHL r11, r12, r3
  DIV r10, r14, r4
  MOD r6, r10, r14
  ADD r8, r0, r4
  AND r5, r1, r7
  RET
  HALT
