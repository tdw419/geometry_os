; DESCRIPTION: Renders a purple line segment connecting (33, 148) to (314, 166).
; PLAN: r0=33(x1), r1=148(y1), r2=314(x2), r3=166(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 148
LDI r2, 314
LDI r3, 166
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
