; DESCRIPTION: Renders a blue line segment connecting (140, 88) to (171, 8).
; PLAN: r0=140(x1), r1=88(y1), r2=171(x2), r3=8(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 88
LDI r2, 171
LDI r3, 8
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
