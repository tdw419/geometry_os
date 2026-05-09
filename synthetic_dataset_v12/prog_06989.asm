; DESCRIPTION: Composite: Places a green dot at position (316, 138) then Draws a orange line from (339, 181) to (232, 92).
; PLAN: r0=316(x), r1=138(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=339(x1), r6=181(y1), r7=232(x2), r8=92(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 316
LDI r1, 138
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 339
LDI r6, 181
LDI r7, 232
LDI r8, 92
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
