; DESCRIPTION: Renders a black line between points (185, 140) and (147, 160).
; PLAN: r0=185(x1), r1=140(y1), r2=147(x2), r3=160(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 140
LDI r2, 147
LDI r3, 160
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
