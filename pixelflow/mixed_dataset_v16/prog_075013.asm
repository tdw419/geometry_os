; DESCRIPTION: Places a purple line segment connecting (365, 21) to (413, 218).
; PLAN: r0=365(x1), r1=21(y1), r2=413(x2), r3=218(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 21
LDI r2, 413
LDI r3, 218
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
