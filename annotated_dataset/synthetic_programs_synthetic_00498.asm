; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs conditional operations based on the comparison of register contents. If certain conditions are met, it executes arithmetic operations like addition, subtraction, and bitwise XOR, or draws geometric shapes using instructions like `RECTF`. The code ultimately halts execution.

; conditional logic
; initialization
  LDI r6, 0x391699
  LDI r11, 64
  LDI r0, 0x736E26
  LDI r15, 16
  CMP r13, r0
  JNZ r13, else_0
  MOD r14, r0, r13
  SHL r1, r9, r4
  JMP endif_1
else_0:
  LDI r13, 377
  FILL r13
  LDI r14, 3527
  LDI r30, 4
  LDI r9, 32
  LDI r12, 256
  LDI r12, 64
  RECTF r14, r30, r9, r12, r12
endif_1:
  CMP r13, r0
  JNZ r13, else_2
  XOR r13, r8, r11
  ADD r5, r2, r3
  SUB r11, r5, r4
  JMP endif_3
else_2:
  LDI r6, 64
  LDI r8, 128
  LDI r6, 440
  PSETI
  LDI r14, 1284
  LDI r12, 0x3764AD
  LDI r2, 0x116E8B
  LDI r14, 666
  LDI r2, 0x223DFB
  RECTF r14, r12, r2, r14, r2
  LDI r0, 1885
  FILL r0
  LDI r10, 0x78931C
  LDI r9, 1
  LDI r10, 255
  WPIXEL
endif_3:
  HALT
