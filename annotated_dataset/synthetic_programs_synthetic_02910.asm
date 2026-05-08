; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses the `LINE` command to draw a line on the screen from point (r7, r5) to point (r13, r1) with a thickness of 1 pixel. The program then halts execution.

; simple draw program
; initialization
  LDI r8, 0x510280
  LDI r12, 8
  LDI r14, 128
  LDI r1, 0x74226A
  LDI r7, 0x3888C1
  LDI r5, 1909
  LDI r13, 0xE2AB97
  LDI r1, 3210
  LDI r3, 1
  LINE r7, r5, r13, r1, r3
  HALT
