; DESCRIPTION: Places a purple line segment connecting (133, 19) to (183, 95).
; PLAN: r0=133(x1), r1=19(y1), r2=183(x2), r3=95(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 19
LDI r2, 183
LDI r3, 95
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
