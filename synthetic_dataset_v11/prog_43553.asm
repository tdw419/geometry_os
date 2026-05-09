; DESCRIPTION: Places a blue line segment connecting (170, 32) to (84, 18).
; PLAN: r0=170(x1), r1=32(y1), r2=84(x2), r3=18(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 32
LDI r2, 84
LDI r3, 18
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
