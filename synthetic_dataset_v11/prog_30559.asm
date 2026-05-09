; DESCRIPTION: Renders a red line between points (181, 207) and (100, 158).
; PLAN: r0=181(x1), r1=207(y1), r2=100(x2), r3=158(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 207
LDI r2, 100
LDI r3, 158
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
