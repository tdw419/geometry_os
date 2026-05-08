; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then sequentially calls four functions (`func_0`, `func_1`, `func_2`, `func_3`). Each function performs a series of arithmetic operations including multiplication, division, subtraction, modulo, addition, shifting, and bitwise OR. The code halts execution after the final function call.

; subroutine calls
; initialization
  LDI r4, 1620
  LDI r31, 0x34EB2F
  LDI r11, 0xB44FCF
  LDI r12, 1127
  LDI r2, 0x41B2C5
  LDI r9, 1574
  LDI r14, 10
  CALL func_0
func_0:
  MUL r14, r9, r2
  DIV r3, r15, r4
  SHL r14, r5, r12
  SUB r4, r10, r12
  MOD r12, r13, r3
  MUL r0, r3, r9
  RET
  CALL func_1
func_1:
  SUB r5, r9, r7
  OR r0, r15, r14
  RET
  CALL func_2
func_2:
  SHL r1, r5, r4
  SHL r6, r12, r25
  OR r3, r0, r9
  MOD r0, r9, r6
  RET
  CALL func_3
func_3:
  ADD r6, r12, r1
  DIV r8, r10, r9
  SHL r11, r0, r30
  RET
  HALT
