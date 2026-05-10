; DESCRIPTION: Renders a purple line segment connecting (44, 84) to (245, 49).
; PLAN: r0=44(x1), r1=84(y1), r2=245(x2), r3=49(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 84
LDI r2, 245
LDI r3, 49
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
