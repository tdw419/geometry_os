; DESCRIPTION: Renders a green line between points (194, 155) and (132, 129).
; PLAN: r0=194(x1), r1=155(y1), r2=132(x2), r3=129(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 155
LDI r2, 132
LDI r3, 129
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
