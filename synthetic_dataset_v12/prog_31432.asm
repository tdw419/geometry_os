; DESCRIPTION: Renders a red line between points (158, 34) and (281, 106).
; PLAN: r0=158(x1), r1=34(y1), r2=281(x2), r3=106(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 34
LDI r2, 281
LDI r3, 106
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
