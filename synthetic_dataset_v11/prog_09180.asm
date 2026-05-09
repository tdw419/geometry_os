; DESCRIPTION: Renders a red line between points (49, 89) and (188, 135).
; PLAN: r0=49(x1), r1=89(y1), r2=188(x2), r3=135(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 89
LDI r2, 188
LDI r3, 135
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
