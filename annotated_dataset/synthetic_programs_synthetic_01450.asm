; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then sequentially calls three functions (`func_0`, `func_1`, `func_2`). Each function performs a series of bitwise operations (shifts, OR, XOR), arithmetic operations (division, multiplication, modulus), and returns control to the caller. The final instruction is a HALT command that stops the program execution.

; subroutine calls
; initialization
  LDI r13, 8
  LDI r3, 2983
  LDI r14, 32
  LDI r8, 0xF46AAE
  LDI r6, 0x2CECBA
  LDI r12, 0x304400
  LDI r10, 0xDB7ED7
  CALL func_0
func_0:
  SHL r2, r6, r11
  SHR r10, r7, r21
  OR r5, r1, r9
  SHL r0, r12, r9
  DIV r2, r0, r6
  XOR r3, r2, r11
  RET
  CALL func_1
func_1:
  DIV r20, r6, r2
  MOD r9, r7, r15
  SHR r9, r6, r15
  RET
  CALL func_2
func_2:
  MUL r15, r12, r2
  SHR r2, r11, r0
  MOD r9, r3, r0
  XOR r9, r12, r10
  SUB r8, r5, r12
  RET
  HALT
