; DESCRIPTION: Renders a yellow line between points (478, 232) and (145, 28).
; PLAN: r0=478(x1), r1=232(y1), r2=145(x2), r3=28(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 232
LDI r2, 145
LDI r3, 28
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
