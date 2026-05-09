; DESCRIPTION: Places a blue line segment connecting (447, 78) to (181, 180).
; PLAN: r0=447(x1), r1=78(y1), r2=181(x2), r3=180(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 78
LDI r2, 181
LDI r3, 180
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
