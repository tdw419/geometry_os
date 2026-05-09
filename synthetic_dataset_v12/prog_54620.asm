; DESCRIPTION: Renders a black line between points (472, 145) and (71, 43).
; PLAN: r0=472(x1), r1=145(y1), r2=71(x2), r3=43(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 145
LDI r2, 71
LDI r3, 43
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
