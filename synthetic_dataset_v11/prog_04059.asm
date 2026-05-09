; DESCRIPTION: Places a purple line segment connecting (144, 81) to (181, 78).
; PLAN: r0=144(x1), r1=81(y1), r2=181(x2), r3=78(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 81
LDI r2, 181
LDI r3, 78
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
