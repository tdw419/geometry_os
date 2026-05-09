; DESCRIPTION: Renders a red line between points (200, 14) and (12, 137).
; PLAN: r0=200(x1), r1=14(y1), r2=12(x2), r3=137(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 14
LDI r2, 12
LDI r3, 137
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
