; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses the `PSETI` instruction to set a pixel at a particular location on the screen. The program halts after executing these operations.

; simple draw program
; initialization
  LDI r2, 16
  LDI r13, 2284
  LDI r8, 0x568410
  LDI r2, 0x20AEBD
  LDI r26, 64
  PSETI
  HALT
