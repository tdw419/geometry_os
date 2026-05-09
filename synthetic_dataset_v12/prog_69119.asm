; DESCRIPTION: Places a black line segment connecting (258, 179) to (423, 218).
; PLAN: r0=258(x1), r1=179(y1), r2=423(x2), r3=218(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 179
LDI r2, 423
LDI r3, 218
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
