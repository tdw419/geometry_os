; DESCRIPTION: The GeOS assembly code initializes several registers and then calls three functions (`func_0`, `func_1`, `func_2`) in sequence. Each function performs a series of arithmetic operations including OR, MOD, DIV, MUL, XOR, SHR, and SHL on the registers, with the final result being computed and returned to the caller.

; subroutine calls
; initialization
  LDI r11, 4
  LDI r9, 1
  LDI r13, 2888
  LDI r10, 0xC937DA
  LDI r2, 8
  CALL func_0
func_0:
  OR r9, r2, r5
  MOD r3, r6, r8
  DIV r11, r13, r15
  RET
  CALL func_1
func_1:
  MUL r15, r2, r8
  XOR r22, r1, r3
  MOD r27, r14, r0
  XOR r5, r8, r0
  DIV r3, r15, r2
  RET
  CALL func_2
func_2:
  SHR r8, r7, r10
  SHR r5, r6, r15
  SHL r11, r15, r7
  SHL r13, r0, r8
  MUL r15, r13, r7
  RET
  HALT
