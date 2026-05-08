; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses the `PSETI` instruction to plot a single pixel on the screen. The program halts after execution.

; simple draw program
; initialization
  LDI r15, 0x89B6FC
  LDI r13, 2282
  LDI r4, 0x9ED8FD
  LDI r31, 1770
  LDI r15, 1767
  LDI r2, 2
  PSETI
  HALT
