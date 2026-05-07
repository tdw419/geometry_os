; DESCRIPTION: This GeOS assembly code initializes the system, sets up graphics parameters, draws a filled circle, and then fills another area before halting execution.

; simple draw program
; initialization
  LDI r1, 0x3169AE
  LDI r14, 1319
  LDI r7, 4000
  LDI r7, 2643
  FILL r7
  LDI r15, 8
  LDI r8, 16
  LDI r14, 1765
  LDI r8, 0x60E156
  CIRCLE r15, r8, r14, r8
  LDI r1, 4
  FILL r1
  HALT
