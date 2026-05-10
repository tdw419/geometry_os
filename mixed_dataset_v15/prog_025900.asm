; DESCRIPTION: Renders a red line between points (266, 190) and (40, 74).
; PLAN: r0=266(x1), r1=190(y1), r2=40(x2), r3=74(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 190
LDI r2, 40
LDI r3, 74
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
