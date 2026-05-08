; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs conditional logic based on the comparison of `r15` and `r5`. If they are equal, it executes a series of circle drawing operations using the `CIRCLE` instruction; otherwise, it shifts bits, multiplies values, and writes pixels. The program halts after executing the conditional logic.

; conditional logic
; initialization
  LDI r11, 1068
  LDI r5, 274
  LDI r1, 2796
  LDI r9, 2818
  LDI r4, 0xC13CAE
  CMP r15, r5
  JZ r15, else_0
  SHR r9, r10, r6
  SHL r8, r7, r10
  MUL r8, r9, r3
  JMP endif_1
else_0:
  LDI r13, 10
  LDI r10, 0x42F201
  LDI r10, 2
  LDI r2, 3538
  CIRCLE r13, r10, r10, r2
  LDI r7, 0xCC0538
  LDI r12, 64
  LDI r12, 0x80CD16
  LDI r25, 2544
  CIRCLE r7, r12, r12, r25
  LDI r4, 0x7F0945
  LDI r13, 1920
  LDI r15, 2
  WPIXEL
  LDI r3, 0xDE3978
  LDI r0, 2621
  LDI r28, 10
  PSETI
endif_1:
  HALT
