; DESCRIPTION: Places a purple line segment connecting (124, 215) to (137, 158).
; PLAN: r0=124(x1), r1=215(y1), r2=137(x2), r3=158(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 215
LDI r2, 137
LDI r3, 158
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
