; DESCRIPTION: Places a purple line segment connecting (271, 130) to (162, 155).
; PLAN: r0=271(x1), r1=130(y1), r2=162(x2), r3=155(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 130
LDI r2, 162
LDI r3, 155
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
