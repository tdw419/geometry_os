; DESCRIPTION: Renders a red line segment connecting (389, 145) to (336, 62).
; PLAN: r0=389(x1), r1=145(y1), r2=336(x2), r3=62(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 145
LDI r2, 336
LDI r3, 62
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
