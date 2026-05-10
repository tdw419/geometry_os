; DESCRIPTION: Renders a magenta line segment connecting (88, 136) to (181, 142).
; PLAN: r0=88(x1), r1=136(y1), r2=181(x2), r3=142(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 136
LDI r2, 181
LDI r3, 142
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
