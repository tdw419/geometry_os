; DESCRIPTION: Places a blue line segment connecting (32, 49) to (223, 149).
; PLAN: r0=32(x1), r1=49(y1), r2=223(x2), r3=149(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 49
LDI r2, 223
LDI r3, 149
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
