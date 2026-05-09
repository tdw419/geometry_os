; DESCRIPTION: Places a blue line segment connecting (257, 188) to (192, 70).
; PLAN: r0=257(x1), r1=188(y1), r2=192(x2), r3=70(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 188
LDI r2, 192
LDI r3, 70
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
