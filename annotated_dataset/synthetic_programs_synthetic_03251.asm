; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then draws two lines on the screen using the `LINE` instruction. The first line is drawn from coordinates (2483, 2) to (71D7ED, 64) with a color of 0x71D7ED, and the second line is drawn from (3438, 10) to (256, 10) with a color of 0x80F653. The program then halts execution.

; simple draw program
; initialization
  LDI r13, 128
  LDI r10, 2544
  LDI r6, 2080
  LDI r9, 0xA4BD08
  LDI r3, 0xE98639
  LDI r15, 3553
  LDI r9, 2483
  LDI r4, 2
  LDI r6, 0x71D7ED
  LDI r5, 64
  LDI r12, 32
  LINE r9, r4, r6, r5, r12
  LDI r19, 3438
  LDI r5, 10
  LDI r0, 256
  LDI r5, 10
  LDI r14, 0x80F653
  LINE r19, r5, r0, r5, r14
  HALT
