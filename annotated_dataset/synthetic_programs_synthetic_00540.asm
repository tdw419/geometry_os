; DESCRIPTION: The GeOS assembly code initializes registers with various values and performs conditional logic based on comparisons. It includes operations like shifting, subtracting, dividing, and filling memory regions, as well as setting pixels and drawing rectangles on a display. The code ends with a halt instruction.

; conditional logic
; initialization
  LDI r13, 3006
  LDI r14, 10
  LDI r0, 4
  LDI r1, 0x446F54
  LDI r15, 255
  LDI r12, 0x8F0095
  LDI r7, 306
  CMP r4, r9
  JNZ r4, else_0
  SHL r5, r2, r12
  SUB r5, r15, r3
  DIV r15, r4, r7
  JMP endif_1
else_0:
  LDI r12, 2239
  FILL r12
  LDI r15, 712
  LDI r6, 16
  LDI r8, 3797
  WPIXEL
  LDI r9, 0xBA09AE
  LDI r6, 4007
  LDI r8, 8
  LDI r1, 2
  LDI r0, 1726
  RECTF r9, r6, r8, r1, r0
  LDI r9, 32
  LDI r11, 0x5BFBB5
  LDI r12, 2809
  PSETI
endif_1:
  CMP r5, r15
  JZ r5, else_2
  MOD r4, r5, r14
  ADD r2, r13, r5
  DIV r6, r14, r8
  JMP endif_3
else_2:
  LDI r5, 0xD7488D
  LDI r0, 3432
  LDI r14, 8
  PSET r5, r0, r14
  LDI r0, 32
  LDI r11, 1922
  LDI r2, 0xA1F10D
  PSETI
  LDI r13, 22
  FILL r13
endif_3:
  CMP r4, r2
  JNZ r4, else_4
  SHR r11, r8, r24
  SHR r15, r10, r11
  JMP endif_5
else_4:
  LDI r8, 0x417FFE
  LDI r4, 2985
  LDI r2, 0x9CD718
  PSET r8, r4, r2
  LDI r8, 3061
  LDI r0, 10
  LDI r5, 1234
  WPIXEL
  LDI r0, 3450
  LDI r15, 2370
  LDI r0, 16
  WPIXEL
  LDI r14, 4
  LDI r5, 0xE89104
  LDI r2, 0xE4C582
  PSETI
endif_5:
  HALT
