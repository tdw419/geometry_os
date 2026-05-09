; DESCRIPTION: Renders a black line between points (71, 105) and (185, 248).
; PLAN: r0=71(x1), r1=105(y1), r2=185(x2), r3=248(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 105
LDI r2, 185
LDI r3, 248
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
