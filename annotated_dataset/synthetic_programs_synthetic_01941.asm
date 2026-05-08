; DESCRIPTION: This GeOS assembly code initializes several registers and performs drawing operations on a display. It sets two specific pixels to predefined colors, draws a circle with a given radius at a specified center, and then halts execution.

; simple draw program
; initialization
  LDI r6, 1415
  LDI r0, 2
  LDI r11, 0
  LDI r5, 32
  LDI r13, 0
  LDI r7, 634
  LDI r5, 402
  LDI r0, 134
  PSET r7, r5, r0
  LDI r13, 1245
  LDI r14, 3066
  LDI r10, 0xF520AC
  PSET r13, r14, r10
  LDI r9, 2844
  LDI r15, 0xDED23C
  LDI r1, 0x6D61D6
  LDI r13, 2408
  CIRCLE r9, r15, r1, r13
  HALT
