; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and performs conditional logic based on register comparisons. It includes operations like addition, multiplication, bitwise OR, XOR, and shifts, as well as drawing commands such as `WPIXEL`, `FILL`, and `CIRCLE`. The code halts execution after completing the conditional operations.

; conditional logic
; initialization
  LDI r15, 2161
  LDI r5, 0x156763
  LDI r8, 0x31F385
  LDI r13, 0xED0E6F
  LDI r12, 128
  LDI r10, 1099
  LDI r14, 3734
  CMP r8, r31
  JNZ r8, else_0
  ADD r4, r12, r3
  SHR r15, r6, r7
  MUL r5, r2, r10
  JMP endif_1
else_0:
  LDI r3, 0x57A272
  LDI r14, 128
  LDI r9, 3911
  WPIXEL
  LDI r1, 3695
  FILL r1
  LDI r15, 1983
  LDI r12, 255
  LDI r11, 0x49892C
  LDI r2, 3624
  CIRCLE r15, r12, r11, r2
endif_1:
  CMP r7, r12
  JNZ r7, else_2
  OR r11, r5, r16
  SHR r9, r5, r1
  OR r3, r29, r0
  XOR r9, r12, r7
  JMP endif_3
else_2:
  LDI r9, 2
  LDI r0, 2068
  LDI r15, 0x047BB5
  LDI r9, 3133
  LDI r5, 0x7E98F1
  RECTF r9, r0, r15, r9, r5
  LDI r7, 0x7E1B8F
  LDI r6, 0xC48850
  LDI r4, 0x3F6CF6
  WPIXEL
endif_3:
  CMP r5, r1
  JNZ r5, else_4
  OR r12, r6, r3
  DIV r22, r9, r4
  JMP endif_5
else_4:
  LDI r10, 718
  FILL r10
  LDI r5, 723
  FILL r5
endif_5:
  HALT
