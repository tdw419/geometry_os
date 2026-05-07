; DESCRIPTION: This GeOS assembly code initializes the display by setting specific memory addresses and registers to configure drawing parameters. It then draws a pixel at coordinates (2514, 3089) and fills areas with predefined patterns before halting execution.

; simple draw program
; initialization
  LDI r7, 2376
  LDI r10, 1001
  LDI r4, 0x0F0F70
  FILL r4
  LDI r2, 2514
  LDI r13, 2
  LDI r0, 3089
  PSETI
  LDI r15, 0
  FILL r15
  HALT
