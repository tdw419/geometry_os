; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs conditional logic based on the comparison of register values. It includes arithmetic operations like addition, division, multiplication, and modulus, as well as graphical operations such as filling pixels (`FILL`), setting pixels (`PSETI`, `PSET`), and drawing rectangles (`RECTF`). The code ends with a halt instruction.

; conditional logic
; initialization
  LDI r8, 2945
  LDI r11, 0xD32451
  LDI r1, 2753
  LDI r12, 255
  LDI r15, 0x4585FD
  LDI r3, 16
  CMP r1, r2
  JNZ r1, else_0
  ADD r1, r6, r2
  DIV r12, r11, r10
  MOD r1, r6, r23
  MOD r10, r9, r8
  JMP endif_1
else_0:
  LDI r0, 2087
  FILL r0
  LDI r13, 1
  LDI r8, 0x229ED3
  LDI r13, 563
  WPIXEL
  LDI r4, 2
  LDI r7, 0xE58615
  LDI r7, 1
  PSETI
endif_1:
  CMP r10, r28
  JZ r10, else_2
  MUL r28, r14, r15
  MOD r6, r1, r14
  MUL r11, r15, r8
  JMP endif_3
else_2:
  LDI r11, 2
  LDI r10, 0xDE319C
  LDI r15, 0x2F8331
  LDI r3, 0
  LDI r11, 0xAF0FAC
  RECTF r11, r10, r15, r3, r11
  LDI r12, 64
  LDI r2, 1219
  LDI r7, 704
  LDI r5, 2878
  LDI r7, 121
  RECTF r12, r2, r7, r5, r7
  LDI r1, 0x9C92AC
  LDI r15, 2912
  LDI r4, 255
  PSET r1, r15, r4
  LDI r15, 4
  LDI r15, 255
  LDI r0, 4
  WPIXEL
endif_3:
  HALT
