; DESCRIPTION: Renders a black line between points (321, 169) and (308, 211).
; PLAN: r0=321(x1), r1=169(y1), r2=308(x2), r3=211(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 169
LDI r2, 308
LDI r3, 211
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
