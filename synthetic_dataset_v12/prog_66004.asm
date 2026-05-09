; DESCRIPTION: Places a blue line segment connecting (20, 40) to (254, 69).
; PLAN: r0=20(x1), r1=40(y1), r2=254(x2), r3=69(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 40
LDI r2, 254
LDI r3, 69
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
