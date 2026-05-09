; DESCRIPTION: Places a orange line segment connecting (206, 187) to (508, 100).
; PLAN: r0=206(x1), r1=187(y1), r2=508(x2), r3=100(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 187
LDI r2, 508
LDI r3, 100
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
