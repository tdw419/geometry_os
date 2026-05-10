; DESCRIPTION: Renders a purple line segment connecting (125, 23) to (237, 114).
; PLAN: r0=125(x1), r1=23(y1), r2=237(x2), r3=114(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 23
LDI r2, 237
LDI r3, 114
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
