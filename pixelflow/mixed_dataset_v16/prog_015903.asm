; DESCRIPTION: Places a purple line segment connecting (152, 43) to (201, 243).
; PLAN: r0=152(x1), r1=43(y1), r2=201(x2), r3=243(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 43
LDI r2, 201
LDI r3, 243
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
