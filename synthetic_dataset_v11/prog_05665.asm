; DESCRIPTION: Places a blue line segment connecting (119, 123) to (196, 187).
; PLAN: r0=119(x1), r1=123(y1), r2=196(x2), r3=187(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 123
LDI r2, 196
LDI r3, 187
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
