; DESCRIPTION: Renders a red line between points (43, 155) and (95, 34).
; PLAN: r0=43(x1), r1=155(y1), r2=95(x2), r3=34(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 155
LDI r2, 95
LDI r3, 34
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
