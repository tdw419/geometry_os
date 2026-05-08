; DESCRIPTION: This GeOS assembly code initializes various registers with specific values and then calls the `CIRCLE` function to draw a circle on the screen at coordinates (0x42EC7A, 256) with a radius of 4 and color 0x53E618. The program then halts execution.

; simple draw program
; initialization
  LDI r3, 0x152292
  LDI r12, 281
  LDI r5, 0x144445
  LDI r7, 2285
  LDI r14, 4
  LDI r0, 8
  LDI r4, 4
  LDI r11, 3305
  LDI r14, 0x42EC7A
  LDI r12, 256
  LDI r9, 4
  LDI r20, 0x53E618
  CIRCLE r14, r12, r9, r20
  HALT
