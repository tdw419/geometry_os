; DESCRIPTION: Renders a yellow line between points (99, 225) and (366, 106).
; PLAN: r0=99(x1), r1=225(y1), r2=366(x2), r3=106(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 225
LDI r2, 366
LDI r3, 106
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
