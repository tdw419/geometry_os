; DESCRIPTION: Places a blue line segment connecting (244, 177) to (5, 22).
; PLAN: r0=244(x1), r1=177(y1), r2=5(x2), r3=22(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 177
LDI r2, 5
LDI r3, 22
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
