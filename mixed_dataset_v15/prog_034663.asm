; DESCRIPTION: Places a blue line segment connecting (32, 129) to (62, 25).
; PLAN: r0=32(x1), r1=129(y1), r2=62(x2), r3=25(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 129
LDI r2, 62
LDI r3, 25
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
