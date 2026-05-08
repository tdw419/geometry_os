; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs conditional logic. If the value in register `r15` is zero, it sets register `r6` to 3377 and fills it; otherwise, it subtracts the values of `r7` from `r12` into `r1` and the value of `r13` from zero into `r6`. The program then halts.

; conditional logic
; initialization
  LDI r8, 1
  LDI r5, 0x47C5E7
  LDI r15, 1933
  LDI r7, 0xD489C2
  LDI r26, 0x33B52C
  LDI r2, 2291
  LDI r4, 0
  LDI r13, 0xF86AB6
  CMP r15, r0
  JZ r15, else_0
  SUB r1, r12, r7
  SUB r6, r0, r13
  JMP endif_1
else_0:
  LDI r6, 3377
  FILL r6
endif_1:
  HALT
