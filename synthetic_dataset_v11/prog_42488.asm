; DESCRIPTION: Places a purple line segment connecting (200, 32) to (183, 26).
; PLAN: r0=200(x1), r1=32(y1), r2=183(x2), r3=26(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 32
LDI r2, 183
LDI r3, 26
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
