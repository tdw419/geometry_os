; DESCRIPTION: Renders a purple line segment connecting (313, 105) to (370, 114).
; PLAN: r0=313(x1), r1=105(y1), r2=370(x2), r3=114(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 105
LDI r2, 370
LDI r3, 114
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
