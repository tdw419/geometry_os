; DESCRIPTION: The GeOS assembly code initializes registers with specific values and calls a function `func_0`. Within `func_0`, it performs various arithmetic operations including modulus, subtraction, addition, shifting, and drawing text at a specified location. The program then halts.

; mixed program
; initialization
  LDI r7, 0x626E4F
  LDI r0, 10
  CALL func_0
func_0:
  MOD r13, r15, r5
  SUB r13, r9, r6
  SHL r5, r15, r0
  ADD r12, r9, r22
  ADD r30, r21, r16
  SUB r15, r14, r3
  RET
  LDI r5, 2158
  LDI r7, 1780
  LDI r5, 0x86DEE8
  DRAWTEXT r5, r7, r5, "WORLD"
  SHLI r14, r13, 0
  SHLI r15, r3, 64
  SHL r2, r7, r23
  SHLI r13, r3, 4
  PUSH r2
  PUSH r13
  PUSH r6
  PUSH r1
  OR r3, r14, r5
  MUL r2, r0, r27
  XOR r6, r0, r5
  POP r1
  POP r6
  POP r13
  POP r2
  PUSH r2
  PUSH r11
  PUSH r15
  DIV r2, r12, r11
  SHL r3, r6, r12
  SHL r1, r11, r5
  POP r15
  POP r11
  POP r2
  HALT
