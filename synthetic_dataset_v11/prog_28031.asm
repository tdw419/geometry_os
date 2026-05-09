; DESCRIPTION: Places a blue line segment connecting (69, 131) to (191, 70).
; PLAN: r0=69(x1), r1=131(y1), r2=191(x2), r3=70(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 131
LDI r2, 191
LDI r3, 70
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
