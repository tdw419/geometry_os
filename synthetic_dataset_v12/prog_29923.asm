; DESCRIPTION: Places a blue line segment connecting (80, 60) to (70, 102).
; PLAN: r0=80(x1), r1=60(y1), r2=70(x2), r3=102(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 60
LDI r2, 70
LDI r3, 102
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
