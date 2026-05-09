; DESCRIPTION: Renders a black line between points (129, 164) and (343, 58).
; PLAN: r0=129(x1), r1=164(y1), r2=343(x2), r3=58(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 164
LDI r2, 343
LDI r3, 58
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
