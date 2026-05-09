; DESCRIPTION: Places a blue line segment connecting (148, 135) to (244, 168).
; PLAN: r0=148(x1), r1=135(y1), r2=244(x2), r3=168(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 135
LDI r2, 244
LDI r3, 168
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
