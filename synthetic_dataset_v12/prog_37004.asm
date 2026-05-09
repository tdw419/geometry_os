; DESCRIPTION: Places a purple line segment connecting (120, 45) to (258, 218).
; PLAN: r0=120(x1), r1=45(y1), r2=258(x2), r3=218(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 45
LDI r2, 258
LDI r3, 218
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
