; DESCRIPTION: Renders a yellow line between points (141, 147) and (233, 35).
; PLAN: r0=141(x1), r1=147(y1), r2=233(x2), r3=35(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 147
LDI r2, 233
LDI r3, 35
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
