; DESCRIPTION: Renders a blue line segment connecting (226, 200) to (97, 150).
; PLAN: r0=226(x1), r1=200(y1), r2=97(x2), r3=150(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 200
LDI r2, 97
LDI r3, 150
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
