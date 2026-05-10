; DESCRIPTION: Renders a purple line segment connecting (69, 142) to (16, 148).
; PLAN: r0=69(x1), r1=142(y1), r2=16(x2), r3=148(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 142
LDI r2, 16
LDI r3, 148
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
