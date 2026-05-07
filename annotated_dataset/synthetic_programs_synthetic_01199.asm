; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and then draws a circle using the `CIRCLE` instruction. The circle's parameters are defined by the register values, and the program halts afterward.

; simple draw program
; initialization
  LDI r6, 128
  LDI r11, 2548
  LDI r14, 0
  LDI r4, 2139
  LDI r9, 1129
  LDI r13, 0x2BE643
  LDI r12, 2740
  LDI r4, 2
  LDI r15, 2669
  LDI r12, 0x37C9FE
  PSETI
  LDI r11, 8
  LDI r5, 0x3748DB
  LDI r5, 256
  LDI r4, 0x4E706E
  CIRCLE r11, r5, r5, r4
  HALT
