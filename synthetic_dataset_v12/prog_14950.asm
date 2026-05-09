; DESCRIPTION: Places a red line segment connecting (390, 60) to (18, 102).
; PLAN: r0=390(x1), r1=60(y1), r2=18(x2), r3=102(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 60
LDI r2, 18
LDI r3, 102
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
