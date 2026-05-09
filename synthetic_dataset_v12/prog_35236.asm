; DESCRIPTION: Places a purple line segment connecting (195, 15) to (252, 238).
; PLAN: r0=195(x1), r1=15(y1), r2=252(x2), r3=238(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 15
LDI r2, 252
LDI r3, 238
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
