; DESCRIPTION: Renders a yellow line between points (6, 15) and (232, 130).
; PLAN: r0=6(x1), r1=15(y1), r2=232(x2), r3=130(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 15
LDI r2, 232
LDI r3, 130
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
