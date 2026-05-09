; DESCRIPTION: Renders a red line between points (200, 117) and (88, 112).
; PLAN: r0=200(x1), r1=117(y1), r2=88(x2), r3=112(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 117
LDI r2, 88
LDI r3, 112
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
