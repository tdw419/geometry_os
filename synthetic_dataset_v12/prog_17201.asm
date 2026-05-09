; DESCRIPTION: Renders a black line between points (463, 76) and (226, 122).
; PLAN: r0=463(x1), r1=76(y1), r2=226(x2), r3=122(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 76
LDI r2, 226
LDI r3, 122
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
