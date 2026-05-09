; DESCRIPTION: Places a blue line segment connecting (37, 162) to (138, 245).
; PLAN: r0=37(x1), r1=162(y1), r2=138(x2), r3=245(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 162
LDI r2, 138
LDI r3, 245
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
