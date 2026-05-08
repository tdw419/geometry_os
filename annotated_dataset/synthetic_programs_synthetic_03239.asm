; DESCRIPTION: The GeOS assembly code initializes the system with specific color and coordinate values, then draws a line using `LINE` instruction followed by filling a rectangle with `RECTF` instruction. Finally, it halts execution.

; simple draw program
; initialization
  LDI r6, 0xAC5766
  LDI r4, 16
  LDI r8, 862
  LDI r6, 0x09E8AB
  FILL r6
  LDI r6, 0xCC9C26
  LDI r15, 2073
  LDI r4, 0xC045FB
  LDI r0, 3294
  LDI r5, 3106
  LINE r6, r15, r4, r0, r5
  LDI r8, 0xD3507F
  LDI r7, 256
  LDI r9, 0x794F78
  LDI r10, 0xBDF24D
  LDI r14, 0x375C47
  RECTF r8, r7, r9, r10, r14
  HALT
