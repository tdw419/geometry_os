; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, performs arithmetic and logical operations, conditionally executes drawing functions like `WPIXEL`, `FILL`, and `CIRCLE` based on register comparisons, and finally checks for a key press to potentially draw a line. The program halts after executing the conditional logic.

; mixed program
; initialization
  LDI r14, 1
  LDI r10, 2787
  LDI r8, 0xEA3F7D
  LDI r11, 0x190141
  LDI r13, 0xA00C01
  LDI r4, 1192
  PUSH r2
  PUSH r12
  PUSH r7
  ADD r0, r13, r12
  AND r4, r10, r6
  POP r7
  POP r12
  POP r2
  CMP r4, r7
  JZ r4, else_0
  MUL r0, r10, r13
  SHR r4, r9, r2
  XOR r10, r14, r2
  JMP endif_1
else_0:
  LDI r9, 1527
  LDI r7, 4
  LDI r0, 0x265AA1
  WPIXEL
  LDI r13, 0xAA31D8
  FILL r13
  LDI r4, 128
  LDI r6, 0xA39CC9
  LDI r1, 3375
  WPIXEL
  LDI r0, 8
  LDI r11, 10
  LDI r11, 16
  LDI r14, 64
  CIRCLE r0, r11, r11, r14
endif_1:
  CMP r8, r11
  JZ r8, else_2
  AND r4, r5, r11
  JMP endif_3
else_2:
  LDI r14, 1909
  LDI r14, 10
  LDI r8, 128
  LDI r14, 120
  LDI r10, 1044
  RECTF r14, r14, r8, r14, r10
  LDI r22, 3690
  FILL r22
  LDI r15, 16
  LDI r3, 2201
  LDI r3, 3122
  LDI r26, 0x03FF96
  CIRCLE r15, r3, r3, r26
endif_3:
  XOR r11, r4, r6
  OR r7, r13, r15
  XOR r13, r3, r11
  IKEY r5
  CMPI r5, 3
  JNZ r5, key_4
  SHR r4, r25, r14
  SAR r8, r3, r10
  SHL r14, r7, r4
  LDI r1, 4
  LDI r6, 0x9C8E61
  LDI r13, 0x2C2D51
  LDI r5, 0xD7A6C8
  LDI r9, 0xE14AB5
  LINE r1, r6, r13, r5, r9
  HALT
