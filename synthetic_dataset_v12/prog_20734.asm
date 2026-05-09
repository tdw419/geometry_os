; DESCRIPTION: Renders a black line between points (424, 159) and (65, 116).
; PLAN: r0=424(x1), r1=159(y1), r2=65(x2), r3=116(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 159
LDI r2, 65
LDI r3, 116
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
