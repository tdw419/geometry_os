; DESCRIPTION: Places a blue line segment connecting (436, 172) to (145, 110).
; PLAN: r0=436(x1), r1=172(y1), r2=145(x2), r3=110(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 172
LDI r2, 145
LDI r3, 110
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
