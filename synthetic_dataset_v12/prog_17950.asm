; DESCRIPTION: Places a blue line segment connecting (41, 207) to (134, 94).
; PLAN: r0=41(x1), r1=207(y1), r2=134(x2), r3=94(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 207
LDI r2, 134
LDI r3, 94
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
