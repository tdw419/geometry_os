; DESCRIPTION: Renders a black line between points (314, 152) and (89, 112).
; PLAN: r0=314(x1), r1=152(y1), r2=89(x2), r3=112(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 152
LDI r2, 89
LDI r3, 112
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
