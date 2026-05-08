; DESCRIPTION: This GeOS assembly code initializes registers with specific values and performs a series of arithmetic operations including subtraction, addition, multiplication, division, modulus, and bit manipulation. It also conditionally executes different sets of instructions based on comparisons, and includes function calls to `func_0` and `func_3`, which perform additional computations and register manipulations. The code ends with a halt instruction.

; mixed program
; initialization
  LDI r11, 0xBC237C
  LDI r3, 255
  CALL func_0
func_0:
  SUB r24, r5, r2
  SUB r27, r0, r12
  OR r3, r1, r14
  RET
  LDI r11, 3014
  LDI r21, 0x6ADFA3
  LDI r10, 2812
  PSET r11, r21, r10
  CMP r6, r14
  JNZ r6, else_1
  MOD r4, r8, r5
  DIV r10, r14, r3
  SHR r7, r29, r13
  AND r13, r10, r4
  JMP endif_2
else_1:
  LDI r3, 3363
  LDI r11, 128
  LDI r12, 3547
  PSETI
  LDI r7, 10
  LDI r5, 2478
  LDI r10, 64
  PSET r7, r5, r10
  LDI r4, 1842
  FILL r4
endif_2:
  CMPI r6, 0xCCCF6E
  CMPI r7, 166
  CALL func_3
func_3:
  MOD r3, r10, r7
  MUL r13, r15, r3
  AND r1, r3, r15
  DIV r8, r5, r9
  SUB r13, r12, r3
  RET
  PUSH r15
  PUSH r13
  PUSH r5
  PUSH r11
  AND r5, r12, r7
  SHR r30, r6, r13
  ADD r7, r3, r12
  POP r11
  POP r5
  POP r13
  POP r15
  SHL r11, r5, r13
  SHLI r15, r14, 5
  HALT
