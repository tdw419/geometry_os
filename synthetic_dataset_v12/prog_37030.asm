; DESCRIPTION: Places a red line segment connecting (463, 170) to (149, 234).
; PLAN: r0=463(x1), r1=170(y1), r2=149(x2), r3=234(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 170
LDI r2, 149
LDI r3, 234
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
