; DESCRIPTION: Renders a blue line segment connecting (62, 8) to (5, 113).
; PLAN: r0=62(x1), r1=8(y1), r2=5(x2), r3=113(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 8
LDI r2, 5
LDI r3, 113
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
