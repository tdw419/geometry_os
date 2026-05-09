; DESCRIPTION: Places a orange line segment connecting (124, 176) to (65, 89).
; PLAN: r0=124(x1), r1=176(y1), r2=65(x2), r3=89(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 176
LDI r2, 65
LDI r3, 89
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
