; DESCRIPTION: Places a purple line segment connecting (159, 62) to (134, 206).
; PLAN: r0=159(x1), r1=62(y1), r2=134(x2), r3=206(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 62
LDI r2, 134
LDI r3, 206
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
