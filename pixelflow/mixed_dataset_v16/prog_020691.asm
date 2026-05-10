; DESCRIPTION: Places a blue line segment connecting (504, 5) to (201, 65).
; PLAN: r0=504(x1), r1=5(y1), r2=201(x2), r3=65(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 5
LDI r2, 201
LDI r3, 65
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
