; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs conditional logic based on the comparison of `r13` and `r6`. If they are equal, it executes a series of bitwise operations; otherwise, it sets up parameters for a rectangle drawing function and halts execution.

; conditional logic
; initialization
  LDI r1, 2925
  LDI r4, 0x753843
  LDI r6, 0xBD96A4
  CMP r13, r6
  JNZ r13, else_0
  AND r7, r10, r13
  MOD r14, r15, r4
  XOR r4, r1, r11
  AND r7, r6, r1
  JMP endif_1
else_0:
  LDI r13, 148
  LDI r31, 0x23BE18
  LDI r11, 128
  LDI r14, 32
  LDI r10, 86
  RECTF r13, r31, r11, r14, r10
endif_1:
  HALT
