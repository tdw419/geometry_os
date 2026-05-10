; DESCRIPTION: Renders a yellow line segment connecting (24, 136) to (400, 105).
; PLAN: r0=24(x1), r1=136(y1), r2=400(x2), r3=105(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 136
LDI r2, 400
LDI r3, 105
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
