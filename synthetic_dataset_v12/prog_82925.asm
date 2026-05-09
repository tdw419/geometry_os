; DESCRIPTION: Renders a orange line between points (484, 3) and (489, 55).
; PLAN: r0=484(x1), r1=3(y1), r2=489(x2), r3=55(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 3
LDI r2, 489
LDI r3, 55
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
