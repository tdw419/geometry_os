; DESCRIPTION: Places a blue line segment connecting (96, 254) to (72, 41).
; PLAN: r0=96(x1), r1=254(y1), r2=72(x2), r3=41(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 254
LDI r2, 72
LDI r3, 41
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
