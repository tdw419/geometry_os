; DESCRIPTION: Places a purple line segment connecting (428, 165) to (96, 73).
; PLAN: r0=428(x1), r1=165(y1), r2=96(x2), r3=73(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 165
LDI r2, 96
LDI r3, 73
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
