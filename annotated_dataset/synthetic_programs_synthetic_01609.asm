; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses the `PSETI` instruction to set a pixel at a particular coordinate. It subsequently fills an area starting from another specified coordinate using the `FILL` instruction, followed by halting the program execution.

; simple draw program
; initialization
  LDI r2, 1948
  LDI r15, 64
  LDI r11, 3361
  LDI r6, 0x3C920C
  LDI r8, 3607
  LDI r12, 0x88F0DB
  LDI r3, 255
  LDI r15, 2035
  LDI r10, 64
  PSETI
  LDI r6, 3914
  FILL r6
  HALT
