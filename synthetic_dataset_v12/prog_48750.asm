; DESCRIPTION: Places a blue line segment connecting (10, 148) to (47, 220).
; PLAN: r0=10(x1), r1=148(y1), r2=47(x2), r3=220(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 148
LDI r2, 47
LDI r3, 220
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
