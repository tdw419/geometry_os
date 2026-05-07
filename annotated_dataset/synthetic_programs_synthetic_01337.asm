; DESCRIPTION: This GeOS assembly code performs conditional logic based on comparisons between registers. If the condition is met (r15 == r12), it initializes specific register values and draws a circle using the `CIRCLE` instruction, followed by pixel operations. If the condition is not met, it calculates a logical OR and AND operation before drawing a line with the `LINE` instruction and setting a point with `PSETI`. The code concludes with a halt command.

; conditional logic
; initialization
  LDI r4, 0x2B8754
  LDI r8, 0xAC28D3
  LDI r5, 2558
  CMP r15, r12
  JZ r15, else_0
  ADD r9, r0, r13
  JMP endif_1
else_0:
  LDI r2, 0xF6F59F
  LDI r13, 158
  LDI r3, 2
  LDI r7, 0x5EC024
  CIRCLE r2, r13, r3, r7
  LDI r14, 4
  LDI r30, 128
  LDI r19, 8
  WPIXEL
  LDI r3, 32
  FILL r3
  LDI r13, 16
  LDI r24, 256
  LDI r15, 425
  WPIXEL
endif_1:
  CMP r1, r11
  JZ r1, else_2
  OR r0, r14, r6
  AND r1, r2, r11
  JMP endif_3
else_2:
  LDI r13, 0x73D875
  LDI r0, 0x211C50
  LDI r11, 256
  LDI r5, 0xF82D36
  LDI r18, 128
  LINE r13, r0, r11, r5, r18
  LDI r9, 8
  LDI r13, 0x2E46B9
  LDI r12, 32
  PSETI
endif_3:
  HALT
