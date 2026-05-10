; DESCRIPTION: Renders a red line between points (400, 172) and (395, 105).
; PLAN: r0=400(x1), r1=172(y1), r2=395(x2), r3=105(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 172
LDI r2, 395
LDI r3, 105
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
