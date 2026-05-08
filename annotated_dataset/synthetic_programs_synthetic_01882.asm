; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses the `PSETI` instruction to plot a pixel at a calculated position on the screen. The program halts afterward.

; simple draw program
; initialization
  LDI r12, 3240
  LDI r11, 3388
  LDI r0, 1698
  LDI r5, 0x65BCF0
  LDI r2, 549
  LDI r6, 2857
  LDI r8, 0x5532C1
  LDI r0, 0x46E074
  LDI r5, 256
  LDI r6, 128
  PSETI
  HALT
