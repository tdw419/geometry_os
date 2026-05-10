; DESCRIPTION: Places a purple line segment connecting (413, 18) to (384, 148).
; PLAN: r0=413(x1), r1=18(y1), r2=384(x2), r3=148(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 18
LDI r2, 384
LDI r3, 148
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
