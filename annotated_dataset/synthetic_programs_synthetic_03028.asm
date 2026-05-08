; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then calls a series of subroutines (`func_0`, `func_1`, `func_2`, `func_3`) that perform arithmetic operations including division, addition, multiplication, modulo, shift right, XOR, and subtraction. The final operation is a HALT instruction.

; subroutine calls
; initialization
  LDI r3, 8
  LDI r5, 256
  LDI r8, 2237
  LDI r7, 0xF5B581
  LDI r9, 64
  LDI r27, 0xFD425E
  LDI r10, 4
  LDI r15, 0x4E0D3F
  CALL func_0
func_0:
  DIV r0, r7, r2
  ADD r2, r16, r11
  MUL r1, r8, r9
  RET
  CALL func_1
func_1:
  ADD r11, r7, r2
  MOD r2, r5, r3
  RET
  CALL func_2
func_2:
  SHR r15, r8, r16
  SUB r12, r9, r7
  MOD r3, r8, r10
  MUL r0, r12, r6
  RET
  CALL func_3
func_3:
  SHR r14, r2, r8
  MOD r10, r3, r5
  XOR r1, r12, r8
  SUB r5, r6, r1
  DIV r12, r15, r2
  MOD r0, r15, r8
  RET
  HALT
