; DESCRIPTION: Renders a green line between points (155, 158) and (95, 38).
; PLAN: r0=155(x1), r1=158(y1), r2=95(x2), r3=38(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 158
LDI r2, 95
LDI r3, 38
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
