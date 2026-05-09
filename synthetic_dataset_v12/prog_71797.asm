; DESCRIPTION: Places a blue line segment connecting (448, 74) to (18, 224).
; PLAN: r0=448(x1), r1=74(y1), r2=18(x2), r3=224(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 74
LDI r2, 18
LDI r3, 224
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
