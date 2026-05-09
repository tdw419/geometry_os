; DESCRIPTION: Places a purple line segment connecting (107, 165) to (490, 32).
; PLAN: r0=107(x1), r1=165(y1), r2=490(x2), r3=32(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 165
LDI r2, 490
LDI r3, 32
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
