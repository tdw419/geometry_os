; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and then sequentially calls four functions (`func_0`, `func_1`, `func_2`, `func_3`) that perform arithmetic operations such as addition, subtraction, multiplication, bitwise XOR, AND, shift operations, and modulo calculations on the registers. The program halts after executing all function calls.

; subroutine calls
; initialization
  LDI r15, 64
  LDI r8, 0x84D0F3
  LDI r2, 773
  LDI r11, 1290
  LDI r10, 3800
  LDI r3, 0x379810
  LDI r7, 2319
  CALL func_0
func_0:
  SUB r6, r13, r14
  SHL r13, r7, r2
  MOD r5, r2, r23
  RET
  CALL func_1
func_1:
  XOR r12, r10, r7
  ADD r8, r13, r2
  RET
  CALL func_2
func_2:
  XOR r4, r10, r6
  SUB r11, r4, r8
  SHR r13, r27, r10
  MOD r2, r6, r3
  MOD r14, r10, r9
  RET
  CALL func_3
func_3:
  ADD r5, r3, r7
  AND r11, r5, r3
  MUL r15, r3, r0
  RET
  HALT
