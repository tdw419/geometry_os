; DESCRIPTION: Renders a yellow line between points (153, 85) and (194, 168).
; PLAN: r0=153(x1), r1=85(y1), r2=194(x2), r3=168(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 85
LDI r2, 194
LDI r3, 168
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
