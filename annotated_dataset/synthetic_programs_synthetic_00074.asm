; DESCRIPTION: This GeOS assembly code initializes several registers with specific hexadecimal values and then uses the `PSETI` instruction to set pixels at two different coordinates on a display. The program halts after executing these operations.

; simple draw program
; initialization
  LDI r13, 0x5A2A84
  LDI r2, 0x29D5C6
  LDI r14, 2125
  LDI r1, 0xDB68D8
  LDI r9, 0xB2D456
  LDI r15, 1316
  LDI r29, 3187
  LDI r6, 0x4A0B45
  LDI r26, 0xEAD55C
  LDI r15, 255
  LDI r0, 1029
  PSETI
  LDI r3, 0x601492
  LDI r5, 4
  LDI r16, 8
  PSETI
  HALT
