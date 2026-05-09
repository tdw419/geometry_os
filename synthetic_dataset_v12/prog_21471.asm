; DESCRIPTION: Places a blue line segment connecting (12, 200) to (342, 108).
; PLAN: r0=12(x1), r1=200(y1), r2=342(x2), r3=108(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 200
LDI r2, 342
LDI r3, 108
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
