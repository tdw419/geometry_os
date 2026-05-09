; DESCRIPTION: Renders a yellow line between points (192, 225) and (148, 98).
; PLAN: r0=192(x1), r1=225(y1), r2=148(x2), r3=98(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 225
LDI r2, 148
LDI r3, 98
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
