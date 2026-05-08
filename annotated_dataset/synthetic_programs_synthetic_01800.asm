; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and then calls three functions (`func_0`, `func_1`, `func_2`). Each function performs a series of arithmetic and bitwise operations using the input registers. Finally, it halts execution.

; subroutine calls
; initialization
  LDI r7, 4
  LDI r12, 64
  LDI r13, 3480
  LDI r1, 0
  LDI r4, 0x2DF77F
  LDI r10, 265
  CALL func_0
func_0:
  SHL r4, r30, r1
  MOD r14, r10, r2
  ADD r10, r8, r14
  XOR r2, r14, r3
  RET
  CALL func_1
func_1:
  SUB r9, r13, r5
  MUL r12, r3, r6
  SHL r14, r10, r2
  XOR r4, r5, r13
  RET
  CALL func_2
func_2:
  SHR r6, r12, r5
  DIV r15, r5, r9
  ADD r3, r15, r9
  RET
  HALT
