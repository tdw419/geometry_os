; DESCRIPTION: This GeOS assembly code initializes various registers with specific values and performs conditional operations based on comparisons. It includes arithmetic operations such as addition, multiplication, and subtraction, as well as logical shifts. The code also contains drawing commands for a circle and line, and it halts execution at the end.

; conditional logic
; initialization
  LDI r0, 0x034936
  LDI r2, 0x25B874
  LDI r8, 606
  LDI r12, 570
  LDI r15, 3513
  LDI r3, 172
  LDI r7, 792
  CMP r5, r8
  JZ r5, else_0
  MOD r0, r11, r14
  ADD r12, r3, r4
  MUL r15, r0, r8
  JMP endif_1
else_0:
  LDI r4, 16
  LDI r10, 256
  LDI r4, 0x908076
  PSETI
endif_1:
  CMP r15, r13
  JNZ r15, else_2
  MOD r5, r9, r13
  SHR r15, r5, r17
  JMP endif_3
else_2:
  LDI r11, 0xE756FA
  LDI r9, 1610
  LDI r0, 587
  LDI r15, 0x58D56B
  CIRCLE r11, r9, r0, r15
  LDI r5, 64
  LDI r4, 0x526B98
  LDI r21, 0x1BC73C
  LDI r2, 0xC5BA0F
  LDI r9, 3703
  LINE r5, r4, r21, r2, r9
  LDI r14, 16
  LDI r9, 0xA1E74F
  LDI r11, 2
  PSETI
  LDI r7, 0xD7880B
  LDI r12, 64
  LDI r11, 2518
  PSETI
endif_3:
  CMP r11, r8
  JZ r11, else_4
  SUB r6, r12, r8
  SHR r20, r13, r2
  JMP endif_5
else_4:
  LDI r4, 4
  FILL r4
  LDI r6, 0x3D61D4
  LDI r15, 0xA90C16
  LDI r6, 2479
  LDI r13, 1136
  LDI r4, 32
  LINE r6, r15, r6, r13, r4
  LDI r1, 1559
  LDI r12, 0xBA9C58
  LDI r16, 255
  PSETI
endif_5:
  HALT
