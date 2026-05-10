; DESCRIPTION: Places a purple line segment connecting (216, 165) to (65, 67).
; PLAN: r0=216(x1), r1=165(y1), r2=65(x2), r3=67(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 165
LDI r2, 65
LDI r3, 67
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
