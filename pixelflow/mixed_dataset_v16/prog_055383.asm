; DESCRIPTION: Places a black line segment connecting (375, 3) to (194, 145).
; PLAN: r0=375(x1), r1=3(y1), r2=194(x2), r3=145(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 3
LDI r2, 194
LDI r3, 145
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
