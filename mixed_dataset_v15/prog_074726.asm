; DESCRIPTION: Places a purple line segment connecting (118, 213) to (356, 88).
; PLAN: r0=118(x1), r1=213(y1), r2=356(x2), r3=88(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 213
LDI r2, 356
LDI r3, 88
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
