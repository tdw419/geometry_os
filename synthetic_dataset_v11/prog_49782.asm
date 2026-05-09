; DESCRIPTION: Renders a black line between points (62, 216) and (147, 137).
; PLAN: r0=62(x1), r1=216(y1), r2=147(x2), r3=137(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 216
LDI r2, 147
LDI r3, 137
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
