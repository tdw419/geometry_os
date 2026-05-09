; DESCRIPTION: Renders a red line between points (462, 112) and (81, 165).
; PLAN: r0=462(x1), r1=112(y1), r2=81(x2), r3=165(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 112
LDI r2, 81
LDI r3, 165
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
