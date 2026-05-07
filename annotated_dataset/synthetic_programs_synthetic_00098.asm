; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs conditional logic based on a comparison between `r9` and `r5`. If they are equal, it executes an alternative path that draws two rectangles and a circle using the `RECTF` and `CIRCLE` instructions. Otherwise, it proceeds to perform a division operation. The program ends with a `HALT` instruction.

; conditional logic
; initialization
  LDI r7, 0x187920
  LDI r8, 64
  LDI r10, 1409
  LDI r2, 1864
  LDI r9, 0x2E4D2A
  LDI r5, 256
  LDI r11, 2644
  CMP r9, r5
  JZ r9, else_0
  DIV r12, r4, r11
  JMP endif_1
else_0:
  LDI r3, 2407
  LDI r2, 0
  LDI r4, 32
  LDI r7, 0x73A056
  LDI r6, 0x97F545
  RECTF r3, r2, r4, r7, r6
  LDI r31, 64
  LDI r22, 3273
  LDI r12, 2981
  LDI r8, 4
  LDI r11, 0x44DC3D
  RECTF r31, r22, r12, r8, r11
  LDI r7, 791
  LDI r31, 128
  LDI r11, 1834
  PSET r7, r31, r11
  LDI r1, 128
  LDI r5, 0xE59DA2
  LDI r1, 256
  LDI r11, 0x8D5BB7
  CIRCLE r1, r5, r1, r11
endif_1:
  HALT
