; DESCRIPTION: Renders a black line between points (45, 218) and (147, 216).
; PLAN: r0=45(x1), r1=218(y1), r2=147(x2), r3=216(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 218
LDI r2, 147
LDI r3, 216
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
