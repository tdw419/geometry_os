; DESCRIPTION: Places a purple line segment connecting (49, 98) to (32, 59).
; PLAN: r0=49(x1), r1=98(y1), r2=32(x2), r3=59(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 98
LDI r2, 32
LDI r3, 59
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
