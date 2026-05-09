; DESCRIPTION: Places a blue line segment connecting (134, 95) to (71, 175).
; PLAN: r0=134(x1), r1=95(y1), r2=71(x2), r3=175(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 95
LDI r2, 71
LDI r3, 175
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
