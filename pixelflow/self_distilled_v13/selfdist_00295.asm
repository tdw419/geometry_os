; DESCRIPTION: Renders a red line segment connecting (324, 163) to (145, 34).
; PLAN: r0=324(x1), r1=163(y1), r2=145(x2), r3=34(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 163
LDI r2, 145
LDI r3, 34
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
