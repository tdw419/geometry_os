; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, performs a series of logical and arithmetic operations including XOR, CMP, SHR, DIV, OR, and SHL, conditionally executes drawing commands like PSET and LINE for geometric shapes, and includes a loop that waits for keyboard input to execute conditional halts based on key presses.

; mixed program
; initialization
  LDI r2, 2726
  LDI r10, 64
  LDI r3, 0x36264D
  LDI r11, 128
  LDI r14, 1195
  LDI r28, 0x810D90
  LDI r12, 1612
  LDI r13, 3211
  XOR r3, r8, r7
  CMP r15, r12
  JZ r15, else_0
  SHR r5, r3, r15
  DIV r10, r7, r3
  SHR r8, r6, r11
  OR r9, r2, r1
  JMP endif_1
else_0:
  LDI r13, 2
  LDI r4, 1
  LDI r5, 32
  PSET r13, r4, r5
  LDI r14, 719
  LDI r0, 0xB4A90A
  LDI r11, 0x934A19
  LDI r0, 0x6A2C13
  LDI r1, 2209
  LINE r14, r0, r11, r0, r1
  LDI r14, 10
  LDI r2, 64
  LDI r5, 3798
  LDI r12, 0xBACC44
  CIRCLE r14, r2, r5, r12
endif_1:
  SHL r15, r5, r8
  SHL r6, r2, r1
  IKEY r10
  CMPI r10, 16
  JNZ r10, key_2
  LDI r8, 8
loop_3:
  CMPI r9, r11, 0x3B0C53
  LDI r30, 1
  SUB r8, r8, r30
  JNZ r8, loop_3
  IKEY r10
  CMPI r10, 0xC95C47
  JNZ r10, key_4
  HALT
