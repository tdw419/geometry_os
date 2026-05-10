; DESCRIPTION: Places a purple line segment connecting (1, 114) to (204, 75).
; PLAN: r0=1(x1), r1=114(y1), r2=204(x2), r3=75(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 114
LDI r2, 204
LDI r3, 75
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
