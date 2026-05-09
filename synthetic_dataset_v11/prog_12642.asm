; DESCRIPTION: Places a purple line segment connecting (17, 130) to (82, 106).
; PLAN: r0=17(x1), r1=130(y1), r2=82(x2), r3=106(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 130
LDI r2, 82
LDI r3, 106
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
