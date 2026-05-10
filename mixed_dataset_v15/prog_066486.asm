; DESCRIPTION: Renders a black line between points (51, 241) and (227, 119).
; PLAN: r0=51(x1), r1=241(y1), r2=227(x2), r3=119(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 241
LDI r2, 227
LDI r3, 119
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
