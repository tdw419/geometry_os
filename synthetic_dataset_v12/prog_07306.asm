; DESCRIPTION: Places a purple line segment connecting (74, 196) to (335, 185).
; PLAN: r0=74(x1), r1=196(y1), r2=335(x2), r3=185(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 196
LDI r2, 335
LDI r3, 185
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
