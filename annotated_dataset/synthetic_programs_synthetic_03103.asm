; DESCRIPTION: This GeOS assembly code initializes registers with specific values, then sequentially calls three functions (`func_0`, `func_1`, and `func_2`) to perform arithmetic operations including division, addition, multiplication, bitwise OR, shift, subtraction, and XOR. After the third function returns, the system halts execution.

; subroutine calls
; initialization
  LDI r15, 32
  LDI r2, 0x518BDC
  LDI r4, 0xF1E942
  LDI r1, 16
  CALL func_0
func_0:
  DIV r14, r11, r12
  ADD r5, r10, r12
  MUL r6, r9, r10
  DIV r2, r8, r15
  SHR r0, r2, r15
  RET
  CALL func_1
func_1:
  OR r4, r0, r10
  SHL r5, r15, r1
  SUB r12, r9, r14
  MUL r9, r4, r8
  XOR r0, r11, r14
  RET
  CALL func_2
func_2:
  SHR r27, r11, r0
  SUB r1, r12, r11
  ADD r4, r9, r2
  OR r1, r13, r9
  ADD r24, r1, r6
  RET
  HALT
