; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses the `LINE` command to draw a line on the screen. The program also sets a pixel at a specified coordinate using the `PSETI` instruction before halting execution.

; simple draw program
; initialization
  LDI r10, 1209
  LDI r14, 3876
  LDI r0, 0x2CEE8D
  LDI r11, 64
  LDI r2, 0xB7C0E4
  LDI r13, 0x12001D
  LDI r21, 0
  LDI r3, 2006
  LDI r9, 0x99843B
  LDI r15, 64
  LINE r13, r21, r3, r9, r15
  LDI r6, 0x893259
  LDI r3, 0x7A5BD8
  LDI r7, 104
  PSETI
  HALT
