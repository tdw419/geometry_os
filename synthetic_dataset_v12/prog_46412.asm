; DESCRIPTION: Places a purple line segment connecting (409, 213) to (6, 69).
; PLAN: r0=409(x1), r1=213(y1), r2=6(x2), r3=69(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 213
LDI r2, 6
LDI r3, 69
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
