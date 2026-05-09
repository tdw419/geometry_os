; DESCRIPTION: Places a blue line segment connecting (373, 34) to (412, 149).
; PLAN: r0=373(x1), r1=34(y1), r2=412(x2), r3=149(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 34
LDI r2, 412
LDI r3, 149
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
