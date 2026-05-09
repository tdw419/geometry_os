; DESCRIPTION: Draws a orange line from (368, 123) to (378, 156).
; PLAN: r0=368(x1), r1=123(y1), r2=378(x2), r3=156(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 123
LDI r2, 378
LDI r3, 156
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
