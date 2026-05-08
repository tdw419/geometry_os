; DESCRIPTION: This GeOS assembly code initializes a drawing program by setting up various registers with specific values for color and position settings. It then uses the `PSETI` command to plot two points on the screen at coordinates (0, 1485) and (256, 0xE873CB) in specified colors, before halting execution.

; simple draw program
; initialization
  LDI r13, 544
  LDI r15, 1485
  LDI r2, 4
  LDI r3, 0xF0FD0B
  LDI r0, 0x33B3CC
  LDI r7, 0
  LDI r15, 1740
  LDI r15, 0
  LDI r28, 4
  PSETI
  LDI r16, 0x02B161
  LDI r15, 0xE873CB
  LDI r11, 256
  PSETI
  HALT
