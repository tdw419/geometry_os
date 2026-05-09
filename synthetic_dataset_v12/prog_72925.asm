; DESCRIPTION: Renders a blue line between points (312, 148) and (144, 72).
; PLAN: r0=312(x1), r1=148(y1), r2=144(x2), r3=72(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 148
LDI r2, 144
LDI r3, 72
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
