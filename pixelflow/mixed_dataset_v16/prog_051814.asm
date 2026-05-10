; DESCRIPTION: Places a purple line segment connecting (15, 34) to (18, 240).
; PLAN: r0=15(x1), r1=34(y1), r2=18(x2), r3=240(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 34
LDI r2, 18
LDI r3, 240
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
