; DESCRIPTION: Places a black line segment connecting (23, 24) to (508, 140).
; PLAN: r0=23(x1), r1=24(y1), r2=508(x2), r3=140(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 24
LDI r2, 508
LDI r3, 140
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
