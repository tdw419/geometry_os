; DESCRIPTION: Renders a blue line between points (253, 62) and (25, 129).
; PLAN: r0=253(x1), r1=62(y1), r2=25(x2), r3=129(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 62
LDI r2, 25
LDI r3, 129
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
