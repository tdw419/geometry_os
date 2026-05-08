; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs conditional operations based on the comparison of these registers. It includes arithmetic operations such as division, subtraction, and multiplication, bitwise operations like XOR and SHL, and drawing functions like PSET, WPIXEL, RECTF, LINE, CIRCLE, and FILL. The code ultimately halts execution after completing its operations.

; conditional logic
; initialization
  LDI r15, 0xDB724A
  LDI r14, 0xAE008C
  LDI r7, 1
  LDI r2, 8
  LDI r9, 0x9DA4FC
  LDI r11, 8
  LDI r1, 0x56B071
  LDI r0, 32
  CMP r7, r13
  JZ r7, else_0
  DIV r6, r4, r11
  XOR r14, r0, r1
  SUB r12, r9, r15
  SHL r9, r7, r10
  JMP endif_1
else_0:
  LDI r4, 404
  LDI r7, 0xCAB805
  LDI r5, 183
  PSET r4, r7, r5
  LDI r3, 4070
  LDI r9, 64
  LDI r11, 0x9B6281
  WPIXEL
  LDI r4, 3032
  LDI r13, 0x58991F
  LDI r11, 0x58B95E
  LDI r11, 255
  LDI r3, 0xEA4F66
  RECTF r4, r13, r11, r11, r3
  LDI r24, 16
  LDI r9, 4
  LDI r4, 0xC8E413
  LDI r10, 1607
  LDI r6, 3990
  LINE r24, r9, r4, r10, r6
endif_1:
  CMP r11, r13
  JZ r11, else_2
  SHL r9, r4, r7
  XOR r4, r12, r1
  JMP endif_3
else_2:
  LDI r3, 0x83FBC3
  FILL r3
  LDI r1, 64
  LDI r13, 0x2684BF
  LDI r1, 0xC0FFE0
  LDI r4, 3608
  LDI r8, 0xA49145
  RECTF r1, r13, r1, r4, r8
  LDI r10, 256
  FILL r10
endif_3:
  CMP r0, r15
  JZ r0, else_4
  SUB r10, r3, r8
  MUL r4, r10, r31
  JMP endif_5
else_4:
  LDI r7, 2668
  LDI r11, 10
  LDI r15, 0x1036B9
  LDI r20, 0xEF4730
  CIRCLE r7, r11, r15, r20
  LDI r9, 0
  LDI r12, 0x21C034
  LDI r31, 0x100327
  LDI r5, 2
  LDI r12, 256
  RECTF r9, r12, r31, r5, r12
endif_5:
  HALT
