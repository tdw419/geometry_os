; DESCRIPTION: This GeOS assembly code initializes registers to specific values and uses the `PSETI` instruction to set a pixel on the screen at coordinates determined by those register values. The program then halts execution.

; simple draw program
; initialization
  LDI r4, 0xB71A96
  LDI r5, 255
  LDI r9, 3595
  LDI r1, 1
  LDI r8, 557
  PSETI
  HALT
