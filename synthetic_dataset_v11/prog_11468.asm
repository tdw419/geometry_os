; DESCRIPTION: Places a blue line segment connecting (140, 150) to (35, 59).
; PLAN: r0=140(x1), r1=150(y1), r2=35(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 150
LDI r2, 35
LDI r3, 59
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
