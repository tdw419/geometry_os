; DESCRIPTION: Renders a blue line segment connecting (45, 123) to (11, 174).
; PLAN: r0=45(x1), r1=123(y1), r2=11(x2), r3=174(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 123
LDI r2, 11
LDI r3, 174
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
