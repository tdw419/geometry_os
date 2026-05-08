; DESCRIPTION: This GeOS assembly code initializes registers to set up a simple drawing program. It loads values into registers `r6`, `r1`, `r0`, and `r7` for specific operations, fills memory at address `r10` with a value, and then halts the system.

; simple draw program
; initialization
  LDI r6, 255
  LDI r1, 351
  LDI r0, 32
  LDI r7, 1537
  LDI r10, 256
  FILL r10
  HALT
