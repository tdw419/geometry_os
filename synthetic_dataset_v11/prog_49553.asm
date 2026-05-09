; DESCRIPTION: Places a blue line segment connecting (150, 136) to (99, 219).
; PLAN: r0=150(x1), r1=136(y1), r2=99(x2), r3=219(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 136
LDI r2, 99
LDI r3, 219
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
