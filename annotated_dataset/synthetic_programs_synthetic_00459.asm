; DESCRIPTION: This GeOS assembly code initializes a drawing environment by setting up registers with specific values and then draws a filled rectangle using the `RECTF` instruction. After drawing the rectangle, it sets a pixel at coordinates (1903, 405) with color index 256 and halts execution.

; simple draw program
; initialization
  LDI r6, 64
  LDI r31, 0xDD73CD
  LDI r10, 0x558AE1
  LDI r14, 0x88033B
  LDI r10, 64
  LDI r15, 0
  LDI r7, 8
  RECTF r10, r14, r10, r15, r7
  LDI r8, 1903
  LDI r3, 405
  LDI r0, 256
  PSETI
  HALT
