; DESCRIPTION: This GeOS assembly code initializes various registers with specific values and then draws a line using the `LINE` instruction. The line is defined by start coordinates (r10, r11), length (r30), color (r4, r9), and the program halts after execution.

; simple draw program
; initialization
  LDI r5, 4
  LDI r13, 227
  LDI r7, 0
  LDI r1, 0xBDD2F8
  LDI r0, 306
  LDI r22, 3520
  LDI r10, 2181
  LDI r11, 4011
  LDI r30, 128
  LDI r4, 0x367472
  LDI r9, 0x6C61B4
  LINE r10, r11, r30, r4, r9
  HALT
