; DESCRIPTION: Places a blue line segment connecting (274, 52) to (447, 59).
; PLAN: r0=274(x1), r1=52(y1), r2=447(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 52
LDI r2, 447
LDI r3, 59
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
