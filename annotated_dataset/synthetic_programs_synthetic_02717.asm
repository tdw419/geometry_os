; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and sequentially calls four functions (`func_0`, `func_1`, `func_2`, `func_3`), each performing bitwise operations such as AND, OR, XOR, shifts (SHL, SHR), subtraction, and division. The final operation is a HALT command, which stops the execution of the program.

; subroutine calls
; initialization
  LDI r11, 255
  LDI r7, 750
  LDI r10, 1607
  LDI r3, 2888
  LDI r21, 2521
  CALL func_0
func_0:
  AND r11, r3, r4
  SHR r13, r8, r7
  SUB r22, r4, r19
  SHL r3, r1, r7
  RET
  CALL func_1
func_1:
  SUB r3, r2, r11
  OR r15, r14, r0
  SUB r21, r15, r9
  DIV r10, r15, r13
  RET
  CALL func_2
func_2:
  SHR r4, r3, r5
  XOR r8, r2, r6
  RET
  CALL func_3
func_3:
  OR r0, r13, r4
  SHL r1, r7, r4
  OR r15, r11, r9
  RET
  HALT
