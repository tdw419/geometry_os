; DESCRIPTION: This GeOS assembly code defines a sequence of subroutines (`func_0`, `func_1`, `func_2`) that perform bitwise operations (AND, XOR), arithmetic operations (ADD, SUB, MUL, DIV, MOD), and shifts. The main function initializes registers, calls these subroutines in order, and halts execution.

; subroutine calls
; initialization
  LDI r9, 2
  LDI r3, 3464
  CALL func_0
func_0:
  AND r0, r12, r6
  XOR r6, r7, r12
  SUB r9, r4, r1
  ADD r14, r8, r5
  MUL r14, r1, r9
  RET
  CALL func_1
func_1:
  AND r14, r7, r29
  SHL r13, r12, r11
  MOD r4, r6, r10
  SUB r19, r29, r3
  ADD r14, r5, r9
  DIV r9, r18, r13
  RET
  CALL func_2
func_2:
  MUL r5, r4, r15
  XOR r14, r15, r24
  AND r0, r5, r1
  MOD r9, r8, r13
  RET
  HALT
