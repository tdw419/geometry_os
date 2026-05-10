; DESCRIPTION: Places a blue line segment connecting (412, 200) to (329, 35).
; PLAN: r0=412(x1), r1=200(y1), r2=329(x2), r3=35(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 200
LDI r2, 329
LDI r3, 35
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
