; DESCRIPTION: Places a purple line segment connecting (213, 95) to (34, 183).
; PLAN: r0=213(x1), r1=95(y1), r2=34(x2), r3=183(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 95
LDI r2, 34
LDI r3, 183
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
