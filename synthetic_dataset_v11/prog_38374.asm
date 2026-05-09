; DESCRIPTION: Renders a black line between points (155, 23) and (139, 92).
; PLAN: r0=155(x1), r1=23(y1), r2=139(x2), r3=92(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 23
LDI r2, 139
LDI r3, 92
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
