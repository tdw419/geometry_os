; DESCRIPTION: Places a purple line segment connecting (39, 58) to (28, 31).
; PLAN: r0=39(x1), r1=58(y1), r2=28(x2), r3=31(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 58
LDI r2, 28
LDI r3, 31
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
