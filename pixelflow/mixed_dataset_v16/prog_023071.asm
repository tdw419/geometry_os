; DESCRIPTION: Renders a purple line segment connecting (132, 130) to (256, 102).
; PLAN: r0=132(x1), r1=130(y1), r2=256(x2), r3=102(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 130
LDI r2, 256
LDI r3, 102
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
