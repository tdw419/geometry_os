; DESCRIPTION: Places a purple line segment connecting (116, 49) to (175, 232).
; PLAN: r0=116(x1), r1=49(y1), r2=175(x2), r3=232(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 49
LDI r2, 175
LDI r3, 232
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
