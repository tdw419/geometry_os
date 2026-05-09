; DESCRIPTION: Places a orange line segment connecting (319, 164) to (112, 247).
; PLAN: r0=319(x1), r1=164(y1), r2=112(x2), r3=247(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 164
LDI r2, 112
LDI r3, 247
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
