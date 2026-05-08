; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses those values to draw a line on the screen using the `LINE` instruction. It also sets a pixel at a particular coordinate using the `PSET` instruction before halting execution.

; simple draw program
; initialization
  LDI r8, 2573
  LDI r10, 0xFAFEE9
  LDI r11, 0xA0218F
  LDI r13, 64
  LDI r4, 2142
  LDI r0, 1377
  LDI r4, 64
  LDI r9, 8
  LDI r2, 3305
  LDI r1, 8
  LINE r0, r4, r9, r2, r1
  LDI r0, 0x20CFE6
  LDI r12, 2472
  LDI r2, 32
  PSET r0, r12, r2
  HALT
