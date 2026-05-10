; DESCRIPTION: Places a blue line segment connecting (463, 175) to (462, 59).
; PLAN: r0=463(x1), r1=175(y1), r2=462(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 175
LDI r2, 462
LDI r3, 59
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
