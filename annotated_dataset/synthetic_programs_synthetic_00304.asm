; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs conditional logic based on comparisons. If a certain condition is met, it executes division and bit shifting operations; otherwise, it sets pixel values and draws rectangles. The code concludes by halting execution.

; conditional logic
; initialization
  LDI r12, 3459
  LDI r2, 1284
  LDI r3, 3738
  LDI r30, 0x3F22A6
  LDI r1, 256
  LDI r11, 64
  CMP r1, r8
  JNZ r1, else_0
  DIV r10, r14, r4
  SHR r3, r0, r13
  JMP endif_1
else_0:
  LDI r15, 255
  LDI r15, 256
  LDI r5, 2739
  PSET r15, r15, r5
  LDI r7, 256
  LDI r15, 0x291C81
  LDI r10, 806
  PSETI
  LDI r14, 0x27D8E4
  LDI r5, 32
  LDI r12, 128
  LDI r8, 0x38F0AC
  LDI r5, 319
  RECTF r14, r5, r12, r8, r5
  LDI r15, 64
  LDI r0, 8
  LDI r12, 0x06F060
  PSET r15, r0, r12
endif_1:
  CMP r10, r9
  JZ r10, else_2
  MUL r15, r10, r9
  MUL r13, r5, r1
  AND r13, r8, r0
  SUB r8, r5, r7
  JMP endif_3
else_2:
  LDI r6, 1662
  LDI r12, 0xB75FA2
  LDI r8, 3451
  PSETI
  LDI r13, 10
  LDI r15, 0x1A8648
  LDI r9, 0x288D2E
  LDI r5, 255
  LDI r12, 0x278018
  RECTF r13, r15, r9, r5, r12
  LDI r13, 297
  LDI r13, 0x12909D
  LDI r2, 0x367765
  LDI r11, 2646
  LDI r9, 0
  RECTF r13, r13, r2, r11, r9
  LDI r8, 256
  FILL r8
endif_3:
  HALT
