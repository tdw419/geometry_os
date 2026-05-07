; DESCRIPTION: This GeOS assembly code initializes the system, sets up drawing parameters, fills a rectangular area with color, draws a pixel at a specific coordinate, and then fills another area before halting execution.

; simple draw program
; initialization
  LDI r8, 1
  LDI r7, 1
  LDI r11, 2
  FILL r11
  LDI r9, 0x094DB9
  LDI r8, 560
  LDI r10, 16
  WPIXEL
  LDI r12, 2051
  FILL r12
  HALT
