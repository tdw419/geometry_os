; DESCRIPTION: Places a blue line segment connecting (261, 20) to (47, 105).
; PLAN: r0=261(x1), r1=20(y1), r2=47(x2), r3=105(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 20
LDI r2, 47
LDI r3, 105
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
