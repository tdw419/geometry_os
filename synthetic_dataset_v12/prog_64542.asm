; DESCRIPTION: Places a purple line segment connecting (139, 130) to (164, 211).
; PLAN: r0=139(x1), r1=130(y1), r2=164(x2), r3=211(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 130
LDI r2, 164
LDI r3, 211
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
