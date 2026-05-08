; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and then sequentially calls three functions (`func_0`, `func_1`, `func_2`). Each function performs arithmetic operations such as addition, subtraction, multiplication, division, modulo, bitwise AND/OR, left/right shift, updating register values, and finally returns. The program halts after executing the last function.

; subroutine calls
; initialization
  LDI r12, 0x74BD9F
  LDI r11, 3322
  LDI r4, 959
  LDI r10, 1940
  CALL func_0
func_0:
  ADD r9, r2, r3
  DIV r2, r6, r8
  DIV r15, r8, r4
  RET
  CALL func_1
func_1:
  MOD r2, r6, r4
  MUL r12, r9, r6
  ADD r13, r3, r10
  OR r3, r6, r11
  SHL r4, r6, r7
  SUB r15, r11, r10
  RET
  CALL func_2
func_2:
  AND r13, r14, r11
  SUB r12, r6, r3
  SUB r7, r8, r9
  SHR r3, r15, r8
  RET
  HALT
