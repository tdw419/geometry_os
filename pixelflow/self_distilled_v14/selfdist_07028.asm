; DESCRIPTION: Renders a blue line segment connecting (88, 72) to (68, 47).
; PLAN: r0=88(x1), r1=72(y1), r2=68(x2), r3=47(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 72
LDI r2, 68
LDI r3, 47
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
