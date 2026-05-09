; DESCRIPTION: Places a black line segment connecting (95, 110) to (125, 78).
; PLAN: r0=95(x1), r1=110(y1), r2=125(x2), r3=78(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 110
LDI r2, 125
LDI r3, 78
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
