; DESCRIPTION: Renders a orange line between points (1, 38) and (351, 78).
; PLAN: r0=1(x1), r1=38(y1), r2=351(x2), r3=78(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 38
LDI r2, 351
LDI r3, 78
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
