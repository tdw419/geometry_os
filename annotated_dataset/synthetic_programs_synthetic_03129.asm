; DESCRIPTION: The code initializes registers with specific values and performs conditional logic based on comparisons between register contents. It either shifts a register value or writes a pixel, then proceeds to another set of conditional operations involving XOR, multiplication, drawing a rectangle, setting a pixel, filling an area, and drawing a circle, before halting execution.

; conditional logic
; initialization
  LDI r15, 3285
  LDI r14, 1605
  CMP r9, r15
  JNZ r9, else_0
  SHR r11, r1, r2
  JMP endif_1
else_0:
  LDI r29, 0xE87D72
  LDI r2, 0x79635B
  LDI r12, 0x50AACC
  WPIXEL
endif_1:
  CMP r3, r5
  JZ r3, else_2
  XOR r8, r6, r0
  MUL r14, r6, r7
  JMP endif_3
else_2:
  LDI r0, 2857
  LDI r3, 3432
  LDI r3, 3930
  LDI r8, 0
  LDI r9, 0x0DB2A0
  RECTF r0, r3, r3, r8, r9
  LDI r14, 3948
  LDI r5, 0
  LDI r13, 942
  PSETI
  LDI r2, 255
  FILL r2
  LDI r2, 255
  LDI r10, 2823
  LDI r3, 1
  LDI r8, 1622
  CIRCLE r2, r10, r3, r8
endif_3:
  HALT
