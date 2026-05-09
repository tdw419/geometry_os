; DESCRIPTION: Places a blue line segment connecting (49, 21) to (0, 218).
; PLAN: r0=49(x1), r1=21(y1), r2=0(x2), r3=218(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 21
LDI r2, 0
LDI r3, 218
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
