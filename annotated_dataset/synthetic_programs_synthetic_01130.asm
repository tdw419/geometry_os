; DESCRIPTION: This GeOS assembly code initializes registers with specific values, performs a series of arithmetic operations including division, multiplication, addition, subtraction, and bitwise operations within two functions (`func_0` and `func_2`). It includes a loop that decrements a register until it reaches zero, calling `func_2` at the end. The program concludes by halting execution.

; mixed program
; initialization
  LDI r8, 1138
  LDI r14, 32
  CALL func_0
func_0:
  DIV r2, r11, r8
  MUL r13, r5, r11
  ADD r9, r1, r4
  SUB r3, r10, r8
  AND r3, r6, r20
  RET
  SAR r2, r12, r27
  SAR r3, r8, r7
  SHR r7, r14, r5
  LDI r8, 1
loop_1:
  ANDI r15, r0, 20
  LDI r12, 1
  SUB r8, r8, r12
  JNZ r8, loop_1
  CALL func_2
func_2:
  DIV r3, r14, r9
  SUB r2, r3, r7
  DIV r0, r27, r1
  MOD r19, r8, r13
  OR r14, r15, r13
  DIV r3, r0, r14
  RET
  HALT
