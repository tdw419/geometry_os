; DESCRIPTION: This GeOS assembly code initializes registers with specific values and then uses those values to draw a line on the screen using the LINE instruction. It also sets a pixel at a specified coordinate using the WPIXEL instruction before halting the program.

; simple draw program
; initialization
  LDI r9, 3437
  LDI r3, 0xD1B505
  LDI r10, 2821
  LDI r2, 0xE9FEE8
  LDI r7, 3743
  LDI r10, 1
  LDI r7, 4092
  LDI r14, 0x2A39AB
  LINE r2, r7, r10, r7, r14
  LDI r14, 3020
  LDI r9, 0
  LDI r8, 4075
  WPIXEL
  HALT
