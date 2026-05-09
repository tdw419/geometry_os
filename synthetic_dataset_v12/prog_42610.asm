; DESCRIPTION: Renders a red line between points (58, 34) and (477, 179).
; PLAN: r0=58(x1), r1=34(y1), r2=477(x2), r3=179(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 34
LDI r2, 477
LDI r3, 179
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
