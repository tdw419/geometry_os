; DESCRIPTION: This GeOS assembly code performs a series of conditional logic operations, initializing registers with specific values, and executing different sets of instructions based on the comparison results. It includes bitwise operations like AND, OR, shifts, and division, as well as drawing primitives such as pixels and lines on a graphical display.

; conditional logic
; initialization
  LDI r7, 2
  LDI r13, 2
  LDI r14, 0x1740FE
  LDI r3, 0xB3CBC4
  LDI r4, 1910
  CMP r3, r5
  JNZ r3, else_0
  SHL r9, r13, r4
  DIV r8, r3, r13
  AND r14, r13, r11
  JMP endif_1
else_0:
  LDI r13, 0x2ABDFC
  FILL r13
endif_1:
  CMP r5, r9
  JZ r5, else_2
  OR r3, r11, r2
  JMP endif_3
else_2:
  LDI r21, 701
  LDI r8, 256
  LDI r3, 256
  WPIXEL
  LDI r15, 0x73D75B
  LDI r5, 0x7D9CCB
  LDI r14, 2711
  LDI r6, 0x25874B
  LDI r0, 1
  LINE r15, r5, r14, r6, r0
  LDI r11, 4
  FILL r11
  LDI r0, 739
  FILL r0
endif_3:
  CMP r7, r8
  JZ r7, else_4
  DIV r14, r12, r27
  JMP endif_5
else_4:
  LDI r12, 3705
  LDI r4, 0
  LDI r11, 1
  PSETI
endif_5:
  HALT
