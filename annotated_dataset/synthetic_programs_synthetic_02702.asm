; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses those values to draw a pixel at coordinates (2902, 16) and fill the screen with the color defined by register `r3`. The program halts after completing these operations.

; simple draw program
; initialization
  LDI r12, 2902
  LDI r15, 16
  LDI r4, 3475
  LDI r3, 0x9BE12B
  LDI r7, 1276
  WPIXEL
  LDI r3, 0x0F0927
  FILL r3
  HALT
