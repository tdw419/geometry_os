; DESCRIPTION: Places a orange line segment connecting (367, 153) to (156, 211).
; PLAN: r0=367(x1), r1=153(y1), r2=156(x2), r3=211(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 153
LDI r2, 156
LDI r3, 211
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
