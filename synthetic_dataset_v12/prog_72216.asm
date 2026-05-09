; DESCRIPTION: Places a purple line segment connecting (17, 114) to (107, 130).
; PLAN: r0=17(x1), r1=114(y1), r2=107(x2), r3=130(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 114
LDI r2, 107
LDI r3, 130
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
