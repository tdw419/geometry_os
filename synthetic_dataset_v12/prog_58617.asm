; DESCRIPTION: Places a purple line segment connecting (437, 49) to (126, 189).
; PLAN: r0=437(x1), r1=49(y1), r2=126(x2), r3=189(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 49
LDI r2, 126
LDI r3, 189
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
