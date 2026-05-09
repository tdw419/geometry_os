; DESCRIPTION: Places a blue line segment connecting (478, 39) to (495, 212).
; PLAN: r0=478(x1), r1=39(y1), r2=495(x2), r3=212(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 39
LDI r2, 495
LDI r3, 212
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
