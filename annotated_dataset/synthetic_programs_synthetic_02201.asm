; DESCRIPTION: The GeOS assembly code initializes registers `r8` and `r9`, then sequentially calls four functions (`func_0`, `func_1`, `func_2`, `func_3`). Each function performs arithmetic operations such as addition, subtraction, multiplication, division, XOR, AND, and shift-right on various registers. After the final function call, the program halts execution.

; subroutine calls
; initialization
  LDI r8, 1797
  LDI r9, 128
  CALL func_0
func_0:
  DIV r10, r9, r29
  ADD r14, r11, r6
  XOR r6, r10, r13
  XOR r3, r15, r11
  ADD r5, r10, r2
  DIV r3, r9, r4
  RET
  CALL func_1
func_1:
  ADD r15, r9, r8
  XOR r6, r5, r14
  SUB r6, r12, r14
  ADD r5, r9, r1
  DIV r15, r11, r2
  RET
  CALL func_2
func_2:
  MUL r2, r10, r3
  XOR r4, r12, r10
  MUL r1, r3, r8
  DIV r6, r7, r14
  DIV r3, r13, r12
  RET
  CALL func_3
func_3:
  AND r6, r14, r13
  SHR r3, r0, r4
  MUL r4, r7, r1
  RET
  HALT
