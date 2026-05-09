; DESCRIPTION: Renders a red line between points (52, 140) and (102, 155).
; PLAN: r0=52(x1), r1=140(y1), r2=102(x2), r3=155(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 140
LDI r2, 102
LDI r3, 155
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
