; DESCRIPTION: Places a blue line segment connecting (129, 171) to (110, 69).
; PLAN: r0=129(x1), r1=171(y1), r2=110(x2), r3=69(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 171
LDI r2, 110
LDI r3, 69
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
