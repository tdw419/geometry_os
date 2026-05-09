; DESCRIPTION: Places a blue line segment connecting (164, 110) to (62, 192).
; PLAN: r0=164(x1), r1=110(y1), r2=62(x2), r3=192(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 110
LDI r2, 62
LDI r3, 192
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
