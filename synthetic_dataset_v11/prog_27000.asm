; DESCRIPTION: Places a blue line segment connecting (155, 221) to (78, 9).
; PLAN: r0=155(x1), r1=221(y1), r2=78(x2), r3=9(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 221
LDI r2, 78
LDI r3, 9
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
