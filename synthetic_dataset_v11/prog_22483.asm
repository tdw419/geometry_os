; DESCRIPTION: Renders a red line between points (77, 49) and (37, 74).
; PLAN: r0=77(x1), r1=49(y1), r2=37(x2), r3=74(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 49
LDI r2, 37
LDI r3, 74
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
