; DESCRIPTION: Renders a black line between points (491, 73) and (142, 105).
; PLAN: r0=491(x1), r1=73(y1), r2=142(x2), r3=105(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 73
LDI r2, 142
LDI r3, 105
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
