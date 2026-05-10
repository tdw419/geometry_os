; DESCRIPTION: Places a blue line segment connecting (496, 25) to (359, 219).
; PLAN: r0=496(x1), r1=25(y1), r2=359(x2), r3=219(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 25
LDI r2, 359
LDI r3, 219
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
