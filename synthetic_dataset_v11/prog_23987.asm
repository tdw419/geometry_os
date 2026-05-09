; DESCRIPTION: Renders a red line between points (102, 76) and (233, 105).
; PLAN: r0=102(x1), r1=76(y1), r2=233(x2), r3=105(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 76
LDI r2, 233
LDI r3, 105
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
