; DESCRIPTION: Places a blue line segment connecting (54, 179) to (159, 157).
; PLAN: r0=54(x1), r1=179(y1), r2=159(x2), r3=157(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 179
LDI r2, 159
LDI r3, 157
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
