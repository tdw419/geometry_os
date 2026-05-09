; DESCRIPTION: Renders a red line between points (54, 158) and (1, 49).
; PLAN: r0=54(x1), r1=158(y1), r2=1(x2), r3=49(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 158
LDI r2, 1
LDI r3, 49
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
