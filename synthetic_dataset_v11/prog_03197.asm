; DESCRIPTION: Places a purple line segment connecting (131, 123) to (167, 40).
; PLAN: r0=131(x1), r1=123(y1), r2=167(x2), r3=40(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 123
LDI r2, 167
LDI r3, 40
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
