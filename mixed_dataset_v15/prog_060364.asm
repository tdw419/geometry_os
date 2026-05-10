; DESCRIPTION: Renders a yellow line segment connecting (110, 106) to (158, 89).
; PLAN: r0=110(x1), r1=106(y1), r2=158(x2), r3=89(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 106
LDI r2, 158
LDI r3, 89
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
