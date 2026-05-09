; DESCRIPTION: Renders a black line between points (177, 147) and (357, 6).
; PLAN: r0=177(x1), r1=147(y1), r2=357(x2), r3=6(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 147
LDI r2, 357
LDI r3, 6
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
