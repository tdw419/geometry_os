; DESCRIPTION: This GeOS assembly code initializes the drawing system by loading specific memory addresses into registers and filling a buffer. The program then halts execution.

; simple draw program
; initialization
  LDI r7, 0x9BEB03
  LDI r3, 0x73E620
  LDI r13, 4
  FILL r13
  HALT
