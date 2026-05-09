; DESCRIPTION: Places a purple line segment connecting (3, 214) to (157, 179).
; PLAN: r0=3(x1), r1=214(y1), r2=157(x2), r3=179(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 214
LDI r2, 157
LDI r3, 179
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
