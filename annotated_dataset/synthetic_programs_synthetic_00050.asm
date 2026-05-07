; DESCRIPTION: The code initializes several registers with specific values, performs a series of bitwise operations and arithmetic calculations in `func_0` and `func_1`, and includes a loop that divides a register value until it reaches zero. The program halts if a specific key is matched; otherwise, it continues execution.

; mixed program
; initialization
  LDI r5, 1251
  LDI r3, 4032
  LDI r6, 0xFEEC9F
  LDI r8, 144
  LDI r17, 975
  SHLI r5, r9, 16
  SHR r12, r3, r15
  SHLI r5, r12, 0xC16EB3
  CALL func_0
func_0:
  MOD r0, r4, r11
  XOR r10, r13, r11
  SHR r7, r9, r2
  MOD r5, r10, r13
  RET
  CALL func_1
func_1:
  SHR r15, r10, r12
  SHL r15, r6, r10
  MUL r11, r22, r2
  OR r8, r12, r2
  XOR r10, r15, r11
  SUB r9, r10, r12
  RET
  LDI r14, 1
loop_2:
  DIV r14, r13, r1
  SHL r7, r9, r13
  LDI r2, 1
  SUB r14, r14, r2
  JNZ r14, loop_2
  IKEY r13
  CMPI r13, 0x92F782
  JNZ r13, key_3
  HALT
