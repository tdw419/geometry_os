; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses the `PSETI` instruction to plot a pixel at coordinates defined by register `r7`. It subsequently fills an area of size defined in register `r28` starting from the plotted pixel, before halting execution.

; simple draw program
; initialization
  LDI r12, 2200
  LDI r15, 0xCA93AC
  LDI r7, 1544
  LDI r14, 16
  LDI r29, 2700
  LDI r7, 996
  LDI r9, 2436
  LDI r0, 0x5962B6
  PSETI
  LDI r28, 15
  FILL r28
  HALT
