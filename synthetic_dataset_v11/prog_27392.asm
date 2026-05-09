; DESCRIPTION: Places a purple line segment connecting (57, 219) to (82, 34).
; PLAN: r0=57(x1), r1=219(y1), r2=82(x2), r3=34(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 219
LDI r2, 82
LDI r3, 34
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
