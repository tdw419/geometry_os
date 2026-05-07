; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses the `PSET` instruction to set a pixel at coordinates defined by register `r1` (x) and `r6` (y) with color specified in `r14`. After that, it fills a region starting from the address defined in register `r4` and halts execution.

; simple draw program
; initialization
  LDI r11, 0x82B71B
  LDI r9, 32
  LDI r8, 0
  LDI r12, 3681
  LDI r10, 688
  LDI r1, 2993
  LDI r6, 1
  LDI r14, 0x4B088E
  PSET r1, r6, r14
  LDI r4, 2835
  FILL r4
  HALT
