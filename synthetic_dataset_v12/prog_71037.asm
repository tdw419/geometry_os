; DESCRIPTION: Places a blue line segment connecting (38, 30) to (30, 33).
; PLAN: r0=38(x1), r1=30(y1), r2=30(x2), r3=33(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 30
LDI r2, 30
LDI r3, 33
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
