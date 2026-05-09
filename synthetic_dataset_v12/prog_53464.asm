; DESCRIPTION: Places a orange line segment connecting (7, 199) to (212, 25).
; PLAN: r0=7(x1), r1=199(y1), r2=212(x2), r3=25(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 199
LDI r2, 212
LDI r3, 25
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
