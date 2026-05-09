; DESCRIPTION: Places a black line segment connecting (10, 170) to (102, 10).
; PLAN: r0=10(x1), r1=170(y1), r2=102(x2), r3=10(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 170
LDI r2, 102
LDI r3, 10
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
