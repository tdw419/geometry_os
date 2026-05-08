; DESCRIPTION: This GeOS assembly code initializes several registers and then calls a series of subroutines (`func_0`, `func_1`, `func_2`, and `func_3`) that perform arithmetic operations including addition, subtraction, multiplication, division, modulus, bitwise AND, OR, XOR, shift right (SHR), and return. The code halts after completing the subroutine calls.

; subroutine calls
; initialization
  LDI r5, 2554
  LDI r14, 2555
  LDI r11, 0
  CALL func_0
func_0:
  ADD r0, r27, r6
  MOD r14, r7, r6
  OR r0, r10, r1
  DIV r4, r15, r2
  RET
  CALL func_1
func_1:
  AND r6, r2, r7
  MUL r13, r11, r15
  SHR r5, r12, r9
  DIV r12, r11, r3
  SHR r0, r7, r21
  SUB r1, r13, r5
  RET
  CALL func_2
func_2:
  OR r2, r4, r15
  XOR r12, r6, r13
  SUB r11, r29, r5
  MUL r15, r2, r0
  SHR r15, r7, r2
  SHR r20, r4, r11
  RET
  CALL func_3
func_3:
  AND r20, r11, r10
  AND r7, r10, r28
  XOR r6, r14, r1
  RET
  HALT
