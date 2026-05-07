; DESCRIPTION: This GeOS assembly code initializes various registers with specific values and then executes a drawing routine. It fills a region of the screen with a color and draws a line using the defined parameters before halting execution.

; simple draw program
; initialization
  LDI r14, 0x31275D
  LDI r0, 8
  LDI r31, 4
  LDI r6, 2
  LDI r11, 3308
  LDI r7, 0x900222
  LDI r0, 0x36AF8E
  FILL r0
  LDI r10, 445
  LDI r9, 4
  LDI r31, 1670
  LDI r3, 0x9B1056
  LDI r1, 1653
  LINE r10, r9, r31, r3, r1
  HALT
