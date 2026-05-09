; DESCRIPTION: Renders a red line between points (91, 200) and (163, 5).
; PLAN: r0=91(x1), r1=200(y1), r2=163(x2), r3=5(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 200
LDI r2, 163
LDI r3, 5
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
