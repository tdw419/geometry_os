; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and performs conditional logic based on the comparison between `r4` and `r5`. If they are equal, it jumps to `else_0`, where it draws a rectangle using the RECTF instruction. Otherwise, it shifts bits in registers and performs division, multiplication, and other arithmetic operations. The code concludes with further conditional checks and potentially drawing a circle before halting execution.

; conditional logic
; initialization
  LDI r15, 0xD943AD
  LDI r5, 16
  LDI r3, 1
  LDI r2, 0
  LDI r12, 0xDBBA43
  LDI r13, 64
  LDI r4, 1604
  LDI r7, 3338
  CMP r4, r5
  JZ r4, else_0
  SHL r4, r12, r1
  SHL r15, r1, r14
  DIV r1, r12, r3
  MUL r5, r1, r14
  JMP endif_1
else_0:
  LDI r30, 0x15BB03
  LDI r5, 0xBB19BC
  LDI r11, 0xFCEF2F
  LDI r0, 372
  LDI r15, 32
  RECTF r30, r5, r11, r0, r15
  LDI r2, 0x4654D0
  LDI r11, 333
  LDI r6, 8
  WPIXEL
  LDI r1, 0xEBCEFC
  FILL r1
endif_1:
  CMP r9, r15
  JNZ r9, else_2
  XOR r15, r3, r12
  SHL r5, r14, r11
  JMP endif_3
else_2:
  LDI r13, 0xD6F4FA
  LDI r2, 0x97ECC5
  LDI r15, 0x5FF6CB
  LDI r2, 256
  CIRCLE r13, r2, r15, r2
endif_3:
  HALT
