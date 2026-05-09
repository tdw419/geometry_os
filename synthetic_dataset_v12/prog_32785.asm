; DESCRIPTION: Composite: Places a blue line segment connecting (99, 170) to (200, 84) then Sets a single black pixel at (318, 76).
; PLAN: r0=99(x1), r1=170(y1), r2=200(x2), r3=84(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=318(x), r6=76(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 99
LDI r1, 170
LDI r2, 200
LDI r3, 84
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 318
LDI r6, 76
LDI r7, 0x000000
PSET r5, r6, r7
HALT
