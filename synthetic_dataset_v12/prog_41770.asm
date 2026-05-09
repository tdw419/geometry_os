; DESCRIPTION: Renders a purple line between points (96, 68) and (302, 129).
; PLAN: r0=96(x1), r1=68(y1), r2=302(x2), r3=129(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 68
LDI r2, 302
LDI r3, 129
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
