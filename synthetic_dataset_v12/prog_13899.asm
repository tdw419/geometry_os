; DESCRIPTION: Places a black line segment connecting (419, 84) to (377, 184).
; PLAN: r0=419(x1), r1=84(y1), r2=377(x2), r3=184(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 84
LDI r2, 377
LDI r3, 184
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
