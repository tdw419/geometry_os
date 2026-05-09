; DESCRIPTION: Places a blue line segment connecting (41, 35) to (84, 120).
; PLAN: r0=41(x1), r1=35(y1), r2=84(x2), r3=120(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 35
LDI r2, 84
LDI r3, 120
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
