; DESCRIPTION: The GeOS assembly code initializes registers and performs a series of arithmetic operations including XOR, MOD, ADD, AND, and DIV within two subroutines, `func_0` and `func_1`. The code then halts execution.

; subroutine calls
; initialization
  LDI r7, 128
  LDI r1, 0xA82EDF
  CALL func_0
func_0:
  XOR r13, r0, r5
  MOD r8, r13, r1
  ADD r20, r17, r14
  RET
  CALL func_1
func_1:
  AND r5, r16, r13
  XOR r11, r1, r10
  ADD r11, r9, r8
  DIV r15, r2, r0
  MOD r14, r6, r11
  RET
  HALT
