; DESCRIPTION: This GeOS assembly code initializes various registers with specific values and then draws a filled rectangle and a circle on the screen using the RECTF and CIRCLE instructions respectively. The program halts after completing the drawing operations.

; simple draw program
; initialization
  LDI r6, 1693
  LDI r13, 72
  LDI r0, 0x9C6536
  LDI r8, 10
  LDI r6, 3253
  LDI r0, 3065
  LDI r9, 0x37597A
  RECTF r0, r8, r6, r0, r9
  LDI r8, 2139
  LDI r9, 0x7B08DF
  LDI r12, 208
  LDI r9, 0xD64E3D
  CIRCLE r8, r9, r12, r9
  HALT
