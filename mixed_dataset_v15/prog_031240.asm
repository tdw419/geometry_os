; DESCRIPTION: Renders a red line between points (55, 155) and (85, 10).
; PLAN: r0=55(x1), r1=155(y1), r2=85(x2), r3=10(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 155
LDI r2, 85
LDI r3, 10
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
