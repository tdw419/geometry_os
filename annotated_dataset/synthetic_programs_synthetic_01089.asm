; DESCRIPTION: This GeOS assembly code initializes registers and performs conditional logic to execute different geometric operations such as XOR, division, multiplication, drawing circles, filling regions, and setting pixels. It concludes by comparing values and halting the system.

; conditional logic
; initialization
  LDI r13, 0
  LDI r9, 255
  LDI r12, 0xF11B0C
  LDI r0, 0x5221A1
  CMP r26, r13
  JNZ r26, else_0
  XOR r1, r11, r4
  DIV r11, r19, r10
  MUL r2, r6, r1
  JMP endif_1
else_0:
  LDI r2, 64
  LDI r11, 0x464EFA
  LDI r6, 3300
  LDI r12, 2634
  CIRCLE r2, r11, r6, r12
  LDI r12, 8
  LDI r8, 3285
  LDI r8, 4
  LDI r11, 0x928C05
  CIRCLE r12, r8, r8, r11
  LDI r8, 0xEC0875
  FILL r8
endif_1:
  CMP r1, r2
  JNZ r1, else_2
  DIV r15, r10, r5
  SHR r11, r0, r8
  JMP endif_3
else_2:
  LDI r2, 0xCE3028
  LDI r6, 256
  LDI r6, 0xEAB741
  PSET r2, r6, r6
  LDI r12, 128
  LDI r13, 1877
  LDI r2, 8
  LDI r1, 3289
  LDI r10, 3050
  RECTF r12, r13, r2, r1, r10
endif_3:
  HALT
