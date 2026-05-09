; DESCRIPTION: Places a blue line segment connecting (447, 254) to (310, 5).
; PLAN: r0=447(x1), r1=254(y1), r2=310(x2), r3=5(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 254
LDI r2, 310
LDI r3, 5
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
