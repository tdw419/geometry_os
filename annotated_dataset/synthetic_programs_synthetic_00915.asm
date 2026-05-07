; DESCRIPTION: This GeOS assembly code initializes registers with specific values and performs a series of arithmetic and logical operations through subroutine calls. The `func_0` and `func_1` subroutines execute modular arithmetic, multiplication, shifting, bitwise operations, and addition, culminating in a halt instruction.

; subroutine calls
; initialization
  LDI r3, 0x328F42
  LDI r12, 0
  LDI r2, 0x4D37E2
  CALL func_0
func_0:
  MOD r5, r1, r15
  MUL r5, r8, r17
  SHR r3, r8, r12
  SHL r6, r1, r5
  OR r0, r13, r7
  RET
  CALL func_1
func_1:
  XOR r5, r15, r11
  OR r6, r1, r3
  XOR r9, r5, r11
  ADD r8, r13, r14
  SHR r15, r14, r5
  RET
  HALT
