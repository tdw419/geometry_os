; DESCRIPTION: Places a purple line segment connecting (81, 224) to (39, 3).
; PLAN: r0=81(x1), r1=224(y1), r2=39(x2), r3=3(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 224
LDI r2, 39
LDI r3, 3
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
