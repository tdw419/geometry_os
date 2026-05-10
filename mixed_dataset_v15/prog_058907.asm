; DESCRIPTION: Places a blue line segment connecting (500, 1) to (161, 247).
; PLAN: r0=500(x1), r1=1(y1), r2=161(x2), r3=247(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 1
LDI r2, 161
LDI r3, 247
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
