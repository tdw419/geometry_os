; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and performs conditional logic based on the comparison of register contents. If `r12` is equal to `r7`, it executes a series of operations including setting pixels, drawing a circle, and filling an area; otherwise, it shifts bits left in `r8` by the value in `r7`. The code concludes with another conditional check involving `r2` and `r15`, performing multiplication if true or filling an area if false, before halting execution.

; conditional logic
; initialization
  LDI r14, 0x4A8B4F
  LDI r7, 10
  LDI r9, 0xAE2492
  CMP r12, r7
  JZ r12, else_0
  SHL r8, r1, r7
  JMP endif_1
else_0:
  LDI r2, 0x7C4B28
  LDI r11, 0xF127CC
  LDI r2, 128
  WPIXEL
  LDI r11, 2
  LDI r2, 13
  LDI r8, 10
  PSETI
  LDI r10, 0x16896F
  LDI r2, 256
  LDI r8, 0x0AF04F
  LDI r11, 0xBF31F2
  CIRCLE r10, r2, r8, r11
endif_1:
  CMP r2, r15
  JZ r2, else_2
  MUL r9, r7, r13
  JMP endif_3
else_2:
  LDI r11, 0xE6A7B6
  FILL r11
  LDI r8, 16
  LDI r11, 1534
  LDI r19, 10
  PSET r8, r11, r19
endif_3:
  HALT
