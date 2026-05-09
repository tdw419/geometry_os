; DESCRIPTION: Places a blue line segment connecting (475, 9) to (448, 44).
; PLAN: r0=475(x1), r1=9(y1), r2=448(x2), r3=44(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 9
LDI r2, 448
LDI r3, 44
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
