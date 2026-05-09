; DESCRIPTION: Renders a yellow line between points (200, 137) and (106, 93).
; PLAN: r0=200(x1), r1=137(y1), r2=106(x2), r3=93(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 137
LDI r2, 106
LDI r3, 93
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
