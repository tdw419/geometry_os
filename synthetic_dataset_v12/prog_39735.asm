; DESCRIPTION: Renders a orange line between points (98, 155) and (266, 120).
; PLAN: r0=98(x1), r1=155(y1), r2=266(x2), r3=120(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 155
LDI r2, 266
LDI r3, 120
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
