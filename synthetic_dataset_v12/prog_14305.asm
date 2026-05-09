; DESCRIPTION: Places a black line segment connecting (508, 0) to (273, 78).
; PLAN: r0=508(x1), r1=0(y1), r2=273(x2), r3=78(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 0
LDI r2, 273
LDI r3, 78
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
