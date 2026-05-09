; DESCRIPTION: Places a purple line segment connecting (71, 210) to (130, 110).
; PLAN: r0=71(x1), r1=210(y1), r2=130(x2), r3=110(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 210
LDI r2, 130
LDI r3, 110
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
