; DESCRIPTION: Renders a red line between points (93, 178) and (137, 72).
; PLAN: r0=93(x1), r1=178(y1), r2=137(x2), r3=72(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 178
LDI r2, 137
LDI r3, 72
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
