; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, performs a series of bitwise and arithmetic operations including shifts, multiplications, and logical operations, calls two functions (`func_0` and `func_1`) that further manipulate the registers, and finally halts execution. The code involves complex interactions between registers for data transformation and processing.

; mixed program
; initialization
  LDI r6, 1496
  LDI r10, 3809
  LDI r2, 3639
  LDI r13, 32
  LDI r15, 3810
  LDI r0, 64
  LDI r1, 2
  LDI r12, 128
  SHL r2, r15, r0
  SHL r2, r9, r8
  SHR r0, r6, r11
  PUSH r6
  PUSH r10
  MUL r12, r2, r30
  OR r14, r3, r6
  MUL r15, r3, r28
  XOR r7, r11, r13
  POP r10
  POP r6
  CALL func_0
func_0:
  SHR r5, r0, r7
  XOR r2, r9, r5
  MOD r9, r11, r10
  RET
  CALL func_1
func_1:
  SUB r4, r10, r7
  OR r1, r12, r11
  MUL r1, r14, r5
  SHL r14, r9, r2
  RET
  HALT
