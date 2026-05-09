; DESCRIPTION: Places a blue line segment connecting (33, 142) to (216, 218).
; PLAN: r0=33(x1), r1=142(y1), r2=216(x2), r3=218(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 142
LDI r2, 216
LDI r3, 218
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
