; DESCRIPTION: Places a blue line segment connecting (462, 44) to (163, 27).
; PLAN: r0=462(x1), r1=44(y1), r2=163(x2), r3=27(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 44
LDI r2, 163
LDI r3, 27
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
