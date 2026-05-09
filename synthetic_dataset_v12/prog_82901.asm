; DESCRIPTION: Places a blue line segment connecting (190, 16) to (137, 39).
; PLAN: r0=190(x1), r1=16(y1), r2=137(x2), r3=39(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 16
LDI r2, 137
LDI r3, 39
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
