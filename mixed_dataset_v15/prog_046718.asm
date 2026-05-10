; DESCRIPTION: Places a purple line segment connecting (299, 145) to (199, 167).
; PLAN: r0=299(x1), r1=145(y1), r2=199(x2), r3=167(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 145
LDI r2, 199
LDI r3, 167
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
