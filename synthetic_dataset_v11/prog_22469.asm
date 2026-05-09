; DESCRIPTION: Renders a black line between points (227, 20) and (177, 35).
; PLAN: r0=227(x1), r1=20(y1), r2=177(x2), r3=35(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 20
LDI r2, 177
LDI r3, 35
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
