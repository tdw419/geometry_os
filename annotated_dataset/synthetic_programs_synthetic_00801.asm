; DESCRIPTION: This GeOS assembly code initializes the drawing system by setting up registers `r14` and `r15` with values 16 and 78, respectively. It then fills a buffer at address specified in register `r2` (which is set to 128) with data and halts execution.

; simple draw program
; initialization
  LDI r14, 16
  LDI r15, 78
  LDI r2, 128
  FILL r2
  HALT
