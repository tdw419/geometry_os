; DESCRIPTION: Renders a purple line segment connecting (148, 111) to (97, 59).
; PLAN: r0=148(x1), r1=111(y1), r2=97(x2), r3=59(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 111
LDI r2, 97
LDI r3, 59
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
