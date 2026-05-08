; DESCRIPTION: The GeOS assembly code initializes registers to set up a simple drawing operation. It loads specific values into registers to define parameters such as position and color, then uses the `PSETI` instruction to plot a pixel at the specified coordinates, followed by a halt command to terminate execution.

; simple draw program
; initialization
  LDI r11, 1364
  LDI r2, 3144
  LDI r10, 4
  LDI r8, 1
  LDI r12, 1
  FILL r12
  LDI r14, 64
  LDI r6, 353
  LDI r4, 3150
  PSETI
  HALT
