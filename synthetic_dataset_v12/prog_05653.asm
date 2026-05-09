; DESCRIPTION: Places a black line segment connecting (508, 78) to (70, 101).
; PLAN: r0=508(x1), r1=78(y1), r2=70(x2), r3=101(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 78
LDI r2, 70
LDI r3, 101
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
