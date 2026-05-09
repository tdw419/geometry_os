; DESCRIPTION: Renders a yellow line between points (167, 80) and (93, 149).
; PLAN: r0=167(x1), r1=80(y1), r2=93(x2), r3=149(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 80
LDI r2, 93
LDI r3, 149
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
