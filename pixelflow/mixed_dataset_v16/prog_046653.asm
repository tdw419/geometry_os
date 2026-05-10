; DESCRIPTION: Renders a black line between points (147, 193) and (222, 60).
; PLAN: r0=147(x1), r1=193(y1), r2=222(x2), r3=60(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 193
LDI r2, 222
LDI r3, 60
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
