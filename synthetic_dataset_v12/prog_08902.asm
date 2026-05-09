; DESCRIPTION: Renders a black line between points (369, 199) and (339, 232).
; PLAN: r0=369(x1), r1=199(y1), r2=339(x2), r3=232(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 199
LDI r2, 339
LDI r3, 232
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
