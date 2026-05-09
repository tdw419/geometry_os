; DESCRIPTION: Draws a orange line from (141, 156) to (172, 185).
; PLAN: r0=141(x1), r1=156(y1), r2=172(x2), r3=185(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 156
LDI r2, 172
LDI r3, 185
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
