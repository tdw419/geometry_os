; DESCRIPTION: Renders a blue line segment connecting (108, 151) to (385, 88).
; PLAN: r0=108(x1), r1=151(y1), r2=385(x2), r3=88(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 151
LDI r2, 385
LDI r3, 88
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
