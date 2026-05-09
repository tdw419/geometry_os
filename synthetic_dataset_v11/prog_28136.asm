; DESCRIPTION: Places a purple line segment connecting (91, 158) to (197, 130).
; PLAN: r0=91(x1), r1=158(y1), r2=197(x2), r3=130(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 158
LDI r2, 197
LDI r3, 130
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
