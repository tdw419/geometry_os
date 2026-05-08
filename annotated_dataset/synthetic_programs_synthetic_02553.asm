; DESCRIPTION: This GeOS assembly code initializes various registers with specific values and then performs drawing operations including drawing a circle using the `CIRCLE` instruction and setting a pixel using the `PSET` instruction. The program halts after completing these tasks.

; simple draw program
; initialization
  LDI r6, 0x0AF944
  LDI r7, 0x43D352
  LDI r0, 0x21AE40
  LDI r12, 32
  LDI r15, 0xFEA6BC
  LDI r11, 1274
  LDI r1, 0x42B55B
  LDI r13, 2650
  LDI r15, 256
  LDI r21, 32
  LDI r0, 3512
  LDI r2, 64
  CIRCLE r15, r21, r0, r2
  LDI r14, 2
  LDI r14, 525
  LDI r6, 4
  LDI r15, 0xA758A7
  CIRCLE r14, r14, r6, r15
  LDI r7, 0x497C81
  LDI r12, 4
  LDI r12, 1653
  PSET r7, r12, r12
  HALT
