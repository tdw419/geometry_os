; DESCRIPTION: This GeOS assembly code initializes registers and calls two subroutines (`func_0` and `func_1`). The first subroutine performs arithmetic operations including subtraction and right shift, while the second subroutine executes division, left shift, multiplication, addition, and another right shift. The program halts after executing these operations.

; subroutine calls
; initialization
  LDI r1, 10
  LDI r9, 0x3A1225
  CALL func_0
func_0:
  SUB r15, r8, r14
  SHR r13, r4, r2
  RET
  CALL func_1
func_1:
  DIV r7, r15, r3
  SHL r7, r11, r0
  MUL r9, r12, r6
  ADD r13, r8, r5
  SHR r5, r13, r0
  RET
  HALT
