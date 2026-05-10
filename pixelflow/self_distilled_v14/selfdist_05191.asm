; DESCRIPTION: Renders a blue line segment connecting (69, 167) to (191, 141).
; PLAN: r0=69(x1), r1=167(y1), r2=191(x2), r3=141(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 167
LDI r2, 191
LDI r3, 141
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
