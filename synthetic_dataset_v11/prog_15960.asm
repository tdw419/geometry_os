; DESCRIPTION: Places a blue line segment connecting (134, 219) to (75, 227).
; PLAN: r0=134(x1), r1=219(y1), r2=75(x2), r3=227(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 219
LDI r2, 75
LDI r3, 227
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
