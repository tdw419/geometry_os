; DESCRIPTION: Renders a red line between points (379, 70) and (155, 20).
; PLAN: r0=379(x1), r1=70(y1), r2=155(x2), r3=20(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 70
LDI r2, 155
LDI r3, 20
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
