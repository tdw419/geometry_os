; DESCRIPTION: Places a blue line segment connecting (167, 123) to (342, 255).
; PLAN: r0=167(x1), r1=123(y1), r2=342(x2), r3=255(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 123
LDI r2, 342
LDI r3, 255
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
