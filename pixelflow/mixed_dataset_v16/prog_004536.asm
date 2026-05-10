; DESCRIPTION: Renders a red line between points (86, 158) and (419, 133).
; PLAN: r0=86(x1), r1=158(y1), r2=419(x2), r3=133(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 158
LDI r2, 419
LDI r3, 133
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
