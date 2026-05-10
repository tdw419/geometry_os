; DESCRIPTION: Places a orange line segment connecting (276, 119) to (302, 26).
; PLAN: r0=276(x1), r1=119(y1), r2=302(x2), r3=26(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 119
LDI r2, 302
LDI r3, 26
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
