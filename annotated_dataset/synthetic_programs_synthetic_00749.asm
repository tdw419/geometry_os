; DESCRIPTION: This GeOS assembly code performs conditional logic checks. If the value in register `r0` equals 255, it executes an XOR operation between registers `r5`, `r8`, and `r7`. Otherwise, it initializes several registers with specific values, draws a rectangle using the `RECTF` instruction, draws a line with `LINE`, sets a pixel with `PSETI`, and fills an area with color specified in register `r3`. The program then halts execution.

; conditional logic
; initialization
  LDI r13, 0xC06F80
  LDI r15, 255
  LDI r11, 0x9FB97E
  LDI r14, 1001
  CMP r0, r15
  JNZ r0, else_0
  XOR r5, r8, r7
  JMP endif_1
else_0:
  LDI r1, 1163
  LDI r1, 0xCF0ACE
  LDI r15, 128
  LDI r13, 0xD4983F
  LDI r1, 0x773828
  RECTF r1, r1, r15, r13, r1
  LDI r6, 3493
  LDI r12, 3815
  LDI r9, 2117
  LDI r9, 1241
  LDI r7, 1
  LINE r6, r12, r9, r9, r7
  LDI r4, 64
  LDI r8, 3605
  LDI r6, 8
  PSETI
  LDI r3, 0x3D87AD
  FILL r3
endif_1:
  HALT
