; DESCRIPTION: Places a blue line segment connecting (60, 160) to (5, 244).
; PLAN: r0=60(x1), r1=160(y1), r2=5(x2), r3=244(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 160
LDI r2, 5
LDI r3, 244
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
