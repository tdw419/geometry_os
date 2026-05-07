; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then sequentially calls four functions (`func_0`, `func_1`, `func_2`, `func_3`). Each function performs a series of arithmetic operations including modular division, multiplication, AND, OR, shift left, and shift right on the registers. The program halts after executing all subroutine calls.

; subroutine calls
; initialization
  LDI r8, 0xED5AAF
  LDI r1, 1669
  LDI r9, 0x8F0417
  LDI r0, 534
  CALL func_0
func_0:
  MOD r14, r8, r12
  MOD r7, r4, r12
  DIV r20, r11, r3
  MOD r9, r0, r3
  RET
  CALL func_1
func_1:
  MOD r7, r5, r0
  MUL r26, r13, r0
  AND r3, r13, r8
  RET
  CALL func_2
func_2:
  DIV r11, r15, r7
  SHL r10, r7, r15
  DIV r0, r3, r4
  DIV r1, r13, r2
  SUB r14, r7, r6
  SHL r8, r13, r14
  RET
  CALL func_3
func_3:
  SUB r7, r2, r8
  OR r0, r15, r6
  SHR r3, r7, r8
  RET
  HALT
