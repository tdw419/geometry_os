; DESCRIPTION: Places a blue line segment connecting (442, 73) to (266, 232).
; PLAN: r0=442(x1), r1=73(y1), r2=266(x2), r3=232(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 73
LDI r2, 266
LDI r3, 232
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
