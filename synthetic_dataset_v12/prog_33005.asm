; DESCRIPTION: Places a blue line segment connecting (142, 157) to (41, 66).
; PLAN: r0=142(x1), r1=157(y1), r2=41(x2), r3=66(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 157
LDI r2, 41
LDI r3, 66
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
