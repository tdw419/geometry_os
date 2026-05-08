; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs conditional logic based on the comparison of register `r5` with zero. If `r5` is zero, it executes a series of operations including loading new values into registers and drawing rectangles using the `RECTF` instruction. If `r5` is not zero, it checks if `r1` equals `r13`; if they are equal, it performs division; otherwise, it draws two more rectangles. The code ends with a halt instruction.

; conditional logic
; initialization
  LDI r11, 307
  LDI r2, 0xEA83E5
  LDI r9, 734
  LDI r13, 2
  LDI r8, 0xCCBB4E
  LDI r3, 0x829FF6
  CMP r5, r0
  JZ r5, else_0
  MOD r11, r7, r8
  AND r13, r12, r5
  JMP endif_1
else_0:
  LDI r5, 1681
  LDI r1, 2083
  LDI r4, 1461
  LDI r13, 0xEFD2AE
  LDI r15, 256
  RECTF r5, r1, r4, r13, r15
endif_1:
  CMP r1, r13
  JNZ r1, else_2
  DIV r3, r14, r9
  JMP endif_3
else_2:
  LDI r0, 0xA89083
  LDI r4, 595
  LDI r0, 2
  LDI r3, 385
  LDI r20, 2990
  RECTF r0, r4, r0, r3, r20
  LDI r17, 333
  LDI r14, 0x2025D9
  LDI r9, 1928
  LDI r8, 559
  LDI r7, 2173
  RECTF r17, r14, r9, r8, r7
endif_3:
  HALT
