; DESCRIPTION: Renders a orange line between points (244, 119) and (219, 99).
; PLAN: r0=244(x1), r1=119(y1), r2=219(x2), r3=99(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 119
LDI r2, 219
LDI r3, 99
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
