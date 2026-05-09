; DESCRIPTION: Places a purple line segment connecting (75, 101) to (420, 31).
; PLAN: r0=75(x1), r1=101(y1), r2=420(x2), r3=31(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 101
LDI r2, 420
LDI r3, 31
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
