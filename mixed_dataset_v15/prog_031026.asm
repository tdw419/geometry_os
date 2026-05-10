; DESCRIPTION: Renders a yellow line between points (93, 244) and (500, 130).
; PLAN: r0=93(x1), r1=244(y1), r2=500(x2), r3=130(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 244
LDI r2, 500
LDI r3, 130
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
