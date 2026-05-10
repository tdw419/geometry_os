; DESCRIPTION: Renders a blue line segment connecting (339, 185) to (166, 7).
; PLAN: r0=339(x1), r1=185(y1), r2=166(x2), r3=7(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 185
LDI r2, 166
LDI r3, 7
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
