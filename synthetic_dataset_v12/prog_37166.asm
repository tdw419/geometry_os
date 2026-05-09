; DESCRIPTION: Places a purple line segment connecting (6, 159) to (40, 19).
; PLAN: r0=6(x1), r1=159(y1), r2=40(x2), r3=19(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 159
LDI r2, 40
LDI r3, 19
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
