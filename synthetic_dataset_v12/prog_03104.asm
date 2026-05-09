; DESCRIPTION: Renders a yellow line between points (147, 102) and (95, 211).
; PLAN: r0=147(x1), r1=102(y1), r2=95(x2), r3=211(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 102
LDI r2, 95
LDI r3, 211
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
