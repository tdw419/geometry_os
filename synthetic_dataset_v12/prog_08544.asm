; DESCRIPTION: Renders a black line between points (155, 236) and (338, 116).
; PLAN: r0=155(x1), r1=236(y1), r2=338(x2), r3=116(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 236
LDI r2, 338
LDI r3, 116
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
