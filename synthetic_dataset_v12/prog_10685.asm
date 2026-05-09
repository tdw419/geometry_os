; DESCRIPTION: Places a blue line segment connecting (40, 56) to (37, 18).
; PLAN: r0=40(x1), r1=56(y1), r2=37(x2), r3=18(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 56
LDI r2, 37
LDI r3, 18
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
