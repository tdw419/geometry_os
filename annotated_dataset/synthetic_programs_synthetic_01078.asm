; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then draws a line using the `LINE` instruction. It also sets a pixel at a specified coordinate using the `PSET` instruction before halting execution.

; simple draw program
; initialization
  LDI r8, 8
  LDI r5, 3926
  LDI r12, 64
  LDI r1, 0x49A808
  LDI r4, 0x77795E
  LDI r11, 64
  LDI r14, 0x554948
  LDI r12, 3375
  LDI r3, 0x05F891
  LDI r3, 0
  LDI r8, 128
  LDI r7, 3824
  LINE r12, r3, r3, r8, r7
  LDI r11, 0x3C5372
  LDI r4, 32
  LDI r1, 289
  PSET r11, r4, r1
  HALT
