; DESCRIPTION: Places a blue line segment connecting (327, 227) to (329, 66).
; PLAN: r0=327(x1), r1=227(y1), r2=329(x2), r3=66(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 227
LDI r2, 329
LDI r3, 66
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
