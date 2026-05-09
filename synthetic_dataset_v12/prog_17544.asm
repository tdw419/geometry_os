; DESCRIPTION: Renders a yellow line between points (119, 58) and (390, 142).
; PLAN: r0=119(x1), r1=58(y1), r2=390(x2), r3=142(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 58
LDI r2, 390
LDI r3, 142
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
