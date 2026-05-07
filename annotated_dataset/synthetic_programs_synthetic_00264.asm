; DESCRIPTION: This GeOS assembly code initializes graphics settings and draws a filled rectangle followed by a circle on the display.

; simple draw program
; initialization
  LDI r13, 254
  LDI r1, 0
  LDI r2, 0xF0291F
  LDI r15, 3775
  LDI r12, 0xB40AA5
  LDI r14, 3322
  PSETI
  LDI r2, 0x825D15
  LDI r14, 2522
  LDI r2, 986
  LDI r3, 0x8C7AD8
  LDI r10, 256
  RECTF r2, r14, r2, r3, r10
  LDI r13, 2771
  LDI r12, 0
  LDI r3, 1
  LDI r15, 0
  CIRCLE r13, r12, r3, r15
  HALT
