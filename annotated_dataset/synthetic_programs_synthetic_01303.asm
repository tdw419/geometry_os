; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and then uses the `PSET` instruction to set a pixel at coordinates (688, 3184) with color 2714. The program halts after executing this operation.

; simple draw program
; initialization
  LDI r15, 0xEEB523
  LDI r30, 10
  LDI r7, 8
  LDI r8, 4
  LDI r3, 0x4C2364
  LDI r11, 688
  LDI r9, 3184
  LDI r0, 2714
  PSET r11, r9, r0
  HALT
