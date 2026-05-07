; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, checks if register `r15` is equal to `r3`, and if not, it jumps to an alternate execution path that draws a circle using the `CIRCLE` command and then sets a pixel with the `PSET` command. If the condition is met, it calculates a difference between two registers (`r10 - r1`). The code ends with a halt instruction.

; conditional logic
; initialization
  LDI r6, 0
  LDI r2, 3463
  LDI r10, 0x3CE09D
  LDI r7, 0xB590B7
  LDI r15, 255
  LDI r14, 0xA8C3DF
  LDI r4, 0x6D9EAD
  LDI r0, 64
  CMP r15, r3
  JNZ r15, else_0
  SUB r11, r10, r1
  JMP endif_1
else_0:
  LDI r8, 0x475482
  LDI r11, 3445
  LDI r9, 1971
  LDI r14, 1
  CIRCLE r8, r11, r9, r14
  LDI r5, 4
  LDI r15, 0x8B3119
  LDI r2, 0x8B24A7
  PSET r5, r15, r2
endif_1:
  HALT
