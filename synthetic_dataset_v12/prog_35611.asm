; DESCRIPTION: Renders a black line between points (496, 112) and (332, 250).
; PLAN: r0=496(x1), r1=112(y1), r2=332(x2), r3=250(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 112
LDI r2, 332
LDI r3, 250
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
