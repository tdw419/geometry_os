; DESCRIPTION: Renders a orange line between points (402, 49) and (489, 244).
; PLAN: r0=402(x1), r1=49(y1), r2=489(x2), r3=244(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 49
LDI r2, 489
LDI r3, 244
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
