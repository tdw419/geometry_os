; DESCRIPTION: Places a purple line segment connecting (183, 148) to (358, 48).
; PLAN: r0=183(x1), r1=148(y1), r2=358(x2), r3=48(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 148
LDI r2, 358
LDI r3, 48
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
