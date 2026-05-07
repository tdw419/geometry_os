; DESCRIPTION: This GeOS assembly code initializes registers with specific values and then sequentially calls three functions (`func_0`, `func_1`, `func_2`) each performing a series of arithmetic and bitwise operations on the registers. Finally, it halts execution.

; subroutine calls
; initialization
  LDI r8, 0x5545AE
  LDI r4, 3674
  CALL func_0
func_0:
  OR r12, r14, r7
  DIV r9, r2, r16
  SUB r13, r1, r2
  MOD r5, r1, r11
  RET
  CALL func_1
func_1:
  MOD r3, r2, r14
  MUL r12, r1, r13
  OR r15, r10, r2
  RET
  CALL func_2
func_2:
  MOD r13, r5, r7
  SHR r14, r7, r9
  ADD r9, r5, r3
  XOR r15, r5, r8
  RET
  HALT
