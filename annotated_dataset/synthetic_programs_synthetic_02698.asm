; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses the `WPIXEL` instruction to write a pixel at a coordinate defined by these registers. The program halts after executing this operation.

; simple draw program
; initialization
  LDI r1, 255
  LDI r12, 3619
  LDI r4, 3740
  LDI r3, 0xE8C9F6
  LDI r7, 10
  LDI r5, 64
  LDI r14, 16
  LDI r12, 3232
  LDI r1, 2021
  WPIXEL
  HALT
