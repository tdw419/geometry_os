; DESCRIPTION: Renders a yellow line between points (29, 121) and (463, 93).
; PLAN: r0=29(x1), r1=121(y1), r2=463(x2), r3=93(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 121
LDI r2, 463
LDI r3, 93
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
