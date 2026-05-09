; DESCRIPTION: Places a orange line segment connecting (111, 5) to (212, 185).
; PLAN: r0=111(x1), r1=5(y1), r2=212(x2), r3=185(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 5
LDI r2, 212
LDI r3, 185
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
