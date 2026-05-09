; DESCRIPTION: Renders a black line between points (5, 247) and (163, 232).
; PLAN: r0=5(x1), r1=247(y1), r2=163(x2), r3=232(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 247
LDI r2, 163
LDI r3, 232
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
