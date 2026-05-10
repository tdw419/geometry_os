; DESCRIPTION: Renders a blue line segment connecting (132, 88) to (206, 116).
; PLAN: r0=132(x1), r1=88(y1), r2=206(x2), r3=116(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 88
LDI r2, 206
LDI r3, 116
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
