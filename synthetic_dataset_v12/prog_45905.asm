; DESCRIPTION: Renders a purple line between points (100, 29) and (152, 136).
; PLAN: r0=100(x1), r1=29(y1), r2=152(x2), r3=136(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 29
LDI r2, 152
LDI r3, 136
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
