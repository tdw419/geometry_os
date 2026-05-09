; DESCRIPTION: Renders a yellow line between points (158, 163) and (63, 110).
; PLAN: r0=158(x1), r1=163(y1), r2=63(x2), r3=110(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 163
LDI r2, 63
LDI r3, 110
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
