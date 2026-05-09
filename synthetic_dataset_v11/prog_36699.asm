; DESCRIPTION: Places a orange line segment connecting (26, 66) to (73, 52).
; PLAN: r0=26(x1), r1=66(y1), r2=73(x2), r3=52(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 66
LDI r2, 73
LDI r3, 52
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
