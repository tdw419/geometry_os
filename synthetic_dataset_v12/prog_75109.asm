; DESCRIPTION: Renders a red line between points (6, 170) and (133, 119).
; PLAN: r0=6(x1), r1=170(y1), r2=133(x2), r3=119(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 170
LDI r2, 133
LDI r3, 119
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
