; DESCRIPTION: Places a purple line segment connecting (304, 49) to (18, 122).
; PLAN: r0=304(x1), r1=49(y1), r2=18(x2), r3=122(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 49
LDI r2, 18
LDI r3, 122
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
