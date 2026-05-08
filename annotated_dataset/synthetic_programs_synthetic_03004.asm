; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and then uses these to draw a filled rectangle and set individual pixels on the screen. The program sets up colors and coordinates for drawing operations before halting execution.

; simple draw program
; initialization
  LDI r14, 1
  LDI r2, 16
  LDI r21, 0x6428F5
  LDI r4, 3399
  LDI r19, 0x3C9B8B
  LDI r14, 0x351C77
  LDI r8, 0x18E139
  LDI r3, 40
  PSET r14, r8, r3
  LDI r8, 3970
  LDI r4, 1267
  LDI r14, 16
  LDI r0, 8
  LDI r1, 0xF7CA93
  RECTF r8, r4, r14, r0, r1
  LDI r3, 0xBFA6EC
  LDI r13, 32
  LDI r10, 2101
  PSET r3, r13, r10
  HALT
