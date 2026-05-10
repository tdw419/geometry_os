; DESCRIPTION: Renders a blue line segment connecting (385, 10) to (223, 59).
; PLAN: r0=385(x1), r1=10(y1), r2=223(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 10
LDI r2, 223
LDI r3, 59
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
