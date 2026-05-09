; DESCRIPTION: Renders a yellow line between points (20, 76) and (93, 233).
; PLAN: r0=20(x1), r1=76(y1), r2=93(x2), r3=233(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 76
LDI r2, 93
LDI r3, 233
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
