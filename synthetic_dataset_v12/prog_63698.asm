; DESCRIPTION: Renders a black line between points (109, 47) and (289, 147).
; PLAN: r0=109(x1), r1=47(y1), r2=289(x2), r3=147(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 47
LDI r2, 289
LDI r3, 147
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
