; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses the `LINE` instruction to draw two lines on a display. The first line is drawn using color 0x441387, while the second line uses color 0x9B7E1E. The program also sets a pixel at coordinates (2519, 0) with color 0xEA5972 and then halts execution.

; simple draw program
; initialization
  LDI r2, 1236
  LDI r10, 1565
  LDI r6, 255
  LDI r7, 8
  LDI r21, 32
  LDI r0, 0x441387
  LDI r10, 128
  LINE r6, r7, r21, r0, r10
  LDI r9, 0xEA5972
  LDI r12, 0xF8745C
  LDI r8, 2519
  PSETI
  LDI r10, 964
  LDI r0, 0
  LDI r15, 0x9B7E1E
  LDI r6, 16
  LDI r1, 0x855F5D
  LINE r10, r0, r15, r6, r1
  HALT
