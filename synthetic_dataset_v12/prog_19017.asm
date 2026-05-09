; DESCRIPTION: Places a blue line segment connecting (142, 95) to (207, 102).
; PLAN: r0=142(x1), r1=95(y1), r2=207(x2), r3=102(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 95
LDI r2, 207
LDI r3, 102
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
