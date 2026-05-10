; DESCRIPTION: Renders a blue line segment connecting (323, 135) to (140, 99).
; PLAN: r0=323(x1), r1=135(y1), r2=140(x2), r3=99(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 135
LDI r2, 140
LDI r3, 99
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
