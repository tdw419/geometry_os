; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses the `WPIXEL` instruction to write a pixel at coordinates (4, 0) with color 0xE0C2CC before halting execution.

; simple draw program
; initialization
  LDI r11, 2985
  LDI r13, 0x3DB6A7
  LDI r9, 0x0C1C52
  LDI r14, 10
  LDI r4, 3151
  LDI r15, 3555
  LDI r10, 4
  LDI r1, 0
  LDI r15, 0xE0C2CC
  WPIXEL
  HALT
