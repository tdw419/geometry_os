; DESCRIPTION: Renders a red line segment connecting (349, 110) to (174, 119).
; PLAN: r0=349(x1), r1=110(y1), r2=174(x2), r3=119(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 110
LDI r2, 174
LDI r3, 119
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
