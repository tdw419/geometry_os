; DESCRIPTION: Renders a blue line segment connecting (282, 161) to (5, 58).
; PLAN: r0=282(x1), r1=161(y1), r2=5(x2), r3=58(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 161
LDI r2, 5
LDI r3, 58
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
