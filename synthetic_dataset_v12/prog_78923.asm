; DESCRIPTION: Places a black line segment connecting (419, 29) to (451, 95).
; PLAN: r0=419(x1), r1=29(y1), r2=451(x2), r3=95(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 29
LDI r2, 451
LDI r3, 95
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
