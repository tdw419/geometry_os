; DESCRIPTION: Places a purple line segment connecting (96, 116) to (25, 157).
; PLAN: r0=96(x1), r1=116(y1), r2=25(x2), r3=157(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 116
LDI r2, 25
LDI r3, 157
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
