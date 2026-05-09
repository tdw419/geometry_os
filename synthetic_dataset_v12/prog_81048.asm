; DESCRIPTION: Places a blue line segment connecting (304, 200) to (154, 105).
; PLAN: r0=304(x1), r1=200(y1), r2=154(x2), r3=105(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 200
LDI r2, 154
LDI r3, 105
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
