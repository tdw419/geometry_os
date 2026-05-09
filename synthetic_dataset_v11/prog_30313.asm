; DESCRIPTION: Places a blue line segment connecting (219, 197) to (2, 85).
; PLAN: r0=219(x1), r1=197(y1), r2=2(x2), r3=85(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 197
LDI r2, 2
LDI r3, 85
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
