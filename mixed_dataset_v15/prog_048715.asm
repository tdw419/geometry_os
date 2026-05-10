; DESCRIPTION: Places a purple line segment connecting (182, 7) to (29, 233).
; PLAN: r0=182(x1), r1=7(y1), r2=29(x2), r3=233(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 7
LDI r2, 29
LDI r3, 233
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
