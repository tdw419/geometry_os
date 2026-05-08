; DESCRIPTION: The GeOS assembly code initializes various registers with specific values and then draws a circle using the `CIRCLE` instruction. The circle is defined by its center coordinates `(r3, r13)` and radius `r14`, followed by a halt command to stop execution.

; simple draw program
; initialization
  LDI r12, 255
  LDI r7, 0x6CA140
  LDI r31, 0xC38066
  LDI r10, 2961
  LDI r15, 399
  LDI r3, 2853
  LDI r13, 2797
  LDI r14, 2881
  LDI r2, 64
  CIRCLE r3, r13, r14, r2
  HALT
