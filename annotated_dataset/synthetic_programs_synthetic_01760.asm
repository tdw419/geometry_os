; DESCRIPTION: The GeOS assembly code initializes various registers with specific values and then performs a series of drawing operations. It sets a pixel at a given coordinate, fills an area starting from that pixel, resets another register to zero, sets a point at a specified location, and finally halts execution.

; simple draw program
; initialization
  LDI r10, 0x32A676
  LDI r11, 16
  LDI r14, 1830
  LDI r8, 2503
  LDI r10, 1
  WPIXEL
  LDI r5, 1
  FILL r5
  LDI r10, 88
  LDI r5, 0
  LDI r3, 1657
  PSETI
  HALT
