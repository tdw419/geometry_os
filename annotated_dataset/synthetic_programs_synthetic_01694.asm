; DESCRIPTION: This GeOS assembly code initializes registers and sets up the display memory to fill a specific area with a color value, then halts execution.

; simple draw program
; initialization
  LDI r1, 247
  LDI r12, 255
  LDI r6, 289
  LDI r2, 2194
  FILL r2
  HALT
