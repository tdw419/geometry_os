; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then calls a subroutine `func_0`. The subroutine performs arithmetic operations including multiplication, division, addition, and XOR, using the initialized register values. After executing these operations, it returns control to the caller and halts execution.

; subroutine calls
; initialization
  LDI r13, 974
  LDI r1, 1932
  LDI r4, 0
  LDI r5, 0xB2D7F3
  LDI r12, 121
  LDI r14, 3317
  LDI r2, 1427
  CALL func_0
func_0:
  MUL r12, r17, r8
  DIV r9, r0, r20
  ADD r1, r23, r13
  XOR r8, r9, r10
  XOR r2, r9, r14
  ADD r14, r5, r12
  RET
  HALT
