; DESCRIPTION: Renders a black line between points (332, 189) and (106, 81).
; PLAN: r0=332(x1), r1=189(y1), r2=106(x2), r3=81(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 189
LDI r2, 106
LDI r3, 81
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
