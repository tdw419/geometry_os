; DESCRIPTION: Renders a red line between points (22, 23) and (134, 106).
; PLAN: r0=22(x1), r1=23(y1), r2=134(x2), r3=106(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 23
LDI r2, 134
LDI r3, 106
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
