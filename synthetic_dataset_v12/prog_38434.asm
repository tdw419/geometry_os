; DESCRIPTION: Renders a orange line between points (285, 132) and (477, 106).
; PLAN: r0=285(x1), r1=132(y1), r2=477(x2), r3=106(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 132
LDI r2, 477
LDI r3, 106
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
