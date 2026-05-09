; DESCRIPTION: Places a black line segment connecting (56, 170) to (85, 70).
; PLAN: r0=56(x1), r1=170(y1), r2=85(x2), r3=70(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 170
LDI r2, 85
LDI r3, 70
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
