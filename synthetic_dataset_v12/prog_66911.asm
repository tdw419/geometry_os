; DESCRIPTION: Places a blue line segment connecting (233, 128) to (169, 98).
; PLAN: r0=233(x1), r1=128(y1), r2=169(x2), r3=98(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 128
LDI r2, 169
LDI r3, 98
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
