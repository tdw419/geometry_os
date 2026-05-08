; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs conditional logic checks using the `CMP` instruction. Depending on the comparison results, it executes different branches of code that may involve shifting bits (`SHL`), setting pixel points (`PSET`), drawing lines (`LINE`), or performing bitwise operations (`XOR`). The execution flow is controlled by jumps (`JMP`, `JZ`, `JNZ`) and ends with a halt instruction.

; conditional logic
; initialization
  LDI r8, 0xD15FFF
  LDI r11, 0
  LDI r2, 803
  LDI r5, 3642
  LDI r10, 3971
  LDI r0, 1817
  CMP r0, r2
  JNZ r0, else_0
  SHL r15, r2, r6
  JMP endif_1
else_0:
  LDI r4, 4
  LDI r3, 8
  LDI r7, 128
  PSET r4, r3, r7
  LDI r12, 0xD530F6
  LDI r17, 0x40C883
  LDI r0, 256
  LDI r2, 2452
  LDI r9, 32
  LINE r12, r17, r0, r2, r9
endif_1:
  CMP r2, r6
  JZ r2, else_2
  XOR r0, r13, r4
  SHL r3, r5, r14
  JMP endif_3
else_2:
  LDI r11, 8
  LDI r7, 4
  LDI r17, 0xCFD1A8
  WPIXEL
endif_3:
  CMP r13, r9
  JZ r13, else_4
  SUB r10, r2, r9
  JMP endif_5
else_4:
  LDI r14, 64
  FILL r14
  LDI r7, 2
  LDI r8, 0xBC30F8
  LDI r5, 1542
  LDI r11, 1528
  LDI r9, 0
  LINE r7, r8, r5, r11, r9
  LDI r1, 4
  FILL r1
  LDI r9, 3879
  LDI r1, 1828
  LDI r15, 0x003343
  WPIXEL
endif_5:
  HALT
