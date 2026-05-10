; DESCRIPTION: Renders a blue line segment connecting (111, 135) to (78, 21).
; PLAN: r0=111(x1), r1=135(y1), r2=78(x2), r3=21(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 135
LDI r2, 78
LDI r3, 21
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
