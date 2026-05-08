; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then performs three drawing operations: it draws a circle at coordinates (2426, 1406) with radius 104 and color 0x181D47, draws a line from (3009, 0xD7E93E) to (256, 0x2C1E95) using color 2, and fills a rectangle with corners at (1234, 2893), (3315, 2) using color 0xE2C0A2. The program halts after completing these operations.

; simple draw program
; initialization
  LDI r2, 2426
  LDI r1, 1406
  LDI r4, 0x181D47
  LDI r13, 104
  LDI r14, 3089
  LDI r0, 0xC8FF2A
  CIRCLE r4, r13, r14, r0
  LDI r6, 3009
  LDI r1, 0xD7E93E
  LDI r6, 2
  LDI r14, 0x2C1E95
  LDI r2, 256
  LINE r6, r1, r6, r14, r2
  LDI r10, 0xE2C0A2
  LDI r1, 1234
  LDI r4, 2893
  LDI r14, 2
  LDI r1, 3315
  RECTF r10, r1, r4, r14, r1
  HALT
