; DESCRIPTION: Renders a purple line segment connecting (334, 186) to (190, 63).
; PLAN: r0=334(x1), r1=186(y1), r2=190(x2), r3=63(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 186
LDI r2, 190
LDI r3, 63
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
