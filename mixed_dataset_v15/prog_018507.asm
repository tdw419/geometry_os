; DESCRIPTION: Places a blue line segment connecting (222, 200) to (240, 60).
; PLAN: r0=222(x1), r1=200(y1), r2=240(x2), r3=60(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 200
LDI r2, 240
LDI r3, 60
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
