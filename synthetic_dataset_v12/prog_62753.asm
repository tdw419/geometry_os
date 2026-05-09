; DESCRIPTION: Places a blue line segment connecting (25, 132) to (339, 159).
; PLAN: r0=25(x1), r1=132(y1), r2=339(x2), r3=159(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 132
LDI r2, 339
LDI r3, 159
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
