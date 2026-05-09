; DESCRIPTION: Places a blue line segment connecting (14, 171) to (65, 131).
; PLAN: r0=14(x1), r1=171(y1), r2=65(x2), r3=131(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 171
LDI r2, 65
LDI r3, 131
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
