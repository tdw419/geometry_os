; DESCRIPTION: Places a blue line segment connecting (141, 122) to (120, 247).
; PLAN: r0=141(x1), r1=122(y1), r2=120(x2), r3=247(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 122
LDI r2, 120
LDI r3, 247
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
