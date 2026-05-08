; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses the `LINE` instruction to draw a line on the screen from coordinates (1994, 64) to (3297, 2031). The program then halts execution.

; simple draw program
; initialization
  LDI r0, 0x6D57CF
  LDI r11, 128
  LDI r12, 1233
  LDI r13, 0x8A555A
  LDI r3, 1
  LDI r5, 0xA938EE
  LDI r2, 4
  LDI r6, 1
  LDI r14, 1994
  LDI r9, 0x3065AD
  LDI r8, 2031
  LDI r15, 64
  LDI r4, 3297
  LINE r14, r9, r8, r15, r4
  HALT
