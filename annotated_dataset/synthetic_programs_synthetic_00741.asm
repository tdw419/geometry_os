; DESCRIPTION: This GeOS assembly code initializes registers with specific values and sequentially calls four functions (func_0 through func_3), each performing arithmetic operations such as subtraction, addition, multiplication, division, modulus, shift operations, and logical operations. The code ultimately halts execution after the final function call.

; subroutine calls
; initialization
  LDI r1, 128
  LDI r18, 0x9A9E89
  LDI r0, 0x753567
  CALL func_0
func_0:
  SUB r8, r13, r2
  SHL r2, r7, r1
  MOD r8, r12, r2
  DIV r6, r2, r13
  SUB r0, r9, r10
  MOD r9, r8, r7
  RET
  CALL func_1
func_1:
  OR r5, r8, r13
  XOR r15, r14, r11
  SHL r10, r15, r8
  MUL r8, r0, r11
  XOR r9, r1, r11
  SHL r2, r3, r4
  RET
  CALL func_2
func_2:
  SUB r0, r3, r11
  MUL r15, r5, r11
  MOD r4, r8, r1
  RET
  CALL func_3
func_3:
  SHR r3, r5, r25
  ADD r15, r10, r12
  DIV r9, r10, r8
  RET
  HALT
