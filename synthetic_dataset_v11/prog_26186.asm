; DESCRIPTION: Places a purple line segment connecting (233, 192) to (12, 98).
; PLAN: r0=233(x1), r1=192(y1), r2=12(x2), r3=98(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 192
LDI r2, 12
LDI r3, 98
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
