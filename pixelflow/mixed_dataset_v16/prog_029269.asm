; DESCRIPTION: Renders a blue line between points (102, 100) and (88, 69).
; PLAN: r0=102(x1), r1=100(y1), r2=88(x2), r3=69(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 100
LDI r2, 88
LDI r3, 69
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
