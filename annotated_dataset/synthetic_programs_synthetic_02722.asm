; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses these to draw a filled rectangle on the screen. It sets pixel colors and positions before halting execution.

; simple draw program
; initialization
  LDI r26, 0xA91F14
  LDI r3, 1
  LDI r11, 0x273F91
  LDI r1, 0x790B18
  LDI r1, 1
  FILL r1
  LDI r7, 1449
  LDI r10, 8
  LDI r5, 255
  PSET r7, r10, r5
  LDI r3, 3240
  LDI r2, 10
  LDI r10, 0x37EBD9
  LDI r11, 348
  LDI r4, 2865
  RECTF r3, r2, r10, r11, r4
  HALT
