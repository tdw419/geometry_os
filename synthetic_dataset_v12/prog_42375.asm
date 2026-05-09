; DESCRIPTION: Renders a yellow line between points (375, 66) and (68, 230).
; PLAN: r0=375(x1), r1=66(y1), r2=68(x2), r3=230(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 66
LDI r2, 68
LDI r3, 230
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
