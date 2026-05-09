; DESCRIPTION: Renders a red line between points (296, 193) and (118, 80).
; PLAN: r0=296(x1), r1=193(y1), r2=118(x2), r3=80(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 193
LDI r2, 118
LDI r3, 80
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
